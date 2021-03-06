<%--
    Document   : ehdkys
    Created on : 10-May-2016
    Author     : Tomi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,vaalikone.Vaalikone,persist.*"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diginide Vaalikone 2.0</title>

        <link href="style.css" rel="stylesheet" type="text/css">
    </head>

    <body>

        <div id="container">
            <img id="headerimg" src="images/Logo.png" width="500" height="144" alt=""/>



            <%
                if (request.getAttribute("func") == "ehdkys") {
                    @SuppressWarnings(  "unchecked")
                    List<Kysymykset> kysymykset = (List<Kysymykset>) request.getAttribute("kysymykset");
                    List<Vastaukset> vastaukset = (List<Vastaukset>) request.getAttribute("vastaukset");
                    Vaalikone vaalikone = (Vaalikone) request.getAttribute("vaalikone");
                    for (Kysymykset kysymys : kysymykset) {%>
                       <div class="kysymys">
                           <%= kysymys.getKysymysId()%> / <%= Vaalikone.getLastId(vaalikone, "Kysymykset")%> <br>
                           <%= kysymys.getKysymys()%>
                           <% Vastaukset vastaus = null;
                           if (vastaukset != null) {
                                if (!vastaukset.isEmpty() && vastaukset.size() > (kysymys.getKysymysId() - 1)) {vastaus = vastaukset.get(kysymys.getKysymysId() - 1);}
                           }
                           int value = 0;
                           String kommentti = "";
                           if (vastaus != null) {value = vastaus.getVastaus(); kommentti = vastaus.getKommentti();} %>
                       </div>
                       <form action="Vaalikone" id="vastausformi">
                           <label>1</label><input type="radio" name="vastaus" value="1" <% if (value == 1) {%>checked="checked"<%}%> />
                           <label>2</label><input type="radio" name="vastaus" value="2" <% if (value == 2) {%>checked="checked"<%}%> />
                           <label>3</label><input type="radio" name="vastaus" value="3" <% if (value == 3 || value == 0) {%>checked="checked"<%}%> />
                           <label>4</label><input type="radio" name="vastaus" value="4" <% if (value == 4) {%>checked="checked"<%}%> />
                           <label>5</label><input type="radio" name="vastaus" value="5" <% if (value == 5) {%>checked="checked"<%}%> /><br><br>
                           <label class="txtareakommentti">Kommentti</label><br><textarea name="kommentti" id="kommentti" form="vastausformi" draggable="false" maxlength="200" rows="4" ><%= kommentti.toString() %></textarea>
                           <input type="hidden" name="q" value="<%= kysymys.getKysymysId()%>">
                           <input type="hidden" name="func" value="ehdkys">
                           <input type="submit" id="submitnappi" value="Vastaa" />
                       </form>
                       <div class="kysymys"><small>1=Täysin eri mieltä 2=Osittain eri mieltä 3=En osaa sanoa, 4=Osittain samaa mieltä 5=Täysin samaa mieltä</small></div>
            <%
                    }
                } else {
            %>
            <h1>Vastauksesi on tallennettu!</h1><br>
            <a href="index.html">Palaa alkuun</a>
            <%
                }
            %>




        </div>

    </body>
</html>
