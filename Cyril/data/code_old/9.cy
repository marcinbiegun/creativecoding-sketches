palette $f
50 red
25 orange
25 yellow
end

color red
move -3

scale 0.5
DECAY: 0.02

do 1 times
move (wave(3000)*10),wave(100) + ((wave(1000)*6) - 3)
particle 0.5
ball 0.3
end
end

