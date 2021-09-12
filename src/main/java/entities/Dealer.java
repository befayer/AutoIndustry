package entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "dealer")
public class Dealer {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_for_dealer")
    @SequenceGenerator(name = "id_for_dealer", sequenceName = "id_for_dealer", allocationSize = 1)
    @Column(name = "id_dealer", nullable = false)
    private int dealerId;

    @Column(name = "name_dealer", nullable = false)
    private String dealerName;

    @Column(name = "country_dealer", nullable = false)
    private String dealerCountry;

    @Column(name = "city_dealer", nullable = false)
    private String dealerCity;

    @OneToMany(mappedBy = "dealer", cascade = CascadeType.ALL)
    private List<Vehicle> vehicleList;

    public Dealer(){}

    public Dealer(String dealerName, String dealerCountry, String dealerCity){
        this.dealerName = dealerName;
        this.dealerCountry = dealerCountry;
        this.dealerCity = dealerCity;
        vehicleList = new ArrayList<>();
    }

    public int getDealerId(){return dealerId;}
    public void setDealerId(int dealerId){this.dealerId = dealerId;}

    public String getDealerName(){return dealerName;}
    public void setDealerName(String dealerName){this.dealerName = dealerName;}

    public String getDealerCountry(){return dealerCountry;}
    public void setDealerCountry(String dealerCountry){this.dealerCountry = dealerCountry;}

    public String getDealerCity(){return dealerCity;}
    public void setDealerCity(String dealerCity){this.dealerCity = dealerCity;}

    public List<Vehicle> getVehicleList(){return vehicleList;}
    public void setVehicleList(List<Vehicle> vehicleList){this.vehicleList = vehicleList;}

    public void addVehicle(Vehicle vehicle){
        vehicleList.add(vehicle);
    }

    public void removeVehicle(Vehicle vehicle){
        vehicleList.remove(vehicle);
    }

    public String toString(){
        return "Dealer { id:" + getDealerId() + "name:" + getDealerName()  + "Country:" + getDealerCountry() +
                "city:" + getDealerCity()+ "}";
    }
}
