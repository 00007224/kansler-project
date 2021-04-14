using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Kansler.Models
{
    public class Product
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public /* image*/ int  Image { get; set; }
        public string  Description { get; set; }
        public int Category { get; set; }
        public float Price { get; set; }
        public int Barcode { get; set; }
        public int Quantity { get; set; }
        public int Warehouse { get; set; }

        [DisplayName("Supllier Name")]
        public int SupplierName { get; set; }

        [DisplayName("Supplier Date")]
        public DateTime SupplyDate { get; set; }

        [DisplayName("Supplier Country")]
        public int SupplierCountry { get; set; }

        [DisplayName("Is in stock")]
        public int IsInStock { get; set; }
    }
}
    
