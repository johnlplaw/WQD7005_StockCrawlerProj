*------------------------------------------------------------*;
* Score: Creating Fixed Names;
*------------------------------------------------------------*;
LABEL EM_EVENTPROBABILITY = 'Probability for level UP of REP_updownInd';
EM_EVENTPROBABILITY = P_REP_updownIndup;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_REP_updownIndup
,
P_REP_updownIndunchange
,
P_REP_updownInddown
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for REP_updownInd";
EM_CLASSIFICATION = I_REP_updownInd;
