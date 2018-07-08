scale 0.5

stroke 3
for i: 0 to 20 step 1
  rotate wave(1000)*10
  scale 0.2 + (0.5 * (1.2 * wave(1000)))
  scale 5
  sphereDetail 2 + (wave(1000)*10)
  color hsv(map(i, 0,20, 0,255),200,200)
  box
end

