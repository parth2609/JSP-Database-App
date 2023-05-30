
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>
            JSP Static and Dynamic Content Display
        </title>
        
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/university?autoReconnect=true&useSSL=false", "root", "root");
            PreparedStatement st=con.prepareStatement("select * from qualification");
            ResultSet rs=st.executeQuery();
            PreparedStatement st1=con.prepareStatement("select * from country");
            ResultSet rss=st1.executeQuery();
        %>
    <center>
        <form method="post" action="insert.jsp">
            <pre>
                Name:<input type="text" name="t1"/></br></br></br>
                Address:<input type="text" name="t2"/></br></br></br>
                Qualification:<select name="s1">
                <%
                    while(rs.next()){
                %>
                    <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                <%
                %>
                </select>
                <input type="submit" value="Submit"/>
                
            </pre>
        </form>
    </center>
    </body>
</html>
