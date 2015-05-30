/*
 * By Derrick Rocha
 * 05-08-15
 * Instructor Gil Gallegos. 
 * This c file implements the function definitions found in myheader.h
 *
 */


#include<stdio.h>
#include"myheader.h"

int n = 1000000;
int i;

void loadArray(int *p){

	srand(time(NULL));

	for(i=0;i<n;i++){
		
		p[i] = getRandomNumber(0,1000);

	}

}


void sortArray(int *p){

	quickSort(p,0,n); // This function is defined in QuickSort.c
}


void printArray(int *p){

	for(i=0;i<n;i++){
		
		printf("%d\n",p[i]);

	}

}


int getRandomNumber(int min_num,int max_num){

	int result =0,low_num = 0,hi_num=0;

	if(min_num<max_num){

		low_num = min_num;
		hi_num = max_num+1;

	}

	else{

		low_num = max_num+1;
		hi_num = min_num;
	
	}
	
	
	result = (rand()%(hi_num-low_num))+low_num;

	return result;
	
}
