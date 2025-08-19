public class Company {
    public String companyName;
    public String ceo;
    public Integer employeeCount;
    public Long revenue;

    // List of customers
    private List<Client> customers = new List<Client>();

    // Add new customer
    public void addNewCustomer(String clientName, String website, String email, Long phone) {
        // Create new customer instance and add it to the list
        Client customer = new Client(clientName, website, email, phone);
        customers.add(customer);
    }

    // Prints list of all customers and their information
    public void getAllCustomers() {
        for (Client customer : customers) {
            System.debug('Customer Name: ' + customer.clientName + ', Website: ' + customer.website + ', Email: ' + customer.email + ', Phone: ' + customer.phone);
        }
    }

    // Private inner class inside of Company class, cannot be used anywhere else
    // Stores customer information
    private class Client {
        public String clientName;
        public String website;
        public String email;
        public Long phone;

        // Constructor to initialize and store client information
        Client(String clientName, String website, String email, Long phone) {
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
        }
    }
}