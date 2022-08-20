import logging

import application

########### logging declarations
logging.basicConfig(level=logging.DEBUG, filename='logs/main.log',
                    format= ('%(asctime)s ::: '
                            '%(module)s ::: '
                            '%(message)s'), datefmt='%m/%d/%Y %I:%M:%S %p')
formatter = logging.Formatter(fmt=('%(asctime)s ::: '
                                   '%(module)s ::: '
                                   '%(message)s'), datefmt='%m/%d/%Y %I:%M:%S %p')
# Declare Logger
handler = logging.FileHandler('logs/app.log')        
handler.setFormatter(formatter)
logger = logging.getLogger("app_logger")
logger.setLevel(logging.INFO)
logger.addHandler(handler)

########### Main()
app = application.createApp()

if __name__ == '__main__':
    app.config['SECRET_KEY'] = '183ada945a324668b9331ee0988a5377'
    app.run(host="0.0.0.0", debug=True)
