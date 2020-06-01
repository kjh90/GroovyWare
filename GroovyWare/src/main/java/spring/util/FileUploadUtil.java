
package spring.util;

import java.io.File;

public class FileUploadUtil {
	
	public static String checkSameFileName(String fileName, String path) {
		
		//인자인 fileName에서 확장자를뺀 파일명만 가려내자!
		//이름이 같다면 확장자를뺀 파일명뒤에 번호를 붙여야하므로
		//.의 위치를 알아내야한다.
		//System.out.println("파일명:"+fileName);
		//System.out.println("경로:"+path);
		
		int period = fileName.lastIndexOf(".");
		
		String f_name = fileName.substring(0, period);//파일명
		String suffix = fileName.substring(period);//.txt와 같은 확장자
		
		//전체경로
		//System.getProperty("file.separator")는 윈도우면 경로 \ 역슬래쉬, 리눅스면 / 슬래쉬
		String saveFileName = path+System.getProperty("file.separator")+fileName;
		
		//위의 경로를 가지고 java.io.File객체를 생성하자!
		//이유는 File객체의 exists()함수를 통하여 존재여부를 확인할 수 있기 때문이다.
		File f = new File(saveFileName);
		
		//같은 이름이 있을경우 파일명 뒤에 숫자를 붙여줘야한다.
		int idx = 1;
		while(f != null && f.exists()) {
			//같은파일이 있는경우
			
			//파일명 뒤에 숫자를 붙여 파일명을 변경한다.
			//문자열만들어줌. 스트링버퍼
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);//파일명
			sb.append(idx++);//숫자를 붙인 후 1 증가
			sb.append(suffix);//확장자
			
			fileName = sb.toString();//변경된 파일명으로 기존파일명을 바꿔줌
			
			//변경된 파일명으로 다시 경로에 넣어줌
			saveFileName = path+System.getProperty("file.separator")+fileName;
			f = new File(saveFileName);
			//다시 반복문돈다. 또중복된파일명이있는지 확인
		}
		
		//중복된게없다면 바뀐이름의 파일명을 반환!
		return fileName;
	}
	
}
