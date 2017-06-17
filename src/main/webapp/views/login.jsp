<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <meta name="keywords" content="Spring,mybatis,shiro,erp,bmis">
    <meta name="description" content="webgate 登录系统">
    <meta name="viewport" content="width=device-width">
    <%@ include file="/commons/basejs.jsp" %>
    <link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/common.css" />
    <script type="text/javascript" src="${staticPath }/static/login.js?v2016122612" charset="utf-8"></script>
    
      <style>
        html,body{
            width:100%;
            height:100%;
            background:url(${staticPath }/static/style/images/goin.jpg);
            background-size:100% 100%;
            overflow: hidden;
        }
    </style>
    
</head>
<body class="goinbody">
  <div class="goinLogo">
      <img src="${staticPath }/static/style/images/goinlogo.png" alt="">
  </div>
  <form method="post" id="loginform">
  <div class="goin">
      <div class="goin_user">
          <input class="goinInp" type="text" id="username" name="username"  placeholder="请输入用户名" value="webgate" />
      </div>
      <div class="goin_password">
          <input class="goinInp" type="password" id="password" name="password" placeholder="请输入密码" value="123456" />
      </div>
      <div class="goin_code">
         
          <input id="validateCode" class="goinInp2" type="text" name="validateCode" placeholder="请输入验证码" value="" />
             
			<img src="${staticPath}/CheckCode" id="yzmPic" onclick="reloadCheckCode()" style="cursor:pointer;" title="点击刷新验证码"/>
			<a href="#" onclick="reloadCheckCode()" data-action="reload">
				<i class="icon-refresh"></i>
			</a>
      </div>
      <div>
      	  <p class="remember2">
      	  	<input type="checkbox"  id="rememberMe" name="rememberMe" value="yes">
      	  	记住账号
      	  </p>
          <input type="button" class="goinInp3" value="登录" onclick="enterlogin()">
      </div>
  </div>
</form>
</body>
</html>
