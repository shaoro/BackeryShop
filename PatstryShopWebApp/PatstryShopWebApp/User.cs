using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PatstryShopWebApp
{
    public class User
    {
        private int id;
        private string firstName;
        private string lastName;
        private string email;
        private string userName;
        private string password;
        private string phoneNumber;
        private int addressId;

        public User (int id, string fName, string lName, string email, string uName, string password, string phone, int addressId)
        {
            this.id = id;
            this.firstName = fName;
            this.lastName = lName;
            this.email = email;
            this.userName = uName;
            this.password = password;
            this.phoneNumber = phone;
            this.addressId = addressId;
        }

        public int ID {
            get { return id; }
            set { }
        }

        public string FirstName
        {
            get { return firstName; }
            set { }
        }

        public string LastName
        {
            get { return lastName; }
            set { }
        }

        public string Email
        {
            get { return email; }
            set { }
        }

        public string UserName
        {
            get { return userName; }
            set { }
        }

        public string Password
        {
            get { return password; }
            set { }
        }

        public string PhoneNum
        {
            get { return phoneNumber; }
            set { }
        }

        public int AddressID
        {
            get { return addressId; }
            set { }
        }
    }
}