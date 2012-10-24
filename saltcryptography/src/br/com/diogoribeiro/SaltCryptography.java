package br.com.diogoribeiro;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: diogo
 * Date: 10/24/12
 * Time: 6:36 PM
 */
public class SaltCryptography {
    public String encrypt(String text) {
        try {
            MessageDigest encrypter = MessageDigest.getInstance("MD5");
            encrypter.update(text.getBytes());
            byte[] result = encrypter.digest();

            return getStringFromBytes(result);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Map encryptWithSalt(String text) {
        Long now = new Date().getTime();
        String salt = now.toString();
        String simpleEncrypt = encrypt(text);
        String textEncryptedWithSalt = encrypt(simpleEncrypt+salt);

        Map result = new HashMap();
        result.put("salt", salt);
        result.put("result", textEncryptedWithSalt);

        return result;
    }

    private String getStringFromBytes(byte[] bytes){
        StringBuffer result = new StringBuffer();
        for(byte actualByte: bytes){
            result.append(actualByte);
        }

        return result.toString();
    }
}