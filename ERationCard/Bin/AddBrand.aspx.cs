using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_AddBrand : AdminBasePage
{
    Entity_DL obj = new Entity_DL();
    public Int32 ID
    {
        get
        {
            return Convert.ToInt32(Request.QueryString["ID"].ToString());
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            Display();
        }
    }
    public void Display()
    {
        if (ID != -1)
        {
            obj.BrandId = ID;
            DataTable dt = new DataTable();
            dt = obj.DisplayBrandByID();
            if (dt.Rows.Count > 0)
            {
                txtBrand.Text = dt.Rows[0]["BrandName"].ToString();
                chkAct.Checked = Convert.ToBoolean(dt.Rows[0]["Activate"].ToString());
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        obj.BrandId = ID;
        obj.BrandName = txtBrand.Text;
        obj.CategoryId = Convert.ToInt32(Session["CategoryID"].ToString());
        obj.ProductId = Convert.ToInt32(Session["ProductID"].ToString());
        obj.Activate = chkAct.Checked;
        obj.UserName = Session["AdminUserName"].ToString();
        obj.AddOrUpdateBrand();
        Response.Redirect("CategoryBrandMaster.aspx");
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Display();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryBrandMaster.aspx");
    }
}