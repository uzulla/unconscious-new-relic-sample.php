FROM php:8.1-apache

RUN apt update && apt install -y sudo gnupg syslog-ng

RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list && \
    php -r "readfile('https://download.newrelic.com/548C16BF.gpg');" | sudo apt-key add - && \
    sudo apt-get update && \
    sudo apt-get -y install newrelic-php5 && \
    sudo NR_INSTALL_SILENT=1 newrelic-install install

RUN echo "newrelic.license = \"\${NR_LICENSE_KEY}\"" >> $(php -r "echo(PHP_CONFIG_FILE_SCAN_DIR);")/newrelic.ini && \
    echo "newrelic.appname = \"\${NR_APP_NAME}\"" >> $(php -r "echo(PHP_CONFIG_FILE_SCAN_DIR);")/newrelic.ini

COPY ./syslog-ng.conf /etc/syslog-ng/syslog-ng.conf