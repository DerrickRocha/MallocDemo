
/* 
 * QuickSort.c by Derrick Rocha.
 * Started on 12/08/2014.
 * Instructor Gil Gallegos. 
 * Used to sort data with insertion sort algorithim.
 * This algorithim has a worst case of n^2, an average case of 
 * n*log(n), and a best case of n*log(n). The worst case space complexity is O(log(n)).
 */
#include<stdio.h>
#include"myheader.h"



 // This function partitions a list into two sub lists, 
 // and makes two recursive calls to quickSort using the sublists.
void quickSort(int a[],int low,int high){

	int pivot;
	
	if(high>low){

		pivot = partition(a,low,high);
		quickSort(a,low,pivot-1);
		quickSort(a,pivot+1,high);



	}
}

// switches the element at the left index with the element at the right.
void swap(int a[],int left,int right){

	int temp;
	temp = a[left];
	a[left] = a[right];
	a[right] = temp;
	

}

 // This function moves all array elements that are smaller than the pivot item to the 
 // left of the pivot, and all the array elements that are larger than the pivot item to the 
 // right of the pivot.
 
int partition(int a[],int l,int r){

	/**int left,right;
	int pivot_item;
	int pivot = left = low;
	pivot_item = a[low];
	right = high;

	while (left<right){

		while(a[left]<= pivot_item)
			
			left++;

		while(a[right]>pivot_item)

			right--;

		if(left<right)

			swap(a,left,right);

			
	}

	a[low] = a[right];
	a[right] = pivot_item;
	return right;**/

int pivot, i, j, t;
   pivot = a[l];
   i = l; j = r+1;
		
   while( 1)
   {
   	do ++i; while( a[i] <= pivot && i <= r );
   	do --j; while( a[j] > pivot );
   	if( i >= j ) break;
   	t = a[i]; a[i] = a[j]; a[j] = t;
   }
   t = a[l]; a[l] = a[j]; a[j] = t;
   return j;

}

