.PHONY:all clean

CC = g++ -g
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

LINK_OBJ_DIR = $(BUILD_ROOT)/app/link_objs
$(shell mkdir -p $(LINK_OBJ_DIR))
DEP_DIR = $(BUILD_ROOT)/app/deps
$(shell mkdir -p $(DEP_DIR))

BIN := $(addprefix $(BUILD_ROOT)/,$(BIN))

OBJS := $(addprefix $(LINK_OBJ_DIR)/, $(OBJS))
DEPS := $(addprefix $(DEP_DIR)/, $(DEPS))

LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ +=$(OBJS)

INC_DIR = $(BUILD_ROOT)/include

all: $(DEPS) $(OBJS) $(BIN)

ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif

$(BIN):$(LINK_OBJ)
	$(CC) -o $@ $^ 

$(LINK_OBJ_DIR)/%.o:%.cpp
	$(CC) -I$(INC_DIR) -o $@ -c $^

$(DEP_DIR)/%.d:%.cpp
	$(CC) -I$(INC_DIR) -MM $(filter %.cpp,$^) | sed 's,\(.*\)\.o[ :]*,$(LINK_OBJ_DIR)/\1.o $@:,g' > $@

clean:
	@echo "$(INC_DIR)"
	rm $(BIN) $(OBJS) $(DEPS)
