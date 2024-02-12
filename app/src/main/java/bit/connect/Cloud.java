package bit.connect;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class Cloud {
  public static List<String> validMajors = new ArrayList<>();
  public static List<String> validInterests = new ArrayList<>();
  public static List<Student> users = new ArrayList<>();
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
   * @param student
   */
  public static void addStudent(Student student) {
    users.add(student);
  }

  public static void refresh() {
    activeUsers.clear();
    for (Student s : users) {
      if (s.isSearchModeOn()) {
        activeUsers.add(s);
      }
    }
  }

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


