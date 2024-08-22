package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/*
	 *  	<select id="memberIdCountData" resultType="int" parameterType="string">
 				SELECT COUNT(*) FROM member
 				WHERE id=#{id}
 			</select>
 			<select id="memberInfoData" resultType="MemberVO" parameterType="string">
 				SELECT * FROM member
 				WHERE id=#{id}
 			</select>
	 */
	public static MemberVO isLogin(String id,String pwd) {
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdCountData",id);
			if(count==0) {
				vo.setMsg("NOID");
			}else {
				vo=session.selectOne("memberInfoData",id);
				if(pwd.equals(vo.getPwd())) {
					// 로그인된 상태
					vo.setMsg("OK");
					
				}else {
					// 비밀번호가 틀린 상태
					vo.setMsg("NOPWD");
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // DBCP => POOL안으로 변환 => 재사용 가능
		}
		return vo;
	}
	// 아이디 중복 체크
	public static int memberIdCheck(String id) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("memberIdCountData",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	// 회원가입 입력
	public static void memberInsert(MemberVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("memberInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	// 회원정보 수정 데이터 가져오기
	public static MemberVO memberUpdateData(String id) {
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			vo=session.selectOne("memberUpdateData",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	// 회원 정보 수정
	public static boolean memberUpdate(MemberVO vo) {
		boolean bCheck=false;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("memberGetPassword",vo.getId());
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				session.update("memberUpdate",vo);
				session.commit();
			}else {
				bCheck=false;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}	
		return bCheck;
	}
	// 이메일로 찾기
	public static String memberIdFindData(MemberVO vo) {
		String result="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdFindCount",vo);
			if(count==0) {
				result="no";
			}else {
				result=session.selectOne("memberIdFindData",vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}	
		return result;
	}
	// 핸드폰 번호로 아이디 찾기
	public static String phoneIdFindData(MemberVO vo) {
		String result="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("phoneIdFindCount",vo);
			if(count==0) {
				result="no";
			}else {
				result=session.selectOne("phoneIdFindData",vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}	
		return result;
	}
	// 비밀번호 찾기
	public static String memberPwdFindData(String id) {
		String result="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberPwdFindCount",id);
			if(count==0) {
				result="no";
			}else {
				String pwd=session.selectOne("memberPwdFindData",id);
				result=pwd;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}	
		return result;
	}
	
	// 비밀번호 수정
	// 1-1 비밀번호 확인
	public static int pwdCheckData(Map map) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("pwdCheckData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	// 1-2 비밀번호 업데이트 
	public static void pwdChange(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("pwdChange",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
}
