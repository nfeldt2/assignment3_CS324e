//181 different frequencies
//2588 is the max amount of words with freq 1
//1 is the amount of words with freq 4689

void setup() {
  size(2588/2, 1810/2);
  String[] lines = loadStrings("wordfrequency.txt");
  for (int i = 0; i < lines.length; i++){
    String[] nums = lines[i].split(": ");
    drawRect(int(i+1), int(nums[1]));
  }
}

void drawRect(int lineCount, int freq){
  rectMode(CENTER);
  rect(width/2, (height-(lineCount*5) +2.5), freq/2, 5); 
}
