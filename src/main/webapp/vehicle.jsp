<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.util.*" %>
<%@ page import="entities.Vehicle" %>
<%@ page import="entities.Dealer" %>
<%@ page import="dao.DealerDAO" %>
<%@ page import="dao.FactoryDAO" %>
<%@ page import="dao.ModelDAO" %>
<%@ page import="entities.Model" %>
<%@ page import="entities.Factory" %>
<%@ page import="entities.Brand" %>
<%@ page import="dao.VehicleDAO" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Транспортные средства</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="title"><p>Транспортные средства</p></h1>
<div class="form_links"></div>
<p>
    <a class="links" href="/main"><b>Главная страница</b></a>
    <a class="links" href="brands">Марки</a>
    <a class="links" href="factories">Заводы</a>
    <a class="links" href="dealers">Автосалоны</a>
    <a class="links" href="models">Модели</a>
</p>
<form class="main_form" id="vehicles" action="vehicles" method="post">
    <table>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Цвет</th>
            <th class="header_of_table" scope="col">Тип кузова</th>
            <th class="header_of_table" scope="col">Год</th>
            <th class="header_of_table" scope="col">Название автосалона</th>
            <th class="header_of_table" scope="col">Название завода</th>
            <th class="header_of_table" scope="col">Название модели</th>
            <th class="header_of_table" scope="col">Название марки</th>
        </tr>
        <%
            List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
            for (Vehicle vehicle: vehicles){
        %>
        <form action="vehicles" method="POST">
            <tr>
                <td><input class="folder" type="text" name="id" value="<%=vehicle.getVehicleId()%>"
                           title="<%=vehicle.getVehicleId()%>" readonly></td>
                <td><input class="folder" type="text" name="color" value="<%=vehicle.getVehicleColor()%>"
                           title="<%=vehicle.getVehicleColor()%>"></td>
                <td><input class="folder" type="text" name="type" value="<%=vehicle.getVehicleType()%>"
                           title="<%=vehicle.getVehicleType()%>"></td>
                <td><input class="folder" type="text" name="year" value="<%=vehicle.getVehicleYear()%>"
                           title="<%=vehicle.getVehicleYear()%>"></td>
                <td><input class="folder" type="text" name="name_dealer" value="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + " (id: " + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"
                           title="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + "(" + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"></td>
                <td><input class="folder" type="text" name="name_factory" value="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName() + " (id: " + vehicle.getVehicleIdFactory().getFactoryId() + ")"%>"
                           title="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName()%>"></td>
                <td><input class="folder" type="text" name="name_model" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName() + " (id: " + vehicle.getVehicleIdModel().getModelId() + ")"%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName()%>"></td>
                <td><input class="folder" type="text" name="name_brand" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"></td>
                <td>
                    <button class="btn_small_edit_add" type="submit" name="action" value="edit">
                        Редактировать
                    </button>
                </td>
                <td>
                    <button type="submit" class="btn_small_delete" name="action" value="delete">
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
<p class="add_title">Добавить ТС</p>
<form id="add-vehicle" action="vehicles" method="post">
    <table>
        <tr>
            <th class="header_of_table" scope="col">Год</th>
            <th class="header_of_table" scope="col">Цвет</th>
            <th class="header_of_table" scope="col">Тип ТС</th>
            <th class="header_of_table" scope="col">Модель</th>
            <th class="header_of_table" scope="col">Автосалон</th>
            <th class="header_of_table" scope="col">Завод</th>
        </tr>
        <tr>
            <td><input class="folder" type="number" name="year" placeholder="Введите год выпуска"></td>
            <td><input class="folder" type="text" name="color" placeholder="Введите цвет"></td>
            <td><input class="folder" type="text" name="type" placeholder="Введите тип ТС" title="Введите тип ТС"></td>
            <td><select class="folder" type="text" style="width: max-content" name="id_model" placeholder="Выберите модель"
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


            <td><select class="folder" type="text" style="width: max-content" name="id_dealer" placeholder="Выберите автосалон"
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

            <td><select class="folder" type="text" style="width: max-content" name="id_factory" placeholder="Выберите завод"
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
                <button class="btn_small_edit_add" type="submit" name="action" value="add">
                    Добавить
                </button>
            </td>
        </tr>
    </table>
</form>
<p></p>
<form class="main_form" id="request" action="vehicles" method="post">
    <p class="add_title">Параметризованный запрос</p>
    <p class="add_title">Вывести транспортные средства, у которых год выпуска между</p>
    <input class="folder" type="text" name="minYear" size="5" max="2030" min="1900" placeholder="мин." title="мин.">
    <input class="folder" type="text" name="maxYear" size="5" max="2030" min="1900" placeholder="макс." title="макс.">
    <button type="submit" class="btn_small_edit_add" name="action" value="request">
        Выполнить
    </button>
    <table class="param_table">
        <%
            if (request.getAttribute("request") != null){
        %>
        <tr >
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Цвет</th>
            <th class="header_of_table" scope="col">Тип кузова</th>
            <th class="header_of_table" scope="col">Год</th>
            <th class="header_of_table" scope="col">Название автосалона</th>
            <th class="header_of_table" scope="col">Название завода</th>
            <th class="header_of_table" scope="col">Название модели</th>
            <th class="header_of_table" scope="col">Название марки</th>
        </tr>
        <%
            List<Vehicle> newVehicles = (List<Vehicle>) request.getAttribute("request");
            for (Vehicle vehicle: newVehicles){
        %>
            <tr>
                <td><input class="folder" type="text" name="id" value="<%=vehicle.getVehicleId()%>"
                           title="<%=vehicle.getVehicleId()%>" readonly></td>
                <td><input class="folder" type="text" name="color" value="<%=vehicle.getVehicleColor()%>"
                           title="<%=vehicle.getVehicleColor()%>"></td>
                <td><input class="folder" type="text" name="type" value="<%=vehicle.getVehicleType()%>"
                           title="<%=vehicle.getVehicleType()%>"></td>
                <td><input class="folder" type="text" name="year" value="<%=vehicle.getVehicleYear()%>"
                           title="<%=vehicle.getVehicleYear()%>"></td>
                <td><input class="folder" type="text" name="name_dealer" value="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + " (id: " + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"
                           title="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + "(" + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"></td>
                <td><input class="folder" type="text" name="name_factory" value="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName() + " (id: " + vehicle.getVehicleIdFactory().getFactoryId() + ")"%>"
                           title="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName()%>"></td>
                <td><input class="folder" type="text" name="name_model" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName() + " (id: " + vehicle.getVehicleIdModel().getModelId() + ")"%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName()%>"></td>
                <td><input class="folder" type="text" name="name_brand" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"></td>
            </tr>
        <%
            }
        %>
        <%
            }
        %>
    </table>
</form>
<p></p>
<form class="main_form" id="requestNameBrand" action="vehicles" method="post">
    <p class="add_title">Параметризованный запрос</p>
    <p class="add_title">Вывести транспортные средства марки:</p>
    <input type="text" class="folder" name="nameBrand" placeholder="Введите название марки" title="Введите название марки">
    <button type="submit" class="btn_small_edit_add" name="action" value="requestNameBrand">
        Выполнить
    </button>
    <table class="param_table">
        <%
            if (request.getAttribute("requestNameBrand") != null){
        %>
        <tr>
            <th class="header_of_table" scope="col">ID</th>
            <th class="header_of_table" scope="col">Цвет</th>
            <th class="header_of_table" scope="col">Тип кузова</th>
            <th class="header_of_table" scope="col">Год</th>
            <th class="header_of_table" scope="col">Название автосалона</th>
            <th class="header_of_table" scope="col">Название завода</th>
            <th class="header_of_table" scope="col">Название модели</th>
            <th class="header_of_table" scope="col">Название марки</th>
        </tr>
        <%
            List<Vehicle> newVehiclesNameBrand = (List<Vehicle>) request.getAttribute("requestNameBrand");
            for (Vehicle vehicle: newVehiclesNameBrand){
        %>
            <tr>
                <td><input class="folder" type="text" name="id" value="<%=vehicle.getVehicleId()%>"
                           title="<%=vehicle.getVehicleId()%>" readonly></td>
                <td><input class="folder" type="text" name="color" value="<%=vehicle.getVehicleColor()%>"
                           title="<%=vehicle.getVehicleColor()%>"></td>
                <td><input class="folder" type="text" name="type" value="<%=vehicle.getVehicleType()%>"
                           title="<%=vehicle.getVehicleType()%>"></td>
                <td><input class="folder" type="text" name="year" value="<%=vehicle.getVehicleYear()%>"
                           title="<%=vehicle.getVehicleYear()%>"></td>
                <td><input class="folder" type="text" name="name_dealer" value="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + " (id: " + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"
                           title="<%=DealerDAO.findById(vehicle.getVehicleIdDealer().getDealerId()).getDealerName() + "(" + vehicle.getVehicleIdDealer().getDealerId() + ")"%>"></td>
                <td><input class="folder" type="text" name="name_factory" value="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName() + " (id: " + vehicle.getVehicleIdFactory().getFactoryId() + ")"%>"
                           title="<%=FactoryDAO.findById(vehicle.getVehicleIdFactory().getFactoryId()).getFactoryName()%>"></td>
                <td><input class="folder" type="text" name="name_model" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName() + " (id: " + vehicle.getVehicleIdModel().getModelId() + ")"%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelName()%>"></td>
                <td><input class="folder" type="text" name="name_brand" value="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"
                           title="<%=ModelDAO.findById(vehicle.getVehicleIdModel().getModelId()).getModelIdBrand().getBrandName()%>"></td>
            </tr>
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
