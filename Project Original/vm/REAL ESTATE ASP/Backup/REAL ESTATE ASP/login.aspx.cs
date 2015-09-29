using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data;

namespace REAL_ESTATE_ASP
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            text.Attributes["Placeholder"] = "UserId";
            password.Attributes["Placeholder"] = "Password";
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (text.Text == "" || password.Text == "")
            {
                Response.Write("<script>alert('Please Enter All Fields')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlcon;
                sqlcon.Open();
                string inputmail = text.Text;
                if (isvalidemailid(inputmail))
                {

                    cmd.CommandText = "select email,password from signup where email like'" + text.Text + "'and password like'" + password.Text + "'";
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows == true)
                    {
                        Session["userid"] = text.Text;
                        Response.Redirect("~/home.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Login')</script>");
                    }

                }

                else
                {
                    Response.Write("<script>alert('Invalid Email-Id')</script>");
                }

            }
        }
    }
}