package spring.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.jdbc.datasource.SimpleDriverDataSource;

public class createString {
	
	int num = 1;
	StringBuffer sb;
	
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("YYYYMMDD");
	
	//문서번호 자동생성
	public StringBuffer getString() {
		sb = new StringBuffer();
		
		sb.append(date.format(today));
		
		return sb;
	}
	

	
}
