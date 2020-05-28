package com.example.demo.controllers;

import com.example.demo.entities.Customer;
import com.example.demo.exceptions.RecordNotFoundException;
import com.example.demo.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("customers")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping
    public List<Customer> index() {
        return customerService.index();
    }

    @PostMapping
    public Customer store(@RequestBody Customer customer) {
        return customerService.store(customer);
    }

    @PutMapping("/{id}")
    public Customer update(@PathVariable("id") Integer id, @RequestBody Customer customer) {
        return  customerService.update(customer, id);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable("id") Integer id) {
        try {
            return ResponseEntity.ok(customerService.delete(id));
        } catch (RecordNotFoundException exception) {
            return ResponseEntity.status(400).body("Customer not found");
        }
    }
}
