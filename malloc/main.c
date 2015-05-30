/*
 * By Derrick Rocha
 * 05-08-15
 * Instructor Gil Gallegos. 
 * This program uses malloc to dynamically allocate memory to hold 1,000,000 integers.
 * The array is than filled with random numbers from 0 to 10,000. The quick sort algorithm
 * is then used to sort the elements in the array. The array is then printed using printf.
 *
 */


#include<stdio.h>
#include<stdlib.h>
#include"myheader.h"


void main(){

	int *p = malloc(1000000*sizeof(int)); // dynamically allocates memory space to hold 1,000,000 integers.

	loadArray(p); // loads the array with random numbers from 0 to 10000. This function is defined in functions.c
	sortArray(p); // sorts the array using quick sort. This function is defined in functions.c
	printArray(p);// Prints the array elements to the screen. This function is defined in functions.c
	
	free(p); // free memory allocated by malloc to prevent memory leaks.
	p = NULL; // Set pointer to null to avoid dangling pointer.
}
