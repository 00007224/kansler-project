using Kansler.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kansler.DAL
{
     public interface IProductRepository
    {
        IList<Product> GetAll();
    }
}
