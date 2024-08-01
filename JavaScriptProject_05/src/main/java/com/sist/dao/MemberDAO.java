package com.sist.dao;
// 아이디 중복 체크 
// 우편 번호 검색
// => 윈도우 => window.open()
/*
 * 	  브라우저 내장 객체 / 내장 객체
 *        window => open() / reload()
 *          |
 *     -----------------------------
 *     |          |                |
 * document    location         history
 *    |           | href           | back(), go, forward()
 *  write()     
 *  getElementById()
 *  querySelector()
 *  querySelectorAll()
 *  
 *  Date/String/Math/Array => Jquery / Vue / React / Next
 *                           => 변수  / 상수 / 제어문 / 연산자 / 배열 ...
 *                           => 객체 (JSON)
 *   이벤트 
 *    onclick / onchange / onmouseover / onmouseout / onkeyup / onkeydown 
 *                         ========================
 *                                 hover() 
 */
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class MemberDAO {
	private static SqlSessionFactory ssf; // xml을 읽어서 저장 (파싱)
	static { // 시작과 동시에 xml을 읽어야 하기 때문에
		try {
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// 기능 설정
	// => 표준화
	public static List<ZipcodeVO> postFind(String dong){
		List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("postFind",dong);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // 반환
		}
		return list;
	}
	
	public static int postFindCount(String dong) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("postFindCount",dong);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // 반환
		}
		return count;
	}
	/*
	 *  <select id="idcheck" resultType="int" parameterType="string">
 			SELECT COUNT(*)
 			FROM member
 			WHERE id=#{id}
 		</select>
	 */
	public static int idCheck(String id) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("idcheck",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
}
