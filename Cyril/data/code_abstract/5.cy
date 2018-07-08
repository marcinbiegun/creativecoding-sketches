// death star surface

// set perspective
rotate 270, 0,1,0
move -10,1,0


// scale oscillating along with wave,
//   - bigger on left (size scaled)
//   - faster on left (velocity scaled)

w1: wave(500)
pos: map(w1, 0,1, -3,3)

move 0,0,pos


// wave inside particle won't work :(
//particle 0.2
//  color hsv(wave(100)*50, 200,200)
//  box 0.2
//end

// color colorizes all the particles (in current frame)
//color hsv(wave(100)*50, 200,200)
//particle 0.2
//  box 0.2
//end



// multiple particles emitors with diffrent colors - WON'T WORK
// paricle emittors will be the same (as the first one
// - looks like it's the same isntance of particle emittor, even if it's inside loop

for i: -5 to 5 step 2
  push
  move 0,0,i
  particle 0.1
    //box 0.1
     color hsv(map(i, -5,5, 0,150), 200, 200)
     box map(i, -5,5, 0.1,0.5)
  end
  pop
end


// without loop, separate pieces of code for emitters

push
move 0,0,-5
particle 0.1
  // color must be placed inside partricle block to work
  color red
  box 0.1
end
pop

push
move 0,0,-3
particle 0.1
  color yellow
  box 0.1
end
pop
