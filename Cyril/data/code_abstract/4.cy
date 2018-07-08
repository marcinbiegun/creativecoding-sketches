// death star surface

// set perspective
rotate 270, 0,1,0
move -10,1,0


// scale oscillating along with wave,
//   - bigger on left (size scaled)
//   - faster on left (velocity scaled)

w1: wave(100)
pos: w1*3

move 0,0,pos

scale map(w1, 0,1, 0, 1)
particle 0.2
  box 0.5
end
