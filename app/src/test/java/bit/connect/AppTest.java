package bit.connect;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.time.Duration;
import java.util.HashSet;
import java.util.Set;

class AppTest {
    static Set<Grid> grids;
    static Grid grid0;
    static Student kareimer;

    // @BeforeAll
    // static void setup() {
    //     grids = new HashSet<>();
    //     grid0 = new Grid(0, 4.4, 40.1, 3.6, 43.5);
    //     kareimer = new Student("Reimer", "Rina", "kareimer", new String[]{"they", "them", "theirs"}, "Discrete Mathematics and Algorithms"); 
    // }

    // @Test void properMajorReading() {
    //     kareimer.turnSearchMode(); // turns the search mode off
    //     assertEquals(Cloud.outputString(), "Rina Reimer (kareimer): Discrete Mathematics and Algorithms Major:: inactive\n" + //
    //                                        "  (): Art Major:: inactive\n");
    // }

    // @Test void testGridRefresh() {
    //     grids.add(grid0);
    //     assertDoesNotThrow(() -> {grid0.refresh();});    
    // }

    @Test void testCloudRefresh() {
        assertDoesNotThrow(() -> {Cloud.refresh();});    
    }

    // @Test void testCreateStudent() {
    //     assertDoesNotThrow(() -> {new Student("", "", "", new String[3], "Art");});    
    // }

    // @Test void searchModeAddsStudent() {
    //     kareimer.turnSearchMode();
    //     Cloud.refresh();
    //     assertTrue(Cloud.activeUsers.contains(kareimer));
    // }
    

}
