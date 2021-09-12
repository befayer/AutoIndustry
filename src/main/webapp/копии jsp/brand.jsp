<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Brand" %>
<html>
<head>
    <title>Brand</title>
</head>
<body>
<button>
    <a href="javascript:history.back()">Назад</a>
</button>
<h1>Марки</h1>
<p>
    <a style="padding: 20px" href="/main"><b>Главная страница</b></a>
    <a style="padding: 20px" href="vehicles">Марки</a>
    <a style="padding: 20px" href="factories">Заводы</a>
    <a style="padding: 20px" href="dealers">Автосалоны</a>
    <a style="padding: 20px" href="models">Модели</a>
</p>
<form id="brands" action="brands" method="post">
    <table>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Название</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        <%
            List<Brand> brands = (List<Brand>) request.getAttribute("brands");
            for (Brand brand: brands){
        %>
        <form action="brands" method="POST">
        <tr>
            <td><input type="text" name="id" value="<%=brand.getBrandId()%>"
                       title="<%=brand.getBrandId()%>" readonly></td>
            <td><input type="text" name="name" value="<%=brand.getBrandName()%>"
                       title="<%=brand.getBrandName()%>"></td>
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
<h2>Добавить марку</h2>
<form id="add-brand" action="brands" method="post">
    <table>
        <tr>
            <td><input type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td>
                <button type="submit" name="action" value="add">
                    <i>Добавить</i>
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
