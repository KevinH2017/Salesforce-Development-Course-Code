// Creates new Company instance
Company myCompany = new Company();

myCompany.companyName = 'Kevin\'s Company';
myCompany.ceo = 'Kevin';
myCompany.employeeCount = 21;
myCompany.revenue = 1000000;

// Adds new customer to the list of customers
myCompany.addNewCustomer('Customer 1', 'www.google.com', 'customer1@gmail.com', 5551231234L);
myCompany.addNewCustomer('Customer 2', 'www.google.com', 'customer2@gmail.com', 5551231235L);
myCompany.addNewCustomer('Customer 3', 'www.google.com', 'customer3@gmail.com', 5551231236L);

myCompany.getAllCustomers();