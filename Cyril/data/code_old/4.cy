range: 20
cyclems: 2000
v: 12

fill

// modify to see the whole picture
move (range/-2)     + 10
move 0, (v/-2)      + 5
scale 0.1

for phase: 0 to 1 step 0.1
  push
    cycle: (TIME+(phase*cyclems)) % cyclems
    pos_v: (range)/(cyclems/cycle)
    pos_h: noise(1, phase*100) * 20

    move pos_v, pos_h
    rotate noise(1, phase*100)*180, noise(2, phase*100)*360, noise(3, phase*100)*360

    box
  pop
end
