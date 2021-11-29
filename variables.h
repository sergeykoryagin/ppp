#ifndef VARIABLES_H
#define VARIABLES_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define CONTAINER_SIZE 15
#define MAX_VARIABLE_NAME 30

typedef struct Variable {
    char name[MAX_VARIABLE_NAME];
    int value;
} Variable;

typedef struct VariableContainerNode {
    Variable *variables;
    int currentLength;
    struct VariableContainerNode *next;
} VariableContainerNode;

VariableContainerNode *createVariableContainerNodeList();

VariableContainerNode *addNewVariableContainerNode(VariableContainerNode **lastNodeInList);

VariableContainerNode *getLastVariableContainerNode(VariableContainerNode **root);

Variable *assignVariable(VariableContainerNode **root, char *name, int value);

Variable *createVariable(char *name, int value);

Variable *getVariableFromList(VariableContainerNode **root, char *variableName);

VariableContainerNode *root;

#endif // VARIABLES_H