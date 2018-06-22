<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>玩具商城后台管理系统</title>
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
    <div id="tabs" class="easyui-tabs">
        <div title="首页" style="padding:20px;">
            欢迎管理员<c:out value='${adminAccountName}'/>
        </div>
    </div>

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