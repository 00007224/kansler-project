using Kansler.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Kansler.DAL
{
    public class ProductRepository : IProductRepository
    {
        private string ConnStr
        {
            get
            {
                return WebConfigurationManager.ConnectionStrings["KanslerConnectionString"].ConnectionString; 
            }
        }


        public IList<Product> GetAll()
        {
            IList<Product> products = new List<Product>();
            using (var conn = new SqlConnection(ConnStr))
            {
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"select ID, Name, Image, Description, Category, Price, Barcode, Quantity, Warehouse, SupplierName, SupplyDate, SupplierCountry,
                                        IsInStock
                                        from product
                                            ";
                    conn.Open();
                    using (var rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            var prd = new Product();
                            prd.ID = rdr.GetInt32(rdr.GetOrdinal("ID"));
                            prd.Name = rdr.GetString(rdr.GetOrdinal("Name"));
                            /*тип данных image*/
                            prd.Image = rdr.GetInt32(rdr.GetOrdinal("Image"));
                            prd.Description = rdr.GetString(rdr.GetOrdinal("Description"));
                            prd.Category = rdr.GetInt32(rdr.GetOrdinal("Category"));
                            prd.Price = rdr.GetInt32(rdr.GetOrdinal("Price"));
                            prd.Barcode = rdr.GetInt32(rdr.GetOrdinal("Barcode"));
                            prd.Quantity = rdr.GetInt32(rdr.GetOrdinal("Quantity"));
                            prd.Warehouse = rdr.GetInt32(rdr.GetOrdinal("Warehouse"));
                            prd.SupplierName = rdr.GetInt32(rdr.GetOrdinal("SupplierName"));
                            prd.SupplyDate = rdr.GetDateTime(rdr.GetOrdinal("Supplydate"));
                            prd.SupplierCountry = rdr.GetInt32(rdr.GetOrdinal("SupplyCountry"));
                            prd.IsInStock = rdr.GetInt32(rdr.GetOrdinal("InInStock"));

                            products.Add(prd);
                        }
                    }
                }

            }
            return products;
        }
    }
}