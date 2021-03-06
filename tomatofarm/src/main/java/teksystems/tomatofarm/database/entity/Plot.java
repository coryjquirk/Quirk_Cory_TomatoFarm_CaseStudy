package teksystems.tomatofarm.database.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "plots")
public class Plot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "user_fullname")
    private String userFullname;

    @Column(name = "soil_makeup")
    private String soilMakeup;

    @Column(name = "cultivation_style")
    private String cultivationStyle;

    @Column(name = "spaces_total")
    private Integer spacesTotal;

    @Column(name = "spaces_taken")
    private Integer spacesTaken;

    @ToString.Exclude
    @OneToMany(mappedBy = "plot", fetch = FetchType.LAZY)
    private List<PlotsPlants> plotsPlants = new ArrayList<>();

    public Plot(Integer userId, String soilMakeup, String cultivationStyle, Integer spacesTotal, Integer spacesTaken) {
        this.userId = userId;
        this.soilMakeup = soilMakeup;
        this.cultivationStyle = cultivationStyle;
        this.spacesTotal = spacesTotal;
        this.spacesTaken = spacesTaken;
    }
}