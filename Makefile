# Makefile for nanoC Parser (Assignment 4)
# CS348 - Implementation of Programming Languages Lab
# IIT Guwahati

CC      = gcc
FLEX    = flex
YACC    = yacc

TARGET  = a.out
LEX_SRC = a4_230101107.l
YACC_SRC = a4_230101107.y
TEST    = a4_230101107_test.nc

LEX_OUT  = lex.yy.c
YACC_OUT = y.tab.c
YACC_HDR = y.tab.h

.PHONY: all clean run

all: $(TARGET)

$(YACC_HDR) $(YACC_OUT): $(YACC_SRC)
	$(YACC) -d $(YACC_SRC)

$(LEX_OUT): $(LEX_SRC) $(YACC_HDR)
	$(FLEX) $(LEX_SRC)

$(TARGET): $(LEX_OUT) $(YACC_OUT)
	$(CC) $(LEX_OUT) $(YACC_OUT) -o $(TARGET)

run: $(TARGET)
	./$(TARGET) < $(TEST)

clean:
	rm -f $(LEX_OUT) $(YACC_OUT) $(YACC_HDR) $(TARGET)
