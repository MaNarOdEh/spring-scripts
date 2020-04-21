import java.util.List;
import java.util.UUID;
import com.example.demo.model.User;
import com.example.demo.services.UserServiceImp;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/User")
public class UserController {
@Autowired
private MovieServicesImp userServiceImp;
}
