<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

  <c:if test="${empty username}">
    <c:redirect url="../../login.html"></c:redirect>
  </c:if>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>病房管理系统</title>
  <link rel="stylesheet" type="text/css" href="../../Public/Static/zui/dist/css/zui.css">
 <link rel="stylesheet" type="text/css" href="../../Public/Static/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../../Public/Common/header.css">
  <link rel="stylesheet" href="../../Public/Static/css/fontello.css">
  <link rel="stylesheet" type="text/css" href="../../Public/Home/home.css">
  <link rel="stylesheet" type="text/css" href="../../Public/Patient/patient.css">
</head>
 <body style="  margin-top: -20px;">
 <!--导航条-->
  <nav class="nav1">
      <ul style="padding-left: 0px;">
        <li class="menu col-sm-2"><p style="color:#222; font-size:26px; left:0;"><span class="icon-h-sigh" style="font-size:26px;"></span>病房管理系统</p></li>
        <li class=" menu"><span class="glyphicon glyphicon-th-large"></span>&nbsp;<a href="/hospital/system/index.action">首页</a></li>
        <li class="menu selected"><span class="icon-accessibility"></span>&nbsp;<a href="/hospital/patient/all.action">病人管理</a></li>
        <li class="menu"><span class=" glyphicon glyphicon-home"></span>&nbsp;<a href="/hospital/ward/manage.action">病房管理</a></li>
        <li class="menu"><span class="icon-users"></span>&nbsp;<a href="/hospital/admin/adminManage.action">管理员管理</a></li>
        <li class="menu person">
          <div class="dropdown">
              <span class="glyphicon glyphicon-user"></span> ${username} 
              <span class="caret"></span>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
              <li role="presentation"><a role="menuitem" tabindex="-1" href="/hospital/system/logout.action">退出</a></li>
           </ul>
          </div>
        <!-- <span class="glyphicon glyphicon-user"></span> demo --></li>
      </ul>
  </nav>

  <nav class="menu" data-toggle="menu" style="width: 200px;margin-top: 20px;float:left; margin-left: 10px;">
  <button class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span><a href="/hospital/ward/register.action" style="color:#FFF"> 登记病人</a></button>

  <ul class="nav nav-primary">
    <li><a href="/hospital/system/index.action"><span class="glyphicon glyphicon-th-large"></span>&nbsp;首页</a></li>
       <li class="show active " >
          <a href="#"><span class="icon-accessibility"></span>&nbsp;病人管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 60px;"></span></a>
           <ul class="nav">
            <li><a href="/hospital/patient/all.action">住院人登记表管理</a></li>
            <li><a href="/hospital/patient/dealOutHospital.action">住院人出院办理<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 28px;  color: #F01378;"></span></a></li>
          </ul>
        </li>
        <li ><a href="#"><span class=" glyphicon glyphicon-home"></span>&nbsp;病房管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 64px;"></span></a>
           <ul class="nav">
                <li><a href="/hospital/ward/add.action">病房添加</a></li>
                <li><a href="/hospital/ward/manage.action">病房管理</a></li>
              </ul>
        </li>


        <li >
            <a href="#"><span class="icon-users"></span>&nbsp;管理员管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 43px;"></span></a>
            <ul class="nav">
                <li><a href="/hospital/admin/newAdmin.action">管理员添加</a></li>
                <li><a href="/hospital/admin/adminManage.action">管理员管理</a></li>
              </ul>
        </li>  
  </ul>
</nav>


  <!--内容-->
  <div id="main" style="  max-width: 1060px;">
    <article>
    <section id="buttons" class="page-section " >
      <h1 class="header-dividing">住院人出院管理</h1>
    
      <p>根据编号是住院唯一识别码</p>
  
    </section>
      <section  >

      <div class="container">
    <div class="row">
        <div class="col-md-10">


            <table class="table table-hover" id="bootstrap-table">
                <thead>
                <tr>
                    <th>#ID</th>
                    <th>住院编号</th>
                    <th>姓名</th>
                    <th>住院时间</th>
                    <th>出院状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${patients}" var="patient" varStatus="status">
				           <tr>
                     <td>${status.index}</td>
	                   <td class="username">${patient.username}</td>
                     <td >${patient.name}</td>
	                   <td>${patient.admission_time}</td>
				            <td>
				              <div class="btn-group">
				                <button class="btn btn-warning agree"> <span class="glyphicon glyphicon-edit"></span>同意出院</button>
				              </div>
				            </td> 
				          </tr>
               </c:forEach>
           
                </tbody>
            </table>
        </div>
    </div>
</div>
    </section>

   <section id="ajax_result">
      <div class="modal fade" id="result">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body re_content">
         
            </div>
           <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div> 
    </div>
    </section>
  </article>

  </div>
  <!--js样式文件-->
  <script type="text/javascript" src="../../Public/Static/jquery/jquery.js"></script>
  <script type="text/javascript" src="../../Public/Static/zui/dist/js/zui.js"></script>
  <script type="text/javascript" src="../../Public/Common/header.js"></script>
  <script type="text/javascript" src="../../Public/Common/js/vendor/jquery.sortelements.js"></script>
  <script type="text/javascript" src="../../Public/Common/js/jquery.bdt.js"></script>
<script>
    $(document).ready( function () {
        $('#bootstrap-table').bdt();
        $('.agree').click(function(){
            var url = "/hospital/patient/outhospital.action";
             var username = $(this).parent().parent().parent().find('.username').html();
             var $tr  =  $(this).parent().parent().parent();
             $.post(url,{'username':username},function(re_data){
                if(re_data.result=="200"){
                  $('.re_content').html("办理出院手续成功");
                  $('#result').modal('show');
                  $tr.hide();

                }else{
                  $('.re_content').html("办理出院手续失败");
                  $('#result').modal('show');
                }
             });
        }); 
    });
</script>

</body>
</html>