import java.io.Serializable;
import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Id;

@Entity
@Table(name = "movie", schema = "public")
public class User implements Serializable {

  @Column(name = "name")
  @NotBlank
  private String name;
  public String getName() {
      return this.name;
  }
  public void setName(String name){
      this.name = name;
  }
}
