package bit.connect;

import java.util.ArrayList;
import java.util.List;

/**
* Student is the base class that controls all the information 
* contained within each user's profile. 
*
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
* 
* @author      Rina Reimer
* @version     %I%, %G%
* @since       1.0
*/
public class Filter {
  private List<String[]> pronouns;
  private List<String> realMajor;
  private List<String> intendedMajor;
  private List<String> careerPath;
  private List<String> interests;

  /**
   * Class constructor. 
   */
  public Filter() {
    this.pronouns = new ArrayList<>(); 
    this.realMajor = new ArrayList<>(); 
    this.intendedMajor = new ArrayList<>(); 
    this.careerPath = new ArrayList<>(); 
    this.interests = new ArrayList<>();
  }

  
  /** 
   * @param student the student whose filters will be compared to
   * @return int
   */
  public int compareTo(Student student) {
    if (this.pronouns.contains(student.getPronouns()) &&
      this.realMajor.contains(student.getRealMajor()) &&
      this.intendedMajor.contains(student.getIntendedMajor())) {
      for (String i : interests) {
        if (!student.getInterests().contains(i)) {
          return -1; 
        }
      }
      return 0; // filters exactly line up
    }
    return -1;
  }

  // setter functions

  /**
   * Sets the pronouns list.
   * 
   * @param pronouns the pronouns list to set
   */
  public void setPronouns(List<String[]> pronouns) { this.pronouns = pronouns; }

  /**
   * Sets the realMajor list.
   * 
   * @param realMajor the realMajor list to set
   */
  public void setRealMajor(List<String> realMajor) { this.realMajor = realMajor; }

  /**
   * Sets the intendedMajor list.
   * 
   * @param intendedMajor the intendedMajor list to set
   */
  public void setIntendedMajor(List<String> intendedMajor) { this.intendedMajor = intendedMajor; }

  /**
   * Sets the careerPath list.
   * 
   * @param careerPath the careerPath list to set
   */
  public void setCareerPath(List<String> careerPath) { this.careerPath = careerPath; }

  /**
   * Sets the interests list.
   * 
   * @param interests the interests list to set
   */
  public void setInterests(List<String> interests) { this.interests = interests; }
  
  // getter functions

  /**
   * Returns the pronouns list.
   * 
   * @return the pronouns list
   */
  public List<String[]> getPronouns() { return pronouns; }

  /**
   * Returns the realMajor list.
   * 
   * @return the realMajor list
   */
  public List<String> getRealMajor() { return realMajor; }

  /**
   * Returns the intendedMajor list.
   * 
   * @return the intendedMajor list
   */
  public List<String> getIntendedMajor() { return intendedMajor; }

  /**
   * Returns the careerPath list.
   * 
   * @return the careerPath list
   */
  public List<String> getCareerPath() { return careerPath; }

  /**
   * Returns the interests list.
   * 
   * @return the interests list
   */
  public List<String> getInterests() { return interests; }
  
}
