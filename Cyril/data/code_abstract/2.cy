// abstract ball zoom inside cube

background black
color white

stroke 4
scale 6


box

do 40 times
  scale wave(10000)
  rotate TIME/1000
  color hsv((TIME/10)%255, 200, 150)
  ball
  box
end


