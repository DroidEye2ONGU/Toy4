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
    <form action="/admin/modifyToy" method="post">

    </form>

    商品列表：
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
            <td>操作</td>
        </tr>
        <form action="/admin/modifyToy" name="toy" method="post" enctype="multipart/form-data">

            <c:forEach items="${itemList}" var="item" varStatus="s">
                <tr>


                    <input type="hidden" name="items[${s.index}].id"
                           value="<c:out value=' ${item.id}'/>">


                    <td>
                        <input type="text" name="items[${s.index}].itemName"
                               value="<c:out value=' ${item.itemName}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].title"
                               value="<c:out value=' ${item.title}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].sellPoint"
                               value="<c:out value=' ${item.sellPoint}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].brand"
                               value="<c:out value=' ${item.brand}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].fenlei"
                               value="<c:out value=' ${item.fenlei}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].price"
                               value="<c:out value=' ${item.price}'/>">
                    </td>

                    <td>
                        <input type="text" name="items[${s.index}].num"
                               value="<c:out value=' ${item.num}'/>">
                    </td>

                    <td>
                        <c:if test="${item.image !=null}">
                            <img src="/pic/${item.image}" width=100 height=100/>
                            <br/>
                        </c:if>
                        <input type="file" name="files"/>
                    </td>

                    <td>
                        <c:if test="${item.image1 !=null}">
                            <img src="/pic/${item.image1}" width=100 height=100/>
                            <br/>
                        </c:if>
                        <input type="file" name="files1"/>
                    </td>

                    <td>
                        <c:if test="${item.image2 !=null}">
                            <img src="/pic/${item.image2}" width=100 height=100/>
                            <br/>
                        </c:if>
                        <input type="file" name="files2"/>
                    </td>

                    <td>
                        <a href="${pageContext.request.contextPath}/admin/deleteToy?id=${item.id}">删除</a>
                    </td>


                </tr>
            </c:forEach>

            <input type="button" value="修改" onclick="modifySubmit()"/>
            <%--<input type="button" value="删除" onclick="deleteSubmit()"/>--%>

        </form>
        <script>
            function modifySubmit() {
                document.toy.action = "/admin/modifyToy";
                document.toy.submit();
            }

            function deleteSubmit() {
                document.toy.action = "/admin//deleteToy";
                document.toy.submit();
            }
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