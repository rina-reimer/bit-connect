package java;
import java.Student;
import java.util.HashSet;
import java.util.Set;
import java.Grid;
import java.Filter;

public class alg {
  private static Set<Grid> grids = new HashSet<>();
  public static void main(String[] args) {
    // set up grid
    Grid grid0 = new Grid(0, 4.4, 40.1, 3.6, 43.5);
    grids.add(grid0);

    // set up users
    Student kareimer = new Student("Reimer", "Rina", "kareimer", new String[]{"they", "them", "theirs"}, "ACMS");
  
    // every minute
    refresh();
    System.out.println(Cloud.outputString());
  }

  public static void refresh() {
    Cloud.refresh();
    for (Grid g : grids) {
      g.refresh();
    }

  }
}