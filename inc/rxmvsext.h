#ifndef __RXMVSEXT_H
#define __RXMVSEXT_H

#include "lstring.h"

/* TODO: should be moved to rxmvs.h */
int  isTSO();
int  isTSOFG();
int  isTSOBG();
int  isEXEC();
int  isIPSF();

/* ---------------------------------------------------------- */
/* environment context RXENVCTX                               */
/* ---------------------------------------------------------- */
typedef  struct trx_env_ctx
{
    /* **************************/
    /* SYSVARS                  */
    /* **************************/

    /* User Information */
    char    SYSPREF[8];
        /* SYSPROC - */
            /* When the REXX exec is invoked in the foreground (SYSVAR('SYSENV') returns 'FORE'), SYSVAR('SYSPROC') will return the name of the current LOGON procedure.*/
            /* When the REXX exec is invoked in batch (for example, from a job submitted by using the SUBMIT command), SYSVAR('SYSPROC') will return the value 'INIT', which is the ID for the initiator. */
    char    SYSUID[8];
    /* Terminal Information */
        /* SYSLTERM - number of lines available on the terminal screen. In the background, SYSLTERM returns 0 */
        /* SYSWTERM - width of the terminal screen. In the background, SYSWTERM returns 132. */
    /* Exec Information */
    char    SYSENV[5];
    char    SYSISPF[11];
    /* System Information */
        /* SYSTERMID - the terminal ID of the terminal where the REXX exec was started. */
    /* Language Information */

    /* **************************/
    /* MVSVARS                  */
    /* **************************/

    /* **************************/
    /* FLAG FIELD               */
    /* **************************/

    unsigned char flags1;  /* allocations */
    unsigned char flags2;  /* environment */
    unsigned char flags3;  /* unused */
    unsigned char flags4;  /* unused */

    unsigned      dummy[32];
    unsigned     *VSAMSUBT;
    unsigned      reserved[64];

} RX_ENVIRONMENT_CTX, *RX_ENVIRONMENT_CTX_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXINIT                                  */
/* ---------------------------------------------------------- */
typedef struct trx_init_params
{
    unsigned   *rxctxadr;
    unsigned   *wkadr;
} RX_INIT_PARAMS, *RX_INIT_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXTSO                                  */
/* ---------------------------------------------------------- */
typedef struct trx_tso_params
{
    unsigned   *cppladdr;
    char       ddin[8];
    char       ddout[8];
} RX_TSO_PARAMS, *RX_TSO_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXSVC                                     */
/* ---------------------------------------------------------- */
typedef struct trx_svc_params
{
    int SVC;
    unsigned int R0;
    unsigned int R1;
    unsigned int R15;
} RX_SVC_PARAMS, *RX_SVC_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXVSAM                                    */
/* ---------------------------------------------------------- */
typedef  struct trx_vsam_params
{
    char            VSAMFUNC[8];
    unsigned char   VSAMTYPE;
    char            VSAMDDN[8];
    char            VSAMKEY[255];
    unsigned char   VSAMKEYL;
    unsigned char   ALLIGN1[3];
    unsigned       *VSAMREC;
    unsigned short  VSAMRECL;
    unsigned char   ALLIGN2[2];
    unsigned       *VSAMSUBTA;
    unsigned        VSAMRCODE;
    unsigned        VSAMFILL[2];
    char            VSAMMSG[81];
    char            VSAMTRC[81];
} RX_VSAM_PARAMS, *RX_VSAM_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXPTIME                                   */
/* ---------------------------------------------------------- */
typedef struct trx_ptime_params
{
    unsigned    *wptmadr;
    unsigned    *wptladr;
    unsigned    *wptccadr;
    unsigned    *wptwkadr;
} RX_PTIME_PARAMS, *RX_PTIME_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXSTIME                                   */
/* ---------------------------------------------------------- */
typedef struct t_rx_stime_params
{
    unsigned    *wstmadr;
    unsigned    *wstladr;
    unsigned    *wstccadr;
    unsigned    *wstwkadr;
} RX_STIME_PARAMS, *RX_STIME_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXWTO                                     */
/* ---------------------------------------------------------- */
typedef struct t_rx_wto_params
{
    char        *msgadr;
    unsigned    *msgladr;
    unsigned    *ccadr;
    unsigned    *wkadr;
} RX_WTO_PARAMS, *RX_WTO_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXWAIT                                     */
/* ---------------------------------------------------------- */
typedef struct t_rx_wait_params
{
    unsigned    *timeadr;
    unsigned    *ccadr;
    unsigned    *wkadr;
} RX_WAIT_PARAMS, *RX_WAIT_PARAMS_PTR;

/* ---------------------------------------------------------- */
/* assembler module RXABEND                                   */
/* ---------------------------------------------------------- */
typedef struct trx_abend_params
{
    int         ucc;
} RX_ABEND_PARAMS, *RX_ABEND_PARAMS_PTR;

void getVariable(char *sName, PLstr plsValue);
int  getIntegerVariable(char *sName);
void setVariable(char *sName, char *sValue);
void setIntegerVariable(char *sName, int iValue);

#ifdef __CROSS__
int  call_rxinit(RX_INIT_PARAMS_PTR params);
int  call_rxtso(RX_TSO_PARAMS_PTR params);
void call_rxsvc(RX_SVC_PARAMS_PTR params);
int  call_rxvsam(RX_VSAM_PARAMS_PTR params);
int  call_rxptime (RX_PTIME_PARAMS_PTR params);
int  call_rxstime (RX_STIME_PARAMS_PTR params);
int  call_rxwto (RX_WTO_PARAMS_PTR params);
int  call_rxwait (RX_WAIT_PARAMS_PTR params);
unsigned int call_rxabend (RX_ABEND_PARAMS_PTR params);
#else
extern int  call_rxinit(RX_INIT_PARAMS_PTR params);
extern int  call_rxtso(RX_TSO_PARAMS_PTR params);
extern void call_rxsvc(RX_SVC_PARAMS_PTR params);
extern int  call_rxvsam(RX_VSAM_PARAMS_PTR params);
extern int  call_rxptime (RX_PTIME_PARAMS_PTR params);
extern int  call_rxstime (RX_STIME_PARAMS_PTR params);
extern int  call_rxwto (RX_WTO_PARAMS_PTR params);
extern int  call_rxwait (RX_WAIT_PARAMS_PTR params);
extern unsigned int call_rxabend (RX_ABEND_PARAMS_PTR params);
#endif

/* ---------------------------------------------------------- */
/* MVS control blocks                                         */
/* ---------------------------------------------------------- */

struct psa {
    char    psastuff[548];      /* 548 bytes before ASCB ptr */
    struct  ascb *psaaold;
};

struct ascb {
    char    ascbascb[4];        /* acronym in ebcdic -ASCB- */
    char    ascbstuff[104];     /* 104 byte to the ASXB ptr */
    struct  asxb *ascbasxb;
};

struct asxb {
    char    asxbasxb[4];        /* acronym in ebcdic -ASXB- */
    char    asxbstuff[16];         /* 16 bytes to the lwa ptr */
    struct lwa *asxblwa;
};

struct lwa {
    int     lwapptr;          /* address of the logon work area */
    char    lwalwa[8];        /* ebcdic ' LWA ' */
    char    lwastuff[12];     /* 12 byte to the PSCB ptr */
    struct  pscb *lwapscb;
};

struct pscb {
    char    pscbstuff[52];        /* 52 byte before UPT ptr */
    struct  upt *pscbupt;
};

struct upt {
    char    uptstuff[16];         /* 16 byte before UPTPREFX */
    char    uptprefx[7];        /* dsname prefix */
    char    uptprefl;        /* length of dsname prefix */
};

#endif