<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2018/5/15
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="/WEB-INF/js/jquery-easyui-1.4.1/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/WEB-INF/js/jquery-easyui-1.4.1/themes/icon.css"/>
    <script type="text/javascript" src="/WEB-INF/js/jquery-1.6.4.js"></script>
    <script type="text/javascript" src="/WEB-INF/js/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="/WEB-INF/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>

</head>

<script type="text/javascript">
    var isWrong = ${isWrongAccount};
    if (isWrong+ ""== "false") {
        alert("用户名或密码错误,请重新输入");
    }


</script>

<script type="text/javascript">
    var newAccountID = ${newAccountID};
    alert("您的ID为:" + newAccountID.toString() + ",请牢记您的登陆凭证!登陆信息已自动为您录入,请直接登录");

</script>

<body style="background-color: #F3F3F3">

<center>
<form id="adminLogin" action="/admin/adminLogin" method="post" onsubmit="return isEmptyCheck(this)">
    <div class="easyui-dialog" title="管理员登录" data-options="closable:false,draggable:false"
         style="width:400px;height:300px;padding:10px;">
        <div style="margin-left: 50px;margin-top: 50px;">
            <div style="margin-bottom:20px;">
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID: <input name="id" class="easyui-textbox" data-options="required:true"
                                style="width:200px;height:32px" value="<c:out value='${newAccountID}'/>"/>
                </div>
            </div>
            <div style="margin-bottom:20px">
                <div>
                    密&nbsp;&nbsp;码: <input name="password" class="easyui-textbox" type="password"
                                           style="width:200px;height:32px" data-options=""
                                           value="<c:out value='${newAccountPassword}'/>"
                />
                </div>
            </div>
            <div>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="登陆">

            </div>
        </div>
    </div>

    <script type="text/javascript">
        function value_required(field) {
            with (field) {
                if (value == null || value.trim() == "") {
                    return false;
                } else {
                    return true;
                }
            }
        }

        function isEmptyCheck(thisform) {
            with (thisform) {
                var errMessage = "";
                if (value_required(id) == false) {
                    id.focus();
                    errMessage += "\nID不能为空";
                }
                if (value_required(password) == false) {
                    password.focus();
                    errMessage += "\n密码不能为空";
                }

                if (errMessage != "") {
                    alert(errMessage);
                    return false;
                } else {
                    return true;
                }
            }
        }
    </script>

</form>
</center>
</body>
</html>
