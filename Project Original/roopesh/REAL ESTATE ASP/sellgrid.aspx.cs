﻿using System;
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
                map();
            }
        }


        public void map()
        {
            string district = Session["district"].ToString();
            DataTable dt = GetData("select * from location where description='"+district+"'and description='"+district+"'");
            rptMarkers.DataSource = dt;
            rptMarkers.DataBind();
            binddata();
        }


        private DataTable GetData(string query)
        {
            SqlCommand cmd = new SqlCommand(query);
            using(SqlConnection conn = new SqlConnection("Data Source=dell;Initial Catalog=Cosco;Integrated Security=True"))
            {
                using(SqlDataAdapter sda=new SqlDataAdapter())
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using(DataTable dt=new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }










        public void binddata()
        {
           
            string state = Session["state"].ToString();
            string district = Session["district"].ToString();
            string property = Session["property"].ToString();
            string minimum = Session["minimum"].ToString();
            string maximum = Session["maximum"].ToString();
            string transaction = Session["transaction"].ToString();
            //string contact = Session["contact"].ToString();
            //string img = Session["images"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
         //  string sql = "select * from"+" "+transaction+" "+"where state='"+state+"'and district='"+district+"'and property='"+property+"'and price='"+minimum+"','"+"'";
            string sql = "select signup.fname,signup.lname,"+""+transaction+""+".district," +""+transaction+""+ ".property," +""+transaction+""+".price,"+""+transaction+""+".imagepath,"+""+transaction+""+".contact"+" "+"from" + " " + transaction+" " + "inner join signup on"+" "+ transaction+""+".email=signup.email and "+transaction+""+".price>="+minimum+" "+"and"+" "+transaction+""+".price<="+maximum+" "+"where"+" "+transaction+""+".property='"+property+"'";
            
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            binddata();
        }
    }
}