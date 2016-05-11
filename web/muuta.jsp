<%-- 
    Document   : muuta
    Created on : May 10, 2016, 11:19:06 AM
    Author     : mikko1324
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muuta kyselyä</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    <body>
     <div id="container" style="text-align:center;">
        <h1>Uusi kysymys</h1>
        
        <form action="Vaalikone" id="uusikysymys">
            <input type="text" name="uusikyssari" maxlength="100" width="300px"> <br/><br/>
            <input type="hidden" name="func" value="muutakysely">
            <input type="submit" value="Lisää uusi kysymys!">
        </form>
        
     </div>
    </body>
</html>
