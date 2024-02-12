package javafiles;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Grid {
  private int id;
  private double[] latBounds;
  private double[] longBounds;
  private List<Student> currUsers;
  private Map<Student, LinkedList<Student>> userMatch;

  public Grid(int id, double lowerLat, double higherLat, double lowerLong, double higherLong) {
    this.id = id;
    this.latBounds = new double[]{lowerLat, higherLat};
    this.longBounds = new double[]{lowerLong, higherLong};
    this.currUsers = new ArrayList<>();
    this.userMatch = new HashMap<>();
  }

  public void refresh() {
    this.currUsers.clear();
    this.userMatch.clear();
    for (Student s : Cloud.activeUsers) {
      // check latitude and longitude and add to matching map and list
      if ((s.getCurrLoc()[0] > latBounds[0] && s.getCurrLoc()[0] < latBounds[1]) &&
          (s.getCurrLoc()[1] > longBounds[0] && s.getCurrLoc()[1] < longBounds[1])) {
        this.currUsers.add(s);
        this.userMatch.put(s, new LinkedList<>());
      }
    }

    for (int i = 0; i < currUsers.size(); i++) {
      for (int j = i+1; j < currUsers.size(); j++){
        if (currUsers.get(i).matchFilters(currUsers.get(j))) {
          insert(currUsers.get(i), currUsers.get(j));
          insert(currUsers.get(j), currUsers.get(i));
        }
      }
    }
  }

  private void insert(Student origin, Student added) {
    double dist = origin.distance(added);
    LinkedList<Student> lst = this.userMatch.get(origin);
    int index = 0;
    while (lst.get(index+1).distance(origin) < dist) {
      index++;
    }
    lst.add(index, added);
  }

  public int getId() { return id; }

}
