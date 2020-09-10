#!/bin/bash

USER="HERC01"
PASS="CUL8TR"
CLASS="A"
ASMSTEP=N


if [ $# = 1 ]; then
    USER=$1
fi

if [ $# = 2 ]; then
    USER=$1
    PASS=$2
fi

if [ $# = 3 ]; then
    USER=$1
    PASS=$2
    CLASS=$3
fi

if [ $# = 4 ]; then
    USER=$1
    PASS=$2
    CLASS=$3
    ASMSTEP=$4
fi

cat <<END_JOBCARD
//BRXCLEAN JOB CLASS=A,MSGCLASS=$CLASS,MSGLEVEL=(1,1),
//         USER=$USER,PASSWORD=$PASS
//*********************************************************************
//* BREXX V7R3M0 CLEAN JOB                                            *
//*********************************************************************
//*
END_JOBCARD


cat <<END_CLEAN_LINKLIB_STEP
//* ------------------------------------------------------------------
//* DELETE SYS2.LINKLIB MEMBERS
//* ------------------------------------------------------------------
//BRXDEL1  EXEC PGM=IKJEFT01,REGION=8192K
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
  DELETE 'SYS2.LINKLIB(BREXX)'
  DELETE 'SYS2.LINKLIB(REXX)'
  DELETE 'SYS2.LINKLIB(RX)'
  COMPRESS 'SYS2.LINKLIB'
/*
END_CLEAN_LINKLIB_STEP


if [ "${ASMSTEP}" = "y" ] || [ "${ASMSTEP}" == "Y" ]; then
cat << END_CLEAN_ASM_STEP
//BRXDEL2  EXEC PGM=IDCAMS,REGION=1024K
//SYSPRINT DD  SYSOUT=A
//SYSIN    DD  *
    DELETE BREXX.ASM NONVSAM SCRATCH PURGE
    DELETE BREXX.LINKLIB NONVSAM SCRATCH PURGE
    DELETE BREXX.MACLIB NONVSAM SCRATCH PURGE
    DELETE BREXX.RXMVSEXT NONVSAM SCRATCH PURGE
    DELETE BREXX.OBJ NONVSAM SCRATCH PURGE
 /* IF THERE WAS NO DATASET TO DELETE, RESET CC           */
 IF LASTCC = 8 THEN
   DO
       SET LASTCC = 0
       SET MAXCC = 0
   END
/*
END_CLEAN_ASM_STEP
fi


exit
