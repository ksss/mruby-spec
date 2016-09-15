run: compile
	cp todo/rbconfig.rb mruby/build/host/lib
	cp todo/iconv.rb mruby/build/host/lib
	cp todo/pp.rb mruby/build/host/lib
	mruby/bin/mruby mspec/bin/mspec-run spec/$(TESTS)
.PHONY: run

build: mruby spec mspec
.PHONY: build

mruby:
	git clone --depth 1 https://github.com/mruby/mruby.git
	sed -i -e 's|//#define MRB_INT64|#define MRB_INT64|' mruby/include/mrbconf.h

spec:
	git clone --depth 1 https://github.com/ruby/spec.git

mspec:
	git clone --depth 1 https://github.com/ruby/mspec.git

compile: build
	cd mruby; MRUBY_CONFIG=../build_config.rb ruby ./minirake
.PHONY: compile

pull:
	cd mruby; git pull
	cd spec; git pull
	cd mspec; git pull
.PHONY: pull
clean:
	rm -fr mruby spec mspec
.PHONY: clean
