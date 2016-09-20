using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Revamp_LatestSightings
{
    public class Person
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Role { get; set; }
        public string CellNumber { get; set; }
        public string TelephoneNumber { get; set; }
        public string OtherContact { get; set; }
        public string Address { get; set; }
        public string Banking { get; set; }
        public string Paypal { get; set; }
        public string Facebook { get; set; }
        public string Skype { get; set; }
        public string Twitter { get; set; }
        public bool Active { get; set; }
        public string username { get; set; }
        public string screenName { get; set; }
    }
}