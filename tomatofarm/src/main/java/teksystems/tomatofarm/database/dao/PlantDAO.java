package teksystems.tomatofarm.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import teksystems.tomatofarm.database.entity.Plant;

@Repository
public interface PlantDAO extends JpaRepository<Plant, Long> {
    Plant findPlantById(@Param("plantId") Integer plantId);
}
