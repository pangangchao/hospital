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

</head>
 <body style="  margin-top: -20px;">

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


        <li class="show active" >
            <a href="#"><span class="icon-users"></span>&nbsp;管理员管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 43px;"></span></a>
            <ul class="nav">
                <li><a href="/hospital/admin/newAdmin.action">管理员添加</a></li>
                <li><a href="/hospital/admin/adminManage.action">管理员管理<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 55px;  color: #F01378;"></span></a></li>
              </ul>
        </li>  
  </ul>
</nav>

  <!--内容-->
  <div id="main" style="max-width:1060px;">
    <article>
    <section id="buttons" class="page-section " >
      <h1 class="header-dividing">后台管理员管理</h1>
    
  
    </section>
      <section  >

      <div class="container">
    <div class="row">
        <div class="col-md-10">


            <table class="table table-hover" id="bootstrap-table">
                <thead>
                <tr>
                    <th>#ID</th>
                    <th>账号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>职务</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                   <c:forEach items="${admins}" var="admin" varStatus="status">
                   <tr> 

                    <input type="hidden"  name="need_id" value="${admin.id}"/>
                    <input type="hidden" name="need_sex" value="${admin.sex}">  
                    <input type="hidden" name="need_password" value="${admin.password}">
                    <td>${status.index }</td>
                    <td class="need_username">${admin.jobID }</td>
                    <td class="need_name">${admin.name}</td>
                    <td class="need_age">${admin.age }</td>
                    <td class="need_professional">${ admin.professional}</td>
				             <td>
				              <div class="btn-group">
				                <button class="btn btn-warning edit"> <span class="glyphicon glyphicon-edit"></span>修改</button>
				                <button class="btn btn-danger delete"><span class="glyphicon glyphicon-trash"></span>删除</button>
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

    <section id="edit_modal">
      <div class="modal fade" id="edit_admin">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">管理员信息修改</h4>
            </div>
            <div class="modal-body">
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
        <div class="form-group" >
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
                   <input type='text' name='username' disabled  value='' class='form-control ' placeholder='请输入账号'/>
                </div>
             </div>

            <div class="form-group">
              <label class="col-md-2 control-label">职业</label>
              <div class="col-md-6 ">
                 <input type='text' name='professional' id='title' value='' class='form-control' placeholder=''/>
              </div>
            </div>
        </form>
           
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
              <button type="button" class="btn btn-primary save-edit">保存修改</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
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

        $('.edit').click(function(){
           var $tr  = $(this).parent().parent().parent();
           var sex=   $tr.find('input[name=need_sex]').val();
           var username=  $tr.find('.need_username').html();
           var age= $tr.find('.need_age').html();
           var name=$tr.find('.need_name').html();
           var professional=$tr.find('.need_professional').html();       
           var id=$tr.find('input[name=need_id]').val();
           var password = $tr.find('input[name=need_password]').val();
           $('#edit_admin').modal('show');
           $('input[name=sickname]').val(name);
           $('input[name=age]').val(age);
           $('input[name=professional]').val(professional);
           $('input[name=username]').val(username);
           $("input[name=sex][value='"+sex+"']").attr("checked",true);

           $('.save-edit').click(function(){
               var save_name= $('input[name=sickname]').val();
               var save_age =$('input[name=age]').val();
               var save_professional=$('input[name=professional]').val();
               var save_username=$('input[name=username]').val();
               var save_sex=$("input[name=sex]:checked").val();
               var url="/hospital/admin/edit.action";
               var data={"id":id,'age':save_age,"name":save_name,"username":save_username,"professional":professional,"sex":sex,'password':password};
               $.post(url,data,function(req_data){
                    if(req_data.result=="200"){
                      $('#edit_admin').modal('hide');
                      $tr.find('input[name=need_sex]').val(save_sex);
                      $tr.find('.need_username').html(save_username);
                      $tr.find('.need_age').html(save_age);
                      $tr.find('.need_name').html(save_name);
                      $tr.find('.need_professional').html(save_professional);  
                     $('.re_content').html('修改成功');  
                     $('#result').modal('show'); 

                    }
               });
            });

        });

     
      
        $('.delete').click(function(){
          var url="/hospital/admin/delete.action";
          var username = $(this).parent().parent().parent().find('.need_username').html();
          var $tr = $(this).parent().parent().parent();
          $.post(url,{'username':username},function(req_data){
              if(req_data.result=="200"){
                $('.re_content').html('删除成功');  
                $tr.hide();
                $('#result').modal('show'); 
              }else{
                $('.re_content').html('删除失败');
                $('#result').modal('show'); 
              }
          });
        });
    });
</script>
</body>
</html>