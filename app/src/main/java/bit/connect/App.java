package bit.connect;

import java.util.HashSet;
import java.util.Set;

/**
 * The App class represents the main entry point of the Bit Connect application.
 * It sets up the grid and users, and refreshes the cloud and grids periodically.
 */
public class App {
    private static Set<Grid> grids = new HashSet<>();

    /**
     * The main method is the entry point of the application.
     * It sets up the grid and users, refreshes the cloud and grids, and prints the output.
     * @param args The command line arguments.
     */
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

    /**
     * The refresh method refreshes the cloud and all the grids.
     */
    public static void refresh() {
        Cloud.refresh();
        for (Grid g : grids) {
            g.refresh();
        }
    }
}
