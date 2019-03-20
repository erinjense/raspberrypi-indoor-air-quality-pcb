import csv

class Csv:
    """
        Controls CSV file manipulation for a series of data loggers.

            Data Logger Information (loggerinfo)
                Data Logger type (Air Quality, Furnace, Energy, etc.)
                Unique Identifier
                Software Version
                Field Names: The column corresponding to data type

            Sensor Module Information (moduleinfo)
                Calibration Date, Parameters, Method

         Functions:
            setFieldNames: Set to a default value based on Data Logger Type.
                           Can be changed dynamically.
            writeData: Write Data row by row, based on data in and field name
    """

    fn = {'IAQ': ['col1','col2','col3']}

    def __init__(self,filename,loggerinfo,moduleinfo):
        self.type            = loggerinfo['loggertype']
        self.id              = loggerinfo['id']
        self.softwareversion = loggerinfo['softwareversion']
       
        self.calibration     = moduleinfo['calibration']

        self.filename   = filename
        self.fieldnames = self.setFieldNames()

    def setFieldNames(self,key=None):
        if (key):
            return self.fn.get(key)
        else:
            return self.fn.get(self.type)

    def writeData(self,data):
        with open(self.filename, 'w') as csvfile:
            writer = csv.DictWriter(csvfile,fieldnames=self.fieldnames)
            writer.writeheader()
            writer.writerow({'col1': data[0], 'col2': data[1]})
