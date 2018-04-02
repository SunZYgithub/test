package com.xyg.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

public class Car {
	
	private int charge;
	
	private static final String DRIVER="oracle.jdbc.driver.OracleDriver";  
    private static final String URL = "jdbc:oracle:thin:@//192.168.0.26:1521/PDB_APEX";  
    private static final String USERNAME="APEX_UAT";  
    private static final String PASSWORD="apex_uat";  
    public Connection getConn()throws ClassNotFoundException,SQLException{  
        Class.forName(DRIVER);  
        Connection conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);  
        return conn;  
    }  
    public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs)throws SQLException{  
        if(rs!=null){  
            rs.close();  
        }  
        if(pstmt!=null){  
            pstmt.close();  
        }  
        if(conn!=null){  
            conn.close();  
            
        }  
    }  
    
  
	//  ����� 	
	public HashMap<String,String> insCar(String ent_carId,String entTime) throws SQLException, ClassNotFoundException{
		HashMap<String, String> hashMap = new HashMap<String, String>();
		try{
			//	Class.forName("oracle.jdbc.driver.OracleDriver");
			//	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.0.26:1521/PDB_APEX","APEX_UAT"," apex_uat");
			Car car = new Car();
			Connection conn = car.getConn();
			String sql = "UPDATE XYG_TEST_PARKING_INFORM SET CAR_NUM = ?,IN_TIME = to_date(?,'yyyy-MM-dd HH24:mi:ss') where PARKING_ID = "
					+ "(select PARKING_ID from (select PARKING_ID from XYG_TEST_PARKING_INFORM order by dbms_random.value) where rownum=1)";
			String sql1 = " insert into XYG_TEST_CAR_NEWFORM(HISTORY_ID,PARKING_CODE,PARKING_TYPE,CAR_NUM,IN_TIME) SELECT XYG_TEST_CAR_NEWFORM_S.NEXTVAL,"
					+ "XTPI.PARKING_CODE,XTPI.PARKING_TYPE,XTPI.CAR_NUM,XTPI.IN_TIME FROM XYG_TEST_PARKING_INFORM XTPI WHERE XTPI.CAR_NUM = ?"; 
			String sql2 = "SELECT CAR_NUM FROM XYG_TEST_PARKING_INFORM WHERE CAR_NUM = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt.setNString(1,ent_carId);
			pstmt.setNString(2,entTime);	
			pstmt1.setNString(1,ent_carId);	
			pstmt2.setNString(1,ent_carId);	
			ResultSet rs1 = pstmt2.executeQuery();
			if(rs1.next()){
				String es1 = "a";
				String msg1 = "车辆已存在";
				hashMap.put("RetCode1", es1);	
				hashMap.put("Msg1",msg1); 
			}else{
				pstmt.executeUpdate();
				pstmt1.executeUpdate();
				String es1 = "b";
				String msg1 = "入库成功";
				hashMap.put("RetCode1", es1);	
				hashMap.put("Msg1",msg1); 
			}
			car.closeAll(conn, pstmt, null);
			car.closeAll(conn, pstmt1, null);
			car.closeAll(conn, pstmt2, null);
		}catch (Exception e) {
			e.printStackTrace();  	     
	    }
		System.out.println(hashMap);
		return hashMap;   		
	}
	
	//  �����
	public HashMap<String, String> outCar(String out_carId,String outTime) throws SQLException, ClassNotFoundException{
		HashMap<String, String> hashMap = new HashMap<String, String>();
		try{
			//	Class.forName("oracle.jdbc.driver.OracleDriver");
			//	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.0.26:1521/PDB_APEX","APEX_UAT"," apex_uat");
			Car car = new Car();
			Connection conn = car.getConn();
		
			String sql1 = " SELECT PARKING_TYPE,IN_TIME FROM XYG_TEST_PARKING_INFORM WHERE CAR_NUM=?";				
			String sql2 = "UPDATE XYG_TEST_CAR_NEWFORM SET CHARGE=?,OUT_TIME = to_date(?,'yyyy-MM-dd HH24:mi:ss')  where CAR_NUM=? AND IN_TIME = ?";		
			String sql3 = "UPDATE XYG_TEST_PARKING_INFORM SET CAR_NUM = NULL,IN_TIME = NULL WHERE CAR_NUM = ?";			
			//	PreparedStatement pstmt = conn.prepareStatement(sql);
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			
			//System.out.println("OutTime:"+outTime);		
			pstmt1.setNString(1, out_carId);						
			ResultSet rs1 = pstmt1.executeQuery();			

			if(rs1.next()){
				String type = rs1.getString(1);
				//String inTime = rs1.getString(2);
				Timestamp inTime = (Timestamp)rs1.getObject(2);
				System.out.println("intTime:"+inTime);
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				long i = (long) inTime.getTime();
				long o = (long) format.parse(outTime).getTime();
				System.out.println("IN��:"+i);
				System.out.println("OU��:"+o);
				System.out.println("s:"+(o-i));
				long sec = (long) ((format.parse(outTime).getTime()-inTime.getTime()));
				
				System.out.println("sec11:"+sec);
		        if(sec>0){
				//System.out.println("inTime:"+inTime);
				//Park p = new Park();
				//Timestamp inTime = (Timestamp)p.Timestamp2uDate(rs1.getObject(2));
				//System.out.println("inTime1:"+inTime);
		        //Park p = new Park();
		        //String inTime1 = inTime.substring(0, 19);
					charge = car.fee(type, inTime, outTime);
					//System.out.println("inTime3:"+inTime1);
					pstmt2.setInt(1, charge);
					pstmt2.setNString(3, out_carId);
					pstmt2.setNString(2, outTime);
					//Timestamp a = new Timestamp(inTime.getTime());
					System.out.println("ts:"+inTime);
					pstmt2.setTimestamp(4, inTime);
					pstmt2.executeUpdate();	
					pstmt3.setNString(1,out_carId);
					pstmt3.executeUpdate();
					
					String es2 = "c";
					String msg2 = "出库成功";
					hashMap.put("RetCode2", es2);	
					hashMap.put("Msg2",msg2);
	
				/*}*/
		        }else {
		        	String es2 = "e";
					String msg2 = "输入时间有误，出库失败";
					hashMap.put("RetCode2", es2);	
					hashMap.put("Msg2",msg2);
		        }
			}else{
				String es2 = "d";
				String msg2 = "汽车不存在，出库失败";
				hashMap.put("RetCode2", es2);	
				hashMap.put("Msg2",msg2); 		
			}					
					
			car.closeAll(conn,pstmt1,rs1);
			car.closeAll(conn,pstmt2,null);
			car.closeAll(conn,pstmt3,null);
		}catch (Exception e) {
			e.printStackTrace();  
	    }
		System.out.println(hashMap);
		return hashMap;  	
	}
	
	//  �ж�ʱ���Ƿ��ҹ
	public int overNight(int n){
		n= (n<0)?0:1;
		return n;
	}
	//  �ж��Ƿ�Ϊ����	
	public int isPlus(int n){
		n=(n<=0)?0:n;
		return n;
	}	
	//  �ж��Ƿ񳬹��޶�
	public int FeeA(int n){
		n=(n>=40)?40:n;
		return n;
	}
	
	public int FeeB(int n){
		n=(n>=64)?64:n;
		return n;
	}
	//   �����ܷ���
	public int fee(String type,Date inTime,String outTime) throws ClassNotFoundException, SQLException{	
		 DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		 try {
			long inTime_Sec =  inTime.getTime();
	        long outTime_Sec =  format.parse(outTime).getTime();
			int Di =  inTime.getHours();
			int Do = ( format.parse(outTime).getSeconds()==0 && format.parse(outTime).getMinutes()==0)
	        		?format.parse(outTime).getHours():(format.parse(outTime).getHours()+1);
	        int day1 = inTime.getDate();
	        //  System.out.println(day1);
	        int day2 = format.parse(outTime).getDate();
	        //  System.out.println("dddd:"+(format.parse(outTime).getHours()));
	        int days = (int) ((outTime_Sec-inTime_Sec)/1000/3600/24);
	        int hour = (int) ((outTime_Sec-inTime_Sec)/1000/3600);
	        int sec = (int) ((outTime_Sec-inTime_Sec)/1000/60);
	        System.out.println("sec:"+sec);
	        // int day =format.parse(outTime).getDay()-format.parse(inTime).getDay();
	        // System.out.println("����days��"+days);
	        // System.out.println("iS:"+inTime_Sec);
	        // System.out.println("oS:"+outTime_Sec);
	        //  A�೵λ�۸�	 
            Car car = new Car();
			Connection conn = car.getConn();
 
            if(type.equals("A")){
            	if(sec<=30){
            		charge = 0;
            	}else{
	 			if(days<1 && day1==day2){ 	
	 				//System.out.println("Di1:"+Di);
	 				//System.out.println("Do1:"+Do);
	 				//System.out.println("hour1:"+hour);
	 				//System.out.println("day-1:"+(hour-(24-Di)-Do+1));
	 				if(Di<8){
	 					charge = 10+car.FeeA(car.isPlus(Do-8)*5);
	 				}else{
	 					charge = car.FeeA((Do-Di-car.isPlus(Do-22))*5+car.overNight(Do-22)*10);
	 				}			
	 			}else{	 
	 				//	System.out.println("Di2:"+Di);
	 				//  System.out.println("Do2:"+Do);
	 				//  System.out.println("hour2:"+hour);
	 				//  System.out.println("day-1:"+(hour-(24-Di)-Do+1));
	 				if(Di<8){	 		
	 					charge = 50+car.FeeA(car.isPlus(Do-8)*5)+40*car.isPlus((hour-(24-Di)-Do+1)/24);
	 				}else{     
	 		           charge = car.FeeA(10+car.isPlus(22-Di)*5)+40*car.isPlus((hour-(24-Di)-Do+1)/24)+ car.FeeA(car.isPlus(Do-8)*5);
	 				}
	 			}
            	}
	 		}else{
	 			System.out.println("B");
	 			//B�೵λ�۸�
	 			if(sec<=30){
	 				charge = 0;
	 			}else{
	 			if(days<1 && day1==day2){ 				
	 				if(Di<8){
	 					charge = 15+car.FeeB(car.isPlus(Do-8)*8);
	 				}else{
	 					charge = car.FeeB((Do-Di-car.isPlus(Do-22))*8+car.overNight(Do-22)*10);
	 				}			
	 			}else{
	 				if(Di<8){
	 					charge = 79+car.FeeB(car.isPlus(Do-8)*5)+64*((hour-(24-Di)-Do)/24);
	 				}else{ 			
	 					charge = car.FeeB(15+car.isPlus(22-Di)*8)+64*((hour-(24-Di)-Do)/24)+ car.FeeB(car.isPlus(Do-8)*8);
	 				}
	 			}		 						
	 			}
	 		}
	 } catch (ParseException e) { 
	 		 System.out.println("eeeee");
	         e.printStackTrace();  
	 }  	   
		System.out.println("����:"+charge);
 		return charge;     
   }	
	//  ��ѯ��ʷ�� �ó�����
	public int allFee(String out_carId,String outTime){
		int fee = 0;
		try{
			Car car = new Car();
			Connection conn = car.getConn();
			
			String sql1 = "SELECT CHARGE FROM XYG_TEST_CAR_NEWFORM WHERE CAR_NUM=? AND OUT_TIME = to_date(?,'yyyy-MM-dd HH24:mi:ss')";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setNString(1,out_carId);
			pstmt1.setNString(2,outTime);
			
			ResultSet rs1 = pstmt1.executeQuery();
			while(rs1.next()){
				 fee = rs1.getInt(1);
				 //System.out.println("�ܴ�λ:"+parkNum);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
			//System.out.print("fefe:"+fee);
		return fee;
	}

	public static void main(String args[]) throws ClassNotFoundException, SQLException{	
			Car car = new Car();
		//	String[] inTime1 = "2017-03-24 08:10:02".split("");
			car.insCar("a009","2017-03-24 08:10:02");
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sdf.format(date);
		System.out.println(str);*/
		//	car.outCar("a007","2017-03-24 09:59:06");
		//	car.allFee("a002","2017-03-09 18:10:00");
		//	car.fee("A", "2017-03-24 08:00:10","2017-03-24 08:40:00");
		//	car.equals(9);
	}
	
}
