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
  <link rel="stylesheet" href="../../Public/Patient/register.css">
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
       <li class="show active" >
          <a href="#"><span class="icon-accessibility"></span>&nbsp;病人管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 60px;"></span></a>
           <ul class="nav">
            <li ><a href="/hospital/patient/all.action">住院人登记表管理<span class="glyphicon glyphicon-chevron-right" style="  margin-left: 13px;  color: #F01378;"></span></a></li>
            <li><a href="/hospital/patient/dealOutHospital.action">住院人出院办理</a></li>
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
  <div id="main" style="  max-width: 1052px;">
    <article>
    <section id="buttons" class="page-section " >
      <h1 class="header-dividing">住院人登记表管理</h1>
    
      <p>根据编号查询住院人</p>
  
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
                    <th>性别</th>
                    <th>年龄</th>
                    <th>住院时间</th>
                    <th>出院时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${patients}" var="patient" varStatus="status">
                  <tr>
                    <input type="hidden" name="id" value="${patient.id}">
                    <input type="hidden" name="identity_card" value="${patient.identity_card }"/>
                    <input type="hidden" name="professional" value="${patient.professional }"/>
                    <input type="hidden" name="allergic_history" value="${patient.allergic_History }"/>
                    <input type="hidden" name="bed_num" value="${patient.bedId }"/>
                    <input type="hidden" name="address" value="${patient.address }"/>
                    <input type="hidden" name="where_department" value="${patient.department_id}"/>
                    <input type="hidden" name="sickcontent" value="${patient.content }">
                    <input type="hidden" name="sex" value="${patient.sex }">
                    <td class="id">${status.index }</td>
                    <td class="username">${patient.username}</td>
                     <td class="name">${patient.name }</td>
                    <td class="sex">
                        <c:if test="${patient.sex ==1}">男</c:if> 
                        <c:if test="${patient.sex ==2}">女</c:if> 
                        
                     </td> 
                    <td class="age">${patient.age }</td>
                   
                    <td class="admission_time">${patient.admission_time }</td>
                    <td class="dismiss_time">${ patient.discharge_time}</td>
                    <td>
                      <div class="btn-group">
                        <button class="btn btn-warning edit" data-position="fit" data-toggle="modal" data-target="#edit_modal"> <span class="glyphicon glyphicon-edit"></span>修改</button>
                        <button class="btn btn-danger delete"  data-position="fit" data-toggle="modal" data-target="#delete_modal"><span class="glyphicon glyphicon-trash"></span>删除</button>
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


    <section id="delete">
      <div class="modal fade" id="delete_modal">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
              删除成功
              </div>
           <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>

    </div>
    </section>
    <!--模拟框-->
    <section id="edit">
        <div class="modal fade" id="edit_modal">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title">住院人登记表修改</h4>
              </div>
              <div class="modal-body">
             <form class="form-horizontal" role="form" method='post'>
              <div class="form-group">
                <label class="col-md-2 control-label">住院编号</label>
                <div class="col-md-6 ">
                   <input type='text' name='edit-username' id='title' value='' class='form-control' placeholder='' disabled="true" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">姓名</label>
                <div class="col-md-6">
                   <input type='text' name='edit-name' id='patient-name' placeholder=请输入姓名 class='form-control' />
                </div>
              </div>
               <div class="form-group">
                <label class="col-md-2 control-label">年龄</label>
                <div class="col-md-6 ">
                   <input type='text' name='edit-age' id='title' value='' class='form-control' placeholder=''/>
                </div>
              </div>

               <div class="form-group">
                    <label class="col-md-2 control-label">有无过敏史</label>
                    <div class="col-md-6 ">
                       <input type='text' name='edit-allergic_history' id='title' value='' class='form-control' placeholder=''  />
                    </div>
                  </div>
                 <div class="form-group">
                    <label class="col-md-2 control-label">进院时间</label>
                    <div class="col-md-6 ">
                       <input type='text' name='edit-admission_time' id='title' value=''  class='form-control' placeholder='' disabled="true"/>
                    </div>
                  </div>

                   <div class="form-group">
                    <label class="col-md-2 control-label">出院时间</label>
                    <div class="col-md-6 ">
                       <div class="input-group date form-datetime col-md-6" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">

                        <input class="form-control col-md-12" name="edit-dismiss_time" size="16" type="text" value="" readonly>
                        <span class="input-group-addon" style="background-color:#FFF"><span class="icon-th"><span class="glyphicon glyphicon-time"></span></span></span>
                    </div>
                       <input type="hidden" id="dtp_input1" value="" /><br/>
                    </div>
                  </div>  



              <div class="form-group">
                <label for="" class="col-md-2 control-label">性别</label>
                <div class="col-md-6">
                  <label class="radio-inline">
                    <input type="radio" name="edit-sex1" class="disabled" disabled id="edit-man" value="1" > 男
                 </label>
                   <label class="radio-inline">
                    <input type="radio" name="edit-sex1" class="disabled" disabled id="edit-gril" value="2"> 女
                 </label>
                </div>  
              </div>  
              <div class="form-group">
                <label class="col-md-2 control-label">身份证号</label>
                <div class="col-md-6 has-error">
                   <input type='text' name='edit-identity_card' id='title' value='' class='form-control' placeholder='' disabled="true"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">地址</label>
                <div class="col-md-10 ">
                   <input type='text' name='edit-address' id='title' value='' class='form-control' placeholder=''/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">职业</label>
                <div class="col-md-10 ">
                   <input type='text' name='edit-professional' id='title' value='' class='form-control' placeholder=''/>
                </div>
              </div>
               <div class="form-group">
                  <label class="col-md-2 control-label">所属科室</label>
                  <div class='col-md-4'>
                    <select class='edit-where_department' id='original' class='form-control'>
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
                    <label class="col-md-2 control-label">住院原因</label>
                    <div class="col-md-10">
                      <textarea name='edit-content' disabled id='content' rows='10' class='form-control'></textarea>
                    </div>
                  </div>
              
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary save">保存</button>
              </div>
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
  <script type="text/javascript" src="../../Public/Static/zui/dist/lib/datetimepicker/datetimepicker.min.js"></script>
<script>
  $(document).ready( function () {
         $('#bootstrap-table').bdt();
   
         $('.edit').click(function(){
          //讲数据放到
            //打开时间选择器
            $('.form-datetime').datetimepicker(
            {

                weekStart: 1,
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                format: 'yyyy-mm-dd hh:ii'
            });
        
            var $thistr=$(this).parent().parent().parent();
            var username=$thistr.find('.username').html();
            var id=$thistr.find('input[name=id]').val();
            var name=$thistr.find('.name').html();
            var age =$thistr.find('.age').html();
            var admission_time=$thistr.find('.admission_time').html();
            var dismiss_time = $thistr.find('.dismiss_time').html();
            var identity_card =$thistr.find('input[name=identity_card]').val();
            var professional  = $thistr.find('input[name=professional]').val();
            var bed_num = $thistr.find('input[name=bed_num]').val();
            var address = $thistr.find('input[name=address]').val();
            var where_department = $thistr.find('input[name=where_department]').val();
            var allergic_history = $thistr.find('input[name=allergic_history]').val();  
            var sex = $thistr.find('input[name=sex]').val();  
            var sickcontent =$thistr.find('input[name=sickcontent]').val();
            //赋值账号
        

            $('input[name=edit-username]').val(username); 
            $('input[name=edit-admission_time]').val(admission_time); 
            $('input[name=edit-name]').val(name); 
            $('input[name=edit-dismiss_time]').val(dismiss_time); 
            $('input[name=edit-identity_card]').val(identity_card); 
            $('input[name=edit-professional]').val(professional); 
            $('input[name=edit-bed_num]').val(bed_num); 
            $('input[name=edit-address]').val(address); 
            $('input[name=edit-age]').val(age)  ;
            sex==1? $("#edit-man").attr("checked",true): $("#edit-gril").attr("checked",true); 
            $('.edit-where_department').get(0).options[where_department].selected = true; 
            $('input[name=edit-allergic_history]').val(allergic_history); 
            $('#content').html(sickcontent); 

          
            
              $(".save").click(function(){
                   var change_name= $('input[name=edit-name]').val();
                   var change_age = $('input[name=edit-age]').val();
                   var change_sex = $('input[name=edit-sex1]').val(); 
                   var change_allergic_history= $('input[name=edit-allergic_history]').val();
                   var change_dismiss =  $('input[name=edit-dismiss_time]').val();
                   var change_department_id= $('.edit-where_department').val();
                   var change_content=   $('#content').html();
                   var change_professional=$('input[name=edit-professional]').val();
                   var change_address= $('input[name=edit-address]').val();
                 var url = "/hospital/patient/update.action"; 


             var data ={'id':id,'name':change_name,'sex':change_sex, 'age':change_age, 'address':change_address,'professional':change_professional, 'department_id':change_department_id,'content':change_content,'allergic_History':change_allergic_history,'identity_card':identity_card,'admission_time':admission_time,'username':username,'bedId':bed_num,'discharge_time':change_dismiss};
                $.post(url,data,function(re_data){
                  if(re_data.result=="200"){
                      $('#result').modal('show');
                      $('.re_content').html("修改成功");
                      $('#edit_modal').modal('hide');
                      location.reload();
                  }else{

                      $('#result').modal('show');
                      $('.re_content').html("修改失败");
                      $('#edit_modal').modal('hide');
                  }    
                });
              });
        }); 

        $('.delete').click(function(){
             var url = "/hospital/patient/delete.action"; 
             var  selectUsername = $(this).parent().parent().parent().find('.username').html();
 
             $.post(url,{'username':selectUsername},function(req_data){
                if(req_data.result=="200"){
                   $('.re_content').html("删除成功");
                   $('#result').modal('show');
                   setTimeout(function(){
                     location=reload();
                   }, 1000);
                    
                }else{
                  
                    $('.re_content').html("删除失败");
                      $('#result').modal('show');
                }
             });
            $(this).parent().parent().parent().hide();
        }); 

    });
</script>

</body>
</html>