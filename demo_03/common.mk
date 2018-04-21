.PHONY:all clean

CC = g++
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

all: $(DEPS) $(OBJS) $(BIN)

ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif

$(BIN):$(OBJS)
	$(CC) -o $@ $^ ../a_dir/a.o ../b_dir/b.o

%.o:%.cpp
	$(CC) -o $@ $(INC) -c $^

%.d:%.cpp
	$(CC) -MM $^ > $@

clean:
	rm $(BIN) $(OBJS) $(DEPS)
