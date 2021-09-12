<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Model" %>
<%@ page import="entities.Brand" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Модели</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="title"><p>Модели ТС</p></h1>
<div class="form_links"></div>
<p>
  <a class="links" href="/main"><b>Главная страница</b></a>
  <a class="links" href="brands">Марки</a>
  <a class="links" href="factories">Заводы</a>
  <a class="links" href="dealers">Автосалоны</a>
  <a class="links" href="vehicles">Модели</a>
</p>
<form class="main_form" id="models" action="models" method="post">
  <table>
    <tr>
      <th class="header_of_table" scope="col">ID</th>
      <th class="header_of_table" scope="col">Название</th>
      <th class="header_of_table" scope="col">Тип</th>
      <th class="header_of_table" scope="col">Марка (id)</th>
    </tr>
    <%
      List<Model> models = (List<Model>) request.getAttribute("models");
      for (Model model: models){
    %>
    <form action="models" method="POST">
    <tr>
      <td><input class="folder" type="text" name="id" value="<%=model.getModelId()%>"
                 title="<%=model.getModelId()%>" readonly></td>
      <td><input class="folder" type="text" name="name" value="<%=model.getModelName()%>"
                 title="<%=model.getModelName()%>"></td>
      <td><input class="folder" type="text" name="type" value="<%=model.getModelType()%>"
                 title="<%=model.getModelType()%>"></td>
      <td><input class="folder" type="text" name="id_brand" value="<%=model.getModelIdBrand().getBrandName() + " (id: " + model.getModelIdBrand().getBrandId() + ")"%>"
                 title="<%=model.getModelIdBrand().getBrandName() + " (id: " + model.getModelIdBrand().getBrandId() + ")"%>"></td>
      <td>
        <button class="btn_small_edit_add" type="submit" name="action" value="edit">
          Редактировать
        </button>
      </td>
      <td>
        <button  class="btn_small_delete" type="submit" name="action" value="delete">
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
<p class="add_title">Добавить модель</p>
<form id="add-model" action="models" method="post">
  <table>
    <tr>
      <td><input class="folder" type="text" name="name" placeholder="Введите название" title="Введите название"></td>
      <td><input class="folder" type="text" name="type" placeholder="Введите тип" title="Введите тип"></td>
      <!--<td><input type="text" name="id_brand" placeholder="Введите id brand" title="Введите id brand"></td>-->

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
