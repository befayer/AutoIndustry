<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>ТС</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1 class="h1">
    <p>Автоматизированная информационная система</p>
    <p>реализации новых автомобилей</p></h1>
<div class="two_forms">
    <div class="info">
        <p>Данное WEB-приложение позволяет вести базу данных о новых автомобилях,</p>
        <p>поступающих на реализацию</p>
        <p>Курсовой проект по дисциплине "Разработка WEB-приложений"</p>
        <p>Студент группы 6403 Калинин А.А.</p>
    </div>
    <div class="form_btn">

        <div class="btn1">
            <button class="btn" name="btn" onclick='location.href="vehicles"' type="submit">
                <p class="btn_text">Транспортные средства</p>
            </button>
        </div>

        <div class="btn1">
            <button class="btn_dealers" name="btn" onclick='location.href="dealers"' type="submit">
                <p class="btn_text">Автосалоны</p>
            </button>
        </div>

        <div class="btn1">
            <button class="btn_models" name="btn" onclick='location.href="models"' type="submit">
                <p class="btn_text">Модели</p>
            </button>
        </div>

        <div class="btn1">
            <button class="btn_brands" name="btn" onclick=onclick='location.href="brands"' type="submit">
                <p class="btn_text">Марки</p>
            </button>
        </div>

        <div class="btn1">
            <button class="btn_facories" name="btn" onclick=onclick='location.href="factories"' type="submit">
                <p class="btn_text">Заводы</p>
            </button>
        </div>
    </div>
</div>


<!--
  <div><a href="vehicles">Транспортные средства</a></div>
  <div><a href="brands">Марки</a></div>
  <div><a href="factories">Заводы</a></div>
  <div><a href="dealers">Автосалоны</a></div>
  <div><a href="models">Модели</a></div>-->
</body>
</html>
