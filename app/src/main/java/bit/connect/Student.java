package bit.connect;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * 
* Student is the base class that controls all the information 
* contained within each user's profile. 
* <p>
* A Graphics object encapsulates the state information needed
* for each user that is utilizing the app whether or not they
* are active. This state information includes the user's:
* <ul>
* <li>First and last name
* <li>NetID or username
* <li>Preffered Pronouns
* <li>Official Major and Intended Major
* <li>Interests and intended career path
* <li>Current location (only used when user is active)
* <li>Active state
* <li>Filters to match with other users
* <li>Past matches
* </ul>
* <p>
* @author      Rina Reimer
* @version     %I%, %G%
* @since       1.0
*/
public class Student {
  private String last;               // Last name of the student
  private String first;              // First name of the student
  private String id;                 // ID of the student, typically the NetID
  private String[] pronouns;         // Pronouns of the student, written as [nominative, accusative, possessive]
  private String realMajor;          // Official major of the student
  private String intendedMajor;      // Intended major of the student
  private List<String> interests;    // Interests of the student
  private double[] currLoc;          // Current location of the student [latitude, longitude]
  private boolean searchModeOn;      // Flag indicating if the student is in search mode
  private Filter filters;            // Filters to match with other students
  private LinkedList<Student> pastMatches;  // List of past matches for the user

  /** 
   * Class constructor. All information should be accessed 
   * through the UW Student database. The official major is 
   * ensured to be a part of the official list of UW majors, 
   * found in the official UW database. All other variables
   * other than those inputted are initialized as empty data-
   * types. The student is added to the list of enrolled students
   * in the Cloud class.
   * 
   * @param lastName the last name of the student
   * @param firstName the first name of the student
   * @param netID the ID of the student, typically taken as the NetID
   * @param pronouns the pronouns of the student, written as [nominative,
   *                  accusative, possessive]
   * @param realMajor the official major of the student
   * @throws IllegalArgumentException if the official major is not
   *                                  a major at UW, typically will not be called
  */
  public Student(String lastName, String firstName, String netID, 
                String[] pronouns, String realMajor) {
    this.last = lastName;
    this.first = firstName;
    this.id = netID;
    this.pronouns = pronouns; 

    // majors 
    if (!Cloud.validMajors.contains(realMajor)) {
      throw new IllegalArgumentException(Cloud.validMajors.toString());
    }
    this.realMajor = realMajor;
    this.intendedMajor = "";

    this.interests = new ArrayList<>();
    this.currLoc = new double[2];
    this.searchModeOn = false;
    this.filters = new Filter();
    this.pastMatches = new LinkedList<>();

    Cloud.addStudent(this);
  }

  /**
   * Takes inputs from user instead of from the official database. The
   * intent with this is to create relationships between users based on 
   * personality and future goals rather than their current standings.
   * 
   * @param intendedMajor the intended major of the student, must be a major at UW
   * @param interests the interests of the student, taken from a pre-set list
   * @throws IllegalArgumentException if the intended major is not a major at UW
   */
  public void processCreation(String intendedMajor, List<String> interests) {

    if (!Cloud.validInterests.contains(intendedMajor)) {
      throw new IllegalArgumentException("Intended Major input is not a major at UW.");
    }
    this.intendedMajor = intendedMajor;

    for (String i : interests) {
      if (!Cloud.validInterests.contains(i)) {
        throw new IllegalArgumentException("Intended Major input is not a major at UW.");
      }
      this.interests.add(i);
    }
  }

  /**
   * Checks if the student matches the filters of another student. Both users 
   * must match the other's filters exactly. If even one does not match the other, 
   * the filters do not match.
   * 
   * @param student the student to compare filters with
   * @return true if the student matches the filters, false otherwise
   */
  public boolean matchFilters(Student student) {
    return this.filters.compareTo(student) == 0 && 
           student.getFilters().compareTo(this) == 0;
  }

  /**
   * Toggles the search mode of the student. When the student is 
   * not actively searching for other users, the coordinates are set to
   * (0.0, 0.0)
   */
  public void turnSearchMode() {
    if (this.searchModeOn) {
      this.currLoc[0] = 0.0;
      this.currLoc[1] = 0.0;
      this.searchModeOn = false;
    } else {
      // TODO: implement a tracking method
      this.currLoc[0] = 100.0;
      this.currLoc[1] = 100.0;
      this.searchModeOn = true;
    }
  }

  /**
   * Calculates the distance between the student and another student.
   * 
   * @param student the student to calculate the distance to
   * @return the distance between the students
   */
  public double distance(Student student) {
    double x = this.currLoc[0] - student.getCurrLoc()[0];
    double y = this.currLoc[1] - student.getCurrLoc()[1];
    return Math.sqrt(x * x + y * y);
  }

  /**
   * Returns a string representation of the student.
   * 
   * @return a string representation of the student
   */
  public String toString() {
    return first + " " + last + " (" + id + "): " + realMajor + " Major";
  }

  // getter methods

  /**
   * Returns the last name of the student.
   * 
   * @return the last name of the student
   */
  public String getLast() { return last; }

  /**
   * Returns the first name of the student.
   * 
   * @return the first name of the student
   */
  public String getFirst() { return first; }

  /**
   * Returns the ID of the student.
   * 
   * @return the ID of the student
   */
  public String getId() { return id; }

  /**
   * Returns the pronouns of the student.
   * 
   * @return the pronouns of the student
   */
  public String[] getPronouns() { return pronouns; }

  /**
   * Returns the real major of the student.
   * 
   * @return the real major of the student
   */
  public String getRealMajor() { return realMajor; }

  /**
   * Returns the intended major of the student.
   * 
   * @return the intended major of the student
   */
  public String getIntendedMajor() { return intendedMajor; }

  /**
   * Returns the interests of the student.
   * 
   * @return the interests of the student
   */
  public List<String> getInterests() { return interests; }
  
  /**
   * Returns the current location of the student.
   * 
   * @return the current location of the student
   */
  public double[] getCurrLoc() { return currLoc; }

  /**
   * Returns whether the search mode is on for the student.
   * 
   * @return true if the search mode is on, false otherwise
   */
  public boolean isSearchModeOn() { return searchModeOn; }

  /**
   * Returns the filters of the student.
   * 
   * @return the filters of the student
   */
  public Filter getFilters() { return filters; }

  /**
   * Returns the past matches of the student.
   * 
   * @return the past matches of the student
   */
  public LinkedList<Student> getPastMatches() { return pastMatches; }

  // setter methods
  /**
   * Sets the last name of the student.
   * 
   * @param last the last name of the student
   */
  public void setLast(String last) { this.last = last; }

  /**
   * Sets the first name of the student.
   * 
   * @param first the first name of the student
   */
  public void setFirst(String first) { this.first = first; }

  /**
   * Sets the ID of the student.
   * 
   * @param id the ID of the student
   */
  public void setId(String id) { this.id = id; }

  /**
   * Sets the pronouns of the student.
   * 
   * @param pronouns the pronouns of the student
   */
  public void setPronouns(String[] pronouns) { this.pronouns = pronouns; }

  /**
   * Sets the real major of the student.
   * 
   * @param realMajor the real major of the student
   */
  public void setRealMajor(String realMajor) { this.realMajor = realMajor; }

  /**
   * Sets the intended major of the student.
   * 
   * @param intendedMajor the intended major of the student
   */
  public void setIntendedMajor(String intendedMajor) { this.intendedMajor = intendedMajor; }

  /**
   * Sets the interests of the student.
   * 
   * @param interests the interests of the student
   */
  public void setInterests(List<String> interests) { this.interests = interests; }

  /**
   * Sets the current location of the student.
   * 
   * @param currLoc the current location of the student
   */
  public void setCurrLoc(double[] currLoc) { this.currLoc = currLoc; }

  /**
   * Sets whether the search mode is on for the student.
   * 
   * @param searchModeOn true if the search mode is on, false otherwise
   */
  public void setSearchModeOn(boolean searchModeOn) { this.searchModeOn = searchModeOn; }

  /**
   * Sets the filters of the student.
   * 
   * @param filters the filters of the student
   */
  public void setFilters(Filter filters) { this.filters = filters; }

  /**
   * Sets the past matches of the student.
   * 
   * @param pastMatches the past matches of the student
   */
  public void setPastMatches(LinkedList<Student> pastMatches) { this.pastMatches = pastMatches; }
  
}

