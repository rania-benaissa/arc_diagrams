

// this is just to check if there are selected nodes
public Node areSelected() {
    
    
    for (Node node : nodes) {
        
        if (node.isSelected()) {
            
            return node;       
        }
    }
    
    return null;         
    
    
}

public void displayNodes() {
    
    for (Node node : nodes) {
        
        node.display();
    }
}

public void displayArcs() {
    
    Node n1;
    Node n2;
    
    stroke(purple);
    
    for (int i = 0; i < arcs1.size();i++) {
        
        n1 = arcs1.get(i);
        n2 = arcs2.get(i);
        
        line(n1.getX(), n1.getY(), n2.getX(), n2.getY());    
    }
    
}

public boolean drawBounding() {
    
    if (mouseX > Node.r / 2 + graphAreaX && mouseX < - Node.r / 2 + graphAreaX + graphAreaWidth && 
        mouseY > Node.r / 2 + graphAreaY && mouseY < - Node.r / 2 + graphAreaY + graphAreaHeight) {
        return true;
        
    }
    
    return false;
    
    
}

public boolean buttonBounding() {
    
    
    // le rectangle du bouton
    rect(370,1010,150,50,7);
    
    if (mouseX > 370 && mouseX < 370 + 150 && 
        mouseY > 1010 && mouseY < 1010 + 50) {
        
        return true;
        
    }
    
    return false;
    
    
}

public void onLeftClick() {
    
    Node n = areSelected();
    
    // on ajoute un new noeud
    if (n == null) {
        
        selectedNodes.clear();
        
        Node node = new Node(CREATED_NODES,mouseX, mouseY);
        
        CREATED_NODES++;
        
        nodes.add(node);
        
        // lunch algo
        algorithm();
        
        
        if (NB_ITERATION == 1) {
            
            diag1_nodes = Copy(nodes);
            COLOR = 1;
        } 
        
        if (NB_ITERATION == 2) {
            
            diag2_nodes = Copy(nodes);
            COLOR = 2;
        }
        
        if (NB_ITERATION == 3) {
            
            diag3_nodes = Copy(nodes);
            COLOR = 3;
        } 
        
        
    } else {
       
        // de/selectionne un noeud
        if (!selectedNodes.contains(n)) {
            
            selectedNodes.add(n);
            
        } else{
            
            selectedNodes.remove(n);
            n.setSelected(false);
        }
      
        // on cree un arc
        if (selectedNodes.size() == 2) {
            
            
            int index1 = nodes.indexOf(selectedNodes.get(0));
            int index2 = nodes.indexOf(selectedNodes.get(1));
            
            
            nodes.get(index1).setSelected(false);
            nodes.get(index2).setSelected(false);
               
            
            
            // s'ils le sont pas deja voisins on les ajoute
            if (!nodes.get(index1).getNeighbors().contains(nodes.get(index2).getName())) {
                
                nodes.get(index1).addNeighbor(nodes.get(index2).getName());
                nodes.get(index2).addNeighbor(nodes.get(index1).getName());
                
                arcs1.add(nodes.get(index1));
                arcs2.add(nodes.get(index2));
                
                algorithm();    
                
                if (NB_ITERATION == 1) {
                    
                    diag1_nodes = Copy(nodes);
                    
                    COLOR = 1;
                } 
                
                if (NB_ITERATION == 2) {
                    
                    diag2_nodes = Copy(nodes);
                    COLOR = 2;
                }
                
                if (NB_ITERATION == 3) {
                    
                    diag3_nodes = Copy(nodes);
                    COLOR = 3;
                }  
                
                NB_ITERATION++;
                
                if (NB_ITERATION > 3)
                {
                    NB_ITERATION = 1;
                }
                
                
                
            }
            
            selectedNodes.clear();
           
            
        }
    }
}


public void onRightClick() {
    
    
    
    Node n = areSelected();
    
    // we're removing a node
    if (n != null) {        
        
        
        nodes.remove(n);
        
        ArrayList<Node> arcs1_inter = new ArrayList<Node>();
        ArrayList<Node> arcs2_inter = new ArrayList<Node>();
        
        // remove nodes
        for (Node node : nodes) {
            
            if (node.getNeighbors().contains(n.getName())) {
                
                node.getNeighbors().remove(n.getName());
            }
            
        }
        
        for (int i = 0; i < arcs1.size();i++) {
            
            if (!arcs1.get(i).equals(n) && !arcs2.get(i).equals(n)) {
                
                arcs1_inter.add(arcs1.get(i));
                arcs2_inter.add(arcs2.get(i));
            }
        }
        
        arcs1 =  arcs1_inter;
        arcs2 =  arcs2_inter;
        
        
        algorithm();
        
        
        if (NB_ITERATION == 1) {
            
            diag1_nodes = Copy(nodes);
            
            COLOR = 1;
        } 
        
        if (NB_ITERATION == 2) {
            
            diag2_nodes = Copy(nodes);
            COLOR = 2;
        }
        
        if (NB_ITERATION == 3) {
            
            diag3_nodes = Copy(nodes);
            COLOR = 3;
        }  
        
        NB_ITERATION++;
        
        if (NB_ITERATION > 3) {
            
            NB_ITERATION = 1;
        }
        
        
    }
    
    
}
