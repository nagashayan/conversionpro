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
    <link rel="stylesheet" href="/Numberconversionpro/style.css" crossorigin="anonymous">
</head>
<body>
  
    <div class="container wrapper">

        <%
            String level = "1", resultdisp = "", points = "0",correctanswerscount = "0", fromtype = "decimal",totype = "binary";
            int result = 0, intlevel;
            Enumeration enParams = request.getParameterNames();
            while (enParams.hasMoreElements()) {

                String paramName = (String) enParams.nextElement();

                //out.println("name - "+paramName+" value - "+request.getParameter(paramName));
                if (paramName.equals("result")) {
                    result = Integer.parseInt(request.getParameter(paramName).trim());
                    if (result == 1) {
                        //out.println("pass");
                        resultdisp = "Congratualations! you have successfully advanced to next level";
                    } else if (result == 0) {
                        //out.println("fail");
                        resultdisp = "Sorry! you have failed this level";
                    }

                }
                if (paramName.equals("nextlevel")) {
                    //out.println("you are going to " + request.getParameter(paramName));
                    level = request.getParameter(paramName).trim();

                }
                if (paramName.equals("points")) {
                    //out.println("you are going to " + request.getParameter(paramName));
                    points = request.getParameter(paramName).trim();

                }
                if (paramName.equals("correctanswerscount")) {
                    //out.println("you are going to " + request.getParameter(paramName));
                    correctanswerscount = request.getParameter(paramName).trim();

                }
                if (paramName.equals("fromtype")) {
                    //out.println("you are going to " + request.getParameter(paramName));
                    fromtype = request.getParameter(paramName).trim();

                }
                if (paramName.equals("totype")) {
                    //out.println("you are going to " + request.getParameter(paramName));
                    totype = request.getParameter(paramName).trim();

                }

            }
            //out.println("level=" + level);
            intlevel = Integer.parseInt(level);
        %>
        <div class="page-header">
            <h1 class="text-center">Welcome to Number Conversion Game</h1>
        </div>  
        <% if (Integer.parseInt(level) < 4) { %>
               <div class="container"> <div class="row"><div class="col-lg-6">
                    <h3 class="pull-right"><a  class="btn btn-lg btn-primary" id="start"> Start Game ( Level <% out.println(level); %>)</a></h3>
                    </div><div class="col-lg-6">
                        <h3 class="pull-left"><a  class="btn btn-lg btn-primary" id="end"> End Game ( Level <% out.println(level); %>)</a></h3>
                    </div>
                </div>
               </div>
        
        <% } %>
        <div class="row main-container">
            <% if (Integer.parseInt(level) < 4) { %>
            <div class="col-lg-4">
                
                <form method = "post" action ="/Numberconversionpro/process.jsp" id="main-form">
                    <input name="level" type="hidden" id="levelele" value="<% out.print(level);%>" />
                    <input name="fromselectmenu" type="hidden" id="from-select-menu-hidden" value="<% out.print(fromtype); %>" />
                    <input name="points" type="hidden" value="<% out.print(points);%>" />
                    <input name="selectmenu" type="hidden" id="select-menu-hidden" value="<% out.print(totype); %>" />
                   <h4> From <select id="convert-selector-from" form="main-form" onchange="fromselectorchange()">
                        <option value="decimal" >Decimal</option>
                        <option value="binary" >Binary</option>
                        <option value="octal" >Octal</option>
                        <option value="hexa" >Hexa</option>
                    </select> to : 
                       <select id="convert-selector" form="main-form" onchange="selectorchange()">
                        <option value="binary" >Binary</option>
                        <option value="octal" >Octal</option>
                        <option value="decimal" >Decimal</option>
                        <option value="hexa" >Hexa</option>
                    </select>
                    </h4>
                    
                    
                    
                    <div class="panel panel-success">
                        <div class="panel-heading"> <h3>Enter values here</h3></div>
                        <div class="panel-body">
                    

                   
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
                    
                    <input class="btn btn-md btn-default" type="submit" value="Submit"/>
                    </div>
            </div>
                </form>

            </div>
            <div class="col-lg-8">
                <div class="row" id="result_disp" ><div class="col-lg-12"><h3><% out.print(resultdisp); %></h3>
                        <h4><% out.print("No of Correct Answers: "+correctanswerscount); %></h4></div></div>
                   <div class="pull-right"> <label>Timer: <span id="timer">100</label></span></div>
                   <div class="pull-right" style="margin-right: 15px;"> <label>Total Points: <span id="timer"><% out.print(points); %></label></span></div>
                   
                <div id="inst" class="row">
                    <div class="col-xs-12">
                    <label>Instructions:</label>
                    <% if (Integer.parseInt(level) == 1) { %>
                    <span>You have 100 seconds time to answer at least 6 correct answers to pass this level </span>
                    <% } %>
                    <% if (Integer.parseInt(level) == 2) { %>
                    <span>You have 80 seconds time to answer at least 7 correct answers to pass this level </span>
                    <% } %>
                    <% if (Integer.parseInt(level) == 3) { %>
                    <span>You have 100 seconds time to answer at least 6 correct answers to pass this level </span>
                    <% } %>
                    </div>
                </div>
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
            <div id="result_div" class="col-xs-12 text-center"><h2>Congratulations! you have successfully completed all the levels</h2>
            <h4><% out.print("No of Correct Answers: "+correctanswerscount); %></h4>
            <div class="row"><div class="col-xs-12 text-center"> <h3>Total Points: <% out.print(points); %></h3></div></div>
            <h3 ><a  href="http://localhost:8080/Numberconversionpro/index.jsp" class="btn btn-lg btn-primary" id="start"> Re-Start Game ( Level 1)</a></h3>
            
            </div>
            <% } %>
        </div>

    </div>
    <footer class="container">
      <p>Number conversion game</p>
    </footer>

    <script src="/Numberconversionpro/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/Numberconversionpro/bootstrap.min.css" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="/Numberconversionpro/bootstrap.min.js" crossorigin="anonymous"></script>
    
    <script type="text/javascript">
          var message = 1;
        var level = "<%=level %>";
        function clicked() {

            //$(this).hide();
            if(level == "1")
                var val = Math.floor((Math.random() * 20) + 1);
            else if(level == "2")
                var val = Math.floor((Math.random() * 50) + 1);
            else 
                var val = Math.floor((Math.random() * 100) + 1);
            var type = $('#convert-selector-from').val();
            console.log("from type ="+type);
            if(type == "binary")
                val = val.toString(2);
            else if(type == "octal")
                val = val.toString(8);
            else if(type == "hexa"){
                val = val.toString(16).toUpperCase();
            }
            
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
                value = 100;
        
        if (level == "1")
                value = 100;
        else if (level == "2")
            value = 80;
        else if (level == "3")
            value = 100;
        $("#timer").html(value);
        console.log("value=" + value);
        $('#convert-selector').removeAttr('disabled');
        $('#convert-selector-from').removeAttr('disabled');
        /*
         * 
         * when start game button is clicked
         */
        $("#start").click(function () {
            //check if user has not selected both from and to same type
            if($('#convert-selector').val() == $('#convert-selector-from').val()){
                alert("Please select different from and to types");
            }
            else{
            console.log("clicked start");
            //if(timer != null)
            window.clearInterval(timer);//reset timer
            $('#inputtable tr').not(function(){if ($(this).has('th').length){return true}}).remove();
            //disable type changer
            $('#convert-selector').attr('disabled','disabled');
            $('#convert-selector-from').attr('disabled','disabled');
            timer = null,
                    interval = 1000;

            //re intialize all again

            level = "<%= level%>";
            if (level == "1")
                value = 100;
            else if (level == "2")
                value = 80;
            else if (level == "3")
                value = 100;
            $("#timer").html(value);
            console.log("value=" + value+$("#timer").html());

            //$("#inst").hide();
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
                    $("#inputtable").find("input,button,textarea,select").attr("readonly", "readonly");
                    $('#convert-selector').attr('disabled','disabled');
                    $('#convert-selector-from').attr('disabled','disabled');
                }
                $("#timer").html(value);
            }, interval);

            //call lazyload function
            startbubbling();
            bubbleiter = setInterval(startbubbling, 5000);
            console.log("after called");
        }
        });

        /**
         * when end game is clicked
         * 
         */
        $("#end").click(function () {
            window.clearInterval(timer);//reset timer
            $('#inputtable tr').not(function(){if ($(this).has('th').length){return true}}).remove();
            timer = null;
            clearInterval(bubbleiter);
            $("#parent").hide();
            $("#secondary_div").show();
            console.log("showing secondary");
            $("#inputtable").find("input,button,textarea").attr("disabled", "disabled");
            $('#convert-selector').removeAttr('disabled');
            $('#convert-selector-from').removeAttr('disabled');
        });
            
       
    var selectorchange = function(){
        if(parseInt($("#levelele").val()) >= 2){
            window.location.href = "http://localhost:8080/Numberconversionpro/index.jsp";
        }
        $("#select-menu-hidden").val($('#convert-selector').val());
    }
    var fromselectorchange = function(){
        if(parseInt($("#levelele").val()) >= 2){
            window.location.href = "http://localhost:8080/Numberconversionpro/index.jsp";
        }
        $("#from-select-menu-hidden").val($('#convert-selector-from').val());
    }
    
    $('#convert-selector').val($("#select-menu-hidden").val());
    $('#convert-selector-from').val($("#from-select-menu-hidden").val());
    </script>
    
</body>
</html>
