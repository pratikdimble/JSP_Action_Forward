<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%!
    String uid;
    String uname;
    String salary;
    static Connection con;
    static Statement st;
    ResultSet rs;
    ResultSetMetaData rsmd;
    	int count;
    		static
    		{
    		/*  Load and register the driver*/
    			try
    			{
    				Class.forName("oracle.jdbc.OracleDriver");
    				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
    				st=con.createStatement();
    			}catch(Exception e){
    				e.printStackTrace();
    			}
    		}
     %>
    <%
    	try
    	{
    	
    		uid=request.getParameter("id");
    		uname=request.getParameter("name");
    		salary=request.getParameter("salary");
    	 
    			 rs=st.executeQuery("SELECT * FROM USER_TABLE WHERE id="+uid);
    				if(rs.next())
    					{ 
    						%>
    						<jsp:forward page="existed.jsp"/>
    						<% 
    			 		}
    						else
    						{  
       						int count=st.executeUpdate("insert into user_table values('"+uid+"','"+uname+"','"+salary+"')");
    							if(count==1)
    							{ 
    								%>
    								<jsp:forward page="success.jsp"/>
    								<%
    			 				}//else-->if
    								else
    								{ 
    								 %>
    				 					<jsp:forward page="failure.jsp"/>
    								<%
    							}//else-->else
    					}//else
    				}//try
    					catch(Exception e)
    					{
    						 %>
    						 <jsp:forward page="failure.jsp"/>
    						 <%
    							 e.printStackTrace();
    					}//catch
    				  %>
   