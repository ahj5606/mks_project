package mks.util;
import javax.imageio.ImageIO;
import javax.xml.transform.sax.SAXSource;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.awt.image.BufferedImage;
import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class qrMake {



	public static String getSha1(String str){
		String SHA;
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-1");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
				
			for (byte aByteData : byteData) {
					sb.append(Integer.toString((aByteData & 0xff) + 0x100, 16).substring(1));
			}
				
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
				e.printStackTrace();
			SHA = null;
		}
			return SHA;
		}
	public static void QR_make(String resCode) {
		 try {
	            File file = null;
	            // 큐알이미지를 저장할 디렉토리 지정
	            file = new File("C:\\qr");
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            // 코드인식시 링크걸 URL주소
	            String codeurl = new String(resCode.getBytes("UTF-8"), "ISO-8859-1");
	            // 큐알코드 바코드 생상값
	            int qrcodeColor =   0xFF000000;
	            // 큐알코드 배경색상값
	            int backgroundColor = 0xFFFFFFFF;
	             
	            QRCodeWriter qrCodeWriter = new QRCodeWriter();
	            // 3,4번째 parameter값 : width/height값 지정
	            BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,200, 200);
	            //
	            MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
	            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
	            // ImageIO를 사용한 바코드 파일쓰기
	            ImageIO.write(bufferedImage, "png", new File("C:\\qr\\"+resCode+".png"));
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }  
	}
	
	
	public static void main(String[] args) {
			
		String password = getSha1("1");
		System.out.println(password);
		QR_make("1");
	}
	
	
}
