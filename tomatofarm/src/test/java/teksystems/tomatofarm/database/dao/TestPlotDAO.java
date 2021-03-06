package teksystems.tomatofarm.database.dao;

import lombok.extern.slf4j.Slf4j;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;
import teksystems.tomatofarm.database.entity.Plot;

import java.util.List;
import java.util.Optional;

@Slf4j
@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class TestPlotDAO {
    @Autowired
    private PlotDAO plotRepository;

    @Test
    @Order(1)
    @Rollback(value = false)
    public void savePlot(){
        Plot plot = new Plot(1, "hydroponic", "indoor hydroponics", 50, 0);
        plotRepository.save(plot);
        Assertions.assertThat(plot.getId()).isGreaterThan(0);
    }
    @Test
    @Order(2)
    @Rollback(value = false)
    public void getPlotTest(){
        Plot plot = plotRepository.findById(1);
        Assertions.assertThat(plot.getId()).isEqualTo(1);
    }
    @Test
    @Order(3)
    @Rollback(value = false)
    public void getPlotListTest(){
        List<Plot> plotList = plotRepository.findAll();
        Assertions.assertThat(plotList.size()).isGreaterThan(0);
    }
    @Test
    @Order(4)
    @Rollback(value = false)
    public void updatePlotTest(){
        Plot plot = plotRepository.findById(1);
        plot.setCultivationStyle("outdoor traditional");
        Assertions.assertThat(plotRepository.findById(1).getCultivationStyle()).isEqualTo(plot.getCultivationStyle());
    }
    @Test
    @Order(5)
    @Rollback(value = false)
    public void deletePlotTest(){
        Plot plot = plotRepository.findById(1);
        plotRepository.delete(plot);
        Optional<Plot> optionalPlot = Optional.ofNullable(plotRepository.findById(plot.getId()));
        Plot temporaryPlot = null;
        if (optionalPlot.isPresent()){
            temporaryPlot = plotRepository.findById(plot.getId());
        }
        Assertions.assertThat(temporaryPlot).isNull();
    }
}
