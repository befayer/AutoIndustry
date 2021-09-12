package entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "factory")
public class Factory {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_for_factory")
    @SequenceGenerator(name = "id_for_factory", sequenceName = "id_for_factory", allocationSize = 1)
    @Column(name = "id_factory", nullable = false)
    private int factoryId;

    @Column(name = "name_factory", nullable = false)
    private String factoryName;

    @Column(name = "country_factory", nullable = false)
    private String factoryCountry;

    @Column(name = "city_factory", nullable = false)
    private String factoryCity;

    @OneToMany(mappedBy = "factory", cascade = CascadeType.ALL)
    private List<Vehicle> vehicleList;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_brand")
    private Brand brand;

    public Factory(){}

    public Factory(String factoryName, String factoryCountry, String factoryCity){
        this.factoryName = factoryName;
        this.factoryCountry = factoryCountry;
        this.factoryCity = factoryCity;
        vehicleList = new ArrayList<>();
    }

    public int getFactoryId(){return factoryId;}
    public void setFactoryId(int factoryId){this.factoryId = factoryId;}

    public String getFactoryName(){return factoryName;}
    public void setFactoryName(String factoryName){this.factoryName = factoryName;}

    public String getFactoryCountry(){return factoryCountry;}
    public void setFactoryCountry(String factoryCountry){this.factoryCountry = factoryCountry;}

    public String getFactoryCity(){return factoryCity;}
    public void setFactoryCity(String factoryCity){this.factoryCity = factoryCity;}

    public List<Vehicle> getVehicleList(){return vehicleList;}
    public void setVehicleList(List<Vehicle> factoryList){this.vehicleList = vehicleList;}

    public void addVehicle(Vehicle vehicle){
        vehicleList.add(vehicle);
    }

    public void removeVehicle(Vehicle vehicle){
        vehicleList.remove(vehicle);
    }

    public String toString(){
        return "Factory { id:" + getFactoryId() + "name:" + getFactoryName()  + "Country:" + getFactoryCountry() +
                "city:" + getFactoryCity()+ "}";
    }

    public Brand getFactoryIdBrand(){return brand;}
    public void setFactoryIdBrand(Brand brand){this.brand = brand;}
}
