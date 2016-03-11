<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <li><a href="/hospital/ward/add.action">病房添加</a></li>
                <li class="active"><a href="/hospital/ward/manage.action">病房管理<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 69px;  color: #F01378;"></span></a></li>
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
  <div id="main"style="max-width: 1060px;">
    <article>
    <section id="buttons" class="page-section " >
      <h1 class="header-dividing">病房管理</h1>
    
      <p>病房编号是病房唯一标识</p>
  
    </section>
      <section  >

      <div class="container">
    <div class="row">
        <div class="col-md-10">


            <table class="table table-hover" id="bootstrap-table">
                <thead>
                <tr>
                    <th>#ID</th>
                    <th>病房编号</th>
                    <th>病房名称</th>
                    <th>病房床位个数</th>
                    <th>病房空位置个数</th>
                    <th>所属科室编号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${wards}" varStatus="status" var="ward">
	                <tr>
                      <input type="hidden" name="reason" value="${ward.reason}">
	                    <td>${status.index }</td>
	                    <td class="wid">${ward.wid}</td>
                      <td class="name">${ward.name}</td>
	                    <td class="bedNum">${ward.bedNum}</td>
                      <td class="emptyBedNum">${ward.emptyBedNum}</td>
                      <td class="department">${ward.department.id}</td>
	                    <td>
	                      <div class="btn-group">
	                        <button class="btn btn-warning edit"> <span class="glyphicon glyphicon-edit"></span>修改</button>
	                        <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>删除</button>
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

    <section id="editWard">
      <div class="modal fade" id="edit-ward">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title">修改病房基础设置</h4>
            </div>
            <div class="modal-body">
                  

        <form class="form-horizontal" role="form" method='post'>
          <div class="form-group">
            <label class="col-md-2 control-label">病房编号</label>
            <div class="col-md-6">
               <input type='text' name='wid'  disabled class='form-control' />
            </div>
          </div>

          <div class="form-group">
            <label class="col-md-2 control-label">病房名称</label>
            <div class="col-md-6">
               <input type='text' name='name'   class='form-control' />
            </div>
          </div>

        <div class="form-group">
            <label class="col-md-2 control-label">病房拥有床铺个数</label>
            <div class="col-md-6">
               <input type='text' name='bedNum' disabled  class='form-control' />
            </div>
          </div>
        <div class="form-group">
            <label class="col-md-2 control-label">病房空床铺个数</label>
            <div class="col-md-6">
               <input type='text' name='emptyBedNum' disabled  class='form-control' />
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


            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
              <button type="button" class="btn btn-primary save">保存</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
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
  
          
          $('.edit').click(function(event) {
            /* Act on the event */
              var $tr = $(this).parent().parent().parent();
              var wid = $tr.find('.wid').html();
              var name= $tr.find('.name').html();
              var reason = $tr.find('input[name=reason]').val();
              var bedNum= $tr.find('.bedNum').html();
              var emptyBedNum = $tr.find('.emptyBedNum').html();
              var department = $tr.find('.department').html();

              $('input[name=wid]').val(wid);
              $('input[name=name]').val(name);
              $('#reason').val(reason);
              $('input[name=bedNum]').val(bedNum);
              $('input[name=emptyBedNum]').val(emptyBedNum);
              $('#department').get(0).options[department-1].selected= true; 

              $('#edit-ward').modal('show');  

              $('.save').click(function(){
                  var departmentId =  $('#department').val();
                  var name =   $('input[name=name]').val();
                  var reason = $('#reason').val();
                  var data={'departmentId':departmentId,'name':name,'wid':wid,'reason':reason};
                  var url = "/hospital/wardmanage/update.action";
                  $.post(url,data,function(req_data){
                    if(req_data.result=="200"){
                      $('#edit-ward').modal('hide');
                      //更新页面数值
                      $tr.find('.name').html(name);
                      $tr.find('input[name=reason]').val(reason);
                      console.log(reason);
                      $tr.find('.department').html(departmentId);

                      $('.re_content').html('更新成功');
                      $('#result').modal('show');

                    }else{
                      $('.re_content').html('更新失败');
                      $('#result').modal('show');
                    }
                  });
              });

          });
        


    });
</script>

</body>
</html>