<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Factory" %>
<%@ page import="entities.Brand" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Заводы</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="title"><p>Заводы</p></h1>
<div class="form_links"></div>
<p>
    <a class="links" href="/main"><b>Главная страница</b></a>
    <a class="links" href="brands">Марки</a>
    <a class="links" href="vehicles">Заводы</a>
    <a class="links" href="dealers">Автосалоны</a>
    <a class="links" href="models">Модели</a>
</p>
<form class="main_form" id="factories" action="factories" method="post">
    <table>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Название</th>
            <th class="header_of_table" scope="col">Страна</th>
            <th class="header_of_table" scope="col">Город</th>
            <th class="header_of_table" scope="col">Марка (id)</th>
        </tr>
        <%
            List<Factory> factories = (List<Factory>) request.getAttribute("factories");
            for (Factory factory: factories){
        %>
        <form action="factories" method="POST">
        <tr>
            <td><input class="folder" type="text" name="id" value="<%=factory.getFactoryId()%>"
                       title="<%=factory.getFactoryId()%>" readonly></td>
            <td><input class="folder" type="text" name="year" value="<%=factory.getFactoryName()%>"
                       title="<%=factory.getFactoryName()%>"></td>
            <td><input class="folder" type="text" name="country" value="<%=factory.getFactoryCountry()%>"
                       title="<%=factory.getFactoryCountry()%>"></td>
            <td><input class="folder" type="text" name="city" value="<%=factory.getFactoryCity()%>"
                       title="<%=factory.getFactoryCity()%>"></td>
            <td><input class="folder" type="text" name="id_brand" value="<%=factory.getFactoryIdBrand().getBrandName() + " (id: " + factory.getFactoryIdBrand().getBrandId() + ")"%>"
                       title="<%=factory.getFactoryIdBrand().getBrandName() + " (id: " + factory.getFactoryIdBrand().getBrandId() + ")"%>"></td>
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
<p class="add_title">Добавить завод</p>
<form id="add-factory" action="factories" method="post">
    <table>
        <tr>
            <td><input class="folder" type="text" name="name" placeholder="Введите название" title="Введите название"></td>
            <td><input class="folder" type="text" name="country" placeholder="Введите страну" title="Введите страну"></td>
            <td><input class="folder" type="text" name="city" placeholder="Введите город" title="Введите город"></td>
            <!--<td><input type="text" name="id_brand" placeholder="Введите id_brand" title="Введите id_brand"></td>-->

            <td><select class="folder" type="text" style="width: max-content" name="id_brand" placeholder="Выберите марку"
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
                <button class="btn_small_edit_add" type="submit" name="action" value="add">
                    Добавить
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
