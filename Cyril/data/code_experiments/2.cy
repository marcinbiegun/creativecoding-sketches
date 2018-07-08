
stroke 4

//rotate map(wave(1000),0,1, 30,60), 1,0,1

rotate 120, 0,1,-0.5

for i: 0 to 40 step 1
  push
  move map(noise(i,2),0,1,-2,2), 0, map(noise(i,3),0,1,-2,2)

  if noise(i,5) <= 0.5
    color green
    box 0.4, 1, 0.4
  end
  if noise(i,5) > 0.5
    color red
    cone 0.4, 1
  end

  pop
end
