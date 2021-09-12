package entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "vehicle")
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_for_vehicle")
    @SequenceGenerator(name = "id_for_vehicle", sequenceName = "id_for_vehicle", allocationSize = 1)
    @Column(name = "id_vehicle", nullable = false)
    private int vehicleId;

    @Column(name = "year_vehicle", nullable = false)
    private int vehicleYear;

    @Column(name = "color_vehicle", nullable = false)
    private String vehicleColor;

    @Column(name = "type_vehicle", nullable = false)
    private String vehicleType;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_model")
    private Model model;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_dealer")
    private Dealer dealer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_factory")
    private Factory factory;

    public Vehicle(){}

    public Vehicle(int vehicleYear, String vehicleColor, String vehicleType){
        this.vehicleYear = vehicleYear;
        this.vehicleColor = vehicleColor;
        this.vehicleType = vehicleType;
    }

    public int getVehicleId(){return vehicleId;}
    public void setVehicleId(int vehicleId){this.vehicleId = vehicleId;}

    public int getVehicleYear(){return vehicleYear;}
    public void setVehicleYear(int vehicleYear){this.vehicleYear = vehicleYear;}

    public String getVehicleColor(){return vehicleColor;}
    public void setVehicleColor(String vehicleColor){this.vehicleColor = vehicleColor;}

    public String getVehicleType(){return vehicleType;}
    public void setVehicleType(String vehicleType){this.vehicleType = vehicleType;}

    public String toString(){
        return "Vehicle { id:" + getVehicleId() + "year:" + getVehicleYear()  + "color:" + getVehicleColor() +
                "type:" + getVehicleType() + "}";
    }

    public Model getVehicleIdModel(){return model;}
    public void setVehicleIdModel(Model model){this.model = model;}

    public Dealer getVehicleIdDealer(){return dealer;}
    public void setVehicleIdDealer(Dealer dealer){this.dealer = dealer;}

    public Factory getVehicleIdFactory(){return factory;}
    public void setVehicleIdFactory(Factory factory){this.factory = factory;}
}
