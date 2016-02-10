function n = note_to_number(note)

switch lower(note)
case 'c2', n = 40-24;
case 'db2', n = 41-24;
case 'd2', n = 42-24;
case 'eb2', n = 43-24;
case 'e2', n = 44-24;
case 'f2', n = 45-24;
case 'f#2', n = 46-24;
case 'g2', n = 47-24;
case 'ab2', n = 48-24;
case 'a2', n = 49-24;
case 'bb2', n = 50-24;
case 'b2', n = 51-24;

case 'c3', n = 40-12;
case 'db3', n = 41-12;
case 'd3', n = 42-12;
case 'eb3', n = 43-12;
case 'e3', n = 44-12;
case 'f3', n = 45-12;
case 'f#3', n = 46-12;
case 'g3', n = 47-12;
case 'ab3', n = 48-12;
case 'a3', n = 49-12;
case 'bb3', n = 50-12;
case 'b3', n = 51-12;

case 'c4', n = 40;
case 'db4', n = 41;
case 'd4', n = 42;
case 'eb4', n = 43;
case 'e4', n = 44;
case 'f4', n = 45;
case 'f#4', n = 46;
case 'g4', n = 47;
case 'ab4', n = 48;
case 'a4', n = 49;
case 'bb4', n = 50;
case 'b4', n = 51;

case 'c5', n = 40+12;
case 'd5', n = 42+12;
case 'eb5', n = 43+12;
case 'e5', n = 44+12;
case 'f5', n = 45+12;
case 'f#5', n = 46+12;
case 'g5', n = 47+12;
case 'ab5', n = 48+12;
case 'a5', n = 49+12;
case 'bb5', n = 50+12;
case 'b5', n = 51+12;

case 'c6', n = 40+24;

end
