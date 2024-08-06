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
public class MainClass2 {
	public static void main(String[] args) {
		MainClass2 mc=new MainClass2();  
		mc.hallData();
	}
	public void hallData() {
		HallDAO dao=HallDAO.newInstance();
		try {
			int k=1; 
			for(int i=1;i<=11;i++) {
				Document doc=Jsoup.connect("https://i-do.kr/wedding_halls/page/"+i).get();
				Elements link=doc.select(".vi-card-title a");
				for(int j=0;j<link.size();j++) {
					try {

					System.out.println(link.get(j).attr("href"));
					System.out.println("번호:"+k++);
					String url=link.get(j).attr("href"); // 링크
					// 상세보기로 이동
					// <li class="aa bb cc dd">
					Document doc2=Jsoup.connect(url).get();
					Element name=doc2.selectFirst(".gap-4 > div:nth-child(1) .text-sm:nth-of-type(1)");
					System.out.println(name.text());
					Element addr=doc2.selectFirst(".gap-4 > div:nth-child(2) .text-sm:nth-of-type(1)");
					System.out.println(addr.text().substring(addr.text().indexOf(" ")+1));
					Element point=doc2.selectFirst(".gap-4 > div:nth-child(3) .text-sm:nth-of-type(1)");
					System.out.println(point.text());
					Element type=doc2.selectFirst(".gap-4 > div:nth-child(4) .text-sm:nth-of-type(1)");
					System.out.println(type.text());
					Element menu=doc2.selectFirst(".gap-4 > div:nth-child(5) .text-sm:nth-of-type(1)");
					System.out.println(menu.text());
					Element mealcost=doc2.selectFirst(".gap-4 > div:nth-child(6) .text-sm:nth-of-type(1)");
					System.out.println(mealcost.text());
					Element map=doc2.selectFirst(".gap-4 > div:nth-child(7) .text-sm:nth-of-type(1)");
					System.out.println(map.text());
					Element homepage=doc2.selectFirst(".gap-4 > div:nth-child(8) .text-sm:nth-of-type(1)");
					System.out.println(homepage.text());
					Element image=doc2.select(".my-6 > div img:nth-of-type(1)").get(0);
					System.out.println(image.attr("src"));

					System.out.println("===========================================================");
					HallVO vo=new HallVO();
					vo.setName(name.text());
					vo.setAddr(addr.text().substring(addr.text().indexOf(" ")+1));
					vo.setPoint(point.text());
					vo.setType(type.text());
					vo.setMenu(menu.text());
					vo.setMealcost(mealcost.text());
					vo.setMap(map.text());
					vo.setHomepage(homepage.text());
					vo.setImage(image.attr("src")); //db에 붙였으니까 주소 안붙여도 된다 
					dao.hallInsert(vo);
					}catch(Exception ex) {}
				}
			}
			System.out.println("저장 완료!!");
		}catch(Exception ex) {}
	}
}
