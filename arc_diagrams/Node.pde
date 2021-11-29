public class Node implements Comparable<Node> {
    
    // circle coordinates
    private int x;
    private int y;
    
    private final String name;
    
    // distance with its neighbors
    private float distance;
    
    private boolean selected;
    
    private color c;
    
    // neighbor nodes
    private ArrayList<String> neighbors;
    
    // circle radius
    public static final int r = 50;
    
    public Node(int nb_nodes,int x, int y) {
        
        
        this.x = x;
        
        this.y = y;
        
        name = "n" + str(nb_nodes);
        
        distance = 0.0;
        
        selected = false;
        
        c = light_purple;
        
        neighbors = new ArrayList<String>();
    }
    
    public Node(Node node) {
        
        x = node.getX();
        y = node.getY();
        name = node.getName();
        distance = node.getDistance();
        
        selected = node.getSelected();
        // neighbor nodes
        neighbors = new ArrayList<String>();
        
        
        for (String neighbor : node.getNeighbors()) {
            
            neighbors.add(neighbor);
        }
        
        
        
    }
    
    public int getX() {
        
        return x;
    }
    
    public int getY() {
        
        return y;
    }
    
    
    public  ArrayList<String> getNeighbors() {
        
        return neighbors;
    }
    
    public  float getDistance() {
        
        return distance;
    }
    
    public String getName() {
        
        return name;
    }
    
    
    public void addNeighbor(String n) {
        
        neighbors.add(n);
        
    }
    
    
    public boolean getSelected() {
        
        return selected;
    }
    
    public void setSelected(boolean value) {
        
        selected = value;
        
        if (selected) {
            
            c = purple; 
            
        } else{
            
            c = light_purple;
        }
    }
    
    
    public void display() {
        
        stroke(purple);
        fill(c);
        circle(x, y, r);
        fill(white);
        textFont(text_font);
        text(name ,x - 8,y + 7);
        
    }
    
    
    public boolean isSelected() {
        
        float d = dist(mouseX, mouseY, x, y);
        
        if (d < r / 2) {
            
            selected = true;
            c = purple;           
            
        } else{
            c = light_purple;
            selected = false;
        }
        
        return selected;
    }
    
    public void calculateDistance() {
        
        float somme = 0;
        
        for (String neighbor : neighbors) {
            
            somme += getNodeIndexFromName(nodes,neighbor);
            
        }
        // je rajoute current node
        somme += nodes.indexOf(this);        
        
        distance = somme / (neighbors.size() + 1);
        
    }
    
    @Override
    public int compareTo(Node n1) {
        
        if (n1 == null)
            return 0;
        
        
        if (distance > n1.getDistance())
            return 1;
        
        if (distance < n1.getDistance())
            return - 1;
        
        return 0;
        
        
    }
    
    
    @Override
    public String toString() {
        
        return "n = " + name + " d = " + str(distance) + "\n";
    }
    
    
    public int getNodeIndexFromName(ArrayList<Node> l, String name) {
        
        for (int i = 0; i < l.size();i++) {
            
            
            if (l.get(i).getName().equals(name)) {
                
                return i;
            }
        }
        return - 1;
    }
}
