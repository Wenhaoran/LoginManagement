package cn.digitalpublishing.util.authen;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtil
{
  public static String formatDate(Date date, String format)
  {
    SimpleDateFormat dateFm = new SimpleDateFormat(format);
    return dateFm.format(date);
  }

  public static String formatDate(Date date)
  {
    return formatDate(date, "yyyy-MM-dd");
  }

  public static String removeDuplicate(String src, char c)
  {
    String result = "";
    char[] ch = src.toCharArray();
    for (int i = 0; i < ch.length; i++) {
      if ((i < ch.length - 1) && (ch[i] == '/') && (ch[(i + 1)] == '/')) {
        ch[i] = ' ';
      }
    }
    result = String.valueOf(ch).replace(" ", "");
    return result;
  }
}