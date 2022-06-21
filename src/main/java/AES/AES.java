package AES;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
public class AES {
    private static SecretKeySpec khoaBiMat;
    private static byte[] khoa;

    public static void taoKhoa(final String khoaCaNhan) {
        MessageDigest sha = null;
        try {
            khoa = khoaCaNhan.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            khoa = sha.digest(khoa);
            khoa = Arrays.copyOf(khoa, 16);
            khoaBiMat = new SecretKeySpec(khoa, "AES");
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public static String maHoa(final String chuoiCanMaHoa, final String chuoiKhoa) {
        try {
            taoKhoa(chuoiKhoa);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, khoaBiMat);
            return Base64.getEncoder()
                    .encodeToString(cipher.doFinal(chuoiCanMaHoa.getBytes("UTF-8")));
        } catch (Exception e) {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }

    public static String giaiMa(final String chuoiCanGiaiMa, final String chuoiKhoa) {
        try {
            taoKhoa(chuoiKhoa);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, khoaBiMat);
            return new String(cipher.doFinal(Base64.getDecoder()
                    .decode(chuoiCanGiaiMa)));
        } catch (Exception e) {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
}
