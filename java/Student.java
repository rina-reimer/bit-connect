package java;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Student {
  private String last;
  private String first;
  private String id;
  private String[] pronouns;
  private String realMajor;
  private String intendedMajor;
  private List<String> interests; 
  private List<String> careerPath;
  private double[] currLoc;
  private boolean searchModeOn;
  private Filter filters;
  private LinkedList<Student> pastMatches;


  // default constructor
  public Student(String lastName, String firstName, String netID, String[] pronouns, String realMajor) {
    this.last = lastName;
    this.first = firstName;
    this.id = netID;
    this.pronouns = pronouns; 

    // majors 
    if (!Cloud.validInterests.contains(realMajor)) {
      throw new IllegalArgumentException("Official Major input is not a major at UW.");
    }
    this.realMajor = realMajor;
    this.intendedMajor = "";

    this.interests = new ArrayList<>();
    this.careerPath = new ArrayList<>();
    this.currLoc = new double[2];
    this.searchModeOn = false;
    this.filters = new Filter();
    this.pastMatches = new LinkedList<>();

    Cloud.addStudent(this);
  }

  // takes inputs and adds them to the constructor
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

  public boolean matchFilters(Student student) {
    return this.filters.compareTo(student) == 0 && student.getFilters().compareTo(this) == 0;
  }

  public void turnSearchMode() {
    if (this.searchModeOn) {
      this.currLoc[0] = 0.0;
      this.currLoc[1] = 0.0;
      this.searchModeOn = false;
    } else {
      // TODO: implement a tracking method
      this.currLoc[0] = 100.0;
      this.currLoc[1] = 100.0;
    }
  }

  public String toString() {
    return first + " " + last + " (" + id + "): " + realMajor + " Major";
  }

  // getter methods
  public String getLast() { return last; }
  public String getFirst() { return first; }
  public String getId() { return id; }
  public String[] getPronouns() { return pronouns; }
  public String getRealMajor() { return realMajor; }
  public String getIntendedMajor() { return intendedMajor; }
  public List<String> getInterests() { return interests; }
  public List<String> getCareerPath() { return careerPath; }
  public double[] getCurrLoc() { return currLoc; }
  public boolean isSearchModeOn() { return searchModeOn; }
  public Filter getFilters() { return filters; }
  public LinkedList<Student> getPastMatches() { return pastMatches; }
  // setter methods
  public void setLast(String last) { this.last = last; }
  public void setFirst(String first) { this.first = first; }
  public void setId(String id) { this.id = id; }
  public void setPronouns(String[] pronouns) { this.pronouns = pronouns; }
  public void setRealMajor(String realMajor) { this.realMajor = realMajor; }
  public void setIntendedMajor(String intendedMajor) { this.intendedMajor = intendedMajor; }
  public void setInterests(List<String> interests) { this.interests = interests; }
  public void setCareerPath(List<String> careerPath) { this.careerPath = careerPath; }
  public void setCurrLoc(double[] currLoc) { this.currLoc = currLoc; }
  public void setSearchModeOn(boolean searchModeOn) { this.searchModeOn = searchModeOn; }
  public void setFilters(Filter filters) { this.filters = filters; }
  public void setPastMatches(LinkedList<Student> pastMatches) { this.pastMatches = pastMatches; }

}

