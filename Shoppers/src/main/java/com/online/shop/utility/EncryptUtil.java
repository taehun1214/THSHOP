package com.online.shop.utility;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class EncryptUtil {
	// MD5 알고리즘
	public static String getMD5(String str) throws NoSuchAlgorithmException{
		
		String rtnMD5 = "";
		System.out.println("str: "+str);
		System.out.println("str.getBytes() : "+Arrays.toString(str.getBytes()));
		
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(str.getBytes());
		byte byteData[] = md.digest();
		
		System.out.println("byteData[]:" +Arrays.toString(byteData));
		
		StringBuffer sb = new StringBuffer();
		
		for (byte byteTmp : byteData){
			sb.append(Integer.toString((byteTmp&0xff)+0x100, 16).substring(1));
		}
		rtnMD5 = sb.toString();
		
		return rtnMD5;
	}
	//SHA-256 알고리즘
	public static String getSHA256(String str) throws NoSuchAlgorithmException{
		String rtnSHA ="";
		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		sh.update(str.getBytes());
		byte byteData[] = sh.digest();
		StringBuffer sb = new StringBuffer();
		
		
		for (int i = 0; i<byteData.length; i++){
			sb.append(Integer.toString((byteData[i]&0xff)+0x100, 16).substring(1));
		}
		rtnSHA = sb.toString();
		return rtnSHA;
	}
	
	public static String getEncryptMD5(String a_orgin){
		String encryptedMD5 = "";
		MessageDigest md = null;
		
		try {
			md=MessageDigest.getInstance("MD5");
			md.update(a_orgin.getBytes(), 0, a_orgin.getBytes().length);
			byte byteData[] = md.digest();
			encryptedMD5 = new BigInteger(1, byteData).toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encryptedMD5;
	}
	
	public static String getEncryptSHA256(String a_origin){
		String encryptedSHA256 = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(a_origin.getBytes(), 0, a_origin.length());
			encryptedSHA256 = new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return encryptedSHA256;
	}
	
}