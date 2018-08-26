#include "types.h"
#include "user.h"
#include "stat.h"
#include "fcntl.h"

#define MEDUIM_SIZE 5000
#define LARGE_SIZE  50000
#define NUMBER_OF_PROCESSES_PER_TYPE 3
#define NUMBER_OF_TYPES 4
#define NUMBER_OF_PROCESSES NUMBER_OF_PROCESSES_PER_TYPE * NUMBER_OF_TYPES

void
simpleCalcMediumSized(){	
	int ans = 0;
	for(int i=0; i<MEDUIM_SIZE; i++){
		ans = ans + i;
	}
}

void
simpleCalcLargeSized(){	
	int ans = 0;
	for(int i=0; i<LARGE_SIZE; i++){
		ans = ans + i;
	}
}

void
printToScreenMediumSized(){	
	for(int i=1; i<=MEDUIM_SIZE; i++){
		printf(2, "%d little piggies\n", i);
	}
}

void
printToScreenLargeSized(){	
	for(int i=1; i<=LARGE_SIZE; i++){
		printf(2, "%d little piggies\n", i);
	}
}

int
main(void){

	int processes[NUMBER_OF_PROCESSES];
	for (int i=0; i<NUMBER_OF_PROCESSES; i++){
		processes[i] = fork();
		#ifdef CFSD
		set_priority(i%3+1);
		#endif
		if(processes[i]==0 && i < NUMBER_OF_PROCESSES_PER_TYPE){
			simpleCalcMediumSized();
			exit();
		}
		if(processes[i]==0 && i >= NUMBER_OF_PROCESSES_PER_TYPE && i < 2*NUMBER_OF_PROCESSES_PER_TYPE){
			simpleCalcLargeSized();
			exit();
		}
		if(processes[i]==0 && i >= 2*NUMBER_OF_PROCESSES_PER_TYPE && i < 3*NUMBER_OF_PROCESSES_PER_TYPE){
			printToScreenMediumSized();
			exit();
		}
		if(processes[i]==0 && i >= 3*NUMBER_OF_PROCESSES_PER_TYPE){
			printToScreenLargeSized();
			exit();
		}
	}

	int mediumCalc_avgwtime = 0, mediumCalc_avgrtime = 0, mediumCalc_avgiotime = 0;
	int largeCalc_avgwtime = 0, largeCalc_avgrtime = 0, largeCalc_avgiotime = 0;
	int mediumIO_avgwtime = 0, mediumIO_avgrtime = 0, mediumIO_avgiotime = 0;
	int largeIO_avgwtime = 0, largeIO_avgrtime = 0, largeIO_avgiotime = 0;
    int wtime = 0, rtime = 0, iotime = 0;
    
    for (int i = 0; i < NUMBER_OF_PROCESSES; i++) {
	    wait2(processes[i], &wtime, &rtime, &iotime);
	    if (i < NUMBER_OF_PROCESSES_PER_TYPE) {
	        mediumCalc_avgwtime += wtime;
	        mediumCalc_avgrtime += rtime;
	        mediumCalc_avgiotime += iotime;
	    }
	    if (i >= NUMBER_OF_PROCESSES_PER_TYPE && i < 2*NUMBER_OF_PROCESSES_PER_TYPE) {
	        largeCalc_avgwtime += wtime;
	        largeCalc_avgrtime += rtime;
	        largeCalc_avgiotime += iotime;
	    }
	    if (i >= 2*NUMBER_OF_PROCESSES_PER_TYPE && i < 3*NUMBER_OF_PROCESSES_PER_TYPE) {
	        mediumIO_avgwtime += wtime;
	        mediumIO_avgrtime += rtime;
	        mediumIO_avgiotime += iotime;
	    }
	    if (i >= 3*NUMBER_OF_PROCESSES_PER_TYPE) {
	        largeIO_avgwtime += wtime;
	        largeIO_avgrtime += rtime;
	        largeIO_avgiotime += iotime;
	    }
	}
	mediumCalc_avgwtime = mediumCalc_avgwtime/NUMBER_OF_PROCESSES_PER_TYPE;
	mediumCalc_avgrtime = mediumCalc_avgrtime/NUMBER_OF_PROCESSES_PER_TYPE;
	mediumCalc_avgiotime = mediumCalc_avgiotime/NUMBER_OF_PROCESSES_PER_TYPE;

	printf(1, "Medium calc:\nAverage wtime: %d, Average rtime: %d, Average iotime: %d\n\n", mediumCalc_avgwtime, mediumCalc_avgrtime, mediumCalc_avgiotime);

	largeCalc_avgwtime = largeCalc_avgwtime/NUMBER_OF_PROCESSES_PER_TYPE;
	largeCalc_avgrtime = largeCalc_avgrtime/NUMBER_OF_PROCESSES_PER_TYPE;
	largeCalc_avgiotime = largeCalc_avgiotime/NUMBER_OF_PROCESSES_PER_TYPE;

	printf(1, "Large calc:\nAverage wtime: %d, Average rtime: %d, Average iotime: %d\n\n", largeCalc_avgwtime, largeCalc_avgrtime, largeCalc_avgiotime);

	mediumIO_avgwtime = mediumIO_avgwtime/NUMBER_OF_PROCESSES_PER_TYPE;
	mediumIO_avgrtime = mediumIO_avgrtime/NUMBER_OF_PROCESSES_PER_TYPE;
	mediumIO_avgiotime = mediumIO_avgiotime/NUMBER_OF_PROCESSES_PER_TYPE;

	printf(1, "Medium IO:\nAverage wtime: %d, Average rtime: %d, Average iotime: %d\n\n", mediumIO_avgwtime, mediumIO_avgrtime, mediumIO_avgiotime);

	largeIO_avgwtime = largeIO_avgwtime/NUMBER_OF_PROCESSES_PER_TYPE;
	largeIO_avgrtime = largeIO_avgrtime/NUMBER_OF_PROCESSES_PER_TYPE;
	largeIO_avgiotime = largeIO_avgiotime/NUMBER_OF_PROCESSES_PER_TYPE;

	printf(1, "Large IO:\nAverage wtime: %d, Average rtime: %d, Average iotime: %d\n\n", largeIO_avgwtime, largeIO_avgrtime, largeIO_avgiotime);


    exit(); 
}