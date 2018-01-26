# when you run 'make' alone, run the 'css' rule (at the
# bottom of this makefile)
all: build.dev

# .PHONY is a special command, that allows you not to
# require physical files as the target (allowing us to
# use the 'all' rule as the default target).
.PHONY: all

# Begin Cleaning Targets
clean:
	git clean -Xdf -e \!backup -e \!node_modules -e \!node_modules/.yarn-integrity -e \!www/vendor -e \!www/.env
	rm -f www/vendor/autoload.php

clean-dev: clean
	git clean -Xdf -e \!www/.env -e \!backup

clean.cache:
	git clean -Xdf www/var/cache/ www/var/sessions/

clean.vendor:
	rm -rf www/vendor/
# End Cleaning Targets

# Begin Compile Targets
build.dev: prepare
	yarn run encore dev

build.prod: prepare
	yarn run encore production
# End Compile Targets

# Begin Test Targets
phpcs: phpcs.errors

phpcbf: phpcbf.errors

phpcs.warnings:
	www/vendor/bin/phpcs -p --colors --standard=phpcs.xml www/src/

phpcbf.warnings:
	www/vendor/bin/phpcbf -p --colors --standard=phpcs.xml www/src/

phpcs.errors:
	www/vendor/bin/phpcs -p --colors --warning-severity=0 --standard=phpcs.xml www/src/

phpcbf.errors:
	www/vendor/bin/phpcbf -p --colors --warning-severity=0 --standard=phpcs.xml www/src/

phpunit:
	cd www/ && bin/phpunit tests/Repository/TeamDocumentRepositoryTest.php
# End Test Targets

# Begin Prepare Targets
autoload:
	cd www/ && composer dumpautoload --optimize

prepare: www/composer.lock www/vendor/autoload.php

www/vendor/autoload.php: www/composer.lock
	cd www/ && composer install

www/composer.lock: www/composer.json
	cd www/ && composer update
	touch www/vendor/autoload.php

node_modules/: package.json yarn.lock
	yarn install
	touch node_modules/
# End Prepare Targets
