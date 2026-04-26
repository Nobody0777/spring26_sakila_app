# Authors: Muhammad Qasim Tahir & M. Saad Asim
# Date: April 25, 2026
# Description: Combined configuration settings

import os

MYSQL_HOST = 'sakila-db-server'

# Addressed PR review: added try/except for safer integer parsing
try:
    CONNECTION_TIMEOUT = int(os.environ.get('CONNECTION_TIMEOUT', '30'))
except ValueError:
    CONNECTION_TIMEOUT = 30

HEALTH_CHECK_INTERVAL = int(os.environ.get('HEALTH_CHECK_INTERVAL', '10'))