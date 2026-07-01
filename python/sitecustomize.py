import logging.config
import os

if 'LOGGING_CONF' in os.environ:
    logging.config.fileConfig(os.environ['LOGGING_CONF'])
