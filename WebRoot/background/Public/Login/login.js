$(document).ready(function(){

	$('input[name=username]').change(function(){
		var name = $(this).val();
		if(name!=""){
			$('.ckname').html("");
		}

	});
	$('input[name=password]').change(function(){
		var pwd = $(this).val();
		if(pwd!=""){
			$('.ckpwd').html("");
		}
		
	});

	$('.login-btn').click(function(){
		var username = $('input[name="username"]').val().trim();
		var password = $('input[name="password"]').val().trim();

		if(username=="")
			$('.ckname').html('<span class="glyphicon glyphicon-info-sign"></span>用户名不能为空').css('color','red');
		if(password=="")
			$('.ckpwd').html('<span class="glyphicon glyphicon-info-sign"></span>密码不能为空').css('color','red');
		
		if(username!="" &&password!=""){
				var url="/hospital/admin/login.action";
        $.post(url,{'username':username,'password':password},function(data){
        		if(data.result=="200"){	
        				location.href="/hospital/background/Application/Home/home.jsp";
        		}
        		else{
        			$('#result').modal('show');
        		}
        });	
		}

	});


			
});