using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project
{
    public class Order
    {
        QLTVEntities data = new QLTVEntities();

        public int iMasach { get; set; }
        public string sTensach { get; set; }
        public string sAnhbia { get; set; }
        public int iSL { get; set; }

        public Order(int masach)
        {
            iMasach = masach;
            SACH sach = data.SACHes.Single(n => n.Masach == iMasach);
            sTensach = sach.Tensach;
            sAnhbia = sach.Hinhminhhoa;
            iSL = 1;
        }
    }
}