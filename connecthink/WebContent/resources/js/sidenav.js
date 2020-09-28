$(() => {
	//side bar lookUp project
	$.ajax({
		url:"/connecthink/lookUpMyProject"
		,success:function(projectInfo){
			let space = $('.sidenav');
			
			$(projectInfo).each(function (index, project) {
				let url = "board?project_no="+project.projectNo+"";
				space.append("<a href="+url+">"+project.title+"</a>");
			});	
			
		}
	});
});