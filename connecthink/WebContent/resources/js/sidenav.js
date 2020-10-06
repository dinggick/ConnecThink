$(() => {
	//side bar lookUp project
	$.ajax({
		url:"/connecthink/logined/lookUpMyProject"
		,success:function(projectInfo){
			let space = $('.sidenav');
			
			$(projectInfo).each(function (index, project) {
				if(project.projectStatus ==1){
					let url = "/connecthink/logined/board?project_no="+project.projectNo+"";
					space.append("<a href="+url+">"+project.title+"</a>");
				}
				
			});	
			
		}
	});
});