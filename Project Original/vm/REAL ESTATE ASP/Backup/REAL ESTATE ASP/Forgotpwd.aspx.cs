using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace REAL_ESTATE_ASP
{
    public partial class Forgotpwd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static bool isvalidemailid(string inputmail)
        {
            Regex expression = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = expression.Match(inputmail);
            if (match.Success)
                return true;
            else
                return false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            string inputmail = email.Text;
            if (isvalidemailid(inputmail))
            {
                cmd.CommandText = "select * from signup where fname='" + fname.Text + "'and lname='" + lname.Text + "'and email='" + inputmail + "'";
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows == true)
                {
                    sdr.Close();
                    if(pwd.Text==confirm.Text)
                    {
                    cmd.CommandText = "update signup set password='" + confirm.Text + "'where fname='" + fname.Text + "'and lname='" + lname.Text + "'and email='" + inputmail + "'";
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Password Updated Successfully')</script>");
 
                    }
                    else
                    {
                        Response.Write("<script>alert('Password Mismatch')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Data Does Not Exist')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Email')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}