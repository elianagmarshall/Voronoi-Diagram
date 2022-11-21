PImage waterfall; //image of a waterfall
float shortestDist; //variable for the shortest distance between a pixel and the randomly generated points
color pointColor; //color variable for the randomly generated points

PVector[] points = new PVector[10000]; //PVector to store the coordinates of the randomly generated points

void setup () {
  size(600,600); //size of the run window
  waterfall=loadImage("waterfall.jpg");
  generatePoints(); //generates random points
}
void draw() {
  image(waterfall,0,0,width,height); //waterfall background
  check(); //checks the waterfall image pixel by pixel and sets the color of the pixel to the color of the shortest distance generating point
}

void generatePoints() {
  for(int index=0;index<points.length;index++) { //index variable has an initial value of 0, must be less than the length of points array, and increases by increments of 1
     points[index]=new PVector(random(width),random(height)); //randomly generates x and y coordinates for points array
  }
}

void check() {
  for(int x=0;x<width;x++) { //x variable has an initial value of 0, must be less than the width of the run window, and increases by increments of 1
    for(int y=0;y<height;y++) { //y variable has an initial value of 0, must be less than the height of the run window, and increases by increments of 1
      shortestDist=dist(x,y,points[0].x,points[0].y); //intial shortest distance between a pixel and a randomly generated point
      for(int index=0;index<points.length;index++) { //index variable has an initial value of 0, must be less than the length of points array, and increases by increments of 1
        if(dist(x,y,points[index].x,points[index].y)<shortestDist) { //if the distance between a pixel and a randomly generated point is less than shortestDist
        shortestDist=dist(x,y,points[index].x,points[index].y); //shortestDist is equal to the distance between a pixel and a randomly generated point
        pointColor=get(int(points[index].x),int(points[index].y)); //pointsColor is equal to the color of the pixels located at the randomly generated points
        }
      }
      set(x,y,pointColor); //changes the color of a pixel to pointColor
    }
  }
}
