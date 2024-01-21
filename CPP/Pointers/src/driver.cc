/* CPP PRACTICE MATERIAL

Author: Dhananjay Vijayaraghavan
Date Created: 20 Jan 2024
Last Modified: 20 Jan 2024

This code is written as part of practicing C/C++ for either interviews 
or courses. The objective is this codebase is to provide an easy, workable template 
that is flexible, yet easy to use for practice and revision. 

Project: Array element removal. 
         Removal of all the occurences of an element in an array.  

FILE:       driver.cc
PURPOSE:    The top level file that implements and tests functionality.
            Add all peripheral functions that are required for preprocessing 
            and implementation of the system. 

FUNCTIONALITY:
            Program expects 2 CLI arguments, a file consisting of array elements
            and the element to be removed. 

*/

#include <stdlib.h>
#include <stdio.h>

#include "arrayops.hh"

#define VERBOSE 1

// All function prototypes here. Add them in order of declaration. 

int* getArrayFromFile(char* filename, int &N);
void printIntArray(int* A, int N);

// Main function. 
int main(int argc, char* argv[])
{
    int N, element;
    int* A;

    if (argc == 3)
    {
        element = atoi(argv[2]);
        A = getArrayFromFile(argv[1], N);
    }
    else
    {
        fprintf(stderr, "Usage: %s <filename> <n> \n" , argv[0] );
        fprintf(stderr, "where filename is the file containing the array \n");
        fprintf(stderr, "where n is the element to be removed\n");
        return -1;    
    }

    if (VERBOSE)
    {
        printf("Array extracted: \n");
        printIntArray(A, N);
        printf("Element to be removed: %d\n", element);
    }

    printf("Removing all occurences of %d in array....\n", element);
    int cnt = removeAllElementOccurences(A, N, element);
    N -= cnt;
    printf("%d occurences found....\n", cnt);
    if(VERBOSE)
    {
        printf("New array is: \n");
        printIntArray(A, N);
    }

    return 0;
}

// Function declarations. 

int* getArrayFromFile(char* filename, int &N)
{
    int* A = NULL;

    FILE* fp;
    char* line = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen(filename, "r");
    if(fp == NULL)
    {
        fprintf(stderr, "Could not open file: %s", filename);
        exit(EXIT_FAILURE);
    }
    
    read = getline(&line, &len, fp);
    if (read != -1)
    {
        line[read-1] = '\0';
        N = atoi(line);
        A = (int*) malloc(N * sizeof(int));
    }

    int i = 0;
    while ((read = getdelim(&line, &len, ',', fp)) != -1)
    {
        if(line[read-1] == '\n') line[read-1] = '\0';
        A[i] = atoi(line);
        i++;
    }
    return A;
}

void printIntArray(int* A, int N)
{
    /* 
    Function to print and integer array *
    int* A : pointer to array
    int N: Length of array
    */

    for(int i=0; i<N; i++)
    {
        printf("%d ", A[i]);
    }
    printf("\n");
}



