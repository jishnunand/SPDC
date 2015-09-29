﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;

namespace REAL_ESTATE_ASP
{
    public partial class _new : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add(new ListItem("Kerala"));
                DropDownList1.Items.Add(new ListItem("TamilNadu"));
                DropDownList1.Items.Add(new ListItem("Karnataka"));
                DropDownList1.Items.Add(new ListItem("AndhraPradesh"));
                DropDownList3.Items.Add(new ListItem("Land"));
                DropDownList3.Items.Add(new ListItem("Villa"));
                DropDownList3.Items.Add(new ListItem("House"));
                DropDownList3.Items.Add(new ListItem("Flat"));
                DropDownList3.Items.Add(new ListItem("Farm"));
                DropDownList4.Items.Add(new ListItem("50000"));
                DropDownList4.Items.Add(new ListItem("60000"));
                DropDownList4.Items.Add(new ListItem("70000"));
                DropDownList4.Items.Add(new ListItem("80000"));
                DropDownList4.Items.Add(new ListItem("90000"));
                DropDownList4.Items.Add(new ListItem("100000"));
                DropDownList4.Items.Add(new ListItem("200000"));
                DropDownList4.Items.Add(new ListItem("300000"));
                DropDownList4.Items.Add(new ListItem("400000"));
                DropDownList4.Items.Add(new ListItem("500000"));
                DropDownList4.Items.Add(new ListItem("600000"));
                DropDownList4.Items.Add(new ListItem("700000"));
                DropDownList4.Items.Add(new ListItem("800000"));
                DropDownList4.Items.Add(new ListItem("900000"));
                DropDownList4.Items.Add(new ListItem("1000000"));
                DropDownList4.Items.Add(new ListItem("2000000"));
                DropDownList4.Items.Add(new ListItem("3000000"));
                TextBox1.Attributes["placeholder"] = "Email";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
            if (DropDownList1.SelectedIndex == 1)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                string sql = "select district.city_name,state.State_Name from district inner join state on district.state_id =" + DropDownList1.SelectedIndex + " and state.State_Id=" + DropDownList1.SelectedIndex;
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["city_name"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                string sql = "select district.city_name,state.State_Name from district inner join state on district.state_id =" + DropDownList1.SelectedIndex + " and state.State_Id=" + DropDownList1.SelectedIndex;
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["city_name"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                string sql = "select district.city_name,state.State_Name from district inner join state on district.state_id =" + DropDownList1.SelectedIndex + " and state.State_Id=" + DropDownList1.SelectedIndex;
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["City_Name"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                string sql = "select district.city_name,state.State_Name from district inner join state on district.state_id =" + DropDownList1.SelectedIndex + " and state.State_Id=" + DropDownList1.SelectedIndex;
                SqlDataAdapter sda = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DropDownList2.DataTextField = ds.Tables[0].Columns["city_name"].ToString();
                DropDownList2.DataSource = ds.Tables[0];
                DropDownList2.DataBind();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0 || DropDownList3.SelectedIndex == 0 || DropDownList4.SelectedIndex == 0 || FileUpload1.HasFile == false)
            {

                Response.Write("<script>alert('Select All Fields to insert')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("CoscoImages/" + filename));
                string contact = "For more details contact Mr.Ajin Chandran phno:9065436754";
                Session["state"] = DropDownList1.SelectedValue;
                Session["district"] = DropDownList2.SelectedValue;
                Session["property"] = DropDownList3.SelectedValue;
                Session["minimum"] = DropDownList4.SelectedValue;
                Session["contact"] = contact;
                string inputmail = TextBox1.Text;
                if (isvalidemailid(inputmail))
                {
                    cmd.CommandText = "select email from signup where email='" + inputmail + "'";
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows == false)
                    {
                        Response.Write("<script>alert('Email Does not Exist')</script>");
                    }
                    else
                    {
                        sdr.Close();
                        cmd.CommandText = "select COUNT(*) from newprojects where state='" + DropDownList1.SelectedValue + "' and District='" + DropDownList2.SelectedValue + "' and property='" + DropDownList3.SelectedValue + "' and price='" + DropDownList4.SelectedValue + "'";
                        int count = (int)cmd.ExecuteScalar();
                        if (count > 0)
                        {
                            Response.Write("<script>alert('Data Already  Exist')</script>");
                        }
                        else
                        {
                            string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                            if (ext == ".JPEG" || ext == ".JPG" || ext == ".BMP" || ext == ".GIF" || ext == ".PNG" || ext==".jpg")
                            {
                                cmd.CommandText = "insert into NewProjects(state,district,property,price,imagename,imagepath,contact) values(@state,@district,@property,@price,@imagename,@imagepath,@contact)";
                                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedValue);
                                cmd.Parameters.AddWithValue("@district", DropDownList2.SelectedValue);
                                cmd.Parameters.AddWithValue("@property", DropDownList3.SelectedValue);
                                cmd.Parameters.AddWithValue("@price", DropDownList4.SelectedValue);
                                cmd.Parameters.AddWithValue("@imagename", filename);
                                cmd.Parameters.AddWithValue("@imagepath", "CoscoImages/" + filename);
                                cmd.Parameters.AddWithValue("@contact", contact);
                                cmd.ExecuteNonQuery();
                                Response.Write("<script>alert('Data Inserted Successfully')</script>");
                                con.Close();
                            }
                            else
                            {
                                Response.Write("<script>alert('Invalid Image Format')</script>");
                            }
                        }

                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email')</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}