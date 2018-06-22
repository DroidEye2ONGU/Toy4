<%--
  Created by IntelliJ IDEA.
  User: DroidEye
  Date: 2018/5/15
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询商品列表</title>
    <link rel="stylesheet" type="text/css"
          href="/js/jquery-easyui-1.4.1/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="/css/taotao.css"/>
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
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
                <li><a href="/page/addToy">新增商品</a></li>
                <li><a href="/page/manageToy">管理商品</a></li>
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
    </form>
    订单列表：
    <form name="toy" method="post">
        <table width="100%" border=1>
            <tr>
                <td>订单编号</td>
                <td>发货快递</td>
                <td>收货人</td>
                <td>商品总价</td>
                <td>订单状态</td>
                <td>快递编号</td>
                <%--<td>操作</td>--%>
            </tr>

            <c:forEach items="${orderList }" var="item" varStatus="s">
            <tr>
                <input type="hidden" value="${item.orderId}" name="orderId"/>
                    <%--订单编号--%>
                <td>${item.orderId}

                </td>

                    <%--购买人--%>
                <td>${item.shippingName}</td>

                    <%--收货人--%>
                <td>${item.username}</td>

                    <%--商品总价--%>
                <td>${item.payment}</td>

                    <%--订单状态--%>
                <td>
                    <c:choose>
                        <c:when test="${item.status == '1'}">
                            待处理

                        </c:when>
                        <c:otherwise>
                            已处理
                        </c:otherwise>
                    </c:choose>
                </td>
                    <%--快递编号--%>
                <td>
                    <c:choose>
                        <c:when test="${item.status == '1'}">
                            未发货,输入订单号并确认自动发货
                            <input name="shippingCode"/>
                        </c:when>
                        <c:otherwise>
                            ${item.shippingCode}
                            <input  type="hidden" name="shippingCode"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                    <%--<td>--%>
                    <%--<a href="${pageContext.request.contextPath}/admin/deleteToy?id=${item.id}">删除</a>--%>
                    <%--</td>--%>
            </tr>
            </c:forEach>
            <input type="button" value="发货" onclick="modifySubmit()"/>
    </form>
    <script>
        function modifySubmit() {
            document.toy.action = "/toyorder/changeorders";
            document.toy.submit();
        }

        // function deleteSubmit() {
        //     document.toy.action = "/admin//deleteToy";
        //     document.toy.submit();
        // }
    </script>
    </table>


</div>
</body>

<script type="text/javascript">
    $(function () {
        $('#menu').tree({
            onClick: function (node) {
                if ($('#menu').tree("isLeaf", node.target)) {
                    var tabs = $("#tabs");
                    var tab = tabs.tabs("getTab", node.text);
                    if (tab) {
                        tabs.tabs("select", node.text);
                    } else {
                        tabs.tabs('add', {
                            title: node.text,
                            href: node.attributes.url,
                            closable: true,
                            bodyCls: "content"
                        });
                    }
                }
            }
        });
    });
</script>
</html>