/*
 * $Header: /home/bnv/tmp/brexx/src/RCS/maintest.c,v 1.1 1998/07/02 17:34:50 bnv Exp $
 * $Log: maintest.c,v $
 * Revision 1.1  1998/07/02 17:34:50  bnv
 * Initial revision
 *
 */
#include <bnv.h>
#include <stdio.h>
#include <string.h>
#include <lstring.h>

#include <rexx.h>
#include <rxdefs.h>

/* ----------- MyFunc -------- */
void
MyFunc( int test )
{
	if (test)
		Lscpy(ARGR,"Banana");
	else
		Lscpy(ARGR,"Bingo");
} /* MyFunc */

/* --------------------- main ---------------------- */
int
main(int ac, char *av[])
{
	Lstr	args, tracestr, file;
	int	input,ia,ir;

	input = FALSE;
	LINITSTR(args);
	LINITSTR(tracestr);
	LINITSTR(file);

	if (ac<2) {
		puts("\nsyntax: rexx [-[trace]] <filename> <args>...\nrexx - (to use stdin)\n");
		puts(VERSION);
		puts("Author: "AUTHOR);
		puts("Please report any bugs, fatal errors or comments to the");
		puts("above address, or to <bnv@nisyros.physics.auth.gr>\n");
		return 0;
	}
#ifdef __DEBUG__
	__debug__ = FALSE;
#endif

	/* --- Initialise --- */
	RxInitialize(av[0]);

	/* --- User registered functions --- */
	RxRegFunction("BINGO",MyFunc,0);
	RxRegFunction("BANANA",MyFunc,1);

	/* --- scan arguments --- */
	ia = 1;
	if (av[ia][0]=='-') {
		if (av[ia][1]==0)
			input = TRUE;
		else
			Lscpy(&tracestr,av[ia]+1);
		ia++;
	} else
	if (av[ia][0]=='?' || av[ia][0]=='!') {
		Lscpy(&tracestr,av[ia]);
		ia++;
	}

	/* --- let's read a normal file --- */
	if (!input && ia<ac) {
		/* prepare arguments for program */
		for (ir=ia+1; ir<ac; ir++) {
			Lcat(&args,av[ir]);
			if (ir<ac-1) Lcat(&args," ");
		}
		RxRun(av[ia],NULL,&args,&tracestr,NULL);
	} else {
		if (ia>=ac)
			Lread(stdin,&file,LREADFILE);
		else
			for (;ia<ac; ia++) {
				Lcat(&file,av[ia]);
				if (ia<ac-1) Lcat(&file," ");
			}
		RxRun(NULL,&file,&args,&tracestr,NULL);
	}

	/* --- Free everything --- */
	RxFinalize();
	LFREESTR(args);
	LFREESTR(tracestr);
	LFREESTR(file);

#ifdef __DEBUG__
	if (mem_allocated()!=0) {
		fprintf(stderr,"\nMemory left allocated: %ld\n",mem_allocated());
		mem_list();
	}
#endif

	return RxReturnCode;
} /* main */
