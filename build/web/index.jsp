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

        #parent {

            left: 0;
            bottom: 0;
            width: 400px;
            height: 100%;
            display: block

        }

        .message,.message-1 {
            position: absolute;
            height: 120px;
            width: 120px;
            background-color: orange;
            color: white;
            z-index: 9999;
            line-height: 115px;
            text-align: center;
            font-family: Arial, sans-serif;
            font-weight: bold;

            -webkit-border-radius: 60px;
            -moz-border-radius: 60px;
            border-radius: 60px;
            margin-top: 700px;

        }
        .message-1{
            float: right;
            left: 150px;
        }
        input{
            color: black !important;
        }
        
    </style>
    <div class="container">

        <%
            String level = "1", resultdisp = "";
            int result = 0, intlevel;
            Enumeration enParams = request.getParameterNames();
            while (enParams.hasMoreElements()) {

                String paramName = (String) enParams.nextElement();

                //out.println("name - "+paramName+" value - "+request.getParameter(paramName));
                if (paramName.equals("result")) {
                    result = Integer.parseInt(request.getParameter(paramName).trim());
                    if (result == 1) {
                        out.println("pass");
                        resultdisp = "Congratualations you have succesfuly advanced next level";
                    } else if (result == 0) {
                        out.println("fail");
                        resultdisp = "Sorry! you have failed this level";
                    }

                }
                if (paramName.equals("nextlevel")) {
                    out.println("you are going to " + request.getParameter(paramName));
                    level = request.getParameter(paramName).trim();

                }

            }
            out.println("level=" + level);
            intlevel = Integer.parseInt(level);
        %>
        <div class="page-header">
            <h2>Welcome to Number Conversion Game</h2>
        </div>  
        <% if (Integer.parseInt(level) < 4) { %>
        <a  class="btn btn-primary" id="start">Start Game (Level <% out.println(level); %>)</a>
        <% } %>
        <div class="row">
            <% if (Integer.parseInt(level) < 4) { %>
            <div class="col-lg-4">
                
                <form method = "post" action ="/Numberconversionpro/process.jsp" id="main-form">
                    From: Decimal to 
                    <select name="selectmenu" form="main-form">
                        <option value="binary" >Binary</option>
                        <option value="octal" >Octal</option>
                        <option value="hexa" >Hexa</option>
                    </select>
                    <input name="level" type="hidden" value="<% out.println(level);%>" />
                    <h3>Enter values here</h3>
                    <table class="table" id="inputtable">
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
                <div class="row" id="result_disp" ><div class="col-lg-12"><h3><% out.println(resultdisp); %></h3></div></div>
                <div class="pull-right"> Timer: <span id="timer">10</span></div>
                <div id="parent" class="center-block" style="display: none">

                    <div class="message" style="display:none" ><span id="header">Click Me</span><span id="open_5"><span id="number_5"></span> 
                        </span>
                    </div>
                    <div class="message" style="display:none" > <span id="header">Click Me</span><span id="open_1"> <span id="number_1"></span></span></div>
                    <div class="message" style="display:none" > <span id="header">Click Me</span><span id="open_2"> <span id="number_2"></span></span></div>
                    <div class="message" style="display:none" > <span id="header">Click Me</span><span id="open_3"> <span id="number_3"></span></span></div>
                    <div class="message" style="display:none" > <span id="header">Click Me</span><span id="open_4"> <span id="number_4"></span></span></div>

                    <!-- <div class="message-1 1" style="display:none"> <span id="header_">Click Me</span><span id="open_"> <span id="number_"></span></span></div>
                    <div class="message-1 2" style="display:none"> <span id="header_">Click Me</span><span id="open_"> <span id="number_"></span></span></div>
                    <div class="message-1 3" style="display:none"> <span id="header_">Click Me</span><span id="open_"> <span id="number_"></span></span></div>
                    <div class="message-1 4" style="display:none"> <span id="header_">Click Me</span><span id="open_"> <span id="number_"></span></span></div>
                    <div class="message-1 5" style="display:none"> <span id="header_">Click Me</span><span id="open_"> <span id="number_"></span></span></div>
                    -->
                </div>
                <div id="secondary_div" style="display:none">
                    <h2>Game Over!</h2>
                    <p>Click Submit to evaluate your answers</p>
                    <p style="display:none">Evaluating your answers! Please wait...</p>
                    <div id="results_div">&nbsp;</div>
                </div>
            </div>
            <% } else { %>
            <div id="result_div" class="col-xs-12"><h2>Congratulations you succesfully completed all the level</h2></div>
            <% } %>
        </div>

    </div>


    <script src="/Numberconversionpro/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/Numberconversionpro/bootstrap.min.css" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="/Numberconversionpro/bootstrap.min.js" crossorigin="anonymous"></script>
    <script>

        var message = 1;

        /*   $(".message").click(function(){
         console.log("clicked"+$(this));
         //$(this).hide();
         console.log($("#tbodyele"));
         var val = Math.floor((Math.random() * 100) + 1);
         $("#tbodyele").prepend("<tr><td>" + val + "</td><td>\n\
         <input type='hidden' name='num" + val + "' value='" + val + "'/><input type='number' name='val" + val + "'/></td>\n\
         </tr>");
         $('#tbodyele :input:visible:enabled:first').focus();
         
         }); */
        /*  $( '#parent' ).on( 'click', 'div', function () { 
         
         //$(this).hide();
         console.log($("#tbodyele"));
         var val = Math.floor((Math.random() * 100) + 1);
         $("#tbodyele").prepend("<tr><td>" + val + "</td><td>\n\
         <input type='hidden' name='num" + val + "' value='" + val + "'/><input type='number' name='val" + val + "'/></td>\n\
         </tr>");
         $('#tbodyele :input:visible:enabled:first').focus();
         
         
         });
         */
        function clicked() {

            //$(this).hide();

            var val = Math.floor((Math.random() * 100) + 1);
            $("#tbodyele").prepend("<tr><td>" + val + "</td><td>\n\
        <input type='hidden' name='num" + val + "' value='" + val + "'/><input type='text' name='val" + val + "'/></td>\n\
            </tr>");
            $('#tbodyele :input:visible:enabled:first').focus();
            $(this).off("click");
            console.log($('.header', $(this)).html());
            $(this).html(val);
        }


        var i = 0;
        var bubbleiter = null;
        /**
         * 
         * for all even numbers
         */
        var startbubbling = function () {

            if (i == 6)
                i = 0;
            //console.log("func");

            //console.log("iterating");
            var ele = $(".message")[i];
            $(ele).click(clicked);
            //console.log(ele);
            //  console.log($(ele).css('margin-top'));
            $(ele).show();
            $(ele).animate({'margin-top': '10px'}, 6000, (function (ele) {
                return function () {
                    console.log("moved");


                    $(ele).hide("slow", function () {
                        $(ele).css('margin-top', '700px');
                        $(this).html("Click Me");
                        $(this).off("click");

                    });
                    console.log("after" + $(ele).css('margin-top'));


                }
            })(ele));

            i = i + 2;
            console.log(i);




        }


        var timer = null,
                interval = 1000,
                value = 30;
        var level = "<% out.print(level); %>";
        if (level == "1")
            value = 30;
        else if (level == "2")
            value = 20;
        else if (level == "3")
            value = 20;
        $("#timer").html(value);
        console.log("value=" + value);


        $("#start").click(function () {
            console.log("clicked start");
            timer = null,
                    interval = 1000;

            //re intialize all again

            level = "<% out.print(level);%>";
            if (level == "1")
                value = 30;
            else if (level == "2")
                value = 20;
            else if (level == "3")
                value = 20;
            $("#timer").html(value);
            console.log("value=" + value);


            $("#secondary_div").hide();
            $("#result_div").hide();
            $("#result_disp").hide();
            $("#parent").show();

            if (timer !== null)
                return;
            timer = setInterval(function () {
                value = value - 1;
                if (value == 0) {
                    clearInterval(timer);
                    clearInterval(bubbleiter);
                    timer = null;
                    $("#parent").hide();
                    $("#secondary_div").show();
                    console.log("showing secondary");
                    $("#inputtable").find("input,button,textarea,select").attr("disabled", "disabled");
                }
                $("#timer").html(value);
            }, interval);

            //call lazyload function
            startbubbling();
            bubbleiter = setInterval(startbubbling, 5000);
            console.log("after called");
        });

    </script>
</body>
</html>
