package bit.connect;

import java.util.ArrayList;
import java.util.List;

public class Filter {
  private List<String[]> pronouns;
  private List<String> realMajor;
  private List<String> intendedMajor;
  private List<String> careerPath;
  private List<String> interests;

  public Filter() {
    this.pronouns = new ArrayList<>(); 
    this.realMajor = new ArrayList<>(); 
    this.intendedMajor = new ArrayList<>(); 
    this.careerPath = new ArrayList<>(); 
    this.interests = new ArrayList<>();
  }

  
  /** 
   * @param student
   * @return int
   */
  public int compareTo(Student student) {
    if (this.pronouns.contains(student.getPronouns()) &&
      this.realMajor.contains(student.getRealMajor()) &&
      this.intendedMajor.contains(student.getIntendedMajor())) {
      for (String cp : careerPath) {
        if (!student.getCareerPath().contains(cp)) {
          return -1;
        }
      }
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
  public void setPronouns(List<String[]> pronouns) { this.pronouns = pronouns; }
  public void setRealMajor(List<String> realMajor) { this.realMajor = realMajor; }
  public void setIntendedMajor(List<String> intendedMajor) { this.intendedMajor = intendedMajor; }
  public void setCareerPath(List<String> careerPath) { this.careerPath = careerPath; }
  public void setInterests(List<String> interests) { this.interests = interests; }
  
  // getter functions
  public List<String[]> getPronouns() { return pronouns; }
  public List<String> getRealMajor() { return realMajor; }
  public List<String> getIntendedMajor() { return intendedMajor; }
  public List<String> getCareerPath() { return careerPath; }
  public List<String> getInterests() { return interests; }
  
}
