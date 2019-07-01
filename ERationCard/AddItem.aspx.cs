using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddItem : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
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
            obj.id = ID;
            DataTable dt = new DataTable();
            dt = obj.DisplayItemDetailsById();
            if (dt.Rows.Count > 0)
            {
                txtFName.Text = dt.Rows[0]["Name"].ToString();
                txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                ddlAvailability.SelectedValue = dt.Rows[0]["Availability"].ToString();

            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        obj.id = ID;
        obj.FName = txtFName.Text;
        obj.Amount = txtAmount.Text;
        obj.Availability = ddlAvailability.SelectedValue;
        obj.InsertUpdateItemDetails();
        Response.Redirect("ItemList.aspx");
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Display();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ItemList.aspx");
    }

    
}