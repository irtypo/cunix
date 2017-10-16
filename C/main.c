/* header */

#include <stdio.h>
#include <math.h>

#define NAME_LENGTH 128

int main() {
	/* 
	float s2;
	unsigned int myAge;
	*/
	char name[NAME_LENGTH];
	int *grades;		/* '*'' is a pointed to an int. or pointer to first elem of array that holds ints */

	grades = malloc(10 * sizeof(int));

	grades[0] = 100;
	grades[1] = 90;
	printf("%d\n", grades[0]);
	scanf("%d", *grades[0]);

	free(grades);


	/*
	s2 = sqrt(2);
	printf("sqrt(2) =  %f\n", (double)s2);

	printf("enter age: ");
	scanf("%u", &myAge);
	*/
	
	printf("Please enter your name: ");
	scanf("%s", name);

	printf("Your name is: %s", name);

	return 0;
}

void printAndZeroValue(unsigned int *myAge){
	printf("in fucntion, myAge = %u", *myAge);
	myAge = 0;
}


