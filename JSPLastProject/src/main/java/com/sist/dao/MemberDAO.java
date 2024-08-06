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
}
