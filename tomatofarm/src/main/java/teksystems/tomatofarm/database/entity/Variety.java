package teksystems.tomatofarm.database.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "varieties")
public class Variety {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "variety_name")
    private String varietyName;

    @Column(name = "color")
    private String color;

    @Column(name = "category")
    private String category;

    @Column(name = "image_url")
    private String imageUrl;

    public Variety(String varietyName, String color, String category, String imageUrl) {
        this.varietyName = varietyName;
        this.color = color;
        this.category = category;
        this.imageUrl = imageUrl;
    }
}