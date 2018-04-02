package com.xyg.test.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xyg.test.Park;

@SuppressWarnings("serial")
public class selectparkServlet extends HttpServlet{

	 
		protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	    {
	       doGet(req,res);
	    }
	    @SuppressWarnings({ "unchecked" })
		protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	    {
	    	req.setCharacterEncoding("utf-8");
			res.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=utf-8");
			
            /***��ѯ��λ  ***/	
			Park park = new Park();		
			int ap = park.getallparkNum();
			int np = park.getnullparkNum();	
		    System.out.println("aP:"+ap);
		    System.out.println("nP:"+np);						
			int park_pageSize = Integer.parseInt(req.getParameter("park_pageSize"));
			int park_currentpage = Integer.parseInt(req.getParameter("park_currentpage"));	
			String lastPageFlag = req.getParameter("lastPage");
			
			/*��ҳ����*/
			int park_pageCount = park.getPage(park_pageSize);
			/*�ж��Ƿ������һҳ*/
			if(lastPageFlag.equals("true")){
				park_currentpage = park_pageCount;
			}
			if(park_currentpage>=park_pageCount){
				park_currentpage=park_pageCount;	
			}else
			if(park_currentpage<=1){
				park_currentpage=1;	
			}
			StringBuffer sb = new StringBuffer();
			ArrayList<Object> L = new ArrayList<Object>();
			ArrayList<Object> l = new ArrayList<Object>();
			L = park.selectPage(park_currentpage,park_pageSize);
			System.out.println("L1:::::::::"+L);
			
			for(int i = 0;i<L.size();i++){
				l = (ArrayList<Object>)L.get(i);
				System.out.println("l::::::"+l);
				System.out.println("l.size()11::::::"+l.size());
				for(int j = 0;j<l.size();j++){
					System.out.println("l.size()2::::::"+l.size());
					if(j==0){
						if(i==0){
							sb.append("[{");
						}else{
							sb.append("{");
						}	
					}else if(j==(l.size()-1)){
						System.out.println("l.size()3::::::"+l.size());
						if(i==(L.size()-1)){
							
							sb.append(l.get(j)+"}]");
						}else{
							sb.append(l.get(j)+"},");
						}					
					}else{
						sb.append(l.get(j)+",");
					}				
				}
			}
			System.out.println("sb::::::::::"+sb);
			String sb1 = "{\"pageCurrentpage\":"+park_currentpage+",\"allPage\":"+park_pageCount+",\"ap\":"+ap+",\"np\":"+np+",\"da\":"+sb+"}";
			System.out.println("SB1:"+sb1);			
			res.getWriter().print(sb1);						
	 }	    
	   
}
