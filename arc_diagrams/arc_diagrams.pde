import controlP5.*;

PFont title_font, button_font,text_font;

int graphAreaWidth,graphAreaHeight, graphAreaX,graphAreaY;

int diagAreaWidth, diagAreaHeight,  diagAreaX, diagAreaY;

int CREATED_NODES;

int NB_ITERATION;

int COLOR = 0;

color gray = #555454 , light_purple = #9286CF , purple = #604E91,white = #FFFFFF,purple_blue = #1158CB,light_purple_blue = #4781E9;

ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Node> diag1_nodes = new ArrayList<Node>();
ArrayList<Node> diag2_nodes = new ArrayList<Node>();
ArrayList<Node> diag3_nodes = new ArrayList<Node>();
ArrayList<Node> selectedNodes = new ArrayList<Node>();
ArrayList<Node> arcs1 = new ArrayList<Node>();
ArrayList<Node> arcs2 = new ArrayList<Node>();


void setup() {
    
    fullScreen();
    
    title_font = loadFont("Gadugi-Bold-48.vlw");
    text_font = loadFont("Gadugi-Bold-16.vlw");
    
    
    graphAreaWidth = displayWidth / 2 - 90;
    
    graphAreaHeight  = displayHeight - 150;
    
    graphAreaX = 50;
    
    graphAreaY = 70;
    
    
    diagAreaWidth = displayWidth / 2 - 90;
    
    diagAreaHeight  = displayHeight - 150;
    
    
    diagAreaX = 1000;
    
    diagAreaY = 70;
    
    CREATED_NODES = 1;
    
    NB_ITERATION = 1;
    
    strokeWeight(2);    
    
}      


void draw() {
    
    background(color(255));
    textFont(title_font);    
    
    fill(white);
    stroke(purple);
    rect(diagAreaX,diagAreaY,diagAreaWidth,diagAreaHeight, 7);
    rect(graphAreaX,graphAreaY,graphAreaWidth,graphAreaHeight, 7);
    
    fill(white);
    stroke(white);
    rect(320,0,310,150);
    rect(1270,0,300,150);
    
    fill(gray);
    textFont(title_font);
    text("Draw a Graph",320,80);
    
    textFont(title_font);
    text("Arc diagrams",1270,80);
    
    
    displayArcs();
    displayNodes();    
    
    if (buttonBounding()) {
        
        cursor(HAND);
        stroke(purple);
        fill(white);
        rect(370,1010,150,50,7);
        fill(light_purple);
        
    } else{
        
        cursor(CROSS);
        stroke(purple);
        fill(light_purple);
        rect(370,1010,150,50,7);
        fill(white);
        
    }
    
    textFont(title_font,32);
    text("Reset",403,1045);
    
    
    drawDiagrams(); 
  
    
    
    
    
}


void mouseClicked() {
    
    //si on est en train de dessiner sur la partie graphe
    if (drawBounding()) {
        
        //soit on rajoute un nouveau noeud
        //soit on selectionne un noeud
        //si on selectionne 2 noeuds on construit un arc
        if (mouseButton == LEFT) {
            
            onLeftClick();
        }
        
        //si on enleve un noeud, on l enleve de ses voisins et on enleve ses arcs
        if (mouseButton == RIGHT) {
            
            onRightClick();
        }
        
    }
    
    if (buttonBounding()) {
        
        nodes.clear();
        arcs1.clear();
        arcs2.clear();
        
        diag1_nodes.clear();
        diag2_nodes.clear();
        diag3_nodes.clear();
        NB_ITERATION = 1;
        CREATED_NODES = 1;
        
        
    }
    
    
    
}
