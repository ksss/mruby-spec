MRUBY_CONFIG=../build_config.rb

run: compile
	mruby/bin/mruby mspec/bin/mspec -B mruby.mspec $(TESTS)
.PHONY: run

build: mruby spec mspec
.PHONY: build

mruby:
	git clone --depth 1 https://github.com/mruby/mruby.git

spec:
	git clone --depth 1 https://github.com/ruby/spec.git

mspec:
	git clone --depth 1 https://github.com/ruby/mspec.git

compile: build
	cd mruby; MRUBY_CONFIG=${MRUBY_CONFIG} ruby ./minirake
.PHONY: compile

pull:
	cd mruby; git pull
	cd spec; git pull
	cd mspec; git pull
.PHONY: pull
clean:
	rm -fr mruby spec mspec
.PHONY: clean
