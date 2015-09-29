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
    public partial class createacc : System.Web.UI.Page
    {
        SqlConnection sqlcon = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            fname.Attributes["placeholder"] = "First Name";
            lname.Attributes["placeholder"] = "Last Name";
            age.Attributes["placeholder"] = "Age";
            Phno.Attributes["placeholder"] = "Phone No";
            email.Attributes["placeholder"] = "Email";
            password.Attributes["placeholder"] = "Password";
            confirm.Attributes["placeholder"] = "Confirm Password";
        }

        public bool phone(string no)
        {
            Regex expr = new Regex(@"^((\+){0,1}91(\s){0,1}(\-){0,1}(\s){0,1}){0,1}9[0-9](\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}[0-9]{7}$");
            if (expr.IsMatch(no))
            {
                return true;
            }
            else
            {
                return false;
            }

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
            if (fname.Text == "" || lname.Text == "" || age.Text == "" || email.Text == "" || Phno.Text == "" || password.Text == "" || confirm.Text == "")
            {
                Response.Write("<script>alert('Enter All Fields')</script>");
            }
            else
            {
                string gender = "";
                if (Male.Checked == true)
                {
                    Female.Enabled = false;
                    gender = "male";
                }
                else
                {
                    Male.Enabled = false;
                    gender = "female";
                }
                string inputmail = email.Text;
                string no = Phno.Text;
                if (isvalidemailid(inputmail))
                {
                    if (phone(no))
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = sqlcon;
                        sqlcon.Open();

                        if (password.Text == confirm.Text)
                        {
                            cmd.CommandText = "select count(*) from signup where email='" + inputmail + "'";
                            int count = (int)cmd.ExecuteScalar();
                            if (count > 0)
                            {
                                Response.Write("<script>alert('Email Already Exists')</script>");
                            }
                            else
                            {
                                cmd.CommandText = "insert into signup values('" + fname.Text + "','" + lname.Text + "','" + age.Text + "','" + gender + "','" + Phno.Text + "','" + inputmail + "','" + confirm.Text + "')";
                                cmd.ExecuteNonQuery();
                                sqlcon.Close();
                                Session["email"] = inputmail;
                                Response.Write("<script>alert('Account Created Successfully')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Password Mismatch')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Phno')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Email')</script>");
                }
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    
}
}