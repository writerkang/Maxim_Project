package common;

import java.security.MessageDigest;

public class PasswordMaker {

	public static void main(String[] args) {

		System.out.println(sha256("apple"));
		System.out.println(sha256("kee"));
		System.out.println(sha256("l@!"));
		System.out.println(sha256("holaheydo"));

		
	}
	
	public static String sha256(String word) {
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(word.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			return hexString.toString();

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}

}
