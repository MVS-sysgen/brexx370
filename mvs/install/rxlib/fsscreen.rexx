/* ---------------------------------------------------------------------
 * Define Screen Fields: text field and associated input field
 * ---------------------------------------------------------------------
 */
fsscreen:
  parse arg maxcol,count
  call fsscrinit
  do i=1 to count
     if iparm.i<>'' then do     /* empty definition is empty line */
        if specialdef(iparm.i,i)=1 then iterate
        varmax=varmax+1
        screen.field.varmax=iparm.i
        nxt=cdtext(iparm.i,row,column.fflip,collen.fflip,i)
        if fflip<maxcol then inln=column.fflip+cwidth-nxt-1
           else inln=width-nxt    /* take remainin cols if last COL */
        if datatype(_screen.length.varmax)='NUM' then  ,
           if _screen.length.varmax<inln then inln=_screen.length.varmax
        call checkFieldLength(iparm.i,inln,i)
        call fssfield('_screen.input.'varmax,row,nxt,inln,#blue,inist)
     end
     call flipctr
  end
  do i=1 to varmax
     if symbol('_screen.init.'i)='VAR' then  ,
        call FSSFSET '_screen.input.'i,_screen.init.i
  end
 call FSSCURSOR '_SCREEN.INPUT.'1   /* Set Cursor to first input field */
  _SCREEN.INPUT.0=varmax
return
/* ---------------------------------------------------------------------
 * Process Special Definition (start with %x, x is the function)
 * ---------------------------------------------------------------------
 */
specialDef:
  parse arg indef,fldnum
  if substr(indef,1,1)='%' then nop
  else if substr(indef,1,1)='/' then nop
  else return 0
  incmd=translate(substr(indef,1,2))
  indef=substr(indef,3)
/*
  %T  Plain text in Column position
  %F  Plain text in Column position
  /N  Switch to new Line
  /C  Switch to next Column
 */
  if incmd='/N' then call newLine      /* Switch to next Line   */
  else if incmd='/C' then call flipctr /* Switch to next Column */
  else if incmd='%T' then do   /* Plain text in Column position */
     nxt=cdtext(indef,row,column.fflip,collen.fflip,fldnum)
     call flipctr
  end
  else if incmd='%F' then do   /* Plain text in Column position */
     varmax=varmax+1
     screen.field.varmax=indef
     call fssfield('_SCREEN.INPUT.'varmax,
                   ,row,column.fflip,collen.fflip,#blue,'_')
     call flipctr
  end
  else return 0
return 1
newVarL:
   varmax=varmax+1
NewLine:
   row=row+1
   fflip=1
return
/* ---------------------------------------------------------------------
 * Increase Flip Counter (manages column and row)
 * ---------------------------------------------------------------------
 */
flipctr:
  if fflip<maxcol then fflip=fflip+1
  else call newLine
return
/* ---------------------------------------------------------------------
 * Read User Data
 * ---------------------------------------------------------------------
 */
FSSgetD:
  do i=1 to varmax
     _SCREEN.INPUT.i=strip(fssFGET('_screen.input.'i,'NOTEST'),,'T')
  end
  _SCREEN.INPUT.0=varmax
return 0
/* ---------------------------------------------------------------------
 * Determine used key to end Screen
 * ---------------------------------------------------------------------
 */
usedKey:
  parse arg rkey
  if rkey='' then rkey=aid
  if rkey==#enter then return 'ENTER'
  else do k=1 to 24
     k=right(k,2,'0')
     if rkey==value('#PFK'k) then return 'F'k
  end
return 'UNKNOWN'
/* ---------------------------------------------------------------------
 * Check and define requested Text Definition
 * ---------------------------------------------------------------------
 */
cdText:
  parse arg itxt,irow,icol,mcol,fieldnum
  ctlen=length(itxt)
  if ctlen=0 then do
     itxt=' '
     ctlen=1
  end
  if ctlen>mcol then do
     say '***** Screen Definition Error *****'
     say "Text Field '"itxt"' exceeds column width"
     say '     definition no.: 'fieldnum
     say '                Text length: 'ctlen
     say '     available column width: 'mcol
     say '***** Screen Definition Aborted *****'
     exit 8  /* Terminate all */
  end
return fsstext(itxt,irow,icol,ctlen,#green)
/* ---------------------------------------------------------------------
 * Check and define requested FText Definition
 * ---------------------------------------------------------------------
 */
checkFieldLength:
  parse arg itxt,ilen,fieldnum
  if ilen>0 then return
  say '***** Screen Definition Error *****'
  say "Field of '"itxt"' does not fit into column"
  say '      definition no.: 'fieldnum
  say '     calculated remaining length: 'ilen
  say '***** Screen Definition Aborted *****'
exit 8  /* Terminate all */
/* ---------------------------------------------------------------------
 * Init Procedure
 * ---------------------------------------------------------------------
 */
fsscrinit:
  row=3                  /* Screen Variables start at row 3  */
/* Calculate Column offset and length */
  cwidth=Width%maxcol    /* calculate width of every Column  */
  column.1=1
  j=1
  do i=2 to maxcol
     column.i=column.j+cwidth
     collen.j=column.i-column.j
     j=j+1
  end
/* Calculate last Column length */
  collen.j=Width+1-column.maxcol
  varmax=0     /* init variable count  */
  fflip=1      /* start in first columns */
  if symbol('_screen.preset')='VAR' then inist=_screen.preset
     else inist='_'
return
