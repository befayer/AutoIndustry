package entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "model")
public class Model {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_for_model")
    @SequenceGenerator(name = "id_for_model", sequenceName = "id_for_model", allocationSize = 1)
    @Column(name = "id_model", nullable = false)
    private int modelId;

    @Column(name = "name_model", nullable = false)
    private String modelName;

    @Column(name = "type_model", nullable = false)
    private String modelType;

    @OneToMany(mappedBy = "model", cascade = CascadeType.ALL)
    private List<Vehicle> vehicleList;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_brand")
    private Brand brand;

    public Model(){}

    public Model(String modelName, String modelType){
        this.modelName = modelName;
        this.modelType = modelType;
        vehicleList = new ArrayList<>();
    }

    public int getModelId(){return modelId;}
    public void setModelId(int modelId){this.modelId = modelId;}

    public String getModelName(){return modelName;}
    public void setModelName(String modelName){this.modelName = modelName;}

    public String getModelType(){return modelType;}
    public void setModelType(String modelType){this.modelType = modelType;}

    public List<Vehicle> getVehicleList(){return vehicleList;}
    public void setVehicleList(List<Vehicle> vehicleList){this.vehicleList = vehicleList;}

    public void addVehicle(Vehicle vehicle){
        vehicleList.add(vehicle);
    }

    public void removeVehicle(Vehicle vehicle){
        vehicleList.remove(vehicle);
    }

    public String toString(){
        return "Model { id:" + getModelId() + "name:" + getModelName()  + "}";
    }

    public Brand getModelIdBrand(){return brand;}
    public void setModelIdBrand(Brand brand){this.brand = brand;}
}
