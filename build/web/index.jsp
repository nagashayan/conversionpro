<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<head>
    <title>Conversion Pro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
    <style>
        parent {

            left: 0;
            top: 0;
            width: 400px;
            height: 100%;
        }

        .message,.message-1 {
            height: 120px;
            width: 120px;
            background-color: orange;
            color: white;
            z-index: -9999;
            line-height: 115px;
            text-align: center;
            font-family: Arial, sans-serif;
            font-weight: bold;

            -webkit-border-radius: 60px;
            -moz-border-radius: 60px;
            border-radius: 60px;
        }

        input{
            color: black !important;
        }
    </style>
    <div class="container">

<% 
    Enumeration enParams = request.getParameterNames(); 
            while(enParams.hasMoreElements()){
            
             String paramName = (String)enParams.nextElement();
             
            // out.println("number - "+paramName+" conversion - "+request.getParameter(paramName));
             if(paramName.equals("result")){
                out.println("pass");
            }
             
             if(paramName.equals("nextlevel")){
                 out.println("you are going to "+request.getParameter(paramName));
             }
             
            }
    %>
        <div class="page-header">
            <h2>Welcome to Number Conversion Game</h2>
        </div>  
        <a  class="btn btn-primary" id="start">Start Game (Level 1)</a>
        <div class="row">
            <div class="col-lg-4">

                <form method = "post" action ="/Numberconversionpro/process.jsp">
                    From: Decimal to 
                    <select>
                        <option value="binary" name="binary">Binary</option>
                        <option value="binary" name="ocatal">Octal</option>
                        <option value="binary" name="hexa">Hexa</option>
                    </select>
                    <h3>Enter values here</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Selected Number</th>
                                <th>Enter Value</th>

                            </tr>
                        </thead>
                        <tbody id="tbodyele">


                        </tbody>
                    </table>

                    <input type="submit" value="Submit"/>
                </form>
            </div>
            <div class="col-lg-8">
                <div class="pull-right"> Timer: <span id="timer">10</span></div>
                <div id="parent">
                    <% for (int i = 0; i < 3; i++) {
                            Random rand = new Random();
                            int n = rand.nextInt(100) + 1;
                            System.out.println(n);
                    %>
                    <div class="message" onclick="clicked(<%=i%>,<%=n%>)">
                        <span id="header_<%=i%>">Click for number</span>
                        <span id="open_<%=i%>">
                            <span id="number_<%=i%>"><%=n%></span> 
                        </span>
                    </div> 
                    <% } %>
                </div>
                <div id="secondary_div" style="display:none">
                    <h2>Game Over!</h2>
                    <p>Click Submit to evaluate your answers</p>
                    <p style="display:none">Evaluating your answers! Please wait...</p>
                    <div id="results_div">&nbsp;</div>
                </div>
            </div>
        </div>

    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script>
    jQuery.fn.verticalMarquee = function (vertSpeed, horiSpeed, index) {

        this.css('float', 'left');

        vertSpeed = 0.5;
        horiSpeed = 1 / horiSpeed || 1;

        var windowH = this.parent().height(),
                thisH = this.height(),
                parentW = (this.parent().width() - this.width()) / 2,
                rand = Math.random() * (index * 1000),
                current = this;

        this.css('margin-top', windowH + thisH);
        this.parent().css('overflow', 'hidden');

        setInterval(function () {
            current.css({
                marginTop: function (n, v) {
                    return parseFloat(v) - vertSpeed;
                }
            });
        }, 15);

        //if we want to repeat same bubbles again and again enable it
        /* setInterval(function() {
         if (parseFloat(current.css('margin-top')) < -thisH) {
         current.css('margin-top', windowH + thisH);
         }
         }, 250); */
    };
    var message = 1;
    $('.message').each(function (message) {
        $(this).verticalMarquee(1, 1, message);
        message++
    });
    function clicked(id, val) {
        console.log("clicked" + id);
        var header = "#header_" + id;
        var open = "#open_" + id;

        $(header).hide();
        $(open).show();

        //append selected number to table for entering numbers and focus it
        console.log($("#tbodyele"));
        $("#tbodyele").prepend("<tr><td>" + val + "</td><td>\n\
        <input type='hidden' name='num" + val + "' value='" + val + "'/><input type='number' name='val" + val + "'/></td>\n\
            </tr>");
        $('#tbodyele :input:visible:enabled:first').focus();
    }

    var timer = null,
            interval = 1000,
            value = 10;

    $("#start").click(function () {
        if (timer !== null)
            return;
        timer = setInterval(function () {
            value = value - 1;
            if (value == -1) {
                clearInterval(timer);
                timer = null;
                $("#parent").hide();
                $("#secondary_div").show();
                console.log("showing secondary");
            }
            $("#timer").html(value);
        }, interval);
    });

    </script>
</body>
</html>
