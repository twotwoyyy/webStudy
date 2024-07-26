package com.sist.manager;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.*;
import org.jsoup.nodes.Document;
import oracle.jdbc.driver.*;


public class MovieManager {
	   public static void main(String[]args) {
	      MovieManager m = new MovieManager();
	      m.movieListData(1);
	   }
    
	public List<MovieVO> movieListData(int type){
		String[] strUrl= {
				"",
				"https://www.kobis.or.kr/kobis/business/main/searchMainDailyBoxOffice.do",
				"https://www.kobis.or.kr/kobis/business/main/searchMainRealTicket.do",
				"https://www.kobis.or.kr/kobis/business/main/searchMainDiverRealTicket.do"
		};
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			Document doc=Jsoup.connect(strUrl[type]).get();
//			System.out.println(doc.toString());
			String json=doc.toString();
			json=json.substring(json.indexOf("["),json.lastIndexOf("]")+1);
			//System.out.println(json);
			// 필요한 데이터를 읽어온다 => 파서 (HTML(Jsoup), XML(DocumentBuilder),JSON(SimpleJSON))
			// [{},{}....] = [] => JSONArray, {} => JSONObject 
			JSONParser jp=new JSONParser();
			JSONArray arr=(JSONArray)jp.parse(json);
			//System.out.println(arr); // 문자열 => JSON으로 변경
			// 1. HTML => 크롤링 연습
			// 2. JSON => 자바와 자바 스크립트 호환 => Ajax / Vue / React 
			// 3. XML => 설정 파일 (MyBatis, Spring) 
			// 4. 공공 데이터 포털, 네이버 데이터 센터, seoul시 데이터 센터 => CSV 
			for(int i=0;i<arr.size();i++) {
				JSONObject obj=(JSONObject)arr.get(i);
//				System.out.println(obj);
//				System.out.println("==========================");
				MovieVO vo=new MovieVO();
				vo.setRank(i+1);
				String poster=(String)obj.get("thumbUrl");
				vo.setPoster("https://www.kobis.or.kr"+poster);
				String title=(String)obj.get("movieNm");
			//	System.out.println((i+1)+"."+title);
				vo.setTitle(title);
				String genre=(String)obj.get("genre");
				vo.setGenre(genre);
				String director=(String)obj.get("director");
				vo.setDirector(director);
				String grade=(String)obj.get("watchGradeNm");
				vo.setGrade(grade);
				list.add(vo);
			}
		}catch(Exception ex) {}
		return list;
	}
}
