<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: broadwells
  Date: 5/8/17
  Time: 1:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Demo</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>

<div class="card">
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                    <div class="card-block">
                        <h3 class="card-title">${product}</h3>
                        <p class="card-text">${descrip} <br> No. of Riders: ${cap}</p>
                        <h4 class="card-title">${price}</h4>
                        <h4 class="card-title">ETA (min): ${time} : (mile): ${mile}</h4>
                        <a href="#" class="btn btn-primary">Call Uber</a>
                    </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-block">
                    <h3 class="card-title">LYFT</h3>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Call Lyft</a>
                </div>
            </div>
        </div>
    </div>

</div>
<%--<table>--%>
    <%--<tr>--%>
        <%--<td>Name</td>--%>
        <%--<td>No. of Riders</td>--%>
        <%--<td>Description</td>--%>
    <%--</tr>--%>
    <%--<c:forEach var="results" items="${product}">--%>
        <%--<tr>--%>
            <%--<td>${results.displayName}</td>--%>
            <%--<td>${results.capacity}</td>--%>
            <%--<td>${results.description}</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>
<%--<br>--%>
<%--<table>--%>
    <%--<tr>--%>
        <%--<td>Name</td>--%>
        <%--<td>Duration (sec)</td>--%>
        <%--<td>Price</td>--%>
    <%--</tr>--%>
    <%--<c:forEach var="prices" items="${price}">--%>
        <%--<tr>--%>
            <%--<td>${prices.displayName}</td>--%>
            <%--<td>${prices.distance}</td>--%>
            <%--<td>${prices.estimate}</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>
<%--<br>--%>
<%--<table>--%>
    <%--<tr>--%>
        <%--<td>Name</td>--%>
        <%--<td>ETA (sec)</td>--%>
    <%--</tr>--%>
    <%--<c:forEach var="duration" items="${time}">--%>
        <%--<tr>--%>
            <%--<td>${duration.displayName}</td>--%>
            <%--<td>${duration.estimate}</td>--%>
        <%--</tr>--%>
    <%--</c:forEach>--%>
<%--</table>--%>


<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
        integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
        crossorigin="anonymous"></script>
</body>
</html>
