.PHONY:all clean

CC = g++
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

bin = main

all:$(bin) $(DEPS)

ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif

$(bin):$(OBJS)
	$(CC) -o $@ $^

%.o:%.cpp
	$(CC) -o $@ -c $^

%.d:%.cpp
	$(CC) -MM $^ > $@

clean:
	rm $(bin) $(OBJS) $(DEPS)
