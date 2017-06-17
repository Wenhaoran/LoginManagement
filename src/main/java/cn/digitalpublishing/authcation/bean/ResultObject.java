package cn.digitalpublishing.authcation.bean;

import java.util.ArrayList;
import java.util.List;

public class ResultObject<T>
{
  private Integer type;
  private List<T> obj;
  private String msg;

  public ResultObject()
  {
  }

  public ResultObject(Integer type, String msg)
  {
    this.msg = msg;
    this.type = type;
  }

  public ResultObject(Integer type, List<T> obj, String msg) {
    this.msg = msg;
    this.obj = obj;
    this.type = type;
  }


public ResultObject(Integer type, T obj, String msg) {
    this.msg = msg;
    if (obj != null) {
      List list = new ArrayList();
      list.add(obj);
      this.obj = list;
    }
    this.type = type;
  }

  public Integer getType() {
    return this.type;
  }

  public void setType(Integer type) {
    this.type = type;
  }

  public List<T> getObj() {
    return this.obj;
  }

  public void setObj(List<T> obj) {
    this.obj = obj;
  }

  public String getMsg() {
    return this.msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }
}