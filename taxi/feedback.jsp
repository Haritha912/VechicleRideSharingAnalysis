<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Feedback</title>
		<meta name="description" content="Minimal Form Interface: Simplistic, single input view form" />
		<meta name="keywords" content="form, minimal, interface, single input, big form, responsive form, transition" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/taxi/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="/taxi/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="/taxi/css/component.css" />
		<script src="/taxi/js/modernizr.custom.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <%
String name= request.getParameter("name");
String contact= request.getParameter("contact");
  %>
  <script type="text/javascript">
    
  	$(document).ready(function(){
  		$("#anssubmit").click(function(){
      	
      	var q1=document.getElementById("q1");
      	var q2=document.getElementById("q2");
      	var q3=document.getElementById("q3");
      	var q4=document.getElementById("q4");
      	console.log(q1.value);
      	         var xhttp = new XMLHttpRequest();

      	 xhttp.onreadystatechange = function() {
      	if (this.readyState == 4 && this.status == 200) {
         	console.log(this.responseText.trim())

         	if(this.responseText.trim()==1)
         		document.getElementById("response").innerHTML = "Some error  occured";
         	
         	else
         	{
         	

         		document.getElementById("response").innerHTML =this.responseText;

         		
         	}
         	
         }
         };
         
        xhttp.open("GET", "feedbacksubmit.jsp?name="+"<%=name%>"+"&contact="+<%=contact%>+"&q1="+q1.value+"&q2="+q2.value+"&q3="+q3.value+"&q4="+q4.value, true);
        xhttp.send();
        });

      });

  		</script>
	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a class="codrops-icon codrops-icon-prev" href="/taxi"><span>Another Analyzation</span></a>
				<span class="right"><a class="codrops-icon codrops-icon-drop" href="/taxi/"><span>Log out</span></a></span>
			</div>
			<header class="codrops-header">
				<h1> CUSTOMER FEEDBACK <span> RATE US ON A SCALE OF 0-5 </span></h1>	
			</header>
			<section>
				<form id="theForm" class="simform" autocomplete="off">
					<div class="simform-inner">
						<ol class="questions">
							<li>
								<span><label for="q1">Is the website helpful ?</label></span>
								<input id="q1" name="q1" type="number"/>
							</li>
							<li>
								<span><label for="q2">How likely you would recommend this to your friend or colleague ?</label></span>
								<input id="q2" name="q2" type="number"/>
							</li>
							<li>
								<span><label for="q3">How was the share taxi experience ?</label></span>
								<input id="q3" name="q3" type="number"/>
							</li>
							<li>
								<span><label for="q4">how would you rate this initiative ?</label></span>
								<input id="q4" name="q4" type="number"/>
							</li>
							
						</ol><!-- /questions -->
						
						<div class="controls">
							<button class="next"></button>
							<div class="progress"></div>
							<span class="number">
								<span class="number-current"></span>
								<span class="number-total"></span>
							</span>
							<span class="error-message"></span>
						</div><!-- / controls -->
					</div><!-- /simform-inner -->
					<span class="final-message"></span>
				</form><!-- /simform -->		
				<button type="submit" id="anssubmit">Send answers</button>	
			</section>
			<section class="related">
				<p><b>Thank you for your support in helping us to conserve the environment !</b></p>
				<a href="http://tympanus.net/Tutorials/NaturalLanguageForm/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/05/NaturalLanguageForm2-300x162.png" />
					<h3> <b>Pollution Analysis Chart </b></h3>
				</a>
				<a href="http://tympanus.net/Development/AnimatedCheckboxes/">
					<img src="http://tympanus.net/codrops/wp-content/uploads/2013/10/AnimatedCheckboxes-300x162.png" />
					<h3> <b>Cost of pollution Graph</b> </h3>
				</a>
			</section>
		</div><!-- /container -->
		<script src="/taxi/js/classie.js"></script>
		<script src="/taxi/js/stepsForm.js"></script>
		<script>
			var theForm = document.getElementById( 'theForm' );

			new stepsForm( theForm, {
				onSubmit : function( form ) {
					// hide form
					classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );

					/*
					form.submit()
					or
					AJAX request (maybe show loading indicator while we don't have an answer..)
					*/

					// let's just simulate something...
					var messageEl = theForm.querySelector( '.final-message' );
					messageEl.innerHTML = 'Thank you! We\'ll be in touch.';
					classie.addClass( messageEl, 'show' );
				}
			} );
		</script>
	</body>
</html>