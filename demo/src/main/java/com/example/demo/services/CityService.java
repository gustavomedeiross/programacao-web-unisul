package com.example.demo.services;

import com.example.demo.entities.City;
import com.example.demo.exceptions.RecordNotFoundException;
import com.example.demo.repositories.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;
import java.util.Optional;

@Service
public class CityService {
    @Autowired
    CityRepository cityRepository;

    public List<City> index() {
        return cityRepository.findAll();
    }

    public City store(City city) {
        return cityRepository.save(city);
    }

    public City update(City city, Integer id) {
        Assert.notNull(id,  "Não foi possível atualizar a cidade");
        Optional<City> optionalCity = cityRepository.findById(id);

        if (optionalCity.isPresent()) {
            City registeredCity = optionalCity.get();
            registeredCity.setName(city.getName());
            registeredCity.setUf(city.getUf());
            cityRepository.save(registeredCity);

            return registeredCity;
        }

        return null;
    }

    public City delete(Integer id) throws RecordNotFoundException {
        Optional<City> optionalCity = cityRepository.findById(id);

        if (optionalCity.isPresent()) {
            City city = optionalCity.get();
            cityRepository.delete(city);
            return city;
        }

        throw new RecordNotFoundException("City not found");
    }
}
