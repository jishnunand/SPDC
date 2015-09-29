using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace REAL_ESTATE_ASP
{
    public partial class sellgrid : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if(!IsPostBack)
            {
                binddata();
            }
        }

        public void binddata()
        {
           
            string state = Session["state"].ToString();
            string district = Session["district"].ToString();
            string property = Session["property"].ToString();
            string minimum = Session["minimum"].ToString();
            string transaction = Session["transaction"].ToString();
            //string contact = Session["contact"].ToString();
            //string img = Session["images"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
         //  string sql = "select * from"+" "+transaction+" "+"where state='"+state+"'and district='"+district+"'and property='"+property+"'and price='"+minimum+"','"+"'";
            string sql = "select signup.fname,signup.lname,"+""+transaction+""+".district," +""+transaction+""+ ".property," +""+transaction+""+".price,"+""+transaction+""+".imagepath,"+""+transaction+""+".contact"+" "+"from" + " " + transaction+" " + "inner join signup on"+" "+ transaction+""+".email=signup.email";
            
            //string sql = "select signup";
            SqlDataAdapter sda = new SqlDataAdapter(sql,con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }

        protected void btn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/buy.aspx");
        }
    }
}