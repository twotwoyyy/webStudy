package com.sist.main;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.*;
/*
 *  <div class="a">       .a img
 *    <div class="b">
 *      <h1>Hello</h1>
 *      <img src="">
 *      <a href="">
 *    </div>
 *    <div class="c">
 *      <h1>Hello</h1>
 *      <img src="">
 *      <a href="">
 *    </div>
 *  </div>
 *  <div class="d">
 *    <div class="b">
 *      <h1>Hello</h1>
 *      <img src="">
 *      <a href="">
 *    </div>
 *    <div class="c">
 *      <h1>Hello</h1>
 *      <img src="">
 *      <a href="">
 *    </div>
 *  </div>
 */
public class MainClass {
	public static void main(String[] args) {
		MainClass mc=new MainClass();    
	}
	public void foodData() {
		FoodDAO dao=FoodDAO.newInstance();
		try {
			int k=1; 
			for(int i=1;i<=347;i++) {
				Document doc=Jsoup.connect("https://www.menupan.com/restaurant/bestrest/bestrest.asp?page="+i+"&trec=8674&pt=rt").get();
				Elements link=doc.select("ul.list p.listName a");
				for(int j=0;j<link.size();j++) {
					try {

					System.out.println(link.get(j).attr("href"));
					System.out.println("업체번호:"+k++);
					String url="https://www.menupan.com"+link.get(j).attr("href"); // 링크
					// 상세보기로 이동
					// <li class="aa bb cc dd">
					Document doc2=Jsoup.connect(url).get();
					Element poster=doc2.selectFirst("div.areaThumbnail ul#id_restphoto_list_src #restphoto_img_0");
					System.out.println(poster.attr("src"));
					Element name=doc2.selectFirst("div.areaBasic dd.name");
					System.out.println(name.text().substring(0,name.text().indexOf("[")));
					Element type=doc2.selectFirst("div.areaBasic dd.type");
					System.out.println(type.text());
					Element phone=doc2.selectFirst("div.areaBasic dd.tel1");
					System.out.println(phone.text());
					Element address=doc2.selectFirst("div.areaBasic dd.add1");
					System.out.println(address.text());
					Element score=doc2.selectFirst("div.areaBasic span.total");
					System.out.println(score.text());
					Element theme=doc2.selectFirst("div.areaBasic dd.Theme");
					System.out.println(theme.text()); //text라 하면 태그는 지워지고 텍스트만 불러온다
					Element content=doc2.selectFirst("div.article div#info_ps_f");
					System.out.println(content.text()); 
					System.out.println("===========================================================");
					FoodVO vo=new FoodVO();
					vo.setName(name.text().substring(0,name.text().indexOf("[")));
					vo.setPhone(phone.text());
					vo.setType(type.text());
					vo.setAddress(address.text());
					vo.setTheme(theme.text());
					vo.setPoster(poster.attr("src")); //db에 붙였으니까 주소 안붙여도 된다 
					vo.setContent(content.text());
					vo.setScore(Double.parseDouble(score.text()));
					dao.foodInsert(vo);
					}catch(Exception ex) {}
				}
			}
			System.out.println("저장 완료!!");
		}catch(Exception ex) {}
	}
}
