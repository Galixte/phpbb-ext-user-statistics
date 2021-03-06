#!/bin/bash
#
# User Statistics extension for the phpBB Forum Software package.
#
# @copyright (c) 2015 Jakub Senko <jakubsenko@gmail.com>
# @license GNU General Public License, version 2 (GPL-2.0)
#
set -e
set -x

DB=$1
TRAVIS_PHP_VERSION=$2

if [ "$TRAVIS_PHP_VERSION" == "5.5" -a "$DB" == "mysqli" ]
then
	cd ../Senky/phpbb-ext-user-statistics
    wget https://scrutinizer-ci.com/ocular.phar
    php ocular.phar code-coverage:upload --format=php-clover ../../phpBB3/build/logs/clover.xml
fi
