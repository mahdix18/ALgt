function ArrayParser(Script: WideString): WideString;
var
  strtbl: WideString;
  i: integer = 0;
  vpos: integer;

begin

  //les syntax possibles
  //Tableau de taille de type  (page 40)
  //Tableau de taille et de type  (page 41)
  //3eme  informatique Tunisie
  //Autre Ecriture
  //Tableau
  //Tableau [Nom]([Length]) en [Type]          //http://fsegt.blogspot.com/2014/10/exercices-corriges-en-algorithmique.html
  //tableau [[binf]..[bsup]] de [type] ;    //http://fsegt.blogspot.com/2014/10/exercices-corriges-en-algorithmique-les.html
  //Tableau de taille et de type
  re := TRegExpr.Create('\bTableau\b\s+\bde\b\s*(.*?)\s*(\bet\b|)\s+(\bde\b|\ben\b|)\s*');
  re.ModifierI := False;
  try
    while re.Exec(script{%H-}) do
    begin
      Inc(i);
      if (i > 1000) then
        error('Out of bounds or infinity loop detected');

      Delete(Script, re.MatchPos[0], re.Matchlen[0]);
      if not (ansistartsStr('[', Trim(re.Match[1])) and
        AnsiEndsStr(']', Trim(re.Match[1]))) then
      begin
        vpos := pos(',', re.Match[1]);

        if (vpos = 0) then
          strtbl := 'array [1..' + re.Match[1] {%H-}+ '] of '
        else
        begin
          strtbl := 'array [1..' + Copy(re.Match[1], 1, vpos) +
            '1..' + Copy(re.Match[1], vpos + 1, Length(re.Match[1])) {%H-}+ '] of ';
        end;
      end
      else
        strtbl := 'array ' + re.Match[1] {%H-}+ ' of ';

      Insert(strtbl, script, re.MatchPos[0]);
    end;
    re := TRegExpr.Create('\bTableau\b\s+\ben\b\s*(.*?)\s*(\bet\b|)\s+(\bde\b|)\s*');
    re.ModifierI := False;

    while re.Exec(script{%H-}) do
    begin
      Inc(i);
      if (i > 1000) then
        error('Out of bounds or infinity loop detected');
      Delete(Script, re.MatchPos[0], re.Matchlen[0]);

      if not (ansistartsStr('[', Trim(re.Match[1])) and
        AnsiEndsStr(']', Trim(re.Match[1]))) then
      begin
        vpos := pos(',', re.Match[1]);

        if (vpos = 0) then
          strtbl := 'array [1..' + re.Match[1] {%H-}+ '] of '
        else
        begin
          strtbl := 'array [1..' + Copy(re.Match[1], 1, vpos) +
            '1..' + Copy(re.Match[1], vpos + 1, Length(re.Match[1])) {%H-}+ '] of ';
        end;
      end
      else

        strtbl := 'array [1..' + re.Match[1] {%H-}+ '] of ';

      Insert(strtbl, script, re.MatchPos[0]);
    end;
    re := TRegExpr.Create('\bTableau\b\s*(.*?)\s*(\bet\b|)\s+(\bde\b|\ben\b|)\s*');
    re.ModifierI := False;

    while re.Exec(script{%H-}) do
    begin
      Inc(i);
      if (i > 1000) then
        error('Out of bounds or infinity loop detected');
      Delete(Script, re.MatchPos[0], re.Matchlen[0]);


      if not (ansistartsStr('[', Trim(re.Match[1])) and
        AnsiEndsStr(']', Trim(re.Match[1]))) then
      begin
        vpos := pos(',', re.Match[1]);

        if (vpos = 0) then
          strtbl := 'array [1..' + re.Match[1] {%H-}+ '] of '
        else
        begin
          strtbl := 'array [1..' + Copy(re.Match[1], 1, vpos) +
            '1..' + Copy(re.Match[1], vpos + 1, Length(re.Match[1])) {%H-}+ '] of ';
        end;
      end
      else
        strtbl := 'array ' + re.Match[1] {%H-}+ ' of ';

      Insert(strtbl, script, re.MatchPos[0]);
    end;
  finally
    Result := (Script);
  end;

end;
