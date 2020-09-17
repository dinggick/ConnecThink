package test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.entity.Task;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.TaskRepository;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class TaskTest {
	@Autowired
	private TaskRepository repository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	//@Test
	void findAllTest() {
		repository.findAll();
	}
	
	//@Test
	public void lists(){
		List<Task> tasks = new ArrayList<>();
		projectRepository.findById(2).get().getTasks().forEach(r ->{
			tasks.add(r);
		});
	}
	
}
