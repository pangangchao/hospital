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
  <link rel="stylesheet" href="../../Public/Patient/register.css">
</head>
 <body >
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
       <li class="active show">
          <a href="#"><span class="icon-accessibility"></span>&nbsp;病人管理 <span class="glyphicon glyphicon-menu-down" style="margin-left: 60px;"></span></a>
           <ul class="nav">
            <li ><a href="/hospital/patient/all.action">住院人登记表管理</a></li>
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
  <div id="main"  style="max-width: 1032px; margin-bottom: 100px;">

    <article>
    <section id='form' class="page-section">
      <div class="page-header"><h1>住院人登记表单</h1></div>
      <h3>信息</h3>
      <h4>基本信息填写</h4>
      <div class='panel'>
        <div class='panel-heading'>创建</div>
        <div class='panel-body'>

        <form class="form-horizontal" role="form" method='post'>
          

          <div class="form-group">
            <label class="col-md-2 control-label">姓名</label>
            <div class="col-md-6">
               <input type='text' name='name' id='patient-name' placeholder=请输入姓名 class='form-control' />
            </div>
          </div>
          
           <div class="form-group" >
            <label class="col-md-2 control-label">年龄</label>
            <div class="col-md-6 ">
               <input type='text' name='patient_age' value='' class='form-control' placeholder=''/>
    
            </div>
          </div>

            <div class="form-group" >
            <label class="col-md-2 control-label">过敏史</label>
            <div class="col-md-6 ">
               <input type='text' name='allergic' value='' class='form-control' placeholder=''/>
            </div>
          </div>
      <div class="form-group">
        <label for="" class="col-md-2 control-label">性别</label>
        <div class="col-md-6">
          <label class="radio-inline">
            <input type="radio" name="patient-sex" id="man" value="1"  selected='true'> 男
        
         </label>
           <label class="radio-inline">
            <input type="radio" name="patient-sex" id="woman" value="2"> 女
         </label>
        </div>  
      </div>  
       <div class="form-group">
              <label class="col-md-2 control-label">身份证号</label>
              <div class="col-md-6 has-error">
                 <input type='text' name='patient-id-card'  value='' class='form-control' placeholder=''/>
     
              </div>
           </div>
    

          <div class="form-group">
            <label class="col-md-2 control-label">地址</label>
            <div class="col-md-10 ">
               <input type='text' name='patient-address'  value='' class='form-control' placeholder=''/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-md-2 control-label">职业</label>
            <div class="col-md-10 ">
               <input type='text' name='patient-professional'  value='' class='form-control' placeholder=''/>
            </div>
          </div>
      <div class="form-group">
            <label class="col-md-2 control-label">病房</label>
            <div class="col-md-4">
               <input type='text' name='sickselectdetail' id='title' value='' class='form-control' placeholder='' disabled="true" />
            </div>
            <a class="btn btn-primary" class="selectWard" data-position="fit" data-toggle="modal" data-target="#selectWard" >选择病房</a>
          </div>

         <div class="form-group">
            <label class="col-md-2 control-label">所属科室</label>
            <div class='col-md-4'>
              <select name='original' id='where-department' class='form-control'>
          
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
              <textarea name='content' id='content' rows='10' class='form-control'></textarea>
            </div>
          </div>
          
         
         

          <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
               <a id='submit' class='btn btn-primary'  data-loading='稍候...' >保存</a> 
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
    
    <section id="selectSickRoom">
        <div class="modal fade" id="selectWard">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
            <h4 class="modal-title">选择病房</h4>
          </div>
          <div class="modal-body">
          
          <c:forEach items="${wards}" var="ward">
	             <div class="col-md-4">
	                <div class="panel panel-info">
	                   <div class="panel-heading sickroomName">${ward.name}</div>
	                   <div class="panel-body">
	                    <p>编号：<span class="sickroomNum">${ward.wid}</span></p>
	                     <p>病房情况(已经/所有)：<span class="hasNum">${ward.bedNum - ward.emptyBedNum}</span>/<span class="allbedNum">${ward.bedNum}</span></p> 
	                    <a class="btn btn-success enter" data-dismiss="modal" data-position="fit" data-toggle="modal" data-target="#sickbedNum">进入</a>
	                   </div> 
	                </div>
	              </div>
          
          </c:forEach>
         


          </div>
          <div class="modal-footer">
          
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    </section>

    <section id="bed_num">
        <div class="modal fade" id="sickbedNum">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">选择床位</h4>
              </div>
              <div class="modal-body beds">

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a type="button" class="btn btn-primary " data-dismiss="modal" data-position="fit" data-toggle="modal" data-target="#selectWard">返回重新选择门诊科</a>
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
  <script type="text/javascript">
    $(document).ready(function(){
        var selectSickRoomId;//病房号
        var selectSickName;//病房名称
        
        var selectSickBedId;//病床号 
        var $selectWard;//选择病房
        function funselectRoom(){
            var $obj = $('.enter').parent().parent();
            selectSickRoomId = $obj.find('.sickroomNum').html();
     
  
        }

       $('body').on('click','.selectBed',function(){
         funselectRoom();
           selectSickName=   $(this).parent().parent().parent().find('.department').html();
          selectSickBedId =$(this).parent().find('.sickroomBedNum').html();
          $('input[name=sickselectdetail]').val("病房名称:"+selectSickName+",病房编号:"+selectSickRoomId+",病床编号:"+selectSickBedId);
          $('#sickbedNum').modal('hide');

        });

        $('.hasNum').each(function(key,num){
          var num1 = $(this).html();
          var num2 =$(this).parent().find('.allbedNum').html();
          if(num1==num2){
            $(this).parent().parent().find('.enter').addClass('disabled','true');
          }
        });


        
        $('.enter').click(function(event) {
          /* Act on the event */
          var id = $(this).parent().find('.sickroomNum').html().trim();
          $selectWard=  $(this).parent().find('.hasNum');
          var url = "/hospital/hospitalbed/bedinfo.action";
          $.post(url,{'id':id},function(req_data){
             var s =$.parseJSON(req_data.result);
             var beds="";
             for(var i=0;i<s.length;i++){

                 var bed;
                 if(s[i].state=="0"){
                  bed="<div class='col-md-4'>"+
                  "<div class='panel panel-info'>"+
                   " <div class='panel-heading department'>"+s[i].name+"</div>"+
                    " <div class='panel-body'> "+
                    "    <p>编号：<span class='sickroomBedNum'>" +s[i].id+ "</span></p>"+
                    "    <p>情况:没人</p>"+ 
                    "   <a class='btn btn-success selectBed' >选择</a>"+
                    " </div>"+ 
                 " </div>"+ 
                "</div>";
                 }else{
                  bed="<div class='col-md-4'>"+
                  "<div class='panel panel-danger'>"+
                   " <div class='panel-heading'>"+s[i].name+"</div>"+
                    " <div class='panel-body'> "+
                    " <p>编号：<span >" +s[i].id+ "</span></p>"+
                    "    <p>情况:有人</p>"+ 
                    "   <a class='btn btn-default disabled '  >选择</a>"+
                    " </div>"+ 
                 " </div>"+ 
                "</div>";
                 }
                 
                beds+=bed;
              
             }
               $('.beds').html(beds);
          

          });
        });


        function clearData(){
             $('input[name=name]').val(" ");
             $('input[name=patient_age]').val(" ");
             $('#man').attr("checked",true);
             $('input[name=patient-id-card]').val(" ");
             $('input[name=patient-address]').val(" ");
             $('input[name=patient-professional]').val(" ");
             $('#content').val(" ");
             $('#where-department').get(0).options[0].selected = true;
             $('input[name=sickselectdetail]').val(" ");
             $('input[name=allergic]').val(" ");
             selectSickRoomId=0;
             selectSickBedId=0;
        }
        
        $('#submit').click(function(){
            var patient_name = $('input[name=name]').val();
            var patient_age = $('input[name=patient_age]').val();
            var patient_sex  = $('input[name=patient-sex]').val();
            var parient_id_card = $('input[name=patient-id-card]').val();
            var patient_address = $('input[name=patient-address]').val();
            var patient_professional = $('input[name=patient-professional]').val();
            var patient_content = $('#content').val();
            var where_department =$('#where-department').val();
            var allergic = $('input[name=allergic]').val();

          var url = "/hospital/patient/register.action";  
          var data ={'name':patient_name,'sex':patient_sex, 'age':patient_age, 'identity_card': parient_id_card, 'address':patient_address,'professional':patient_professional, 'department_id':where_department,'sickroomId':selectSickRoomId,'content':patient_content,'bedId':selectSickBedId,'allergic_History':allergic};
          $.post(url,data,function(re_data){
            if(re_data.result=="200"){
                 $('.re_content').html("添加成功"); 
                 clearData();
                 $('#result').modal('show');
                  var ward__has_num_select= parseInt($selectWard.html());
                  $selectWard.html(ward__has_num_select+1);
           

                $('.hasNum').each(function(key,num){
                  var num1 = $(this).html();
                  var num2 =$(this).parent().find('.allbedNum').html();
                  if(num1==num2){
                    $(this).parent().parent().find('.enter').addClass('disabled','true');
                  }
                });


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