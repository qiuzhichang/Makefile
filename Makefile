
CC = gcc
CFLAGS = -Wall -O2

export SHELL = /bin/bash
TOP_DIR = $(shell pwd)
BIN_DIR = $(TOP_DIR)/bin
SRC_DIR = $(TOP_DIR)/src

C_SRC = $(wildcard $(SRC_DIR)/*.c)
CPP_SRC = $(wildcard $(SRC_DIR)/*.cpp)
C_CPP_SRC = $(C_SRC) $(CPP_SRC)

C_OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(C_SRC))
CPP_OBJ = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.obj,$(CPP_SRC))
OBJ = $(C_OBJ) $(CPP_OBJ)

NOTDIR_C_CPP_SRC = $(notdir $(basename $(C_CPP_SRC)))
FILES =  $(basename $(C_CPP_SRC))

RM = rm

all: $(FILES)
	cp $(FILES) $(TOP_DIR)
	mv $(FILES) $(BIN_DIR)
	@echo $(NOTDIR_C_CPP_SRC)
	# @echo $(C_CPP_SRC)
	# @echo "hello aqiu"
	# @echo $(FILES)
	# @echo "hello aqiu"

clean:
	-$(RM) $(FILES) $(BIN_DIR)/* $(TOP_DIR)/$(NOTDIR_C_CPP_SRC)  *.o *~
