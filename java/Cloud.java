package java;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class Cloud {
  public static List<String> validMajors;
  public static List<String> validInterests;
  public static List<Student> users = new ArrayList<>();
  public static List<Student> activeUsers = new ArrayList<>();

  static {
    try {
      validInterests = Files.readAllLines(new File("majors.txt").toPath(), Charset.defaultCharset());
      validMajors = Files.readAllLines(new File("majors.txt").toPath(), Charset.defaultCharset());
    } catch (IOException e) {
      // Handle the IOException here
      e.printStackTrace();
    }
  }

  public static void addStudent(Student student) {
    users.add(student);
  }

  public static void refresh() {
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
      if (activeUsers.contains(s)) {
        active = ": ACTIVE";
      }
      result += s.toString() + ":" + active + "\n";
    }
    return result;
  }
}


