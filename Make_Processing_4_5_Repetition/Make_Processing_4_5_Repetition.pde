//Reuse the same values

size(480, 120);
smooth();
strokeWeight(2);

line(20, 40, 80, 80);
line(80, 40, 140, 80);
line(140, 40, 200, 80);
line(200, 40, 260, 80);
line(260, 40, 320, 80);
line(320, 40, 380, 80);
line(380, 40, 440, 80);

for (int i = 20; i < 400; i += 8) {
  line(i, 40, i + 60, 80);
}
// for (init;test;update){
// statements 
// }

//Fanning out the lines
for (int i = 20; i < 400; i += 20) {
  line(i, 0, i + i/2, 80);
}
//Kinking the lines
for (int i = 20; i < 400; i += 20) {
  line(i, 0, i + i/2, 80);
  line(i + i/2, 80, i*1.2, 120);
}
