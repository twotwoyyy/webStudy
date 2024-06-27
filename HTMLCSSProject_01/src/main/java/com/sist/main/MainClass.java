package com.sist.main;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.MusicDAO;
import com.sist.dao.MusicVO;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        MainClass mc=new MainClass();
        mc.genieData();
	}
	public void genieData()
	{
		MusicDAO dao=MusicDAO.newInstance();
		try
		{
			int k=1;
			for(int i=1;i<=4;i++)
			{
				Document doc=Jsoup.connect("https://www.genie.co.kr/chart/top200?ditc=D&ymd=20240627&hh=15&rtm=Y&pg="+i).get();
				Elements title=doc.select("table.list-wrap td.info a.title");
				Elements singer=doc.select("table.list-wrap td.info a.artist");
				Elements album=doc.select("table.list-wrap td.info a.albumtitle");
				Elements poster=doc.select("table.list-wrap a.cover img");
				Elements etc=doc.select("table.list-wrap span.rank");
				for(int j=0;j<title.size();j++)
				{
					System.out.println(k);
					System.out.println(title.get(j).text());
					System.out.println(singer.get(j).text());
					System.out.println(album.get(j).text());
					System.out.println(poster.get(j).attr("src"));
					//System.out.println(etc.get(j).text());
					String s=etc.get(j).text();
					String id="";
					String state="";
					if(s.equals("유지"))
					{
						id="0";
						state="유지";
					}
					else
					{
						id=s.replaceAll("[^0-9]", "");
						state=s.replaceAll("[^가-힣]", "");
					}
					System.out.println("상태:"+state);
					System.out.println("등폭:"+id);
					System.out.println("=======================================");
				    k++;
				    
				    MusicVO vo=new MusicVO();
				    vo.setAlbum(album.get(j).text());
				    vo.setTitle(title.get(j).text());
				    vo.setSinger(singer.get(j).text());
				    vo.setPoster(poster.get(j).attr("src"));
				    vo.setState(state);
				    vo.setIdcrement(Integer.parseInt(id));
				    dao.musicInsert(vo);
				}
			}
		}catch(Exception ex){}
	}

}