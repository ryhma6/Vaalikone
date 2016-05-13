<%-- 
    Document   : muuta_onnistui
    Created on : May 10, 2016, 11:19:06 AM
    Author     : mikko1324
--%>

<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muuttaminen onnistui</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    <body>
     <div id="container">
        <h1>Uuden kysymyksen lisääminen onnistui!</h1>       
        <form action="Vaalikone">
                <input type="hidden" name="func" value="muutakysely">
                <input id="submitnappi" type="submit" value="Palaa takaisin" name="btnMuutaKyselya" />
        </form>    
     </div>
    </body>
</html>
