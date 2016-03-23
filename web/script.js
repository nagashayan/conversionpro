/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * 
 * AS WE ARE ACCESSING AND NEED JSP VARIABLES WE CAN'T USE SEPERATE .JS FILE HERE
 */



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
                value = 60;
        var level = "<% out.print(level); %>";
        if (level == "1")
                value = 60;
        else if (level == "2")
            value = 50;
        else if (level == "3")
            value = 40;
        $("#timer").html(value);
        console.log("value=" + value);


        $("#start").click(function () {
            console.log("clicked start");
            //if(timer != null)
                window.clearInterval(timer);//reset timer
            timer = null,
                    interval = 1000;

            //re intialize all again

            level = "<%= level;%>";
            if (level == "1")
                value = 60;
            else if (level == "2")
                value = 50;
            else if (level == "3")
                value = 40;
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
                    $("#inputtable").find("input,button,textarea,select").attr("disabled", "disabled");
                }
                $("#timer").html(value);
            }, interval);

            //call lazyload function
            startbubbling();
            bubbleiter = setInterval(startbubbling, 5000);
            console.log("after called");
        });

    