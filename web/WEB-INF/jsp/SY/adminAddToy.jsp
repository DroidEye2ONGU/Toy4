<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2018/5/15
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/css/taotao.css" />
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <style type="text/css">
        .content {
            padding: 10px 10px 10px 10px;
        }
    </style>
</head>
<body class="easyui-layout">
<script type="text/javascript">
    var isAddedSucceed = ${isAddedSucceed};
    if (isAddedSucceed + "" == "false") {
        alert("添加玩具失败");
    } else {
        alert("添加玩具成功");
    }


</script>
<div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    <ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
        <li>
            <span>商品管理</span>
            <ul>
                <li><a href="/page/queryToy">查询商品内容</a></li>
                <li><a href="/page/addToy">新增商品</a> </li>
                <li><a href="/page/manageToy" >管理商品</a></li>
            </ul>
        </li>
        <li>
            <span>订单管理</span>
            <ul>
                <li><a href="/page/queryOrders">查询订单</a></li>
                <li><a href="/toyorder/changeToyOdersSearch">修改订单状态</a></li>
            </ul>
        </li>
        <%--<li>--%>
            <%--<span>广告更新</span>--%>
            <%--<ul>--%>
                <%--<li><a href="">首页轮播图内容修改</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    </ul>
</div>
<div data-options="region:'center',title:''">
    <%--<form action="/admin/addToy" method="post" enctype="multipart/form-data">--%>
        <%--<input type="text" name="a"/>--%>
        <%--<input type="file" name="picture"/>--%>
        <%--<input type="submit" value="submit"/>--%>
    <%--</form>--%>
商品列表：
<form ACTION="/admin/addToy" name="toy" method="post" enctype="multipart/form-data">
    <table width="100%" border=1>
        <tr>
            <td>商品名称</td>
            <td>商品标题</td>
            <td>商品卖点</td>
            <td>商品品牌</td>
            <td>商品分类</td>
            <td>商品价格</td>
            <td>库存数量</td>
            <td>商品图片1</td>
            <td>商品图片2</td>
            <td>商品图片3</td>
        </tr>
            <tr>
                <td><input type="text" name="itemName"></td>
                <td><input type="text" name="title"></td>
                <td><input type="text" name="sellPoint"></td>
                <td><input type="text" name="brand"></td>
                <td><input type="text" name="fenlei"></td>
                <td><input type="text" name="price"></td>
                <td><input type="text" name="num"></td>

                <td>
                    <input type="file" name="files">
                </td>
                <td>
                    <input type="file" name="files">
                </td>
                <td>
                    <input type="file" name="files">
                </td>
                <td>
                    <input type="submit" value="添加">
                </td>
            </tr>
    </table>
</form>
</div>
<script type="text/javascript">
    $(function(){
        $('#menu').tree({
                            onClick: function(node){
                                if($('#menu').tree("isLeaf",node.target)){
                                    var tabs = $("#tabs");
                                    var tab = tabs.tabs("getTab",node.text);
                                    if(tab){
                                        tabs.tabs("select",node.text);
                                    }else{
                                        tabs.tabs('add',{
                                            title:node.text,
                                            href: node.attributes.url,
                                            closable:true,
                                            bodyCls:"content"
                                        });
                                    }
                                }
                            }
                        });
    });
</script>
</body>
</html>
