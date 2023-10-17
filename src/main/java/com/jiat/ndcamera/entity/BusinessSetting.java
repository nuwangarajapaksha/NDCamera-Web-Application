package com.jiat.ndcamera.entity;

import com.jiat.ndcamera.util.BSUtil;

import javax.persistence.*;

@Entity(name = "business_settings")
//@Table(name = "business_settings")
public class BusinessSetting extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String name;
    @Column(columnDefinition = "LONGTEXT")
    private String value;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @PostPersist
    @PostUpdate
    public void updateBSUtil(){
        BSUtil.reload();
    }
}
