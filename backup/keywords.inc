
operator in(i: widestring; a: array of wideString) : Boolean;
var
  b: widestring;
begin
  Result := false;
  for b in a do begin
    Result := i = b;
    if Result then Break;
  end;
end;























//Start keywords
addkeywords('algorithme', 'program');
addkeywords('algo', 'program');



//const definition
addkeywords('const', 'const');
addkeywords('constante', 'const');
addkeywords('constant', 'const');

//type definition
 addkeywords('type', 'type',true);
addkeywords('types', 'type',true);
//var definition
 addkeywords('var', 'var',true);
 addkeywords('variable', 'var',true);
  addkeywords('variables', 'var',true);
//Array Definition




//boolean definition
// addkeywords('booleen', 'Boolean');

//operators
 addkeywords('non', 'not');
 addkeywords('ou', 'or');
 addkeywords('ouex', 'xor');
 addkeywords('et', 'and');
addkeywords('div', 'div');
addkeywords('mod', 'mod');
addkeywords('dif', '<>',true);
addkeywords('eg', '=',true);
addkeywords('sup', '>',true);
addkeywords('inf', '<',true);
//si

 addkeywords('alors', 'then Begin');
 addkeywords('sinon', 'end else Begin');
 addkeywords('finsi', 'end');
 addkeywords('fin\b\s+\bsi', 'end',true);
// addkeywords('si', 'if');


//pour
addkeywords('for', 'for');

 addkeywords('to', 'to');
addkeywords('downto', 'downto');

 addkeywords('finpour', 'end');
 addkeywords('fin\b\s*\bpour','end');
 addkeywords('faire', 'do Begin');




// addkeywords('repeter', 'repeat');
 addkeywords('tant\b\s*\bque', 'while');


 addkeywords('fonction', 'function');
 addkeywords('fonc', 'function');

 addkeywords('def\b\s*\bfn','function');
 addkeywords('def\b\s*\bproc','procedure',true);
addkeywords('debut\b\s+\bfonction','function');
addkeywords('debut\b\s+\bprocedure','procedure',true);
addkeywords('debut\b\s+\bfonc','function');
addkeywords('debut\b\s+\bproc','procedure',true);


 addkeywords('proc', 'procedure',true);


 addkeywords('procedure', 'procedure',true);

 addkeywords('debut', 'begin');


addkeywords('est\b\s+\bun', ':',true);
addkeywords('est\b\s+\bune', ':',true);
addkeywords('chaine\b\s+\bde\b\s+\bcaracteres', 'string');

addkeywords('\beffacer\b\s*\bl\b\s*['']\s*\becran\b','ClrScr');
// syntax mta3 <= wa ila >=
addkeywords('est\b\s+\bsuperieur\b\s+\bou\b\s+\begal\b\s+\ba', '>=',true);
addkeywords('est\b\s+\binferieur\b\s+\bou\b\s+\begal\b\s+\ba', '<=',true);
addkeywords('est\b\s+\bsuperieur\b\s+\bou\b\s+\begal', '>=',true);
addkeywords('est\b\s+\binferieur\b\s+\bou\b\s+\begal', '<=',true);
addkeywords('superieur\b\s+\bou\b\s+\begal\b\s+\ba', '>=',true);
addkeywords('inferieur\b\s+\bou\b\s+\begal\b\s+\ba', '<=',true);
addkeywords('superieur\b\s+\bou\b\s+\begal', '>=',true);
addkeywords('inferieur\b\s+\bou\b\s+\begal', '<=',true);
addkeywords('est\b\s+\bsup\b\s+\bou\b\s+\beg\b\s+\ba', '>=',true);
addkeywords('est\b\s+\binf\b\s+\bou\b\s+\beg\b\s+\ba', '<=',true);
addkeywords('est\b\s+\bsup\b\s+\bou\b\s+\beg', '>=',true);
addkeywords('est\b\s+\binf\b\s+\bou\b\s+\beg', '<=',true);
addkeywords('sup\b\s+\bou\b\s+\beg\b\s+\ba', '>=',true);
addkeywords('inf\b\s+\bou\b\s+\beg\b\s+\ba', '<=',true);
addkeywords('sup\b\s+\bou\b\s+\beg', '>=',true);
addkeywords('inf\b\s+\bou\b\s+\beg', '<=',true);

//unicode syntax  <= >=
{ TODO : unicode sup ou eg inf ou eg }
//('≥','>=');
//('≤','>=');
//('≠','<>');
//('←',':=')
//←
// syntax mta3 < wa ila >
addkeywords('est\b\s+\bsuperieur\b\s+\ba', '>',true);
addkeywords('est\b\s+\binferieur\b\s+\ba', '<',true);
addkeywords('est\b\s+\bsuperieur', '>',true);
addkeywords('est\b\s+\binferieur', '<',true);
addkeywords('superieur\b\s+\ba', '>',true);
addkeywords('inferieur\b\s+\ba', '<',true);
addkeywords('superieur', '>',true);
addkeywords('inferieur', '<',true);
addkeywords('sup', '>',true);
addkeywords('inf', '<',true);

// syntax mta3 egal

addkeywords('est\b\s+\begal\b\s+\ba', '=',true);
addkeywords('est\b\s+\begale\b\s+\ba', '=',true);
addkeywords('est\b\s+\begal', '=',true);
addkeywords('est\b\s+\begale', '=',true);
addkeywords('egal\b\s+\ba', '=',true);
addkeywords('egale\b\s+\ba', '=',true);
addkeywords('egal', '=',true);
addkeywords('egale', '=',true);
addkeywords('eg', '=',true);




//syntax different
addkeywords('est\b\s+\bdifferent\b\s+\ba', '>',true);
addkeywords('est\b\s+\bdifferente\b\s+\ba', '<',true);
addkeywords('est\b\s+\bdifferent', '>',true);
addkeywords('est\b\s+\bdifferente', '<',true);
addkeywords('different\b\s+\ba', '>',true);
addkeywords('differente\b\s+\ba', '<',true);

//Premitives Types
//chaine
addkeywords('chaine de caracteres', 'String');
addkeywords('Chaine', 'String');
//caractere
addkeywords('caractère', 'char');

//entier

addkeywords('mot\b\s+\blong', 'Longword');
addkeywords('mot', 'Word');
addkeywords('octet', 'Byte');
addkeywords('entier\b\s+\bcourt', 'Shortint');
addkeywords('entier\b\s+\blong', 'Longint');
addkeywords('entier', 'Integer');

//Reel
addkeywords('reel simple', 'Single');
addkeywords('simple', 'Single');
addkeywords('reel double', 'Single');
addkeywords('double', 'Double');
addkeywords('etendu', 'Extended');
addkeywords('reel', 'Real');
//booléen
addkeywords('booleen', 'boolean');

// valeur de booleen
addkeywords('est\b\s+\bvrai', '= true');
addkeywords('est\b\s+\bfaux', '= false');
addkeywords('vrai', 'true');
addkeywords('faux', 'false');


addkeywords('fin', 'end;//.',true);

addkeywords('ecrire','write');
addkeywords('lire','read');

addkeywords('recoit',':=');
addkeywords('avec', 'with');
addkeywords('repeter', 'repeat');
addkeywords('jusqu\s*['']*\s*a', 'until');


addkeywords('fin_fichier','eof');
addkeywords('fin\b\s*\des*\bfichier','eof');

 //Enregistrement
  addkeywords('enreg','record');
  addkeywords('enregistrement','record');
  addkeywords('article','record');






//keywordlist pascal
addkeywords('absolute','');
addkeywords('and','and');
addkeywords('array','');
addkeywords('asm','');
addkeywords('as','');
addkeywords('begin','');
addkeywords('case','');
addkeywords('const','');
addkeywords('constructor','');
addkeywords('class','');
addkeywords('destructor','');
addkeywords('div','');
addkeywords('do','');
addkeywords('downto','');
addkeywords('dispose','');
addkeywords('else','');
addkeywords('end','');
addkeywords('exit','');
addkeywords('except','');
addkeywords('exports','');
addkeywords('for','');
addkeywords('function','');
addkeywords('file','');
addkeywords('finalization','');
addkeywords('finally','');
addkeywords('goto','');
addkeywords('if','');
addkeywords('implementation','');
addkeywords('in','');
addkeywords('inherited','');
addkeywords('inline','');
addkeywords('interface','');
addkeywords('initialization','');
addkeywords('is','');
addkeywords('library','');
addkeywords('label','');
addkeywords('mod','');
addkeywords('not','');
addkeywords('nil','');
addkeywords('new','');
 addkeywords('nil','');
 addkeywords('object','');
 addkeywords('of','');
 addkeywords('on','');
 addkeywords('operator','');
 addkeywords('out','');
 addkeywords('property','');
 addkeywords('public','');
 addkeywords('private','');
 addkeywords('packed','');
 addkeywords('program','');
 addkeywords('repeat','');
 addkeywords('record','');
 addkeywords('reintroduce','');
 addkeywords('raise','');
 addkeywords('string','');
 addkeywords('self','');
 addkeywords('set','');
 addkeywords('shl','');
 addkeywords('shr','');
 addkeywords('then','');
 addkeywords('to','');
 addkeywords('try','');
 addkeywords('true','');
// addkeywords('type','');
 addkeywords('threadvar','');
 addkeywords('unit','');
 addkeywords('until','');
 addkeywords('uses','');
// addkeywords('var','');
 addkeywords('while','');
 addkeywords('with','');
 addkeywords('xor','');
 //addkeywords('procedure','');








































