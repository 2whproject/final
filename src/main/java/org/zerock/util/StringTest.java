package org.zerock.util;

public class StringTest {

	public static void main(String[] args) {
		String title_link = "http://movie.daum.net/moviedb/main?movieId=46121";
		
		int idx = title_link.indexOf("=");
		
		String moveid = title_link.substring(idx + 1);
		
		System.out.println("moveid = [" + moveid + "]");

	}

}
