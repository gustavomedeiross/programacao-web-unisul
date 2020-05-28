package com.example.demo.services;

import com.example.demo.entities.Customer;
import com.example.demo.exceptions.RecordNotFoundException;
import com.example.demo.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerService {
    @Autowired
    CustomerRepository customerRepository;

    public List<Customer> index() {
        return customerRepository.findAll();
    }

    public Customer store(Customer customer) {
        return customerRepository.save(customer);
    }

    public Customer update(Customer customer, Integer id) {
        Assert.notNull(id,  "Não foi possível atualizar o cliente");
        Optional<Customer> optionalCustomer = customerRepository.findById(id);

        if (optionalCustomer.isPresent()) {
            Customer registeredCustomer = optionalCustomer.get();
            registeredCustomer.setName(customer.getName());
            registeredCustomer.setBalance(customer.getBalance());
            registeredCustomer.setCity(customer.getCity());
            customerRepository.save(registeredCustomer);

            return registeredCustomer;
        }

        return null;
    }

    public Customer delete(Integer id) throws RecordNotFoundException {
        Optional<Customer> optionalCustomer = customerRepository.findById(id);

        if (optionalCustomer.isPresent()) {
            Customer customer = optionalCustomer.get();
            customerRepository.delete(customer);
            return customer;
        }

        throw new RecordNotFoundException("Customer not found");
    }
}
