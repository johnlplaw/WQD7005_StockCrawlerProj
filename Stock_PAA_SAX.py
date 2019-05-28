import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from tslearn.generators import random_walks
from tslearn.preprocessing import TimeSeriesScalerMeanVariance
from tslearn.piecewise import PiecewiseAggregateApproximation
from tslearn.piecewise import SymbolicAggregateApproximation, OneD_SymbolicAggregateApproximation
import mysql.connector
from UtilProperty import ReadProperty

# Query data from mysql
# Query the active stock and remove the duplicated row
queryStr = " select thedate, comp_code, v_updownpercent " \
           " from upd_klse where v_updownpercent is not null " \
           " group by thedate, comp_code, v_updownpercent " \
           " order by comp_code, thedate"

#Load the DB connection info
readProperty = ReadProperty()
dicMySql = readProperty.getPropertiesDic('MySQL')
mydb = mysql.connector.connect(
host=dicMySql['host'],
user=dicMySql['user'],
passwd=dicMySql['passwd'],
database=dicMySql['database']
)

db_cursor = mydb.cursor()
db_cursor.execute(queryStr)
table_rows = db_cursor.fetchall()

#Target: To find out which are covariance stocks
#How: base on the daily stock market activity, by comparing the 'Up and down percent', v_updownpercent
df = pd.DataFrame(table_rows, columns = ["thedate", "comp_code", "v_updownpercent"])
#print(df.head(10))

# pivot the stock code from row to column
# To make all the stocks become columns
dfpivot = pd.pivot_table(df, index='thedate', columns = 'comp_code', values=['v_updownpercent'])

# fill in 0 to missing value
dfpivot = dfpivot.fillna(0)
print("===============================")
print("Pivot table:")
print(dfpivot.head(10))

# Finding the covariance stock
cov_dfpivot = dfpivot.cov()
print("===============================")
print("Covariance calculation result:")
print("The first 5:")
print(cov_dfpivot.head(5))
print("The Last 5:")
print(cov_dfpivot.tail(5))
print("===============================")

# pick a stock to compare with others
initStock = '3A'

#Sort the covariance values with the selected stock code
Stock_target = cov_dfpivot['v_updownpercent'][initStock]
Stock_target = Stock_target.sort_values( ascending=False)
print("===============================")
print("Covariance calculation result:")
print("Positive:")
print(Stock_target.head(5))
print("Negative:")
print(Stock_target.tail(5))
print("===============================")

# Finding correlationship
#cor_dfpivot = dfpivot.corr()
#print("===============================")
#print("Correlationship calculation result:")
#print("The first 5:")
#print(cor_dfpivot.head(5))
#print("The last 5:")
#print(cor_dfpivot.head(-5))
#print("===============================")



# Get the stock list (Positive covariance)
pos_relatedStock = []
pos_relatedStock.append(initStock)
# focus on the 3 other stock
for idxname in Stock_target.iloc[0:3].index.tolist():
    pos_relatedStock.append(idxname[1])

print("Positive cov: ", pos_relatedStock)
print("Num Stock: ", len(pos_relatedStock))


# Plotting Graph
plt.figure()
graph_idx = 0;

# Transform PAA, SAX, 1d-SAX,
for stockCode in pos_relatedStock :

    dataset = dfpivot['v_updownpercent'][stockCode]
    scaler = TimeSeriesScalerMeanVariance(mu=0., std=1.)  # Rescale time series
    dataset = scaler.fit_transform(dataset)

    # PAA transform (and inverse transform) of the data
    n_paa_segments = 10
    paa = PiecewiseAggregateApproximation(n_segments=n_paa_segments)
    paa_dataset_inv = paa.inverse_transform(paa.fit_transform(dataset))

    # SAX transform
    n_sax_symbols = 8
    sax = SymbolicAggregateApproximation(n_segments=n_paa_segments, alphabet_size_avg=n_sax_symbols)
    sax_dataset_inv = sax.inverse_transform(sax.fit_transform(dataset))

    # 1d-SAX transform
    n_sax_symbols_avg = 8
    n_sax_symbols_slope = 8
    one_d_sax = OneD_SymbolicAggregateApproximation(n_segments=n_paa_segments, alphabet_size_avg=n_sax_symbols_avg,
                                                    alphabet_size_slope=n_sax_symbols_slope)
    one_d_sax_dataset_inv = one_d_sax.inverse_transform(one_d_sax.fit_transform(dataset))

    graph_idx = graph_idx + 1
    plt.subplot(len(pos_relatedStock), 4, graph_idx)  # First, raw time series
    plt.plot(dataset[0].ravel(), "b-")
    plt.title("Raw time series: " + stockCode)

    graph_idx = graph_idx + 1
    plt.subplot(len(pos_relatedStock), 4, graph_idx)  # Second, PAA
    plt.plot(dataset[0].ravel(), "b-", alpha=0.4)
    plt.plot(paa_dataset_inv[0].ravel(), "b-")
    plt.title("PAA: " + stockCode)

    graph_idx = graph_idx + 1
    plt.subplot(len(pos_relatedStock), 4, graph_idx)  # Then SAX
    plt.plot(dataset[0].ravel(), "b-", alpha=0.4)
    plt.plot(sax_dataset_inv[0].ravel(), "b-")
    plt.title("SAX, %d symbols" % n_sax_symbols)

    graph_idx = graph_idx + 1
    plt.subplot(len(pos_relatedStock), 4, graph_idx)  # Finally, 1d-SAX
    plt.plot(dataset[0].ravel(), "b-", alpha=0.4)
    plt.plot(one_d_sax_dataset_inv[0].ravel(), "b-")
    plt.title("1d-SAX, %d symbols (%dx%d)" % (n_sax_symbols_avg * n_sax_symbols_slope,
                                                  n_sax_symbols_avg,
                                                  n_sax_symbols_slope))

plt.tight_layout()
plt.show()

print("========================")
