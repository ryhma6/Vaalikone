<%-- 
    Document   : muuta
    Created on : May 10, 2016, 11:19:06 AM
    Author     : mikko1324
--%>
<%@page import="persist.Kysymykset"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muuta kyselyä</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    <body>
     <div id="container">
         <h2>Kaikki kysymykset</h2>
        <% List<Kysymykset> kaikkiKysymykset = (List<Kysymykset>) request.getAttribute("kaikkiKysymykset"); %>
              <%  for (int i = 0; i < kaikkiKysymykset.size(); i++) { %>
              <div class="lisaakyslista"> 
                  <form action="Vaalikone">
                  <input type="hidden" name="func" value="muutakysely">
                  <input type="hidden" name="kyssaripoistaid" value="<%= kaikkiKysymykset.get(i).getKysymysId()%>">
                  <input type="submit" value="poista" class="poistanappi">
                  <%= i + 1%>: <%= kaikkiKysymykset.get(i).getKysymys()%> id: <%= kaikkiKysymykset.get(i).getKysymysId()%> 
                  </form>
              </div>
     <%  } %>
      
        <h2>Uusi kysymys</h2>
        
        <form action="Vaalikone">
            <textarea rows="4" cols="50" name="uusikyssari" maxlength="100" width="300px"> </textarea><br>
            <small>MAX 100 merkkiä.</small>
            <br/><br/>
            <input type="hidden" name="func" value="muutakysely">
            <input type="submit" value="Lisää uusi kysymys!">
        </form>
        
     </div>
    </body>
</html>
