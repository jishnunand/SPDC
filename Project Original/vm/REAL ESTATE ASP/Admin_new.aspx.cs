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
    public partial class Admin_new : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binddata();
            }  
        }

        public void binddata()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            string sql = "select signup.Fname,signup.Lname,signup.Age,signup.Gender,signup.Ph_No,newprojects.state,newprojects.district,newprojects.property,newprojects.price,newprojects.imagepath from signup inner join newprojects on signup.Email=newprojects.email";
            //string sql = "select signup";
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            binddata();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin_Home.aspx");
        }
    }
}