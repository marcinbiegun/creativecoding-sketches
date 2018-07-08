// use noise() to build surface, use move() for movement

// set perspective
rotate 270, 0,1,0
move -20,1,0


//move map(TIME%1000, 0,1000, 0,5),0,0

DECAY: 0.05

move 0,wave(200)*2,wave(50)*10
particle 1

stroke 1
// whole set of x*y block is a single particle
for x: -5 to 5 step 2
  for y: -5 to 5 step 2
    push
      // now its: forth, top, left
      z_pos: map(noise(x,y), 0,1, -5,5)
      x_pos: map(noise(x*2,y*2), 0,1, -5,5)
      y_pos: map(noise(x*4,y*4), 0,1, -5,5)

      move x_pos,z_pos,y_pos

      box wave(100) * map(noise(x,y), 0,1, 0.5,1)
    pop
  end
end
end







