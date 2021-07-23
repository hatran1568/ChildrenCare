package util;


import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

public class JWT {

    private static JWT uniqueInstance;

    public static JWT getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new JWT();
        }
        return uniqueInstance;
    }

    public static JWebToken generateJWT(String s, int minute) {
        JSONObject jwtPayload = new JSONObject();
        jwtPayload.put("status", 0);

        JSONArray audArray = new JSONArray();
        audArray.put("admin");
        jwtPayload.put("sub", s);

        jwtPayload.put("aud", audArray);
        LocalDateTime ldt = LocalDateTime.now().plusMinutes(minute);
        jwtPayload.put("exp", ldt.toEpochSecond(ZoneOffset.UTC)); //this needs to be configured

        JWebToken token = new JWebToken(jwtPayload);
       return token;
    }
    private static String decode(String encodedString) {
        return new String(Base64.getUrlDecoder().decode(encodedString));
    }

    public static String decodeToken(String token) {
       return decode(token);
    }
}
