<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Dealer" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Автосалоны</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="title"><p>Автосалоны</p></h1>
<div class="form_links"></div>
<p>
    <a class="links" href="/main"><b>Главная страница</b></a>
    <a class="links" href="brands">Марки</a>
    <a class="links" href="factories">Заводы</a>
    <a class="links" href="vehicles">Автосалоны</a>
    <a class="links" href="models">Модели</a>
</p>
<form class="main_form" id="dealers" action="dealers" method="post">
    <table>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Название</th>
            <th class="header_of_table" scope="col">Страна</th>
            <th class="header_of_table" scope="col">Город</th>
        </tr>
        <%
            List<Dealer> dealers = (List<Dealer>) request.getAttribute("dealers");
            for (Dealer dealer: dealers){
        %>
        <form action="dealers" method="POST">
        <tr>
            <td><input class="folder" type="text" name="id" value="<%=dealer.getDealerId()%>"
                       title="<%=dealer.getDealerId()%>" readonly></td>
            <td><input class="folder" type="text" name="name" value="<%=dealer.getDealerName()%>"
                       title="<%=dealer.getDealerName()%>"></td>
            <td><input class="folder" type="text" name="country" value="<%=dealer.getDealerCountry()%>"
                       title="<%=dealer.getDealerCountry()%>"></td>
            <td><input class="folder" type="text" name="city" value="<%=dealer.getDealerCity()%>"
                       title="<%=dealer.getDealerCity()%>"></td>
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
<p class="add_title">Добавить автосалон</p>
<form id="add-dealers" action="dealers" method="post">
    <table>
        <tr>
            <td><input class="folder" type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td><input class="folder" type="text" name="country" placeholder="Введите страну" title="Введите страну"></td>
            <td><input class="folder" type="text" name="city" placeholder="Введите город" title="Введите город"></td>
            <td>
                <button class="btn_small_edit_add" type="submit" name="action" value="add">
                    Добавить
                </button>
            </td>
        </tr>
    </table>
</form>
<p class="param_title">Параметризованный запрос</p>
<form class="main_form" action="dealers" method="post">
    <p class="add_title">Вывести автосалоны указанной страны</p>
    <input class="folder" type="text" name="country" placeholder="Введите страну" title="Введите страну">
    <button class="btn_small_edit_add" type="submit" name="action" value="request">
        Выполнить
    </button>
    <table class="param_table">
        <%
            if (request.getAttribute("requestDealers") != null){
        %>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Название</th>
            <th class="header_of_table" scope="col">Страна</th>
            <th class="header_of_table" scope="col">Город</th>
        </tr>
        <%
            List<Dealer> dealers1 = (List<Dealer>) request.getAttribute("requestDealers");
            for (Dealer dealer: dealers1){
        %>
        <form action="dealers" method="post">
            <tr>
                <td><input class="folder" type="text" name="id" value="<%=dealer.getDealerId()%>"
                           title="<%=dealer.getDealerId()%>" readonly></td>
                <td><input class="folder" type="text" name="name" value="<%=dealer.getDealerName()%>"
                           title="<%=dealer.getDealerName()%>"></td>
                <td><input class="folder" type="text" name="country" value="<%=dealer.getDealerCountry()%>"
                           title="<%=dealer.getDealerCountry()%>"></td>
                <td><input class="folder" type="text" name="city" value="<%=dealer.getDealerCity()%>"
                           title="<%=dealer.getDealerCity()%>"></td>
                <td>
            </tr>
        </form>
        <%
            }
        %>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
