package travelblog;
 
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;
 
public class OfySignTravelblogServlet extends HttpServlet{
    static{
        ObjectifyService.register(blogUser.class);
    }
    private static final Logger log = Logger.getLogger(OfySignTravelblogServlet.class.getName());
   
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException{
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
       
        String guestbookName = req.getParameter("guestbookName");
        Key guestbookKey = KeyFactory.createKey("TravelBlog", guestbookName);
        String content = req.getParameter("content");
        String title = req.getParameter("title");
        Date date = new Date();
        Entity greeting = new Entity("blogUser", guestbookKey);
        greeting.setProperty("title", title);
        greeting.setProperty("user", user);
        greeting.setProperty("date",date);
        greeting.setProperty("content", content);
       
        if(content == null){
            content = "(No greeting)";
        }
        if(user != null){
        	ofy().save().entity(greeting).now();
            log.info("Greeting posted by user " + user.getNickname() + ": " + content);
        }
        else{
            log.info("Greeting not posted, must be anonymous");
        }
        resp.sendRedirect("/ofytravelblog.jsp?guestbookName=" + guestbookName);
    }
}