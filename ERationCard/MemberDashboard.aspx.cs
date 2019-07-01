using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberDashboard : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Display();
        }
    }
    public void Display()
    {
        
        obj.RelationalNumber = Session["RelationalRef"].ToString();
        DataTable dt = new DataTable();
        dt = obj.DisplayFamilyDetailsByRelationalNumber();
        if (dt.Rows.Count > 0)
        {
            lblRegCode.Text = Session["RelationalRef"].ToString();
            lblName.Text = dt.Rows[0]["FName"].ToString() + " " + dt.Rows[0]["MName"].ToString() + " " + dt.Rows[0]["LName"].ToString();
            lblEmailID.Text = dt.Rows[0]["Email"].ToString();
            lblContact.Text = dt.Rows[0]["ContactNo"].ToString();
            lblAddress.Text = dt.Rows[0]["Address"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblDistrict.Text = dt.Rows[0]["District"].ToString();
            lblTaluka.Text = dt.Rows[0]["Taluka"].ToString();
            lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
            lblIncome.Text = dt.Rows[0]["AnnualIncome"].ToString();
            Image1.ImageUrl = dt.Rows[0]["Image"].ToString();
            lblRelation.Text = "HOF";
        }

    }
}