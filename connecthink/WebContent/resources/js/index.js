
$(document).ready(function(){

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
				txt += "<div class='col-md-6 col-lg-4'><div class='single_candidates text-center pl-0 pr-0 pt-0' onclick='recDetail(this);'>" +
						"<div class='thumbnail'><div class='test'><img src='img/default.png' alt='모집 사진'></div></div>" +
						"<h4 class='mt-4 mr-4 ml-4 rec_title'>" + responseObj[x].requirement + "</h4>" +
				"<ul style='list-style: none;'><li class='wanna'>" + responseObj[x].position.name + "</li>" +
					
					"<li class='peorid'>" + responseObj[x].deadline+ "</li>" +
					" <input type='text' id='customerNo' value='"+responseObj[x].recruitNo + "' hidden='hidden'></ul></div></div>";
			} 
			
			$teamSection.html(txt);
			
		}
    });
}