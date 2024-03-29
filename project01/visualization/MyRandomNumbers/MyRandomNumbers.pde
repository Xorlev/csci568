/*
 #myrandomnumber Tutorial
 blprnt@blprnt.com
 April, 2010
 */

//This is the Google spreadsheet manager and the id of the spreadsheet that we want to populate, along with our Google username & password
SimpleSpreadsheetManager sm;
String sUrl = "t6mq_WLV5c5uj6mUNSryBIA";
String googleUser = GUSER;
String googlePass = GPASS;
PFont label;
  
void setup() {
  //This code happens once, right when our sketch is launched
  size(800,800);
  background(0);
  smooth();

  label = createFont("Helvetica", 24);

  int[] numbers = getNumbers();
  
  fill(255,40);
  noStroke();
  
  colorGrid(numbers,50,50,70);
}

void draw() {
  //This code happens once every frame.
}

void barGraph(int[] nums, float y) {
  // Make a list of the number frequencies
  int[] counts = new int[100];
  
  // Zero-init
  for (int i = 1; i < 100; i++) {
    counts[i] = 0;
  }
  
  // Count nums
  for (int i = 0; i < nums.length; i++) {
    counts[nums[i]]++;
  }
  
  // Make bar graph
  for (int i = 0; i < counts.length; i++) {
    colorMode(HSB);
    fill(counts[i]*30,255,255);
    rect(i * 8, y, 7, -counts[i] * 10);
  }
}

void colorGrid(int[] nums, float x, float y, float s) {
  int[] counts = new int[100];
  
  //Fill it with zeros
  for (int i = 0; i < 100; i++) {
    counts[i] = 0;
  }
   
  //Tally the counts
  for (int i = 0; i < nums.length; i++) {
    counts[nums[i]] ++;
  }
  
  pushMatrix();
  translate(x,y);
  //Draw grid
  for (int i = 0; i < counts.length; i++) {
    colorMode(HSB);
    fill(counts[i]*30, 255, 255, counts[i]*30);
    //rect((i%10)*s, floor(i/10)*s, s, s);
    textAlign(CENTER);
    textFont(label);
    text(i, (i%10)*s, floor(i/10)*s);
  }
  
  popMatrix();
}
