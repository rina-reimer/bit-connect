package bit.connect;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

/**
 * The Cloud class represents a cloud storage system for a student networking application.
 * It provides methods to manage student data and perform operations on the data.
 */
/**
 * Represents a cloud storage for student data.
 */
public class Cloud {
  /**
   * THIS HAS BEEN CHANGED.
   */
  public static List<String> validMajors = new ArrayList<>();

  /**
   * List of valid interests.
   */
  public static List<String> validInterests = new ArrayList<>();

  /**
   * List of all student users.
   */
  public static List<Student> users = new ArrayList<>();

  /**
   * List of active student users.
   */
  public static List<Student> activeUsers = new ArrayList<>();

  static {
    try {
      validInterests = Files.readAllLines(new File("/Users/rinareimer/Desktop/coding-projects/bit-connect/app/src/main/java/bit/connect/interests.txt").toPath(), Charset.defaultCharset());
      validMajors = Files.readAllLines(new File("/Users/rinareimer/Desktop/coding-projects/bit-connect/app/src/main/java/bit/connect/majors.txt").toPath(), Charset.defaultCharset());
    } catch (IOException e) {
      // Handle the IOException here
      e.printStackTrace();
    }
  }

  
  /** 
   * Adds a student to the list of users.
   * @param student the student to be added
   */
  public static void addStudent(Student student) {
    users.add(student);
  }

  /**
   * Refreshes the list of active users based on their search mode status.
   */
  public static void refresh() {
    activeUsers.clear();
    for (Student s : users) {
      if (s.isSearchModeOn()) {
        activeUsers.add(s);
      }
    }
  }

  /**
   * Generates a string representation of the student data in the cloud.
   * @return a string representation of the student data
   */
  public static String outputString() {
    String result = "";
    for (Student s : users) {
      String active = ": inactive";
      if (s.isSearchModeOn()) {
        active = ": ACTIVE";
      }
      result += s.toString() + ":" + active + "\n";
    }
    return result;
  }
}

