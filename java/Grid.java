package java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Grid {
  private int id;
  private double[] latBounds;
  private double[] longBounds;
  private List<Student> currUsers;
  private Map<Student, List<Student>> userMatch;

  public Grid(int id, double lowerLat, double higherLat, double lowerLong, double higherLong) {
    this.id = id;
    this.latBounds = new double[]{lowerLat, higherLat};
    this.longBounds = new double[]{lowerLong, higherLong};
    this.currUsers = new ArrayList<>();
    this.userMatch = new HashMap<>();
  }

  public void refresh() {
    for (Student s : Cloud.activeUsers) {
      // check latitude

      // check longitude
    }
  }

}
