package travelblog;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

import java.lang.String;
import java.util.Date;
import java.util.List;

 

import com.google.appengine.api.users.User;

import com.googlecode.objectify.annotation.Entity;

import com.googlecode.objectify.annotation.Id;

 

 

@Entity

public class blogUser implements Comparable<blogUser> {

	@Parent Key<OfySignTravelblogServlet> Travelblog;
    @Id Long id;

    User user;

    String content;
    
    String title;

    Date date;

    private blogUser() {}

    public blogUser(User user, String content, String title) {

        this.user = user;

        this.content = content;
        
        this.title = title;

        date = new Date();

    }

    public User getUser() {

        return user;

    }

    public String getContent() {

        return content;

    }
    
    public Date getDate() {
    	
    	return date;
    }
    
    public String getTitle() {
    	return title;
    }

    @Override

    public int compareTo(blogUser other) {

        if (date.after(other.date)) {

            return 1;

        } else if (date.before(other.date)) {

            return -1;

        }

        return 0;

    }

}