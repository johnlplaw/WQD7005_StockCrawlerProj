"""
This file is for handling the python project properties and parameter setting
"""

import configparser

"""
The Class for reading properties
"""
class ReadProperty:

    def getPropertiesDic (self, prosec):
        config = configparser.RawConfigParser()
        config.read('config.properties')
        details_dict = dict(config.items(prosec))
        return details_dict

