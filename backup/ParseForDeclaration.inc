function pourParser(script: WideString): WideString;
var
  i: integer;
  astr, strPour, str: WideString;

begin

  // pour i de 1 a n  (pas-1) faire
  // pour i <- 1 a n  pas -1 faire
  // pour i <- 1 jusqu'a n pas -1 faire
  // pour i <- 1 -> n pas -1 faire
  // pour chaque [variableName] dans [List|VariableName] faire
  // pour chaque x

    try
        // pour i <- 1 jusqua n  (pas -1) faire
  re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\s*<-\s*(.*?)\bjusqu\s*['']*\s*a\b(.*?)[(]*\s*\bpas\b\s*=\s*-1\s*[)]*\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' downto ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);
  end;

  // pour i de 1 a n  (pas-1) faire
  re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\bde\b\s+(.*?)\ba\b(.*?)[(]*\s*\bpas\b\s*=\s*-1\s*[)]*\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' downto ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);
  end;


  // pour i <- 1 a n  (pas -1) faire
  re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\s*<-\s*(.*?)\ba\b(.*?)[(]*\s*\bpas\b\s*=\s*-1\s*[)]*\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' downto ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);
  end;

    re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\s*<-\s*(.*?)\bjusqu\s*['']*\s*a\b\s+(.*?)\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' to ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);

  end;

  // pour i de 1 a n  (pas-1) faire
  re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\bde\b\s+(.*?)\ba\b(.*?)\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' to ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);

  end;


  // pour i <- 1 a n  (pas -1) faire
  re := TRegExpr.Create(
    '\bpour\b\s*(.*?)\s*<-\s*(.*?)\ba\b(.*?)\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' := ' + re.Match[2] + ' to ' +
      re.Match[3] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);

  end;



      // pour i <- 1 a n  (pas -1) faire
  re := TRegExpr.Create(
    '\bpour\b\s+\bchaque\b\s+(.*?)\bdans\b(.*?)\s*\bfaire\b');
  re.ModifierI := False;
  i := 0;
  while (re.Exec(script{%H-})) do
  begin
    Inc(i);
    if (i > 1000) then
      error('Out of bounds or infinity loop detected');


    Delete(Script, re.MatchPos[0], re.Matchlen[0]);
    strPour := 'for ' + re.Match[1] + ' in ' + re.Match[2] + ' do Begin';
    Insert(strPour, script, re.MatchPos[0]);

  end;

    finally
 result := script;
    re.Free;
  end;

end;
