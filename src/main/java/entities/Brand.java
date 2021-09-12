package entities;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "brand")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_for_brand")
    @SequenceGenerator(name = "id_for_brand", sequenceName = "id_for_brand", allocationSize = 1)
    @Column(name = "id_brand", nullable = false)
    private int brandId;

    @Column(name = "name_brand", nullable = false)
    private String brandName;

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    private List<Factory> factoryList;

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    private List<Model> modelList;

    public Brand(){}

    public Brand(String brandName){
        this.brandName = brandName;
        factoryList = new ArrayList<>();
        modelList = new ArrayList<>();
    }

    public int getBrandId(){return brandId;}
    public void setBrandId(int brandId){this.brandId = brandId;}

    public String getBrandName(){return brandName;}
    public void setBrandName(String brandName){this.brandName = brandName;}

    public List<Factory> getFactoryList(){return factoryList;}
    public void setFactoryList(List<Factory> factoryList){this.factoryList = factoryList;}

    public List<Model> getModelList(){return modelList;}
    public void setModelList(List<Model> modelList){this.modelList = modelList;}

    public void addFactory(Factory factory){
        factoryList.add(factory);
    }

    public void removeFactory(Factory factory){
        factoryList.remove(factory);
    }

    public void addModel(Model model){
        modelList.add(model);
    }

    public void removeModel(Model model){
        modelList.remove(model);
    }

    public String toString(){
        return "Brand { id:" + getBrandId() + "name:" + getBrandName() + "}";
    }
}
