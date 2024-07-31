package com.sist.dao;
import java.util.*;

import lombok.Data;
// => MyBatis : 컬럼명과 일치 => 변경
@Data
public class EmpVO {
  private int empno,sal,comm,deptno,mgr;
  private String ename,job;
  private Date hiredate;
}
