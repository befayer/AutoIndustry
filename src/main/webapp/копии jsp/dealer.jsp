<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Dealer" %>
<html>
<head>
    <title>Dealer</title>
</head>
<body>
<button>
    <a href="javascript:history.back()">Назад</a>
</button>
<h1>Автосалоны</h1>
<p>
    <a style="padding: 20px" href="/main"><b>Главная страница</b></a>
    <a style="padding: 20px" href="brands">Марки</a>
    <a style="padding: 20px" href="factories">Заводы</a>
    <a style="padding: 20px" href="vehicles">Автосалоны</a>
    <a style="padding: 20px" href="models">Модели</a>
</p>
<form id="dealers" action="dealers" method="post">
    <table>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Название</th>
            <th scope="col">Страна</th>
            <th scope="col">Город</th>
        </tr>
        <%
            List<Dealer> dealers = (List<Dealer>) request.getAttribute("dealers");
            for (Dealer dealer: dealers){
        %>
        <form action="dealers" method="POST">
        <tr>
            <td><input type="text" name="id" value="<%=dealer.getDealerId()%>"
                       title="<%=dealer.getDealerId()%>" readonly></td>
            <td><input type="text" name="name" value="<%=dealer.getDealerName()%>"
                       title="<%=dealer.getDealerName()%>"></td>
            <td><input type="text" name="country" value="<%=dealer.getDealerCountry()%>"
                       title="<%=dealer.getDealerCountry()%>"></td>
            <td><input type="text" name="city" value="<%=dealer.getDealerCity()%>"
                       title="<%=dealer.getDealerCity()%>"></td>
            <td>
                <button type="submit" name="action" value="edit">
                    <i>Редактировать</i>
                </button>
            </td>
            <td>
                <button type="submit" name="action" value="delete">
                    <i>Удалить</i>
                </button>
            </td>
        </tr>
        </form>
        <%
            }
        %>
    </table>
</form>
<h2>Добавить автосалон</h2>
<form id="add-dealer" action="dealers" method="post">
    <table>
        <tr>
            <td><input type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td><input type="text" name="country" placeholder="Введите страну" title="Введите страну"></td>
            <td><input type="text" name="city" placeholder="Введите город" title="Введите город"></td>
            <td>
                <button type="submit" name="action" value="add">
                    Добавить
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
