<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
        <li class="menu selected"><span class=" glyphicon glyphicon-home"></span>&nbsp;<a href="/hospital/ward/manage.action">病房管理</a></li>
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
       <li >
          <a href="#"><span class="icon-accessibility"></span>&nbsp;病人管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 60px;"></span></a>
           <ul class="nav">
            <li><a href="/hospital/patient/all.action">住院人登记表管理</a></li>
            <li  ><a href="/hospital/patient/dealOutHospital.action">住院人出院办理</a></li>
          </ul>
        </li>
        <li class="show active" ><a href="#"><span class=" glyphicon glyphicon-home"></span>&nbsp;病房管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 64px;"></span></a>
           <ul class="nav">
                <li><a href="/hospital/ward/add.action">病房添加<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 69px;  color: #F01378;"></span></a></li>
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
  <div id="main" style="max-width: 1060px;">

    <article>
    <section id='form' class="page-section">
      <div class="page-header"><h1>病房登记表单</h1></div>
      <h3>信息</h3>
      <h4>基本信息填写</h4>
      <div class='panel'>
        <div class='panel-heading'>创建</div>
        <div class='panel-body'>

        <form class="form-horizontal" role="form" method='post'>
          <div class="form-group">
            <label class="col-md-2 control-label">病房名称</label>
            <div class="col-md-6">
               <input type='text' name='name'   class='form-control' />
            </div>
          </div>

        <div class="form-group">
            <label class="col-md-2 control-label">病房拥有床铺个数</label>
            <div class="col-md-6">
               <input type='text' name='bedNum'   class='form-control' />
            </div>
          </div>


    


         <div class="form-group">
            <label class="col-md-2 control-label">所属科室</label>
            <div class='col-md-4'>
              <select name='department' id='department' class='form-control'>
          
                <option value="1" selected='selected'>内科</option>
                <option value="2">外科</option>
                <option value="3">儿科</option>
                <option value="4">妇科</option>
                <option value="5">眼科</option>
                <option value="6">耳鼻喉科</option>
                <option value="7">口腔科</option>
                <option value="8">皮肤科</option>
                <option value="9">中医科</option>
                <option value="10">针灸推拿科</option>
                <option value="11">心理咨询室</option>
                <option value="12">呼吸内科</option>
                <option value="13">消化内科</option>
                <option value="14">泌尿内科</option>
                <option value="15">心内科</option>
                <option value="16">血液科</option>
                <option value="17">内分泌科</option>
                <option value="18">神经内科</option>
                <option value="19">小儿科</option>
                <option value="20">感染科</option>
                <option value="21">普外科</option>
                <option value="22">骨科</option>
                <option value="23">血透室</option>
                <option value="24">产科</option>
                <option value="25">妇科</option>
                <option value="26">神经外科</option>
                <option value="27">肝胆外科</option>
                <option value="28">泌尿外科</option>
                <option value="29">烧伤科</option>
        
              </select>
            </div>
           </div>


      

          <div class="form-group">
            <label class="col-md-2 control-label">开设病房原因</label>
            <div class="col-md-10">
              <textarea name='content' id='reason' rows='10' class='form-control'></textarea>
            </div>
          </div>


          <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
               <a  class='btn btn-primary save' data-loading='稍候...' >保存</a>
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
       function clearDate(){
           $('input[name=name]').val(" ");
           $('input[name=bedNum]').val(" ");
           $('#department').get(0).options[1].selected=true;
           $('#reason').val("");
       }
       $('.save').click(function(event) {
         /* Act on the event */
          var name = $('input[name=name]').val();
          var bedNum = $('input[name=bedNum]').val();
          var departmentId = $('#department').val();
          var reason = $('#reason').val();
          var data = {'name':name,'bedNum':bedNum,'departmentId':departmentId,'reason':reason};
          var url = "/hospital/wardmanage/add.action";
          $.post(url,data,function(req_data){
             if(req_data.result=="200"){
                $('.re_content').html("添加成功");
                $('#result').modal('show');
                clearDate();
             }else{
                   $('.re_content').html("添加失败");
                  $('#result').modal('show');
             } 
          });
       });
    });
  </script>
</body>
</html>
