package br.com.diogoribeiro;

import junit.framework.TestCase;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: diogo
 * Date: 10/24/12
 * Time: 6:27 PM
 */
public class SaltCryptographyTests extends TestCase {

    SaltCryptography cryptographer = new SaltCryptography();
    String text = "string_to_be_encrypted";

    @Override
    public void setUp() throws Exception {
        super.setUp();
    }

    public void testShouldReturnAnMD5String(){
        String stringEncrypted = cryptographer.encrypt(text);

        assertNotNull(stringEncrypted);
    }

    public void testShouldReturnTheSameMD5StringForTheSameString(){
        String stringEncrypted = cryptographer.encrypt(text);
        String stringEncrypted2 = cryptographer.encrypt(text);

        assertNotNull(stringEncrypted);
        assertNotNull(stringEncrypted2);

        assertEquals("The generated hash md5 should be the same for the same string", stringEncrypted, stringEncrypted2);
    }

    public void testShouldReturnDifferentMD5StringsForDifferentStrings(){
        String stringEncrypted = cryptographer.encrypt(text);
        String stringEncrypted2 = cryptographer.encrypt("othe_text");

        assertNotNull(stringEncrypted);
        assertNotNull(stringEncrypted2);

        assertNotSame("The generated hash md5 should be different for different strings", stringEncrypted, stringEncrypted2);
    }

    public void testShoudReturnAnMD5StringAndTheSalt(){
        Map encryptionResult = cryptographer.encryptWithSalt(text);

        assertNotNull(encryptionResult);
        assertEquals("It should contains the salt and the hash md5", 2, encryptionResult.size());
    }

    public void testShouldReturnDifferentMD5StringsUsingSalt(){
        String stringEncrypted = cryptographer.encrypt(text);
        String stringEncrypted2 = cryptographer.encrypt(text);

        assertNotNull(stringEncrypted);
        assertNotNull(stringEncrypted2);

        assertNotSame("The generated hash md5 should be different when using salt", stringEncrypted, stringEncrypted2);
    }
}
