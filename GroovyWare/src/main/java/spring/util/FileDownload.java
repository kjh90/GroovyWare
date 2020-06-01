package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */

public class FileDownload extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 값들 받기(dir, fileName)
		String dir = request.getParameter("dir");// /upload
		String fileName = request.getParameter("fileName");
		
		//dir을 절대경로로 만든다.
		String path = getServletContext().getRealPath(dir);
		
		//전체 경로
		String fullPath = path + System.getProperty("file.separator") + fileName;
		
		System.out.println("fullPath="+fullPath);
		
		//전체 경로로 File객체 생성
		File f = new File(fullPath);
		
		//바구니 역활
		byte[] buf = new byte[2048];
		
		//전송할 데이터가 Stream처리될 때 문자셋 지정
		response.setContentType("application/octet-stream;charset=8859_1");
		
		//다운로드 대화상자 처리
		response.setHeader("Content-Disposition","attachment;fileName="+new String(fileName.getBytes(),"ISO8859_1")+";");
		
		//전송타입이 이진데이터(binary)
		response.setHeader("Content-Transfer-Encoding","binary");
		
		if(f.isFile()){
//			FileInputStream fis = new FileInputStream(f);
//			BufferedInputStream bis = new BufferedInputStream(fis);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			//요청한 곳으로 보내기 위해
			//스트림을 요청객체(response)로 부터 얻어낸다
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int size = -1;
			try {
				while((size = bis.read(buf)) != -1){
					bos.write(buf, 0, size);
				}
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
