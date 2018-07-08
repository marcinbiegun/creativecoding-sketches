background hsv(210,255,255)


color white

m: map(wave(1000), 0,1, -5,5)
move 0,0,m
stroke 4

rotate 45, 1,1,0

push
for i:0 to 10 step 1
  rotate 3
  box 0.25 + F2*2
end
pop



stroke 2
color red

do 10 times
  rotate 1
  scale 1.1
  sphere map(wave(1000), 0,1,0.3,10)
end
