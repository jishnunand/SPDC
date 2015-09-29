using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace REAL_ESTATE_ASP
{
    public partial class buygrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                map();
            }
        }

        public void map()
        {
           // string district = Session["district"].ToString();
            DataTable dt = GetData("select * from location ");
            rptMarkers.DataSource = dt;
            rptMarkers.DataBind();
        }


        private DataTable GetData(string query)
        {
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection conn = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
}