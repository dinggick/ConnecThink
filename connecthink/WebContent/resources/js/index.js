
$(document).ready(function(){
console.log("hi");


loadMemberList();
loadProjectList();

});

function loadMemberList() {
	var $memberSection = $("div.main_member_area > .container > .row:nth-child(2)");
	$.ajax({
    	url : "/connecthink/customerList",  
    	method: "GET",
		success: function(responseObj) {
			
			var txt = "";
			for (x in responseObj) {
				txt += "<div class='col-md-6 col-lg-3'><div class='single_catagory'>" +
						"<div class='thumb' style='float: right;'> " +
						"<img src='img/candiateds/1.png' alt=''></div>"+
						"<a href='member_recruit'><h4>"+responseObj[x].name+"</h4></a>" +
						" <input type='text' id='customerNo' value='"+responseObj[x].customerNo + "' hidden='hidden'>";							 
				
				for(p in responseObj[x].customerPositions) {
					txt += "<p style='font-weight: bold;'>"+ responseObj[x].customerPositions[p].position.name+"</p>"
				}	
				txt += "<p>" + responseObj[x].about + "</p>";
				txt += "</div></div>";
			} 
			
			$memberSection.html(txt);
		}
    });
}
function loadProjectList() {
	var $teamSection =  $("div.popular_catagory_area > .container > .row:nth-child(2)");
	$.ajax({
    	url : "/connecthink/projectList",  
    	method: "GET",
		success: function(responseObj) {
			console.log(responseObj);
			var txt = "";
			for (x in responseObj) {
				txt += "<div class='col-md-6 col-lg-3'><div class='single_catagory'>" +
						
						"<a href='member_recruit'><h4>"+responseObj[x].title+"</h4></a>" +
						" <input type='text' id='customerNo' value='"+responseObj[x].projectNo + "' hidden='hidden'>";							 
				
				for(p in responseObj[x].customerPositions) {
					txt += "<p style='font-weight: bold;'>"+ responseObj[x].customerPositions[p].position.name+"</p>"
				}	
				txt += "<p>" + responseObj[x].about + "</p>";
				txt += "</div></div>";
			} 
			
			$teamSection.html(txt);
			
		}
    });
}