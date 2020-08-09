
import datetime

LOG_DATE = datetime.datetime.now().strftime('%Y%m%d%H')
LOG_FILE = 'sample-'+ str(LOG_DATE)+'.log'

with open(LOG_FILE, 'w') as f:
    print("Sample File name - {}".format(LOG_FILE), file=f)


with open(LOG_FILE, 'a') as f:
                print("Sample text ", file=f)
