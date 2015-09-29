import org.hibernate.*;
import org.hibernate.cfg.*;

import packag.product;
public class clientprogram 
{
	public static void main(String[] args) 
	{ 
		Configuration cfg = new Configuration(); 
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession(); 
		Object o=session.load(product.class,new Integer(101));
		product s=(product)o; 
		// For loading Transaction scope is not necessary...  System.out.println("Loaded object product name is___"+s.getProName());    
		System.out.println("Object Loaded successfully.....!!"); 
		session.close();  
		factory.close(); 
		}
}
	
