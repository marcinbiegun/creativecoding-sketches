// sun + cover bottom part

// move sun up or down - sync with music?
// mov: 0
//move 0,mov,0
// move back

move 0,0,-60

push
  // down
  fill
  color gray

  move 0,5,0
  sphereDetail 32
  //sphere 20

  do 5 times
    rotate wave(200)*100
    scale 1.1
    color hsv(wave(1000)*200,255,255)
    box 10 + (20*F1)
  end
pop




fill
color hsv(250,255,50)
move 0,16.5, 25
box 100,30,0
