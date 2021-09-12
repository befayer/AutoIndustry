<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Model" %>
<%@ page import="entities.Brand" %>
<html>
<head>
  <title>Model</title>
</head>
<body>
<button>
  <a href="javascript:history.back()">Назад</a>
</button>
<h1>Модели ТС</h1>
<p>
  <a style="padding: 20px" href="/main"><b>Главная страница</b></a>
  <a style="padding: 20px" href="brands">Марки</a>
  <a style="padding: 20px" href="factories">Заводы</a>
  <a style="padding: 20px" href="dealers">Автосалоны</a>
  <a style="padding: 20px" href="vehicles">Модели</a>
</p>
<form id="models" action="models" method="post">
  <table>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Название</th>
      <th scope="col">Тип</th>
      <th scope="col">Марка (id)</th>
    </tr>
    <%
      List<Model> models = (List<Model>) request.getAttribute("models");
      for (Model model: models){
    %>
    <form action="models" method="POST">
    <tr>
      <td><input type="text" name="id" value="<%=model.getModelId()%>"
                 title="<%=model.getModelId()%>" readonly></td>
      <td><input type="text" name="name" value="<%=model.getModelName()%>"
                 title="<%=model.getModelName()%>"></td>
      <td><input type="text" name="type" value="<%=model.getModelType()%>"
                 title="<%=model.getModelType()%>"></td>
      <td><input type="text" name="id_brand" value="<%=model.getModelIdBrand().getBrandName() + " (id: " + model.getModelIdBrand().getBrandId() + ")"%>"
                 title="<%=model.getModelIdBrand().getBrandName() + " (id: " + model.getModelIdBrand().getBrandId() + ")"%>"></td>
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
<h2>Добавить модель</h2>
<form id="add-model" action="models" method="post">
  <table>
    <tr>
      <td><input type="text" name="name" placeholder="Введите название" title="Введите название"></td>
      <td><input type="text" name="type" placeholder="Введите тип" title="Введите тип"></td>
      <!--<td><input type="text" name="id_brand" placeholder="Введите id brand" title="Введите id brand"></td>-->

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
