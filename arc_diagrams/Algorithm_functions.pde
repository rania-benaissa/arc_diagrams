import java.util.*; 

private void calculateDistances() {
    
    for (Node node : nodes) {
        
        node.calculateDistance();
    }
}

private boolean areDifferent(ArrayList<Node> prev_nodes) {
    
    
    for (int i = 0;i < prev_nodes.size();i++) {
        
        if (!prev_nodes.get(i).getName().equals(nodes.get(i).getName()))
            
            return true;
        
    }
    
    return false;
}


private boolean differentDistances(ArrayList<Node> prev_nodes) {
    
    
    for (int i = 0;i < prev_nodes.size();i++) {
        
        if (prev_nodes.get(i).getDistance() != nodes.get(i).getDistance())
            
            return true;
        
    }
    
    return false;
}

private ArrayList<Node> Copy(ArrayList<Node> l) {
    
    ArrayList<Node> c = new ArrayList<Node>();
    
    for (Node n : l) {
        
        
        c.add(new Node(n));
        
    }
    
    return c;
    
}

public void algorithm() {
    
    ArrayList<Node> prev_nodes;
    
    int cpt = 0;
    
    do {
        prev_nodes = Copy(nodes);
        
        calculateDistances();
        cpt++;
        Collections.sort(nodes);
        
        
    } while(areDifferent(prev_nodes) &&  differentDistances(prev_nodes) && cpt <1000); 
    
 
}

public void drawDiagrams() {
    
    float y = diagAreaY + diagAreaHeight / 3 - 40 ;  
    
    if (diag1_nodes.size()>0) {
        
        stroke(gray);
        line(diagAreaX + 20,  y, diagAreaX + diagAreaWidth - 20, y); 
        drawDiagram(diag1_nodes,y, COLOR == 1);
        
    }
    
    if (diag2_nodes.size()>0) {
        stroke(gray);
        y +=diagAreaHeight / 3-5;
        line(diagAreaX + 20,  y, diagAreaX + diagAreaWidth - 20, y); 
        drawDiagram(diag2_nodes,y,COLOR == 2);
        
    }
    
    if (diag3_nodes.size()>0) {
        
        stroke(gray);
        y +=diagAreaHeight / 3- 5 ;	
        line(diagAreaX + 20,  y, diagAreaX + diagAreaWidth - 20, y); 
        drawDiagram(diag3_nodes,y,COLOR == 3); 
        
    }
    
    
}


public void drawDiagram(ArrayList<Node> l,float y, boolean is_current) {
    
    int axeWidth = diagAreaWidth - 40;
    
    float circleX,circleXNeighbor;
    
    int index; 
    
    float circleY = y;
    
    for (int i = 0; i < l.size(); ++i) {
        
        circleX = diagAreaX + 20 + (axeWidth / l.size()) * i;
        
        fill(gray);
        textFont(title_font,13);
        
        text(l.get(i).getName(), circleX - 5, circleY + 20);
        
        for (String neighbor : l.get(i).getNeighbors()) {
            
            index = l.get(i).getNodeIndexFromName(l,neighbor);
            
            circleXNeighbor = diagAreaX + 20 + (axeWidth / l.size()) * index;
            
            if (index > i) {
                
                noFill();
                
                if (is_current) {
                    
                    stroke(light_purple_blue);
                    
                } else{
                    
                    stroke(light_purple);
                }
                
                arc((circleX + circleXNeighbor) / 2, circleY ,(axeWidth / l.size()) * (index - i) ,(index - i) * 100 , - PI,0);
            }
        }
        
        if (is_current) {
            
            stroke(purple_blue);
            fill(purple_blue);
            
        } else{
            
            stroke(purple);
            fill(purple);
        }
        
        circle(circleX, circleY, 10);
    }
}
