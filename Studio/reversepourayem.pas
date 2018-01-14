program reversepourayem;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

type
  f = String[65];     //A
  b = String[72];  //H
  c = String[68];  //D
  g = String[77];  // M
  e = String[49]; //I
  type
  TRecord = Record
    name : b;
    age  : Byte;
    agex  : Byte;
    namea : string[1];
  end;




var
    m : ^g;
    a : ^f  ;
    h : ^b ;
    d : ^c ;
    i : ^e;


begin
     write(char(SizeOf(TRecord)) , Char(SizeOf(TRecord)) , char(SizeOf(TRecord)) , char(SizeOf(TRecord)) , char(SizeOf(TRecord)))   ;
     readln;





end.

