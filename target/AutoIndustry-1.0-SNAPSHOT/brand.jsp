<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Brand" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Марки</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="title"><p>Марки</p></h1>
<div class="form_links"></div>
<p>
    <a class="links" href="/main"><b>Главная страница</b></a>
    <a class="links" href="vehicles">Марки</a>
    <a class="links" href="factories">Заводы</a>
    <a class="links" href="dealers">Автосалоны</a>
    <a class="links" href="models">Модели</a>
</p>
<form class="main_form" id="brands" action="brands" method="post">
    <table>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Название</th>
            <th class="header_of_table" scope="col"></th>
            <th class="header_of_table" scope="col"></th>
        </tr>
        <%
            List<Brand> brands = (List<Brand>) request.getAttribute("brands");
            for (Brand brand: brands){
        %>
        <form action="brands" method="POST">
        <tr>
            <td><input class="folder" type="text" name="id" value="<%=brand.getBrandId()%>"
                       title="<%=brand.getBrandId()%>" readonly></td>
            <td><input class="folder" type="text" name="name" value="<%=brand.getBrandName()%>"
                       title="<%=brand.getBrandName()%>"></td>
            <td>
                <button class="btn_small_edit_add" type="submit" name="action" value="edit">
                    Редактировать
                </button>
            </td>
            <td>
                <button class="btn_small_delete" type="submit" name="action" value="delete">
                    Удалить
                </button>
            </td>
        </tr>
        </form>
        <%
            }
        %>
    </table>
</form>
<p class="add_title">Добавить марку</p>
<form id="add-brand" action="brands" method="post">
    <table>
        <tr>
            <td><input class="folder" type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td>
                <button class="btn_small_edit_add" type="submit" name="action" value="add">
                    Добавить
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
