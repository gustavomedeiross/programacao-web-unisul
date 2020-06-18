package com.gustavo.cars.services;

import com.gustavo.cars.entities.Car;
import com.gustavo.cars.errors.RecordNotFoundError;
import com.gustavo.cars.repositories.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;
import java.util.Optional;

@Service
public class CarService {
    @Autowired
    private CarRepository carRepository;

    public List<Car> getAll() {
        return carRepository.findAll();
    }

    public Car create(Car car) {
        return carRepository.save(car);
    }

    public Car update(Car car, Integer id) throws RecordNotFoundError {
        Assert.notNull(id, "The id is required");
        Optional<Car> optionalCar = carRepository.findById(id);

        if (!optionalCar.isPresent()) {
            throw new RecordNotFoundError("Record not found");
        }

        Car registeredCar = optionalCar.get();
        registeredCar.setName(car.getName());
        registeredCar.setDescription(car.getDescription());
        registeredCar.setType(car.getType());
        registeredCar.setImage(car.getImage());
        registeredCar.setVideo(car.getVideo());
        registeredCar.setLatitude(car.getLatitude());
        registeredCar.setLongitude(car.getLongitude());
        carRepository.save(registeredCar);

        return registeredCar;
    }

    public Car delete(Integer id) throws RecordNotFoundError {
        Optional<Car> optionalCar = carRepository.findById(id);

        if (!optionalCar.isPresent()) {
            throw new RecordNotFoundError("Record not found");
        }

        Car car = optionalCar.get();
        carRepository.delete(car);
        return car;
    }
}
