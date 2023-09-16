color[] fontColors = new color[3];
String[] words;

void setup() {
  size(700, 600);
  PFont myFont = createFont("Copperplate Gothic Bold", 24); // 1920s font-style
  textFont(myFont);
  
  fontColors[0] = color(255, 0, 0); // red
  fontColors[1] = color(255, 165, 0); // orange
  fontColors[2] = color(255, 255, 100); // yellow
  
  words();
  wordCloud();
}

void draw() {}

void mousePressed() {
  wordCloud();
}

// generates array of unique words using ArrayList
void words() {
  String[] lines = loadStrings("uniquewords.txt");
  ArrayList<String> uniqueWords = new ArrayList<String>();
  
  for (String line : lines) {
    String[] tokens = split(line, " ");
    for (String word : tokens) {
      uniqueWords.add(word);
    }
  }
  words = uniqueWords.toArray(new String[0]);
}

void wordCloud() {
  background(0);
  int xPosition = 10, yPosition = 20;
  
  // if words run off-screen at the bottom, end the loop
  while (yPosition < 600) {
    int ind = int(random(words.length));
    String word = words[ind];
    fill(fontColors[int(random(3))]);
    
    // wrap text to the next line
    if ((width - 20) < (xPosition + textWidth(word))) {
      xPosition = 10;
      yPosition += 30;
    }
    
    // print next word
    text(word, xPosition, yPosition);
    xPosition += textWidth(word) + 8;
  }
}
