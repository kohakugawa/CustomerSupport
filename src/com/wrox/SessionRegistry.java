package com.wrox;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 * Created by yzhai on 5/26/2014.
 */
public class SessionRegistry {

    private static final Map<String, HttpSession> SESSION_MAP = new Hashtable<>();

    public static void addSession(HttpSession s)
    {
        SESSION_MAP.put(s.getId(), s);
    }

    public static void updateSessionId(HttpSession s, String oldSessionId)
    {
        synchronized (SESSION_MAP)
        {
            SESSION_MAP.remove(oldSessionId);
            addSession(s);
        }
    }

    public static void removeSession(HttpSession s)
    {
        SESSION_MAP.remove(s.getId());
    }

    public static List<HttpSession> getAllSessions()
    {
        return new ArrayList<>(SESSION_MAP.values());
    }

    public static int getNumberOfsessions()
    {
        return SESSION_MAP.size();
    }

    private SessionRegistry()
    {

    }
}
