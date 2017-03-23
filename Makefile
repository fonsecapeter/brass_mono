DIR := ${CURDIR}

init:
	@./scripts/init.sh

build:
	@./scripts/build.sh

clean:
	@./scripts/clean.sh

install:
	@./scripts/reset_user_fonts.sh

