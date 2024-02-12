package bit.connect;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Represents a grid in a coordinate system.
 * A grid is defined by its ID, latitude and longitude bounds, and the list of current users within the grid.
 * It also maintains a mapping of users and their matched students.
 */
public class Grid {
  private int id;
  private double[] latBounds;
  private double[] longBounds;
  private List<Student> currUsers;
  private Map<Student, LinkedList<Student>> userMatch;

  /**
   * Class constructor.
   * 
   * @param id
   * @param lowerLat
   * @param higherLat
   * @param lowerLong
   * @param higherLong
   */
  public Grid(int id, double lowerLat, double higherLat, double lowerLong, double higherLong) {
    this.id = id;
    this.latBounds = new double[]{lowerLat, higherLat};
    this.longBounds = new double[]{lowerLong, higherLong};
    this.currUsers = new ArrayList<>();
    this.userMatch = new HashMap<>();
  }

  /**
   * Refreshes the grid by updating the list of current users and their matches.
   * This method clears the current user list and user match map, and then iterates through the active users.
   * For each active user, it checks if their current location falls within the specified latitude and longitude bounds.
   * If a user's location is within the bounds, they are added to the current user list and a new empty list is created for their matches.
   * Finally, it iterates through the current user list and checks for matches between users based on their filters.
   * If a match is found, it inserts the users into each other's match lists.
   */
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

  
  /**
   * Inserts a student into the grid based on their distance from the origin student.
   * The student is inserted into the appropriate position in the linked list of matched students.
   *
   * @param origin the origin student
   * @param added the student to be inserted
   */
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
