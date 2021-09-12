<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Vehicle" %>
<%@ page import="entities.Dealer" %>
<%@ page import="dao.DealerDAO" %>
<%@ page import="dao.FactoryDAO" %>
<%@ page import="dao.ModelDAO" %>
<%@ page import="entities.Model" %>
<%@ page import="entities.Factory" %>
<html>
<head>
    <title>Vehicle</title>
</head>
<body>
<button>
    <a href="javascript:history.back()">Назад</a>
</button>
<h1>Транспортные средства</h1>
<p>
    <a style="padding: 20px" href="/main"><b>Главная страница</b></a>
    <a style="padding: 20px" href="brands">Марки</a>
    <a style="padding: 20px" href="factories">Заводы</a>
    <a style="padding: 20px" href="dealers">Автосалоны</a>
    <a style="padding: 20px" href="models">Модели</a>
</p>
<form id="vehicles" action="vehicles" method="post">
    <table>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Цвет</th>
            <th scope="col">Тип кузова</th>
            <th scope="col">Год</th>
            <th scope="col">Название автосалона</th>
            <th scope="col">Название завода</th>
            <th scope="col">Название модели</th>
            <th scope="col">Название марки</th>
        </tr>
        <%
            List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
            for (Vehicle vehicle: vehicles){
        %>
        <form action="vehicles" method="POST">
        <tr>
            <td><input type="text" name="id" value="<%=vehicle.getVehicleId()%>"
                       title="<%=vehicle.getVehicleId()%>" readonly></td>
            <td><input type="text" name="color" value="<%=vehicle.getVehicleColor()%>"
                       title="<%=vehicle.getVehicleColor()%>"></td>
            <td><input type="text" name="type" value="<%=vehicle.getVehicleType()%>"
                       title="<%=vehicle.getVehicleType()%>"></td>
            <td><input type="text" name="year" value="<%=vehicle.getVehicleYear()%>"
                       title="<%=vehicle.getVehicleYear()%>"></td>
            <td><input type="text" name="name_dealer" value="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + " (id: " + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"
                       title="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + "(" + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"></td>
            <td><input type="text" name="name_factory" value="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName() + " (id: " + vehicle.getVehicleIdFactory().getFactoryId() + ")"%>"
                       title="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName()%>"></td>
            <td><input type="text" name="name_model" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName() + " (id: " + vehicle.getVehicleIdModel().getModelId() + ")"%>"
                       title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName()%>"></td>
            <td><input type="text" name="name_brand" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"
                       title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"></td>
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
<h2>Добавить ТС</h2>
<form id="add-vehicle" action="vehicles" method="post">
    <table>
        <tr>
            <td><input type="number" name="year" size="5" max="2030" min="1900" placeholder="Введите год" title="Введите год"></td>
            <td><input type="text" name="color" placeholder="Введите цвет" title="Введите цвет"></td>
            <td><input type="text" name="type" placeholder="Введите тип ТС" title="Введите тип ТС"></td>

            <!--<td><input type="text" name="id_model" placeholder="Введите id model" title="Введите id model"></td>-->

            <td><select type="text" style="width: max-content" name="id_model" placeholder="Выберите модель"
                        title="Выберите модель">
                <%
                    List<Model> models = (List<Model>) request.getAttribute("models");
                    for (Model model : models) {
                %>
                <option value="<%=Integer.toString(model.getModelId())%>">
                    <%=model.getModelName() + " (id: " + model.getModelId() + ")"%>
                </option>
                <%
                    }
                %>
            </select></td>

            <!--<td><input type="text" name="id_dealer" placeholder="Введите id dealer" title="Введите id dealer"></td>-->

            <td><select type="text" style="width: max-content" name="id_dealer" placeholder="Выберите автосалон"
                        title="Выберите автосалон">
                <%
                    List<Dealer> dealers = (List<Dealer>) request.getAttribute("dealers");
                    for (Dealer dealer : dealers) {
                %>
                <option value="<%=Integer.toString(dealer.getDealerId())%>">
                    <%=dealer.getDealerName() + " (id: " + dealer.getDealerId() + ", city: " + dealer.getDealerCity() + ")"%>
                </option>
                <%
                    }
                %>
            </select></td>

            <!--<td><input type="text" name="id_factory" placeholder="Введите id factory" title="Введите id factory"></td>-->

            <td><select type="text" style="width: max-content" name="id_factory" placeholder="Выберите завод"
                        title="Выберите завод">
                <%
                    List<Factory> factories = (List<Factory>) request.getAttribute("factories");
                    for (Factory factory : factories) {
                %>
                <option value="<%=Integer.toString(factory.getFactoryId())%>">
                    <%=factory.getFactoryName() + " (id: " + factory.getFactoryId() + ", city: " + factory.getFactoryCity() + ")"%>
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
