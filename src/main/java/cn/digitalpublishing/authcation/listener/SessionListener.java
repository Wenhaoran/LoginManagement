package cn.digitalpublishing.authcation.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cn.digitalpublishing.authcation.bean.ConstantsSession;
import cn.digitalpublishing.base.bean.SessionIdMap;
import cn.digitalpublishing.util.Log;



public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener{
	
	public void attributeAdded(HttpSessionBindingEvent arg0) {
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		if(arg0.getName().equals(ConstantsSession.SESSION_TICKET)){
			Log.printInfo("Session timeout, User logs off, remove the"+ConstantsSession.SESSION_TICKET+" from the cache");
			SessionIdMap.remove((String)arg0.getValue());
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		
	}

	/**
	 * 登录总数
	 */
	private static int count = 0;
	/**
	 * 活动数
	 */
	private static int activeCount=0;
	
	//记录登录信息
	public void sessionCreated(HttpSessionEvent evt){
		count++;
		activeCount++;
		HttpSession session = evt.getSession();
		if(session.getAttribute(ConstantsSession.SESSION_TICKET)!=null){
			Log.printInfo("################# PT Ticket is "+session.getAttribute(ConstantsSession.SESSION_TICKET).toString());
		}
	}
	
	//销毁登录信息
	public void sessionDestroyed(HttpSessionEvent evt){
		activeCount--;
		HttpSession session = evt.getSession();
		if(session.getAttribute(ConstantsSession.SESSION_TICKET)!=null){
			SessionIdMap.remove(session.getAttribute(ConstantsSession.SESSION_TICKET).toString());
			Log.printInfo("################# PT Ticket has been expired :"+session.getAttribute(ConstantsSession.SESSION_TICKET).toString());
		}
	}

	public static int getActiveCount() {
		return activeCount;
	}
	
	public static int getCount() {
		return count;
	}
}
