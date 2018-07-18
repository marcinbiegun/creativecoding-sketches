color white


DECAY: 0.02


rotate

move rand(-2,2),rand(-2,2),rand(-1,1)
particle 0.1
  fill
  color hsv(HEALTH*255,255,map(F2, 0,1,100,255))
  cone 0.5 + map(F1, 0,1, 0,3)
end
