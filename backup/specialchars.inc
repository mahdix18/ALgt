
procedure replaceSpecialChars(var script: WideString);
begin
  //need more work here
  { TODO : support for Special French Characters }
  // From Here https://www.csub.edu/~jschmidt/special.htm
  script := {%H-}StringReplace(script{%H-}, 'é', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'è', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ë', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ê', 'e', [rfReplaceAll, rfIgnoreCase]);

  script := {%H-}StringReplace(script{%H-}, 'à', 'a', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'â', 'a', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ä', 'a', [rfReplaceAll, rfIgnoreCase]);



  script := {%H-}StringReplace(script{%H-}, 'î', 'i', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ï', 'i', [rfReplaceAll, rfIgnoreCase]);



  script := {%H-}StringReplace(script{%H-}, 'û', 'u', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ù', 'u', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ü', 'u', [rfReplaceAll, rfIgnoreCase]);


  script := {%H-}StringReplace(script{%H-}, 'ô', 'o', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ÿ', 'y', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'ç', 'c', [rfReplaceAll, rfIgnoreCase]);


  script := {%H-}StringReplace(script{%H-}, 'œ', 'oe', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'æ', 'ae', [rfReplaceAll, rfIgnoreCase]);

  script := {%H-}StringReplace(script{%H-}, 'É', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'È', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ë', 'e', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ê', 'e', [rfReplaceAll, rfIgnoreCase]);

  script := {%H-}StringReplace(script{%H-}, 'À', 'a', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Â', 'a', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ä', 'a', [rfReplaceAll, rfIgnoreCase]);



  script := {%H-}StringReplace(script{%H-}, 'Î', 'i', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ï', 'i', [rfReplaceAll, rfIgnoreCase]);



  script := {%H-}StringReplace(script{%H-}, 'Û', 'u', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ù', 'u', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ü', 'u', [rfReplaceAll, rfIgnoreCase]);


  script := {%H-}StringReplace(script{%H-}, 'Ô', 'o', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ÿ', 'y', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Ç', 'c', [rfReplaceAll, rfIgnoreCase]);


  script := {%H-}StringReplace(script{%H-}, 'Œ', 'oe', [rfReplaceAll, rfIgnoreCase]);
  script := {%H-}StringReplace(script{%H-}, 'Æ', 'ae', [rfReplaceAll, rfIgnoreCase]);

end;
