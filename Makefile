PYTHON ?= python3
CONFIG ?= config.example.txt
SOURCES = a_maze_ing.py $(wildcard src/mazegen/*.py)

all: check

check:
	$(PYTHON) -m py_compile $(SOURCES)

run:
	$(PYTHON) a_maze_ing.py $(CONFIG)

.PHONY: all check run

test:
	$(PYTHON) -m unittest discover -s tests -v

.PHONY: test
