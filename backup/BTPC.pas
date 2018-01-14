program BTPC;

{$IFDEF WIN32}
{$APPTYPE CONSOLE}
{$ENDIF}
const
  MCC = 65536;
  MIC = 512;
  MTC = 32;
  MLC = 10;
  MAS = 20;
type
  TA = array[1..MAS] of char;

  TI = record
    I0: TA;
    I1: integer;
    I2:
    integer;
    I3: integer;
    I4: integer;
    I5: integer;
    I6: integer;
    I7: boolean;
    I8: integer;
    I9: integer;
    I10: integer;
    I11: integer;
    I12: integer;
    I13: boolean;
  end;

  TT = record
    T0: integer;
    I3: integer;
    T1: integer;
    T2: integer;
    T3: integer;
    T4: integer;
  end;
var
  G0: char;
  G1: integer;
  G2: integer;
  G3: integer;
  G4: TA;
  G5: integer;
  G6: array[1..255] of char;
  G7: integer;
  G8: integer;
  G9: array[21..50] of TA;
  G10: integer;
  G11: integer;
  G12: boolean;
  G13: array[-1..MLC] of integer;
  G14: integer;
  G15: integer;
  G16: array[0..MIC] of TI;
  G17: array[1..MTC] of TT;
  G18: array[0..MCC] of integer;
  G19: integer;
  G20: integer;

  function U0(var S1, S2: TA): boolean;
  var
    F: boolean;
    I: integer;
  begin
    F := True;
    I := 1;
    while F and (I <= MAS) do
    begin
      F := (S1[I] = S2[I]);
      I := I + 1;
    end;
    U0 := F;
  end;

  procedure U1(var A: TA; B: TA);
  begin
    A := B;
  end;

  procedure U2(N: integer);
  begin
    WRITELN('Error ', N: 1, ' detected at line ', G2: 1, ' at column ', G1: 1);
    HALT;
  end;

  procedure U3;
  begin
    if not EOF then
    begin
      Read(G0);
      G1 := G1 + 1;
      if G0 = CHR(10) then
      begin
        G2 := G2 + 1;
        G1 := 0;
      end;
    end
    else
    begin
      G0 := CHR(0);
    end;
  end;

  function U4: integer;
  var
    NUM: integer;
  begin
    NUM := 0;
    if ('0' <= G0) and (G0 <= '9') then
    begin
      while ('0' <= G0) and (G0 <= '9') do
      begin
        NUM := (NUM * 10) + (Ord(G0) - Ord('0'));
        U3;
      end;
    end
    else if G0 = '$' then
    begin
      U3;
      while (('0' <= G0) and (G0 <= '9')) or (('A' <= G0) and (G0 <= 'F')) do
      begin
        if ('0' <= G0) and (G0 <= '9') then
        begin
          NUM := (NUM * 16) + (Ord(G0) - Ord('0'));
        end
        else if ('A' <= G0) and (G0 <= 'F') then
        begin
          NUM := (NUM * 16) + (Ord(G0) - Ord('A') + 10);
        end;
        U3;
      end;
    end;
    U4 := NUM;
  end;

  procedure U5;
  var
    K, S: integer;
    H, Z: boolean;
    LC: char;
  begin
    while (G0 > CHR(0)) and (G0 <= ' ') do
      U3;
    if (('a' <= G0) and (G0 <= 'z')) or (('A' <= G0) and (G0 <= 'Z')) then
    begin
      K := 0;
      while ((('a' <= G0) and (G0 <= 'z')) or (('A' <= G0) and (G0 <= 'Z')) or (('0' <= G0) and (G0 <= '9'))) or
        (G0 = '_') do
      begin
        if K <> MAS then
        begin
          K := K + 1;
          if ('a' <= G0) and (G0 <= 'z') then
            G0 := CHR(Ord(G0) - 32);
          G4[K] := G0;
        end;
        U3;
      end;
      while
        K <> MAS do
      begin
        K := K + 1;
        G4[K] := ' ';
      end;
      G3 := 0;
      S := 21;
      while S <= 50 do
      begin
        if U0(G9[S], G4) then
          G3 := S;
        S := S + 1;
      end;
    end
    else if (('0' <= G0) and (G0 <= '9')) or (G0 = '$') then
    begin
      G3 := 1;
      G5 := U4;
    end
    else if G0 = ':' then
    begin
      U3;
      if G0 = '=' then
      begin
        U3;
        G3 := 20;
      end
      else
      begin
        G3 := 8;
      end;
    end
    else if G0 = '>' then
    begin
      U3;
      if G0 = '=' then
      begin
        U3;
        G3 := 14;
      end
      else
      begin
        G3 := 13;
      end;
    end
    else if G0 = '<' then
    begin
      U3;
      if G0 = '=' then
      begin
        U3;
        G3 :=
          12;
      end
      else if G0 = '>' then
      begin
        U3;
        G3 := 10;
      end
      else
      begin
        G3 := 11;
      end;
    end
    else if G0 = '.' then
    begin
      U3;
      if G0 = '.' then
      begin
        U3;
        G3 := 8;
      end
      else
      begin
        G3 := 19;
      end;
    end
    else
    if (G0 = '''') or (G0 = '#') then
    begin
      G7 := 0;
      H := False;
      Z := False;
      G3 := 2;
      while not H do
      begin
        if Z then
        begin
          if G0 = '''' then
          begin
            U3;
            if G0 = '''' then
            begin
              G7 := G7 + 1;
              G6[G7] := G0;
              U3;
            end
            else
            begin
              Z := False;
            end;
          end
          else if (G0 = CHR(13)) or (G0 = CHR(10)) then
          begin
            U2(100);
            H := True;
          end
          else
          begin
            G7 := G7 + 1;
            G6[G7] := G0;
            U3;
          end;
        end
        else
        begin
          if G0 = '''' then
          begin
            Z := True;
            U3;
          end
          else if G0 = '#' then
          begin
            U3;
            G7 := G7 + 1;
            G6[G7] := CHR(U4);
          end
          else
          begin
            H := True;
          end;
        end;
      end;
      if G7 = 0 then
        U2(101);
    end
    else if G0 = '+' then
    begin
      U3;
      G3 := 3;
    end
    else if G0 = '-' then
    begin
      U3;
      G3 := 4;
    end
    else if G0 = '*' then
    begin
      U3;
      G3 := 5;
    end
    else if G0 = '(' then
    begin
      U3;
      if G0 = '*' then
      begin
        U3;
        LC := '-';
        while not ((G0 = ')') and (LC = '*')) do
        begin
          LC := G0;
          U3;
        end;
        U3;
        U5;
      end
      else
      begin
        G3 := 15;
      end;
    end
    else if G0 = ')' then
    begin
      U3;
      G3 := 16;
    end
    else if G0 = '[' then
    begin
      U3;
      G3 := 6;
    end
    else if G0 = ']' then
    begin
      U3;
      G3 := 7;
    end
    else if G0 = '=' then
    begin
      U3;
      G3 := 9;
    end
    else if G0 = ',' then
    begin
      U3;
      G3 := 17;
    end
    else if G0 = ';' then
    begin
      U3;
      G3 := 18;
    end
    else if G0 = '{' then
    begin
      while G0 <> '}' do
        U3;
      U3;
      U5;
    end
    else
    begin
      U2(102);
    end;
  end;

  procedure U6(S: integer);
  begin
    if G3 <> S then
      U2(S);
  end;

  procedure U7(S: integer);
  begin
    U6(S);
    U5;
  end;

  procedure U8(G4: TA; K, T: integer);
  var
    J: integer;
  begin
    if G14 = MIC then
      U2(103);
    G14 := G14 + 1;
    G16[0].I0 := G4;
    J := G13[G11];
    while not U0(G16[J].I0, G4) do
      J := G16[J].I1;
    if J <> 0 then
    begin
      if G16[J].I3 <> 4 then
        U2(104);
      if (G18[G16[J].I10] <> 39) or (G18[G16[J].I10 + 1] > 0) then
        U2(105);
      G16[J].I0[1] := '$';
      G18[G16[J].I10 + 1] := G19;
      G8 := J;
    end;
    G16[G14].I0 := G4;
    G16[G14].I1 :=
      G13[G11];
    G16[G14].I2 := T;
    G16[G14].I3 := K;
    G13[G11] := G14;
  end;

  function U9: integer;
  var
    I, J: integer;
  begin
    G16[0].I0 := G4;
    I := G11;
    repeat
      J := G13[I];
      while not U0(G16[J].I0, G4) do
        J := G16[J].I1;
      I := I - 1;
    until (I < -1) or (J <> 0);
    if J = 0 then
      U2(106);
    U9 := J;
  end;

  procedure U10(OY, A: integer);
  begin
    case OY of
      13, 26, 27, 28, 29, 30, 31, 32: G20 := G20 - 4;
      1, 5, 6, 14, 17, 19, 22, 25, 37, 38, 39, 41, 43:
      begin
      end;
      0, 2, 3, 4, 7, 8, 9, 10, 11, 12, 15, 16, 21, 23, 24, 33, 34, 40: G20 := G20 + 4;
      18, 20, 35: G20 := G20 + 8;
      36: G20 := G20 - (A - 4);
      42: G20 := G20 + A;
    end;
    if not ((((OY = 37) or (OY = 42)) and (A = 0)) or ((OY = 38) and (A = 1))) then
    begin
      if G12 then
      begin
        G18[G19] :=
          OY;
        G19 := G19 + 1;
        if OY >= 28 then
        begin
          G18[G19] := A;
          G19 := G19 + 1;
        end;
        G12 := False;
      end
      else
      if (G10 = 28) and (OY = 0) then
      begin
        G18[G19 - 2] := 37;
      end
      else if (G10 = 28) and (OY = 2) then
      begin
        G18[G19 - 2] := 38;
      end
      else if (G10 = 28) and (OY = 1) then
      begin
        G18[G19 - 1] := -G18[G19 - 1];
        OY :=
          G10;
      end
      else if (G10 = 28) and (G18[G19 - 1] = 2) and (OY = 3) then
      begin
        G18[G19 - 2] := 5;
        G19 := G19 - 1;
      end
      else if (G10 = 28) and (G18[G19 - 1] = 2) and (OY = 4) then
      begin
        G18[G19 - 2] := 6;
        G19 := G19 - 1;
      end
      else if (G10 = 29) and (OY = 18) then
      begin
        G18[G19 - 2] := 34;
      end
      else if (G10 = 29) and (OY = 17) then
      begin
        G18[G19 - 2] := 32;
      end
      else if (G10 = 30) and (OY = 18) then
      begin
        G18[G19 - 2] := 33;
      end
      else if (G10 = 30) and (OY = 17) then
      begin
        G18[G19 - 2] := 31;
      end
      else
      begin
        G18[G19] := OY;
        G19 := G19 + 1;
        if OY >= 28 then
        begin
          G18[G19] := A;
          G19 := G19 + 1;
        end;
      end;
      G10 := OY;
    end;
  end;

  procedure U11(OY: integer);
  begin
    U10(OY, 0);
  end;

  function U12: integer;
  begin
    U12 :=
      G19;
    G12 := True;
  end;

  procedure U13(L, A: integer);
  begin
    if L = 0 then
    begin
      U10(29, A);
    end
    else if L = G11 then
    begin
      U10(30, A - G20);
    end
    else
    begin
      U10(31, -G20);
      while (L + 1) <> G11 do
      begin
        U11(17);
        L := L + 1;
      end;
      U10(37, A);
    end;
  end;

  procedure U14(IZ: integer);
  begin
    U13(G16[IZ].I5, G16[IZ].I6);
    if G16[IZ].I7 then
      U11(17);
  end;

  procedure MB(X, Y: integer);
  begin
    if X <> Y then
    begin
      if (G17[X].I3 = 1) and (G17[Y].I3 = 1) and (G17[X].T1 = G17[Y].T1) and (G17[X].T2 = G17[Y].T2) then
      begin
        MB(G17[X].T3, G17[Y].T3);
      end
      else
      begin
        U2(107);
      end;
    end;
  end;

  procedure U15(var X: integer); forward;

  procedure U16(var T, IZ: integer);
  var
    J, X: integer;
  begin
    T := G16[IZ].I2;
    U5;
    if (G3 = 19) or (G3 = 6) then
    begin
      U14(IZ);
      IZ := 0;
      while
        (G3 = 19) or (G3 = 6) do
      begin
        case G3 of
          19:
          begin
            if G17[T].I3 <> 2 then
              U2(108);
            U5;
            U6(0);
            J := G17[T].T4;
            G16[0].I0 := G4;
            while not U0(G16[J].I0, G4) do
              J := G16[J].I1;
            if J = 0 then
              U2(109);
            U10(37, G16[J].I8);
            T := G16[J].I2;
            U5;
          end;
          6:
          begin
            repeat
              if G17[T].I3 <> 1 then
                U2(110);
              U5;
              U15(X);
              MB(1, X);
              U10(37, -G17[T].T1);
              T := G17[T].T3;
              U10(38, G17[T].T0);
              U11(0);
            until G3 <> 17;
            U7(7);
          end;
        end;
      end;
    end;
  end;

  procedure U17(var T: integer);
  var
    J: integer;
  begin
    U6(0);
    J := U9;
    U16(T, J);
    if J <> 0 then
      U14(J);
  end;

  procedure U18(N: integer);
  var
    X: integer;
  begin
    case N of
      0:
      begin
        U7(15);
        U15(X);
        MB(1, X);
        U7(16);
      end;
      1:
      begin
        U7(15);
        U15(X);
        if X <> 2 then
          MB(3, X);
        U7(16);
      end;
      2, 3:
      begin
        if N = 2 then
          U6(15);
        if G3 = 15 then
        begin
          repeat
            U5;
            if G3 = 2 then
            begin
              X := 1;
              while X <= G7 do
              begin
                U10(28, Ord(G6[X]));
                U11(21);
                X := X + 1;
              end;
              U5;
            end
            else
            begin
              U15(X);
              if G3 = 8 then
              begin
                MB(1, X);
                U5;
                U15(X);
                MB(
                  1, X);
                U11(20);
              end
              else if X = 1 then
              begin
                U10(28, 1);
                U11(20);
              end
              else if X = 3 then
              begin
                U11(21);
              end
              else
              begin
                U2(111);
              end;
            end;
          until G3 <> 17;
          U7(16);
        end;
        if N = 3 then
          U11(22);
      end;
      4, 5:
      begin
        if N = 4 then
          U6(15);
        if G3 = 15 then
        begin
          repeat
            U5;
            U17(X);
            if X = 1 then
            begin
              U11(23);
            end
            else if X = 3 then
            begin
              U11(24);
            end
            else
            begin
              U2(112);
            end;
          until
            G3 <> 17;
          U7(16);
        end;
        if N = 5 then
          U11(25);
      end;
      6: U11(26);
      7: U11(27);
    end;
  end;

  procedure U19(I: integer);
  var
    QX, P, X: integer;
  begin
    U5;
    if G16[I].I9 < 0 then
    begin
      U18(G16[I].I10);
    end
    else
    begin
      if G16[I].I2 <> 0 then
        U10(28, 0);
      P := I;
      QX := G20;
      if G3 = 15 then
      begin
        repeat
          U5;
          if P = G16[I].I11 then
            U2(113);
          P := P + 1;
          if G16[P].I7 then
          begin
            U17(X);
          end
          else
          begin
            U15(X);
            if G17[X].I3 <> 0 then
              U10(36, G17[X].T0);
          end;
          if X = 4 then
          begin
            if G16[P].I7 then
              U2(114);
            if G17[G16[P].I2].I3 <> 1 then
              U2(115);
            if G17[G16[P].I2].T3 <> 3 then
              U2(116);
            if ((G17[G16[P].I2].T2 - G17[G16[P].I2].T1) + 1) <> G7 then
              U2(117);
          end
          else
          begin
            MB(G16[P].I2, X);
          end;
        until G3 <> 17;
        U7(16);
      end;
      if P <> G16[I].I11 then
        U2(118);
      if G16[I].I9 <> 0 then
        U13(G16[I].I9, 0);
      U10(41, G16[I].I10);
      G20 := QX;
    end;
  end;

  procedure U20(var T: integer);
  var
    I: integer;
  begin
    if G3 = 0 then
    begin
      I := U9;
      T := G16[I].I2;
      case G16[I].I3 of
        0:
        begin
          U5;
          U10(28, G16[I].I4);
        end;
        1:
        begin
          U16(T, I);
          if I <> 0 then
            U14(I);
          if G17[T].I3 = 0 then
            U11(17);
        end;
        4:
        begin
          if T = 0 then
          begin
            U2(119);
          end
          else
          begin
            U19(I);
          end;
        end;
        3: U2(120);
      end;
    end
    else if G3 = 1 then
    begin
      U10(28, G5);
      T := 1;
      U5;
    end
    else if G3 = 2 then
    begin
      I := G7;
      while I >= 1 do
      begin
        U10(28, Ord(G6[I]));
        I := I - 1;
      end;
      T := 3;
      if G7 <> 1 then
        T := 4;
      U5;
    end
    else if G3 = 15 then
    begin
      U5;
      U15(T);
      U7(16);
    end
    else if G3 = 34 then
    begin
      U5;
      U20(T);
      MB(2, T);
      U11(1);
      U10(37, 1);
    end
    else
    begin
      U2(121);
    end;
  end;

  procedure U21(var X: integer);
  var
    Y: integer;
  begin
    U20(X);
    while (G3 = 37) or (G3 = 5) or (G3 = 35) or (G3 = 36) do
    begin
      if G3 = 37 then
      begin
        MB(2, X);
      end
      else
      begin
        MB(1, X);
      end;
      case G3 of
        5:
        begin
          U5;
          U20(Y);
          U11(2);
        end;
        35:
        begin
          U5;
          U20(Y);
          U11(3);
        end;
        36:
        begin
          U5;
          U20(Y);
          U11(4);
        end;
        37:
        begin
          U5;
          U20(Y);
          U11(15);
        end;
      end;
      MB(X, Y);
    end;
  end;

  procedure U22(var X: integer);
  var
    Y: integer;
  begin
    if G3 = 3 then
    begin
      U5;
      U21(X);
      MB(1, X);
    end
    else if G3 = 4 then
    begin
      U5;
      U21(X);
      MB(1, X);
      U11(1);
    end
    else
    begin
      U21(X);
    end;
    while (G3 = 38) or (G3 = 3) or (G3 = 4) do
    begin
      if G3 = 38 then
      begin
        MB(2, X);
      end
      else
      begin
        MB(1, X);
      end;
      case G3 of
        3:
        begin
          U5;
          U21(Y);
          U11(0);
        end;
        4:
        begin
          U5;
          U21(Y);
          U11(1);
          U11(0);
        end;
        38:
        begin
          U5;
          U21(Y);
          U11(16);
        end;
      end;
      MB(X, Y);
    end;
  end;

  procedure U15(var X: integer);
  var
    O, Y: integer;
  begin
    U22(X);
    if (G3 = 9) or (G3 = 10) or (G3 = 11) or (G3 = 12) or (G3 = 13) or (G3 = 14) then
    begin
      if (X = 4) or (G17[X].I3 <> 0) then
        U2(121);
      O := G3;
      U5;
      U22(Y);
      MB(X, Y);
      case O of
        9: U11(7);
        10: U11(8);
        11: U11(
            9);
        12: U11(10);
        13: U11(11);
        14: U11(12);
      end;
      X := 2;
    end;
  end;

  procedure U23;
  var
    L: array[1..64] of integer;
    M, N, I, J, T, X, R, QX: integer;
  begin
    if G3 = 0 then
    begin
      I := U9;
      case G16[I].I3 of
        1:
        begin
          U16(T, I);
          U7(20);
          U15(X);
          MB(T, X);
          if I = 0 then
          begin
            U11(14);
          end
          else
          begin
            U14(I);
          end;
          if G17[T].I3 = 0 then
          begin
            U11(18);
          end
          else
          begin
            U10(35, G17[T].T0);
          end;
        end;
        4:
        begin
          if G16[I].I2 = 0 then
          begin
            U19(I);
          end
          else
          begin
            if not G16[I].I13 then
              U2(122);
            U5;
            U7(20);
            U15(X);
            MB(G16[I].I2, X);
            U13(G16[I].I9 + 1, G16[I].I12);
            U11(18);
          end;
        end;
        0, 2, 3: U2(123);
      end;
    end
    else if G3 = 23 then
    begin
      U5;
      U15(T);
      MB(2, T);
      U7(24);
      I := U12;
      U10(40, 0);
      U23;
      if G3 = 25 then
      begin
        U5;
        J := U12;
        U10(39, 0);
        G18[I + 1] := U12;
        I := J;
        U23;
      end;
      G18[I + 1] := U12;
    end
    else if G3 = 28 then
    begin
      U5;
      U15(T);
      MB(1, T);
      U7(43);
      J := 0;
      M :=
        0;
      repeat
        if J <> 0 then
          G18[J + 1] := U12;
        N := M;
        repeat
          if N <> M then
            U5;
          U11(13);
          if G3 = 0 then
          begin
            I := U9;
            if G16[I].I3 <> 0 then
              U2(124);
            U10(28, G16[I].I4);
          end
          else if G3 = 1 then
          begin
            U10(28, G5);
          end
          else if (G3 = 2) and (G7 = 1) then
          begin
            U10(28, Ord(G6[1]));
          end
          else
          begin
            U2(125);
          end;
          U11(8);
          N := N + 1;
          L[N] := U12;
          U10(40, 0);
          U5;
        until G3 <> 17;
        if G3 <> 8 then
          U2(126);
        J := U12;
        U10(39, 0);
        repeat
          G18[L[N] + 1] := U12;
          N := N - 1;
        until N = M;
        U5;
        U23;
        M := M + 1;
        L
          [M] := U12;
        U10(39, 0);
        if G3 = 18 then
          U5;
      until G3 = 22;
      G18[J + 1] := U12;
      repeat
        G18[L[M] + 1] :=
          U12;
        M := M - 1;
      until M = 0;
      U10(42, 4);
      U5;
    end
    else if G3 = 31 then
    begin
      U5;
      if G3 = 0 then
      begin
        QX := G20;
        I := U9;
        if G16[I].I3 <> 1 then
          U2(127);
        U16(T, I);
        U7(20);
        U15(X);
        MB(T, X);
        if I = 0 then
        begin
          U11(14);
        end
        else
        begin
          U14(I);
        end;
        if G17[T].I3 <> 0 then
          U2(128);
        U11(18);
        R := 1;
        if G3 = 32 then
        begin
          U7(32);
        end
        else if G3 = 33 then
        begin
          U7(33);
          R := -1;
        end
        else
        begin
          U2(129);
        end;
        J := U12;
        if I = 0 then
        begin
          U11(14);
        end
        else
        begin
          U14(I);
        end;
        U11(
          17);
        U15(X);
        MB(T, X);
        if R > 0 then
        begin
          U11(10);
        end
        else
        begin
          U11(12);
        end;
        N := U12;
        U10(40, 0);
        U7(27);
        U23;
        if I = 0 then
        begin
          U11(14);
        end
        else
        begin
          U14(I);
        end;
        U11(17);
        U10(37, R);
        if I = 0 then
        begin
          U11(14);
        end
        else
        begin
          U14(I);
        end;
        U11(18);
        U10(39, J);
        G18[
          N + 1] := U12;
        U10(42, QX - G20);
      end
      else
      begin
        U7(0);
      end;
    end
    else if G3 = 26 then
    begin
      U5;
      I := U12;
      U15(T);
      MB(2, T);
      U7(27);
      J := U12;
      U10(40, 0);
      U23;
      U10(39, I);
      G18[J + 1] := U12;
    end
    else
    if G3 = 29 then
    begin
      I := U12;
      repeat
        U5;
        U23;
      until G3 <> 18;
      U7(30);
      U15(T);
      MB(2, T);
      U10(40, I);
    end
    else if G3 = 21 then
    begin
      repeat
        U5;
        U23;
      until G3 <> 18;
      U7(22);
    end
    else if G3 = 48 then
    begin
      U11(19);
      U5;
    end;
  end;

  procedure U24(L: integer); forward;

  procedure U25(var C, T: integer);
  var
    I, S: integer;
  begin
    if (G3 = 2) and (G7 = 1) then
    begin
      C := Ord(G6[1]);
      T := 3;
    end
    else
    begin
      if G3 = 3 then
      begin
        U5;
        S := 1;
      end
      else if G3 = 4 then
      begin
        U5;
        S := -1;
      end
      else
      begin
        S := 0;
      end;
      if G3 = 0 then
      begin
        I := U9;
        if G16[I].I3 <> 0 then
          U2(130);
        C := G16[I].I4;
        T := G16[I].I2;
      end
      else if G3 = 1 then
      begin
        C := G5;
        T := 1;
      end
      else
      begin
        U2(131);
      end;
      if S <> 0 then
      begin
        MB(T, 1);
        C := C * S;
      end;
    end;
    U5;
  end;

  procedure U26;
  var
    A: TA;
    T, C: integer;
  begin
    A := G4;
    U5;
    U7(9);
    U25(C, T);
    U7(18);
    U8(A, 0, T);
    G16[G14].I4 := C;
  end;

  procedure I2(var T: integer); forward;

  procedure FQ(var T: integer);
  var
    X: integer;
  begin
    G17[T].
      I3 := 1;
    U5;
    U25(G17[T].T1, X);
    MB(1, X);
    U7(8);
    U25(G17[T].T2, X);
    MB(1, X);
    if G17[T].T1 > G17[T].T2 then
      U2(132);
    if G3 = 17 then
    begin
      FQ(G17[T].T3);
    end
    else
    begin
      U7(7);
      U7(43);
      I2(G17[T].T3);
    end;
    G17[T].T0 := (G17[T].T2 - G17[T].T1 + 1) * G17[G17[T].T3].T0;
  end;

  procedure I2(var T: integer);
  var
    I, J, SZ, FT: integer;
  begin
    if G3 = 44 then
      U5;
    if G3 = 0 then
    begin
      I := U9;
      if G16[I].I3 <> 3 then
        U2(133);
      T := G16[I].I2;
      U5;
    end
    else
    begin
      if G15 = MTC then
        U2(134);
      G15 := G15 + 1;
      T := G15;
      if G3 = 42 then
      begin
        U5;
        U6(6);
        FQ(T);
      end
      else
      begin
        U7(45);
        if G11 = MLC then
          U2(135);
        G11 := G11 + 1;
        G13[G11] := 0;
        U6(0);
        SZ := 0;
        repeat
          U8(G4, 2, 0);
          I :=
            G14;
          U5;
          while G3 = 17 do
          begin
            U5;
            U6(0);
            U8(G4, 2, 0);
            U5;
          end;
          J := G14;
          U7(8);
          I2(FT);
          repeat
            G16[I].I2 := FT;
            G16[I].I8 := SZ;
            SZ := SZ + G17[FT].T0;
            I := I + 1;
          until I > J;
          if G3 = 18 then
          begin
            U5;
          end
          else
          begin
            U6(22);
          end;
        until G3 <> 0;
        G17[T].T0 := SZ;
        G17[T].I3 := 2;
        G17[T].T4 := G13[G11];
        G11 := G11 - 1;
        U7(22);
      end;
    end;
  end;

  procedure UY;
  var
    A: TA;
    T: integer;
  begin
    A := G4;
    U5;
    U7(9);
    I2(T);
    U7(18);
    U8(A, 3, T);
  end;

  procedure UV;
  var
    P, Q, T: integer;
  begin
    U8(G4, 1, 0);
    P := G14;
    U5;
    while G3 = 17 do
    begin
      U5;
      U6(0);
      U8(G4, 1, 0);
      U5;
    end;
    Q := G14;
    U7(8);
    I2(T);
    U7(
      18);
    repeat
      G16[P].I5 := G11;
      G20 := G20 - G17[T].T0;
      G16[P].I2 := T;
      G16[P].I6 := G20;
      G16[P].I7 := False;
      P := P + 1;
    until P > Q;
  end;

  procedure NP(var P, PS: integer);
  var
    R: boolean;
    T: integer;
  begin
    if G3 = 40 then
    begin
      R := True;
      U5;
    end
    else
    begin
      R := False;
    end;
    U6(0);
    P := G14;
    U8(G4, 1, 0);
    U5;
    while G3 = 17 do
    begin
      U5;
      U6(0);
      U8(G4, 1, 0);
      U5;
    end;
    U7(8);
    U6(0);
    I2(T);
    while
      P < G14 do
    begin
      P := P + 1;
      G16[P].I2 := T;
      G16[P].I7 := R;
      if R then
      begin
        PS := PS + 4;
      end
      else
      begin
        PS := PS + G17[T].T0;
      end;
    end;
  end;

  procedure FD(BF: boolean);
  var
    F, P, PS, P1, P2, QX: integer;
  begin
    U5;
    U6(0);
    G8 := -1;
    U8(G4, 4, 0);
    U5;
    F := G14;
    G16[F].I9 := G11;
    G16[F].I10 := U12;
    U10(39, 0);
    if G11 = MLC then
      U2(136);
    G11 := G11 + 1;
    G13[G11] := 0;
    PS := 4;
    QX := G20;
    if G3 = 15 then
    begin
      repeat
        U5;
        NP(P, PS);
      until G3 <> 18;
      U7(16);
    end;
    if G11 > 1 then
    begin
      G20 := -4;
    end
    else
    begin
      G20 := 0;
    end;
    G16[F].I12 := PS;
    P := F;
    while P < G14 do
    begin
      P := P + 1;
      if G16[P].I7 then
      begin
        PS := PS - 4;
      end
      else
      begin
        PS := PS - G17[G16[P].I2].T0;
      end;
      G16[P].I5 := G11;
      G16[P].I6 := PS;
    end;
    if BF then
    begin
      U7(8);
      U6(0);
      I2(G16[F].I2);
      if G17[G16[F].I2].I3 <> 0 then
        U2(137);
    end;
    U7(18);
    G16[F].I11 := G14;
    if G3 <> 47 then
    begin
      if G8 >= 0 then
      begin
        P1 := G8 + 1;
        P2 := F + 1;
        while P1 <= G16[G8].I11 do
        begin
          if P2 > G16[F].I11 then
            U2(138);
          if not U0(G16[P1].I0, G16[P2].I0) then
            U2(139);
          if G16[P1].I2 <> G16[P2].I2 then
            U2(140);
          if G16[P1].I7 <> G16[P2].I7 then
            U2(141);
          P1 := P1 + 1;
          P2 := P2 + 1;
        end;
        if P2 <= G16[F].I11 then
          U2(142);
      end;
      G16[F].I13 := True;
      U24(G16[F].I10);
      G16[F].I13 := False;
      U10(43, G16[F].I12 - G20);
    end
    else
    begin
      if G8 >= 0 then
        U2(143);
      U5;
    end;
    G11 := G11 - 1;
    G20 := QX;
    U7(18);
  end;

  procedure U24(L: integer);
  var
    I, D, QX, IK: integer;
  begin
    QX := G20;
    IK := G14;
    while (G3 = 39) or (G3 = 41) or (G3 = 40) or (G3 = 49) or (G3 = 50) do
    begin
      if G3 = 39 then
      begin
        U5;
        U6(0);
        while G3 = 0 do
          U26;
      end
      else if G3 = 41 then
      begin
        U5;
        U6(0);
        while G3 = 0 do
          UY;
      end
      else if G3 = 40 then
      begin
        U5;
        U6(0);
        while G3 = 0 do
          UV;
      end
      else if (G3 = 49) or (G3 = 50) then
      begin
        FD(G3 = 49);
      end;
    end;
    if L + 1 = U12 then
    begin
      G19 := G19 - 1;
    end
    else
    begin
      G18[L + 1] := U12;
    end;
    if G11 = 0 then
    begin
      U10(42, G20);
    end
    else
    begin
      D := G20 - QX;
      G20 := QX;
      U10(42, D);
    end;
    U23;
    if G11 <> 0 then
      U10(42, QX - G20);
    I := IK + 1;
    while I <= G14 do
    begin
      if G16[I].I3 = 4 then
        if (G18[G16[I].I10] = 39) and (G18[G16[I].I10 + 1] = 0) then
          U2(144);
      I := I + 1;
    end;
    G14 := IK;
  end;

var
  OCT: array[1..262144] of char;
  OCP: integer;

  procedure OCC(C: char);
  begin
    if OCP < 262143 then
    begin
      OCP := OCP + 1;
      OCT[OCP] := C;
    end;
  end;

  procedure OC(B: integer);
  begin
    OCC(CHR(B));
  end;

  procedure OCW(I: integer);
  begin
    if I >= 0 then
    begin
      OC(I mod 256);
      OC((I div 256) mod 256);
    end
    else
    begin
      I := -(I + 1);
      OC(255 - (I mod 256));
      OC(255 - ((I div 256) mod 256));
    end;
  end;

  procedure OCI(I: integer);
  begin
    if I >= 0 then
    begin
      OC(I mod 256);
      OC((I div 256) mod 256);
      OC((I div 65536) mod 256);
      OC(I div 16777216);
    end
    else
    begin
      I := -(I + 1);
      OC(255 - (I mod 256));
      OC(255 - ((I div 256) mod 256));
      OC(255 - ((I div 65536) mod 256));
      OC(255 - (I div 16777216));
    end;
  end;

  function OCGI(O: integer): integer;
  begin
    if Ord(OCT[O + 3]) < $80 then
    begin
      OCGI := Ord(OCT[O]) + (Ord(OCT[O + 1]) * 256) + (Ord(OCT[O + 2]) * 65536) + (Ord(OCT[O + 3]) * 16777216);
    end
    else
    begin
      OCGI := -(((255 - Ord(OCT[O])) + ((255 - Ord(OCT[O + 1])) * 256) + ((255 - Ord(OCT[O + 2])) * 65536) +
        ((255 - Ord(OCT[O + 3])) * 16777216)) + 1);
    end;
  end;

  procedure OCPI(O, I: integer);
  begin
    if I >= 0 then
    begin
      OCT[O] := CHR(I mod 256);
      OCT[O + 1] := CHR((I div 256) mod 256);
      OCT[O + 2] := CHR((I div 65536) mod 256);
      OCT[O + 3] := CHR(I div 16777216);
    end
    else
    begin
      I := -(I + 1);
      OCT[O] := CHR(255 - (I mod 256));
      OCT[O + 1] := CHR(255 - ((I div 256) mod 256));
      OCT
        [O + 2] := CHR(255 - ((I div 65536) mod 256));
      OCT[O + 3] := CHR(255 - (I div 16777216));
    end;
  end;

  procedure WOC;
  var
    I: integer;
  begin
    for I := 1 to OCP do
    begin
      Write(OCT[I]);
    end;
  end;

type
  TOCS = array[1..255] of char;

  procedure OCS(S: TOCS);
  var
    I: integer;
  begin
    for I :=
      1 to 255 do
      OCC(S[I]);
  end;

  procedure OCASC;
  begin
    OCP := 0;
    OCS('MZRÃBeRo^fr'#0'PE'#0#0'L'#1#1#0#0#0#0#0#0#0#0#0#0#0#0#0'à'#0#15#3#11#1#0#0'‹'#3#0#0#0#0#0#0#0#0#0#0'Ä'#16#0#0#0#16#0#0#12#0#0#0#0#0'@'#0#0#16#0#0#0#2#0#0#4#0#0#0#0#0#0#0#4#0#0#0#0#0#0#0#0' '#0#0#0#2#0#0#0#0#0#0#3#0#0#0#0#0#16#0#0' '#0#0#0#0#16#0#0' '#0#0#0#0#0#0#16#0#0#0#0#0#0#0#0#0#0#0#0#16#0#0'Ä'#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0);
    OCS(#0#0#0#0#0#0#0#0#0#0#0#0#0#0#16#0#0#0#16#0#0'‹'#3#0#0#0#2#0#0#0#0#0#0#0#0#0#0#0#0#0#0' '#0#0'à'#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0);
    OCS(#0#0#0#0#0#0#0#0#0#0'ÿÿÿÿ('#16#0#0'5'#16#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'kernel32.dll'#0'W'#16#0#0'e'#16#0#0't'#16#0#0'…'#16#0#0'‘'#16#0#0'œ'#16#0#0'­'#16#0#0'¹'#16#0#0#0#0#0#0'ExitProcess'#0#0#0'GetStdHandle'#0#0#0'SetConsoleMode'#0#0#0'WriteFile'#0#0#0'ReadFile'#0#0#0'GetProcessHeap'#0#0#0'HeapAlloc'#0#0#0'HeapFree'#0'éb'#2#0#0' Compiled by: BeRoTinyPascal - (C) Copyright 2006, B');
    OCS('enjamin ''BeRo'' Rosseaux @'#0'Vt$'#8'`j'#0'h'#21#17'@'#0'j'#1'Vÿ5'''#19'@'#0'ÿ'#21'A'#16'@'#0'a^Â'#4#0'@'#0'@'#0'@'#0'V‹\$'#8'‹D$'#12'ƒø'#0'}'#10'÷ØKj-è»ÿÿÿ3ÉPS…Àt'#12'A»'#10#0#0#0'3Ò÷ûëð…É'#15'”Ò'#10'Ê[X+Ùƒû'#0'~'#12'Qj èÿÿÿKuöY¹9'#17'@'#0'Q¾'#10#0#0#0'3Ò÷þZ0ˆ'#31'OâïYj'#0'h'#21#17'@'#0'Qh:'#17'@'#0'ÿ5'''#19'@'#0'ÿ'#21'A'#16'@'#0'^Â'#8#0'j'#13'èNÿÿÿj'#10'èGÿÿÿÃ@'#0'`j'#0'hÔ'#17'@'#0'j'#1'hÓ'#17'@'#0'ÿ5#'#19'@'#0'ÿ'#21'E'#16'@'#0'…À'#15'”Ð'#8#5'º'#18);
    OCS('@'#0'ƒ=Ô'#17'@'#0#0#15'”Ð'#8#5'º'#18'@'#0'aÃ'#0'€='#16#18'@'#0#0'u'#12'è¹ÿÿÿÆ'#5#16#18'@'#0#1'Ãèåÿÿÿ'#15'¶'#5'Ó'#17'@'#0'è ÿÿÿÃèÓÿÿÿ`3ÀH'#1'€=º'#18'@'#0#0'uH€=Ó'#17'@'#0#0't'#16'€=Ó'#17'@'#0' w'#7'ètÿÿÿëÞ€=Ó'#17'@'#0'-u'#7'÷Ùèbÿÿÿ'#15'¶'#29'Ó'#17'@'#0'€û0r'#19'€û9w'#14'kÀ'#10'D'#24'ÐèEÿÿÿëá÷éaÃèsÿÿÿ€=º'#18'@'#0#0'u'#18'Š'#29'Ó'#17'@'#0'€û'#10't'#7'è!ÿÿÿëàÃ'#0#15'¶'#5'º'#18'@'#0'Ã€=Ó'#17'@'#0#10#15'”ÒÃ@'#0'‹%Î'#18'@'#0'ÿ5'#31#19'@'#0'h'#0#0#0#0'ÿ5'#27#19'@'#0'ÿ'#21'Q'#16'@'#0'j'#0'ÿ'#21'5'#16'@'#0'Ò'#18'@'#0);
    OCS(#25#17'@'#0'F'#17'@'#0'Ä'#17'@'#0#39#18'@'#0'9'#18'@'#0'™'#18'@'#0'»'#18'@'#0'Ã'#18'@'#0'@'#0'@'#0'@'#0'@'#0'jöÿ'#21'9'#16'@'#0'£#'#19'@'#0'j'#5'Pÿ'#21'='#16'@'#0'jõÿ'#21'9'#16'@'#0'£'''#19'@'#0'j'#3'Pÿ'#21'='#16'@'#0'‰%Î'#18'@'#0'ÿ'#21'I'#16'@'#0'£'#27#19'@'#0'h'#28#0'@'#0'h'#12#0#1#0'Pÿ'#21'M'#16'@'#0'£'#31#19'@'#0' '#0#0'@'#0'‹ì¾÷'#18'@'#0'                                                                                                               ');
    OCP := 1419;
  end;

var
  LOCV, PC: integer;

  procedure OC0;
  begin
    if LOCV = 2 then
    begin
      if G18[PC] = OCP then
      begin
        G18[PC] := G18[PC] - 1;
      end;
      if OCP > 0 then
        OCP := OCP - 1;
      LOCV := 0;
    end
    else
    begin
      OC($50);
      LOCV := 1;
    end;
  end;

  procedure OC1;
  begin
    if LOCV = 1 then
    begin
      if G18[PC] = OCP then
      begin
        G18[PC] := G18[PC] - 1;
      end;
      if OCP > 0 then
        OCP := OCP - 1;
      LOCV := 0;
    end
    else
    begin
      OC($58);
      LOCV := 2;
    end;
  end;

  procedure OC2;
  begin
    OC($5B);
    LOCV := 3;
  end;

  procedure OC3;
  begin
    OC($F7);
    OC($EB);
    LOCV := 4;
  end;

  procedure OC4;
  begin
    OC($33);
    OC($D2);
    LOCV := 5;
  end;

  procedure OC5;
  begin
    OC($F7);
    OC($FB);
    LOCV := 6;
  end;

  procedure OC6;
  begin
    OC($52);
    LOCV := 7;
  end;

  procedure OC7;
  begin
    OC($3B);
    OC($C3);
    LOCV := 8;
  end;

  procedure OC8;
  begin
    OC($0F);
    OC($B6);
    OC($C0);
    LOCV := 9;
  end;

  procedure OC9;
  begin
    OC($75);
    OC($03);
    LOCV := 11;
  end;

  procedure OC10;
  begin
    OC($89);
    OC($04);
    OC($24);
    LOCV := 10;
  end;

  procedure OC11;
  begin
    OC($89);
    OC($03);
    LOCV := 12;
  end;

  procedure OC12(OFS: integer);
  begin
    OC($FF);
    OC($66);
    OC(OFS);
    LOCV := 13;
  end;

  procedure OC13(OFS: integer);
  begin
    OC($FF);
    OC($56);
    OC(OFS);
    LOCV := 14;
  end;

  procedure OC14;
  begin
    OC($87);
    OC($D6);
    LOCV := 15;
  end;

  procedure OC15;
  begin
    OC($5E);
    LOCV := 16;
  end;

  procedure OC16(I4: integer);
  begin
    OC($B9);
    OCI(I4);
    LOCV := 17;
  end;

  procedure OC17;
  begin
    OC($FC);
    LOCV := 18;
  end;

  procedure OC18;
  begin
    OC($F3);
    OC($A4);
    LOCV := 19;
  end;

  procedure OC19;
  begin
    OC($85);
    OC($C0);
    LOCV := 20;
  end;

  procedure OC20;
  begin
    OC($F7);
    OC($1C);
    OC($24);
    LOCV := 21;
  end;

  procedure OC21;
  begin
    OC($8B);
    OC($04);
    OC($24);
    LOCV := 22;
  end;

  procedure OC22;
  begin
    OC($8B);
    OC($5D);
    OC($04);
    LOCV := 23;
  end;

  procedure OC23;
  begin
    OC($39);
    OC($03);
    LOCV := 24;
  end;

  procedure OC24;
  begin
    OC($8B);
    OC($45);
    OC($08);
    LOCV := 25;
  end;

var
  JCPT: array[1..MCC] of integer;

  procedure UAL;
  var
    JCPC, I, D, CS, SA, SOCP: integer;
  begin
    OCASC;
    SOCP := OCP;
    LOCV := 0;
    PC := 0;
    JCPC := 0;
    while PC < G19 do
    begin
      I := G18[PC];
      D := G18[PC + 1];
      G18
        [PC] := OCP;
      case I of
        0:
        begin
          OC1;
          OC($01);
          OC($04);
          OC($24);
          LOCV := 0;
        end;
        1:
        begin
          OC20;
        end;
        2:
        begin
          OC2;
          OC1;
          OC3;
          OC0;
        end;
        3:
        begin
          OC2;
          OC1;
          OC4;
          OC5;
          OC0;
        end;
        4:
        begin
          OC2;
          OC1;
          OC4;
          OC5;
          OC6;
        end;
        5:
        begin
          OC($D1);
          OC($3C);
          OC($24);
          LOCV := 0;
        end;
        6:
        begin
          OC1;
          OC($8B);
          OC($D8);
          OC($25);
          OC($01);
          OC($00);
          OC($00);
          OC($80);
          OC($79);
          OC($05);
          OC($48);
          OC($83);
          OC($C8);
          OC($FE);
          OC($40);
          LOCV := 0;
          OC3;
          OC0;
        end;
        7:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC($94);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        8:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC($95);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        9:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC($9C);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        10:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC($9E);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        11:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC(
            $9F);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        12:
        begin
          OC2;
          OC1;
          OC7;
          OC($0F);
          OC($9D);
          OC($D0);
          LOCV := 0;
          OC8;
          OC0;
        end;
        13:
        begin
          OC($FF);
          OC($34);
          OC($24);
          LOCV := 0;
        end;
        14:
        begin
          OC2;
          OC1;
          OC(
            $53);
          LOCV := 0;
          OC0;
        end;
        15:
        begin
          OC1;
          OC19;
          OC9;
          OC10;
          LOCV := 0;
        end;
        16:
        begin
          OC1;
          OC($83);
          OC($F8);
          OC($01);
          LOCV := 0;
          OC9;
          OC10;
          LOCV := 0;
        end;
        17:
        begin
          OC1;
          OC($FF);
          OC($30);
          LOCV := 0;
        end;
        18:
        begin
          OC2;
          OC1;
          OC11;
        end;
        19:
        begin
          OC12(0);
        end;
        20:
        begin
          OC13(8);
        end;
        21:
        begin
          OC13(4);
        end;
        22:
        begin
          OC13(12);
        end;
        23:
        begin
          OC2;
          OC13(20);
          OC11;
        end;
        24:
        begin
          OC2;
          OC13(16);
          OC8;
          OC11;
        end;
        25:
        begin
          OC13(24);
        end;
        26:
        begin
          OC13(28);
          OC0;
        end;
        27:
        begin
          OC13(32);
          OC0;
        end;
        28:
        begin
          if (D >= -128) and (D <= 127) then
          begin
            OC($6A);
            OC(D);
          end
          else
          begin
            OC($68);
            OCI(D);
          end;
          LOCV := 0;
          PC := PC + 1;
        end;
        29:
        begin
          if D = 0 then
          begin
            OC($8B);
            OC($C5);
          end
          else if (D >= -128) and (D <= 127) then
          begin
            OC($8D);
            OC($45);
            OC(D);
          end
          else
          begin
            OC($8D);
            OC($85);
            OCI(D);
          end;
          LOCV := 0;
          OC0;
          PC := PC + 1;
        end;
        30:
        begin
          if D = 0 then
          begin
            OC($8B);
            OC($C4);
          end
          else if (D >= -128) and (D <= 127) then
          begin
            OC($8D);
            OC($44);
            OC($24);
            OC(D);
          end
          else
          begin
            OC($8D);
            OC($84);
            OC($24);
            OCI(D);
          end;
          LOCV := 0;
          OC0;
          PC := PC + 1;
        end;
        31:
        begin
          if D = 0 then
          begin
            OC21;
          end
          else if (D >= -128) and (D <= 127) then
          begin
            OC($8B);
            OC($44);
            OC($24);
            OC(D);
          end
          else
          begin
            OC($8B);
            OC($84);
            OC($24);
            OCI(D);
          end;
          OC0;
          PC := PC + 1;
        end;
        32:
        begin
          if (D >= -128) and (D <= 127) then
          begin
            OC($8B);
            OC($45);
            OC(D);
          end
          else
          begin
            OC($8B);
            OC($85);
            OCI(D);
          end;
          LOCV := 0;
          OC0;
          PC := PC + 1;
        end;
        33:
        begin
          OC1;
          D := D - 4;
          if D = 0 then
          begin
            OC($89);
            OC($04);
            OC($24);
          end
          else if (D >= -128) and (D <= 127) then
          begin
            OC($89);
            OC($44);
            OC($24);
            OC(D);
          end
          else
          begin
            OC($89);
            OC($84);
            OC($24);
            OCI(D);
          end;
          LOCV := 0;
          PC :=
            PC + 1;
        end;
        34:
        begin
          OC1;
          if (D >= -128) and (D <= 127) then
          begin
            OC($89);
            OC($45);
            OC(D);
          end
          else
          begin
            OC($89);
            OC($85);
            OCI(D);
          end;
          LOCV := 0;
          PC := PC + 1;
        end;
        35:
        begin
          OC14;
          OC($5F);
          LOCV := 0;
          OC15;
          OC16(D);
          OC17;
          OC18;
          OC14;
          PC := PC + 1;
        end;
        36:
        begin
          OC14;
          OC15;
          OC16(D);
          OC($2B);
          OC($E1);
          OC($8B);
          OC($FC);
          LOCV := 0;
          OC17;
          OC18;
          OC14;
          PC := PC + 1;
        end;
        37:
        begin
          if (D >= -128) and (D <= 127) then
          begin
            OC($83);
            OC($04);
            OC($24);
            OC(D);
          end
          else
          begin
            OC($81);
            OC($04);
            OC($24);
            OCI(D);
          end;
          LOCV := 0;
          PC := PC + 1;
        end;
        38:
        begin
          if D = (-1) then
          begin
            OC20;
          end
          else
          if (D >= -128) and (D <= 127) then
          begin
            OC1;
            OC($6B);
            OC($C0);
            OC(D);
            LOCV := 0;
            OC0;
          end
          else
          begin
            OC1;
            OC($69);
            OC($C0);
            OCI(D);
            LOCV := 0;
            OC0;
          end;
          PC := PC + 1;
        end;
        39:
        begin
          if D <> (PC + 2) then
          begin
            JCPC := JCPC + 1;
            OC($E9);
            JCPT[JCPC] := OCP + 1;
            OCI(D);
          end;
          PC := PC + 1;
          LOCV := 0;
        end;
        40:
        begin
          JCPC := JCPC + 1;
          OC1;
          OC19;
          OC($0F);
          OC($84);
          JCPT[JCPC] := OCP + 1;
          OCI(D);
          LOCV := 0;
          PC := PC + 1;
        end;
        41:
        begin
          JCPC := JCPC + 1;
          OC($E8);
          JCPT[JCPC] := OCP + 1;
          OCI(D);
          LOCV := 0;
          PC := PC + 1;
        end;
        42:
        begin
          if D > 0 then
          begin
            if (D >= -128) and (D <= 127) then
            begin
              OC($83);
              OC($C4);
              OC(D);
            end
            else
            begin
              OC($81);
              OC($C4);
              OCI(D);
            end;
          end
          else if D < 0 then
          begin
            D := -D;
            if (D >= -128) and (D <= 127) then
            begin
              OC($83);
              OC($EC);
              OC(D);
            end
            else
            begin
              OC($81);
              OC($EC);
              OCI(D);
            end;
          end;
          LOCV := 0;
          PC := PC + 1;
        end;
        43:
        begin
          D := D - 4;
          if D > 0 then
          begin
            OC($C2);
            OCW(D);
          end
          else
          if D = 0 then
          begin
            OC($C3);
          end;
          LOCV := 0;
          PC := PC + 1;
        end;
      end;
      PC := PC + 1;
    end;
    for I := 1 to JCPC do
    begin
      D := JCPT[I];
      OCPI(D, ((G18[OCGI(D)] - D) - 3));
    end;
    CS := OCGI($29) + (OCP - SOCP);
    OCPI($29, CS);
    SA := OCGI($45);
    I := CS;
    if SA <> 0 then
    begin
      D := I mod SA;
      if D <> 0 then
      begin
        I := I + (SA - D);
      end;
    end;
    OCPI($10D, I);
    OCPI($5D, I + OCGI($39));
    OCPI($115, OCGI($115) + (OCP - SOCP));
    WOC;
  end;

begin
  U1(G9[21], 'BEGIN               ');
  U1(G9[22], 'END                 ');
  U1(G9[23], 'IF                  ');
  U1(G9[24], 'THEN                ');
  U1(G9[25], 'ELSE                ');
  U1(G9[26], 'WHILE               ');
  U1(G9[27], 'DO                  ');
  U1(G9[28], 'CASE                ');
  U1(G9[29], 'REPEAT              ');
  U1(G9[30], 'UNTIL               ');
  U1(G9[31], 'FOR                 ');
  U1(G9[32], 'TO                  ');
  U1(G9[33], 'DOWNTO              ');
  U1(G9[34], 'NOT                 ');
  U1(G9[35], 'DIV                 ');
  U1(G9[36], 'MOD                 ');
  U1(G9[37], 'AND                 ');
  U1(G9[38], 'OR                  ');
  U1(G9[39], 'CONST               ');
  U1(G9[40], 'VAR                 ');
  U1(G9[41], 'TYPE                ');
  U1(G9[42], 'TABLEAU               ');
  U1(G9[43], 'OF                  ');
  U1(G9[44], 'PACKED              ');
  U1(G9[45], 'RECORD              ');
  U1(G9[46], 'PROGRAM             ');
  U1(G9[47], 'FORWARD             ');
  U1(G9[48], 'HALT                ');
  U1(G9[49], 'FUNCTION            ');
  U1(G9[50], 'PROCEDURE           ');
  G17[1].T0 := 4;
  G17[1].I3 := 0;
  G17[3].T0 := 4;
  G17[3].I3 := 0;
  G17[2].T0 := 4;
  G17[2].I3 := 0;
  G17[4].T0 := 0;
  G17[4].I3 := 0;
  G15 := 4;
  G13[-1] := 0;
  G11 := -1;
  G14 := 0;
  U8('FALSE               ', 0, 2);
  G16[G14].I4 := Ord(False);
  U8('TRUE                ', 0, 2);
  G16[G14].I4 := Ord(True);
  U8('MAXINT              ', 0, 1);
  G16[G14].I4 := 2147483647;
  U8('INTEGER             ', 3, 1);
  U8('CHAR                ', 3, 3);
  U8('BOOLEAN             ', 3, 2);
  U8('CHR                 ', 4, 3);
  G16[G14].I9 := -1;
  G16[G14].I10 := 0;
  G16[G14].I13 := False;
  U8('ORD                 ', 4, 1);
  G16[G14].I9 := -1;
  G16[G14].I10 := 1;
  G16[G14].I13 := False;
  U8('WRITE               ', 4, 0);
  G16[G14].I9 := -1;
  G16[G14].I10 := 2;
  U8('WRITELN             ', 4, 0);
  G16[G14].I9 := -1;
  G16[G14].I10 := 3;
  U8('READ                ', 4, 0);
  G16[G14].I9 := -1;
  G16[G14].I10 := 4;
  U8('READLN              ', 4, 0);
  G16[G14].I9 := -1;
  G16[G14].I10 := 5;
  U8('EOF                 ', 4, 2);
  G16[G14].I9 := -1;
  G16[G14].I10 := 6;
  G16[G14].I13 := False;
  U8('EOLN                ', 4, 2);
  G16[G14].I9 := -1;
  G16[G14].I10 := 7;
  G16[G14].I13 := False;
  G13[0] := 0;
  G11 := 0;
  G2 := 1;
  G1 := 0;
  U3;
  U5;
  G12 := True;
  G19 := 0;
  G10 := -1;
  G20 := 4;
  U7(46);
  U7(0);
  U7(18);
  U10(39, 0);
  U24(0);
  U11(19);
  U6(19);
  UAL;
end.
