unit Converter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RegExpr, strutils, winCrt;

implementation

const
  nl = //{$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
       {$IFDEF MSWINDOWS} ansistring(#13#10) {$ENDIF};

type
  arrWide = array of WideString;

  parenthesePos = record
    opened: integer;
    closed: integer;
  end;
  arrPos = array of parenthesePos;

var
  keywords: arrWide;
  originalkeywords: arrWide;
  specialKeywords: array of boolean;
  strings: arrWide;
  script: WideString;
  re: TRegExpr;
  Mode : integer = 0;
{$Include err.inc}
{$Include specialchars.inc}
procedure addkeywords(key, originalkey: WideString; special: boolean = False);
begin
  if originalkey = '' then
    originalkey := key;


  SetLength(keywords, Length(keywords) + 1);
  keywords[Length(keywords) - 1] := key;
  SetLength(originalkeywords, Length(originalkeywords) + 1);

  originalkeywords[Length(originalkeywords) - 1] := originalkey;
  SetLength(specialKeywords, Length(specialKeywords) + 1);
  specialKeywords[Length(specialKeywords) - 1] := special;

end;



procedure addstring(str: WideString);
begin
  SetLength(strings, Length(strings) + 1);
  strings[Length(strings) - 1] := str;
end;

procedure extractString(var script: WideString);
var
  i: integer;
begin
  re := TRegExpr.Create('"(.*?)"');
  i := 0;

  try
    while re.Exec(script{%H-}) do
    begin

      addstring(re.Match[1]{%H-});
      Delete(script, re.MatchPos[1] - 1, re.MatchLen[1] + 2);

      insert(Format('%%s%d%%', [i]){%H-}, script, re.MatchPos[1] - 1);
      Inc(i);
    end;
  finally
    re.Free;
  end;
end;

function restringplaces(var script: WideString): WideString;
var
  i: integer;
begin
  for i := 0 to Length(strings) - 1 do
    script := ReplaceStr(script, Format('%%s%d%%', [i]), '''' + strings[i] + '''');


  Result := script;
end;




//not used yet but sob7ana allah nest7a9ha
procedure Split(const Delimiter, Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.StrictDelimiter := True;
  Strings.LineBreak := Delimiter;
  Strings.DelimitedText := Input;
end;



function replaceWord(input, oldWord, newWord: WideString): WideString;

begin

  replaceWord := {%H-}ReplaceRegExpr('\b' + oldWord + '\b'{%H-},
    input{%H-}, newWord{%H-}, True);
end;



procedure replaceoriginalkeywords(var script: WideString);
var
  str: WideString;
  i: integer;
  // Lines: TStringList;
begin

  for i := 0 to pred(Length(originalkeywords)) do
    //Word Boundaries
  begin
    str := originalkeywords[i];
    if (specialKeywords[i] = False) then
      script := {%H-}ReplaceRegExpr('\b' + str + '\b'{%H-}, script{%H-},
        '__' + str + '__'{%H-}, True);
  end;
  //bon mana3rech fech n5amem
  (*Lines := TStringList.Create;
  re := TRegExpr.Create;
  try
    re := TRegExpr.Create(nl);
    re.Split(script, Lines);
    for line in Lines do
      ReplaceRegExpr();
  finally
    re.Free;
    Lines.Free;
  end;  *)
end;


procedure convertKeywords(var script: WideString);
var
  str: WideString;
  i: integer;
begin
  for i := 0 to pred(Length(originalkeywords)) do
  begin
    //writeln('replaceing',keywords[i]);
    script := replaceWord(script, keywords[i], originalkeywords[i]);
  end;
end;

 { TODO :
 }

function orderAlgorithme(var Script: WideString): WideString;
var
  Lines: TStringList;
  l: string;
begin
  Lines := TStringList.Create;
  re := TRegExpr.Create('(\r\n|^)\s*[0-9]+\s*\)');
  // re.ModifierM:=true;
  script := re.Replace(Script, nl, True);
  Result := script;
  // Write(script);
  //re.Split(script,Lines);
  // for l in Lines do
  //     writeln('>',l);
end;

procedure pushVar(var Script: WideString; var_: WideString = '');
var
  strVar: WideString;
  i: integer;
begin

  re := TRegExpr.Create('\bprocedure\b(.*?)\r\n');
  re.ModifierI := False;
  i := 0;
  try
    re.Exec(script{%H-});
    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strVar := 'procedure ' + re.Match[1] + IfThen(var_ <> '', 'var ', '') +
      var_ + nl + ' Begin' + nl;
    Insert(strVar, script, re.MatchPos[0]);

    while (re.ExecNext) do
    begin
      Inc(i);
      if (i > 1000) then
        error('Out of bounds or infinity loop detected');


      Delete(Script, re.MatchPos[0], re.Matchlen[0]);
      strVar := 'procedure ' + re.Match[1] + IfThen(var_ <> '', 'var ', '') + var_ + nl + ' Begin';
      Insert(strVar, script, re.MatchPos[0]);
    end;
  finally

    re.Free;
  end;

end;

function getLasword(l: WideString): WideString;
var
  tab, space: integer;
begin
  tab := LastDelimiter('\t', trim(l));
  space := LastDelimiter(' ', trim(l));
  if (space > tab) then
    Result := RightStr(trim(l), Length(trim(l)) - space)
  else
    Result := RightStr(trim(l), Length(trim(l)) - tab);
end;




function injectSemicolon(var script: WideString): WideString;
var
  Lines: TStringList;
  l: WideString;
  spkey: array[1..9] of
  WideString = ('begin', 'var', 'else', 'then', 'do', 'repeat', 'of', 'mod', 'div');
  spsym: array[1..5] of WideString = ('+', '*', '-', '/', ';');
begin
  Lines := TStringList.Create;
  re := TRegExpr.Create(nl);
  re.Split(Script, Lines);
  script := '';
  for l in Lines do
  begin
    if (LowerCase(getLasword(l)) in spkey) or (Length(Trim(l)) = 0) or
      (rightstr(trim(l), 1) in spsym) then
    begin
      script := script + (l + nl);

    end
    else

      script := script + (l + ';' + nl);

  end;

  Result := script;
end;



  {$Include ParseArrayDeclaration.inc}
  {$Include ParseForDeclaration.inc}



initialization
{$Include keywords.inc}



  //script := 'pour i de 1 a 10 faire';//' Début mahdi si 5 mod 5 = 0 alors'+nl + 'ecrire(5+5)'+nl + 'sinon'+nl +'ecrire(non vrai)' + nl+ 'finsi' ;
  script := '0) Début procédure Affichage (Var Classeur : Personnels ; Fiche : Les_Fiches)'
    + nl + '1) Ouvrir (Classeur)' + nl + '2) Tant que Non (Fin_fichier (Classeur)) Faire'
    + nl + 'Lire (Classeur, Fiche)' + nl + 'Effacer l''écran' + nl +
    'Avec Fiche Faire' + nl + 'Ecrire ("Nom & prénom : ", nom_prenom)'
    + nl + 'Ecrire ("N° Cin : ", cin)' + nl + 'Ecrire ("Matricule : ", matricule)'
    + nl + 'Ecrire ("Grade : ", grade)' + nl + 'Ecrire ("Adresse : ", adresse)'
    + nl + 'Ecrire ("N° de téléphone : ", tel)' + nl + 'Ecrire ("Ancienneté : ", ancien)'
    + nl + 'Fin Avec' + nl +
    'Lire ( ) {Pause jusqu''à l''appui sur ENTRER}' + nl + 'Fin Tant que '
    + nl + '3) Fin Affichage ';



  script := 'Algorithme Mahdi' + nl +
            'variable x: entier' + nl +
            'variable y,n: entier' + nl +
            'debut' + nl +
            'lire(n)' + nl +
            'pour i de 1 a n faire' + nl +
            'ecrire(x+y);' + nl +
            'fin Mahdi';




  replaceSpecialChars(script);




  extractString(script);
  script := LowerCase(script);
  replaceoriginalkeywords(script);
  pourParser(script);
  script := ((pourParser(script) + nl));
  convertKeywords(script);


  orderAlgorithme(script);
  // pushVar(script);
  injectSemicolon(script);
  restringplaces(script);
  Write(script);
  readkey;



































finalization

end.
