/* CPP PRACTICE MATERIAL

Author: Dhananjay Vijayaraghavan
Date Created: 20 Jan 2024
Last Modified: 20 Jan 2024

This code is written as part of practicing C/C++ for either interviews 
or courses. The objective is this codebase is to provide an easy, workable template 
that is flexible, yet easy to use for practice and revision. 

Project: Array element removal. 
         Removal of all the occurences of an element in an array.  

FILE:       arrayops.cc
PURPOSE:    Defining a file to perform different array operations. 
            List of functions defined:
                1. Removal of all occurences of an element.  
*/

#include <stdio.h>
#include <stdlib.h>

#include "arrayops.hh"

int removeAllElementOccurences(int *A, int N, int element)
{
    /* 
    Function to remove all the occurences of an element 
    in the array. 

    A: array to remove the elements from 
    element: element to remove from the array. 
    */

   int cnt = 0;

   for(int i=0; i<N; i++)
   {
    if(A[i] == element)
    {
        cnt++; // Increasing occurence count
    }
    else
    {
        A[i-cnt] = A[i];  // Shifting all non-target elements by number of occurences
    }

   }

   return cnt;

}

