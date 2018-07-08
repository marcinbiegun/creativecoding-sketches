
//rotate map(wave(500),0,1,0,360), 0,0,1
//rotate map(wave(500),0,1,0,360), 0,1,0




// tevel tunnel
//DECAY: 0.01
//do 2 times
  //push
  //rotate map(rand(0,1),0,1,0,360), 0,0,1
  ////rotate map(wave(0,1),0,1,0,360), 0,1,0
  //particle 0.01, 0,0.001,0.001
    //box 0.1
  //end
  //pop
//end



push
// emit in all directions
DECAY: 0.002
rotate map(rand(0,1),0,1,0,360), 0,0,1
rotate map(rand(0,1),0,1,0,360), 0,1,0


//color hsv(255,255,map(wave(500),0,1,0,255))

//if TIME % 1000 > 500
  //h: 50
//end
//if TIME % 1000 <= 500
  //h: 150
//end
//color hsv(h,255,255)

//color hsv(TIME%255,255,255)

// color change inside perticle block wont work
// * you can change it manually, then it will work as expected
// * you can only use HEALTH as parameter binded to a single particle

//particle 0.02
  ////color hsv(map(rand(0,1),0,1,0,255),255,255)
  //box 0.1
//end
//pop





// emittors with difrenet colors - needs to be inside block, wont work outsite of block
//rotate map(rand(0,1),0,1,0,360), 0,0,1
//rotate map(rand(0,1),0,1,0,360), 0,1,0
//particle 0.03
  //color blue
  //box 0.1*HEALTH
//end

//rotate map(rand(0,1),0,1,0,360), 0,0,1
//rotate map(rand(0,1),0,1,0,360), 0,1,0
//particle 0.03
  //color green
  //box 0.1
//end

//rotate map(rand(0,1),0,1,0,360), 0,0,1
//rotate map(rand(0,1),0,1,0,360), 0,1,0
//particle 0.03
  //color red
  //box 0.1
//end
//pop




// getting smaller
//particle 0.01
  //color green
  //box 0.1*HEALTH
//end
//pop





// it's the same function for all
//particle 0.01
  //color green
  //box 1*noise(HEALTH, 2)
//end
//pop



// random works fine
particle 0.01
  color green
  box rand(0.1,0.2)*HEALTH
end
pop








