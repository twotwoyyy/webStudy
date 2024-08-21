package com.sist.temp;
import java.io.*;
import java.util.*;
public class RecipeMain {
	public static void main(String[] args) {
		try {
			FileReader fr=new FileReader("c:\\webDev\\RECIPEDETAIL.csv");
			StringBuffer sb=new StringBuffer();
			int i=0;
			while((i=fr.read())!=-1) {
				sb.append((char)i);
			}
			fr.close();
			System.out.println(sb.toString());
		}catch(Exception ex) {}
	}
}
