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
    public partial class buy : System.Web.UI.Page
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
                DropDownList5.Items.Add(new ListItem("Selling"));
                DropDownList5.Items.Add(new ListItem("Renting"));
                DropDownList5.Items.Add(new ListItem("NewProjects"));
                minimum.Attributes["placeholder"] = "Minimum Value";
               maximum.Attributes["placeholder"] = "Maximum Value";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0 ||  DropDownList3.SelectedIndex == 0 || DropDownList5.SelectedIndex == 0|| minimum.Text==""|| maximum.Text=="" )
            {

                Response.Write("<script>alert('Select Fields to search')</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                //string contact = "For more details contact Mr.Ajin Chandran phno:9065436754";
                Session["state"] = DropDownList1.SelectedValue;
                Session["district"] = DropDownList2.SelectedValue;
                Session["property"] = DropDownList3.SelectedValue;
                Session["minimum"] = minimum.Text;
                Session["maximum"] = maximum.Text;
                Session["transaction"] = DropDownList5.SelectedValue;


                cmd.CommandText = "select count(*) from" + " " + DropDownList5.SelectedValue + " " + "where price>="+minimum.Text+"and price<="+maximum.Text+"and district='" + DropDownList2.SelectedValue + "'and property='" + DropDownList3.SelectedValue + "'and state='"+DropDownList1.SelectedValue+"'";
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    cmd.CommandText = "select * from" + " " + DropDownList5.SelectedValue + " " + "where state='" + DropDownList1.SelectedValue + "'and district='" + DropDownList2.SelectedValue + "'and property='" + DropDownList3.SelectedValue + "'and price<=" + minimum.Text + "and price>=" + maximum.Text + "";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/sellgrid.aspx");
                    //Response.Write("<script>alert('Data Inserted Successfully')</script>");
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Selected Data Does Not Exist')</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}