<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Factory" %>
<%@ page import="entities.Brand" %>
<html>
<head>
    <title>Factory</title>
</head>
<body>
<button>
    <a href="javascript:history.back()">Назад</a>
</button>
<h1>Заводы</h1>
<p>
    <a style="padding: 20px" href="/main"><b>Главная страница</b></a>
    <a style="padding: 20px" href="brands">Марки</a>
    <a style="padding: 20px" href="vehicles">Заводы</a>
    <a style="padding: 20px" href="dealers">Автосалоны</a>
    <a style="padding: 20px" href="models">Модели</a>
</p>
<form id="factories" action="factories" method="post">
    <table>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Название</th>
            <th scope="col">Страна</th>
            <th scope="col">Город</th>
            <th scope="col">Марка (id)</th>
        </tr>
        <%
            List<Factory> factories = (List<Factory>) request.getAttribute("factories");
            for (Factory factory: factories){
        %>
        <form action="factories" method="POST">
        <tr>
            <td><input type="text" name="id" value="<%=factory.getFactoryId()%>"
                       title="<%=factory.getFactoryId()%>" readonly></td>
            <td><input type="text" name="year" value="<%=factory.getFactoryName()%>"
                       title="<%=factory.getFactoryName()%>"></td>
            <td><input type="text" name="country" value="<%=factory.getFactoryCountry()%>"
                       title="<%=factory.getFactoryCountry()%>"></td>
            <td><input type="text" name="city" value="<%=factory.getFactoryCity()%>"
                       title="<%=factory.getFactoryCity()%>"></td>
            <td><input type="text" name="id_brand" value="<%=factory.getFactoryIdBrand().getBrandName() + " (id: " + factory.getFactoryIdBrand().getBrandId() + ")"%>"
                       title="<%=factory.getFactoryIdBrand().getBrandName() + " (id: " + factory.getFactoryIdBrand().getBrandId() + ")"%>"></td>
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
<h2>Добавить завод</h2>
<form id="add-factory" action="factories" method="post">
    <table>
        <tr>
            <td><input type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td><input type="text" name="country" placeholder="Введите страну" title="Введите страну"></td>
            <td><input type="text" name="city" placeholder="Введите город" title="Введите город"></td>
            <!--<td><input type="text" name="id_brand" placeholder="Введите id_brand" title="Введите id_brand"></td>-->

            <td><select type="text" style="width: max-content" name="id_brand" placeholder="Выберите марку"
                        title="Выберите марку">
                <%
                    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
                    for (Brand brand : brands) {
                %>
                <option value="<%=Integer.toString(brand.getBrandId())%>">
                    <%=brand.getBrandName()%>
                </option>
                <%
                    }
                %>
            </select></td>

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
