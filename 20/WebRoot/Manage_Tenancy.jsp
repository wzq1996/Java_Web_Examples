<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<%@ page import="java.io.*" %>
<html>
<head>
<title>华奥汽车销售集团网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<jsp:useBean id="data" scope="session" class="cars.Bean1" />
<jsp:useBean id="bottom" scope="session" class="cars.Bean3" />
<jsp:useBean id="rst" scope="session" class="cars.Pages" />
<%!
	String sql;
	String vari;
	String rla;
	int i;
	int pagecount;
	int pages;
	int nows;
	ResultSet rs;
%>
<link rel="stylesheet" href="Css/style.css">
<Script src="Js/PopMenu.js"></script>
<SCRIPT src="Js/TextColor.js"></SCRIPT>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f9f9f9">
  <tr>
    <td><div align="center"><img src="Image/Fla.jpg" width="740" height="200"> </div></td>
  </tr>
</table>
<table width="744" height="526" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f9f9f9">
  <tr>
    <td width="164" height="526" valign="top"><%@ include file="Manage_Left.jsp" %>    </td>
    <td width="580" valign="top"><table width="580" height="564" border="1" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFCC99">
        <td height="20" colspan="2">&nbsp;<a href="Manage.jsp" style="color:#000000 ">管理中心</a></td>
      </tr>
      <tr>
        <td height="544" colspan="2" valign="middle"><div align="center">
          <table width="550" height="500" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="50"><div align="center">租 赁 信 息 管 理</div></td>
            </tr>
            <tr>
              <td height="25"><div align="right"></div></td>
            </tr>
            <tr>
              <td height="25" valign="middle">
                <table width="480" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
                  <form name="form1" method="post" action="Manage_Tenancy.jsp">
                    <tr>
                      <td width="68"><div align="right">关键字：</div></td>
                      <td width="150"><input name="keyword" type="text" class="wenbenkuang" size="20"></td>
                      <td width="92"><div align="right">关键字类别：</div></td>
                      <td width="106"><select name="Type" class="wenbenkuang">
                        <option value="CarsName" selected>租赁车型</option>
                        <option value="UserName">租赁用户`</option>
                      </select></td>
                      <td width="64"><input name="Submit" type="submit" class="buttons" value="查询确认"></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
            <tr>
              <td height="400" valign="top"><table width="535" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="10">&nbsp;</td>
                    <td height="10" colspan="2">&nbsp;</td>
                    <td height="10" colspan="2">&nbsp;</td>
                    <td height="10">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#efefef">
                    <td width="37" height="20" class="br"><div align="center">ID</div></td>
                    <td width="119" height="20" class="br"><div align="center">欲租车型</div></td>
                    <td width="122" class="br"><div align="center">申请时间</div></td>
                    <td width="86" height="20" class="br"><div align="center">租赁用户</div></td>
                    <td width="131" class="br"><div align="center">联系电话</div></td>
                    <td width="40" height="20" class="br"><div align="center">操作</div></td>
                  </tr>
                  <%
				  	if(request.getParameter("keyword")==null||request.getParameter("keyword").equals("")){
	sql="select * from tb_Tenancy where Whether='未受理'";
	rla="";
		}else{
	sql="select * from tb_Tenancy where Whether='未受理' and "+request.getParameter("Type")+" like '%"+request.getParameter("keyword")+"%'";
	rla="Type="+request.getParameter("Type")+"&keyword="+request.getParameter("keyword")+"&";
	}
        rst.size=17;
        vari=request.getParameter("pages");
   if(vari==null){
	pages=1;
   }
   else{
	pages=Integer.parseInt(vari);
   }
   rst.page=pages;
   rs=data.getrs(sql);
   rs=rst.getrs(rs);
   nows=0;
   while(rs.next()&&(nows<rst.size)){
	nows=nows+1;
%>
                  <tr>
                    <td height="20"><div align="center"><%=rs.getInt("ID")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("CarsName")%></div></td>
                    <td height="20"><div align="center"><%=rs.getDate("IssueDate")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("UserName")%></div></td>
                    <td height="20"><div align="center"><%=rs.getString("Phone")%></div></td>
                    <td height="20"><div align="center">
                        <input name="Submit22" type="button" class="buttons" value="受理" onClick="javascript:window.open('Tenancy_Particular.jsp?id=<%=rs.getInt("ID")%>','','width=472,height=346,toolbar=no,location=no,status=no,menubar=no')">
                    </div></td>
                  </tr>
                  <%}
data.close();
%>
                  <tr>
                    <td height="20" colspan="6">
                      <div align="right">
                        					  <%
		pagecount=rst.getavg();
		if(pagecount>1){
			if(pages==1){
			out.write("<a href='Manage_Tenancy.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			if(pages<pagecount){
			out.write("<a href='Manage_Tenancy.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			out.write("<a href='Manage_Tenancy.jsp?"+rla+"pages="+(pages+1)+"' style='color:#000000 '>下一页</a>");
			}
			else{
			out.write("<a href='Manage_Tenancy.jsp?"+rla+"pages="+(pages-1)+"' style='color:#000000 '>上一页</a>");
			}
			}
		}
		%>
                    </div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">汽车厂商标志</div></td>
  </tr>
</table>
<table width="744" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center">
      <p><%=bottom.seturl("吉林省长春市明日科技有限公司","www.mingrisoft.com")%> <a style="color:#000000;" href="Exit.jsp">管理出口</a><%=bottom.setnumbers("0431-4972266")%><br>
        <%=bottom.setemail("mingrisoft@mingrisoft.com")%><br>
        Copyright &copy; 2005-2008</p>
    </div></td>
  </tr>
</table>
</body>
</html>
