<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
 <body >
 <!--导航条-->
  <nav class="nav1">
      <ul style="padding-left: 0px;">
        <li class="menu col-sm-2"><p style="color:#222; font-size:26px; left:0;"><span class="icon-h-sigh" style="font-size:26px;"></span>病房管理系统</p></li>
        <li class=" menu"><span class="glyphicon glyphicon-th-large"></span>&nbsp;<a href="/hospital/system/index.action">首页</a></li>
        <li class="menu "><span class="icon-accessibility"></span>&nbsp;<a href="/hospital/patient/all.action">病人管理</a></li>
        <li class="menu "><span class=" glyphicon glyphicon-home"></span>&nbsp;<a href="/hospital/ward/manage.action">病房管理</a></li>
        <li class="menu selected"><span class="icon-users"></span>&nbsp;<a href="/hospital/admin/adminManage.action">管理员管理</a></li>
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
       <li >
          <a href="#"><span class="icon-accessibility"></span>&nbsp;病人管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 60px;"></span></a>
           <ul class="nav">
            <li><a href="/hospital/patient/all.action">住院人登记表管理</a></li>
            <li  ><a href="/hospital/patient/dealOutHospital.action">住院人出院办理</a></li>
          </ul>
        </li>
        <li ><a href="#"><span class=" glyphicon glyphicon-home"></span>&nbsp;病房管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 64px;"></span></a>
           <ul class="nav">
                <li ><a href="/hospital/ward/add.action">病房添加</a></li>
                <li><a href="/hospital/ward/manage.action">病房管理</a></li>
              </ul>
        </li>


        <li  class=" show active">
            <a href="#"><span class="icon-users"></span>&nbsp;管理员管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 43px;"></span></a>
            <ul class="nav">
                <li ><a href="/hospital/admin/newAdmin.action">管理员添加<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 55px;  color: #F01378;"></span></a></li>
                <li ><a href="/hospital/admin/adminManage.action">管理员管理</a></li>
              </ul>
        </li>  
  </ul>
</nav>
  <!--内容-->
  <div id="main" style="max-width:1060px; margin-bottom: 20px;">

    <article>
    <section id='form' class="page-section">
      <div class="page-header"><h1>管理员添加页面</h1></div>
      <h3>基本信息填写</h3>
      <h4>管理员账号是唯一的</h4>
      <div class='panel'>
        <div class='panel-heading'>创建</div>
        <div class='panel-body'>

        <form class="form-horizontal" >
          <div class="form-group">
            <label class="col-md-2 control-label">姓名</label>
            <div class="col-md-6">
               <input type='text' name='sickname'  placeholder=请输入姓名 class='form-control' />
            </div>
          </div>
          
           <div class="form-group" >
            <label class="col-md-2 control-label">年龄</label>
            <div class="col-md-6 ">
               <input type='text' name='age' id='title' value='' class='form-control' placeholder=''/>
            </div>
          </div>
      <div class="form-group">
        <label for="" class="col-md-2 control-label">性别</label>
        <div class="col-md-6">
          <label class="radio-inline">
            <input type="radio" name="sex" id="man" value="1"> 男
        
         </label>
           <label class="radio-inline">
            <input type="radio" name="sex" id="woman" value="2"> 女
         </label>
        </div>  
      </div>  
       <div class="form-group">
              <label class="col-md-2 control-label">账号</label>
              <div class="col-md-6 ">
                 <input type='text' name='username'  value='' class='form-control' placeholder='请输入账号'/>
              </div>
           </div>

          <div class="form-group">
            <label class="col-md-2 control-label">密码</label>
            <div class="col-md-6 ">
               <input type='text' name='pwd'  value='' class='form-control' placeholder='请输入密码'/>
            </div>
         </div>

          <div class="form-group">
            <label class="col-md-2 control-label">职业</label>
            <div class="col-md-6 ">
               <input type='text' name='professional' id='title' value='' class='form-control' placeholder=''/>
            </div>
          </div>

         


          <div class="form-group">
            <div class="col-md-offset-2 col-md-6">
               <a  class='btn btn-primary save'  data-loading='稍候...' >保存</a>
            </div>
          </div>
        </form>
        </div>
      </div>
      <table class="table-form">
        <tr>
          <th></th>
          <td></td>
        </tr>
      </table>
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
  <script>
  $(document).ready(function(){
      $('#man').attr("checked",true);
        
      function clearData(){
           $('input[name=pwd]').val(" ");
           $("input[name=username]").val(" ");
           $('input[name=professional]').val(" ");
           $('#man').attr("checked",true);
           $('input[name=sickname]').val(" ");
           $('input[name=age]').val(" ");
      }

      $('.save').click(function(){
         var url="/hospital/admin/add.action";
         var name = $('input[name=sickname]').val();
         var age=$('input[name=age]').val();
         var username = $("input[name=username]").val();
         var pwd  = $('input[name=pwd]').val();
         var professional = $('input[name=professional]').val();
         var sex = $("input[type=radio]:checked").val();
         var data ={'age':age,'name':name,'username':username,'password':pwd,'professional':professional,'sex':sex};

         $.post(url,data,function(req_data){
            if(req_data.result=="200"){
              $('#result').modal('show');
              $('.re_content').html("添加成功");
              clearData();
            }else{
               $('#result').modal('show');
              $('.re_content').html("添加失败");
            }
         });   
     });

  });
  </script>
</body>
</html>