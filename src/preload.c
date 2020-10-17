#include <string.h>

#include "lerror.h"
#include "lstring.h"

#include "preload.h"
int
RxPreLoad(RxFile *rxf,char *code) {
    int clen;
    clen=strlen(code);
    Lfx(&rxf->file, clen+32);
    LZEROSTR(rxf->file);
    strcpy(LSTR(rxf->file), code);
    LLEN(rxf->file) = clen;
    LTYPE(rxf->file) = LSTRING_TY;
    LASCIIZ(rxf->file);
}
/* ----------------- RxPreLoaded ------------------- */
int __CDECL
RxPreLoaded(RxFile *rxf) {
    if (strcasecmp(LSTR(rxf->name), "PEEKA") == 0) {
            RxPreLoad(rxf, "PEEKA: return c2d(storage(d2x(arg(1)),4))");
    }else if (strcasecmp(LSTR(rxf->name), "LINKMVS") == 0) {
            RxPreLoad(rxf,"LINKMVS: Procedure;trace off;_p='';"
                      "do i=2 to arg();_p=_p''arg(i)',';end;"
                      "_a=address();ADDRESS SYSTEM;if arg()>1 then do;"
                      "_p=substr(_p,1,length(_p)-1);interpret arg(1) \"'\"_p\"'\";end;"
                      "else interpret arg(1);_r=rc;"
                      "if _a<>'SYSTEM' then interpret \"ADDRESS \"_a;return _r");
    }else if (strcasecmp(LSTR(rxf->name), "BASE64DEC") == 0) {
            RxPreLoad(rxf,"BASE64DEC: procedure;trace off;"
                      "b64='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';"
                      "_f=strip(translate(arg(1),'+/','-_' ));_s='';"
                      "do while abbrev('==',_f)=0;parse var _f _o 2 _f;_o=d2x( pos(_o,b64)-1);"
                      "_s=_s||right(x2b(_o),6,0);end;return x2c(b2x(left(_s,length(_s)-2*length(_f))))");
    }else if (strcasecmp(LSTR(rxf->name), "BASE64ENC") == 0) {
            RxPreLoad(rxf,"BASE64ENC: Procedure;trace off;"
                       "!b64='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';"
                       "_f=x2b(c2x(arg(1)));_s='';_t=int((length(_f)/4)//3);"
                       "_f=_f||copies('00',_t);do while _f<>'';parse var _f n 7 _f;"
                       "n=x2d(b2x(n));_s=_s||substr(!b64,n+1,1);end;return _s||copies('=',_t );");
    } else if (strcasecmp(LSTR(rxf->name), "CLRSCRN") == 0) {
            RxPreLoad(rxf, "CLRSCRN: ADDRESS TSO 'CLS';return 0");
    } else if (strcasecmp(LSTR(rxf->name), "STIME") == 0) {
            RxPreLoad(rxf, "STIME: PROCEDURE; PARSE VALUE TIME('L') WITH __HH':'__MM':'__SS'.'__HS;"
                       "return __HH*360000+__MM*6000+__SS*100+__HS");
    }else if (strcasecmp(LSTR(rxf->name), "EPOCHTIME") == 0) {
            RxPreLoad(rxf,"EPOCHTIME: procedure;trace off;"
                       "parse arg dd,mm,yy;if dd='' then do;"
                       "parse value date('e') with dd'/'mm'/'yy;yy='20'yy;"
                       "secs=time('s');end;else do;"
                       "if _vr(dd,1,31)>0 then signal tserror;"
                       "if _vr(mm,1,12)>0 then signal tserror;"
                       "if _vr(yy,1970,2040)>0 then signal tserror;"
                       "secs=0;end;a=(14-mm)%12;m=mm+12*a-3;y=yy+4800-a;"
                       "j=dd+(153*m+2)%5+365*y;j=j+y%4-y%100+y%400-32045;"
                       "return int((j-1721426-719162)*86400+secs);_vr:;"
                       "if datatype(arg(1))<>'NUM' then return 8;"
                       "if arg(1)<arg(2) | arg(1)>arg(3) then return 8;return 0;"
                       "tserror: SAY 'DATE IN ERROR: 'DD'.'MM'.'YY;exit 8");
    } else if (strcasecmp(LSTR(rxf->name), "MOD") == 0) {
           RxPreLoad(rxf, "MOD: return arg(1)%arg(2)");
    } else if (strcasecmp(LSTR(rxf->name), "REM") == 0) {
           RxPreLoad(rxf, "REM: return arg(1)//arg(2)%1");
    } else if (strcasecmp(LSTR(rxf->name), "B2C") == 0) {
           RxPreLoad(rxf, "B2C: return x2c(b2x(arg(1)))");
    } else if (strcasecmp(LSTR(rxf->name), "C2B") == 0) {
           RxPreLoad(rxf, "C2B: return x2b(c2x(arg(1)))");
    } else if (strcasecmp(LSTR(rxf->name), "ROOT") == 0) {
           RxPreLoad(rxf, "ROOT:;r=POW(arg(1),1/arg(2)); return r");
    } else if (strcasecmp(LSTR(rxf->name), "DUMPVAR") == 0) {
           RxPreLoad(rxf, "DUMPVAR: Procedure;trace off;parse upper arg vname;"
                       "xname=value(vname,,-1);vaddr=addr('xname');"
                       "vlen=length(xname);say 'Core Dump of 'vname', length 'vlen', length displayed 'vlen+16;"
                       "say copies('-',77);vlen=vlen+16;"
                       "call dumpit d2x(vaddr),vlen;return 0");
    }else if (strcasecmp(LSTR(rxf->name), "EPOCH2DATE") == 0) {
           RxPreLoad(rxf,"EPOCH2DATE: procedure;trace off;"
                       "udd=arg(1)%int(86400);udt=arg(1)//int(86400);"
                       "hh=right(udt%int(3600),2,'0');ut=udt//int(3600);"
                       "mm=right(ut%int(60),2,'0');ut=ut//int(60);ss=right(int(ut),2,'0');"
                       "return rxdate('e',udd,'unix')' 'hh':'mm':'ss");
    }else if (strcasecmp(LSTR(rxf->name), "GETTOKEN") == 0) {
           RxPreLoad(rxf,"GETTOKEN: Procedure;trace off;"
                       "if abbrev('CENTURY',upper(arg(1)),1)=1 then do;"
                       "call wait 1;DX=date('sorted');DX=substr(DX,2,2)+365*substr(DX,4);"
                       "return DX||filter(time('L'),'.:');end;"
                       "return peeka(peeka(peeka(16)+604)+124)");
    }else if (strcasecmp(LSTR(rxf->name), "JOBINFO") == 0) {
           RxPreLoad(rxf,"JOBINFO: procedure expose job.;trace off;drop job.;"
                       "job.name=strip(peeks(__tiot(),8));ssib=peeka(__jscb()+316);"
                       "jobn=peeks(ssib+12,8);job.number=translate(jobn,'0',' ');"
                       "proc=strip(peeks(__tiot()+8,8));"
                       "stepn=strip(peeks(__tiot()+16,8));if stepn='' then job.step=proc;"
                       "else job.step=proc'.'stepn;job.program=peeks(__jscb()+360,8);"
                       "return job.name;__tcb: return peeka(540);"
                       "__tiot: return peeka(__tcb()+12);__jscb: return peeka(__tcb()+180)");
    }else if (strcasecmp(LSTR(rxf->name), "PEEKS") == 0) {
           RxPreLoad(rxf,"PEEKS: return storage(d2x(arg(1)),arg(2));");
    }else if (strcasecmp(LSTR(rxf->name), "VERSION") == 0) {
           RxPreLoad(rxf,"VERSION: Procedure;parse upper arg mode;"
                       "parse version lang vers ptf '('datef')';"
                       "if abbrev('FULL',mode,1)=0 then return vers;parse var datef mm dd yy;"
                       "return 'Version 'vers' Build Date 'dd'. 'mm' 'yy");
    }else if (strcasecmp(LSTR(rxf->name), "SPLITBS") == 0) {
          RxPreLoad(rxf,"SPLITBS:;trace off; parse arg I_#1,I_#2,I_#3;"
                      "if I_#2='' then I_#2='mystem.';"
                      "else if substr(I_#2,length(I_#2),1)<>'.' then I_#2=I_#2'.';"
                      "I_#3=upper(I_#3);I_#4=length(I_#3);interpret 'drop 'I_#2;I_7=1;I_5=1;"
                      "I_6=pos(I_#3,I_#1);if I_6>0 & I_#4>0 then;do until I_6=0;"
                      "interpret I_#2'i_7=substr(I_#1,I_5,I_6-I_5)';i_7=i_7+1;I_5=I_6+I_#4;"
                      "I_6=pos(I_#3,I_#1,I_5);end;interpret I_#2'i_7=substr(I_#1,I_5)';"
                      "interpret I_#2'0=i_7';return i_7;");
    }else if (strcasecmp(LSTR(rxf->name), "LOADP") == 0) {
        RxPreLoad(rxf,"LOADP: Procedure;parse upper arg _p;      ;"
                      "if length(_p)>8 then _p=substr(_p,1,8);else if _p='' then _p='default';"
                      "_AD=userid()\".REXX.PROF(\"_P\")\";_AE=\"'\"userid()\".REXX.PROF(\"_P\")'\";"
                      "if exists(_AE)<>1 then return 4;_fk=getG('PROF_file_'_p);if _fk>0 then do;"
                      "call close _fk;call setG('PROF_file_','');end;"
                      "if Import(_ad)<>0 then return 8;signal on syntax name _#ierr;"
                      "interpret 'call PROF_'_p;say vlist(_p);_A=changestr('=\"',vlist(_p),'\",\"');"
                      "call split(_A,'_x','15'x);drop _a;do i=1 to _x.0;"
                      "interpret '#=SETG(\"'_x.i\")\";end;drop _x.;_a=vlist(_p);_fk=open(_AE,'rb');"
                      "fs=SEEK(_fk,0,\"EOF\");call close _fk;if fs<length(_A)*1.5 then return 0;"
                      "_fk=open(_AE,'wb');if _fk<=0 then return 4;call write _fk,'PROF_'_p':  '_A;"
                      "call close _fk;return 0;_#ierr:;"
                      "say 'Error '_ae' corrupted, label PROF_'_p': missing, or';"
                      "say '       file contains invalid statements';return 8");
    }else if (strcasecmp(LSTR(rxf->name), "SETP") == 0) {
          RxPreLoad(rxf,"SETP: Procedure;trace off;parse upper arg _p,_v;if _p='' then _p='default';"
                       "if length(_p)>8 then _p=substr(_p,1,8);_fk=getG('PROF_file_'_p);"
                        "if _fk='' then _fk=_#cpds();if _fk<=0 then return _fk;"
                       "call write(_fk,_p'_'_v'=\"'arg(3)'\"','nl');call setg(_p'_'_v,arg(3));"
                        "return 0;_#cpds:;_AD=userid()'.REXX.PROF';_ap=\"'\"_ad'('_p\")'\";"
                       "if exists(\"'\"_AD\"'\")<1 then _fk=_#apds();"
                       "else if exists(_ap)=1 then _fk=_#rpds();else _fk=_#npds();"
                       "if _fk<=0 then return -1;call setg('PROF_file_'_p,_fk);return _fk;"
                       "_#npds:;_fk=open(_ap,'wt');if _fk<=0 then return -1;#=_#wlb();"
                       "return _fk;_#rpds:;_fk=open(_ap,'RB');if _fk<=0 then return -2;"
                       "eof=seek(_fk,0,'EOF');call seek(_fk,0,'TOF');_b=read(_fk,eof);"
                       "call close _fk;_fk=open(_ap,'wb');if _fk<=0 then return -2;"
                       "if pos('PROF_'_p':',substr(_b,1,40))=0 then call _#wlb;"
                        "call write(_fk,_b);drop _b;return _fk;_#apds:;"
                       "rc=CREATE(\"'\"_AD\"'\",'recfm=vb,lrecl=255,blksize=5100,unit=sysda,;"
                       ",pri=30,sec=30,dirblks=50');if rc<0 then return -3;_fk=open(_ap,'wt');"
                       "if _fk<=0 then return -1;call _#wlb;return _fk;"
                       "_#wlb: return write(_fk,'PROF_'_p':','nl')");
    }else if (strcasecmp(LSTR(rxf->name), "GETP") == 0) {
            RxPreLoad(rxf,"GETP: trace off;parse arg _p;if length(_p)>8 then _p=substr(_p,1,8);"
                       ";else if _p='' then _p='default';return getg(_p'_'arg(2));");
    } else return FALSE;
    return TRUE;
}