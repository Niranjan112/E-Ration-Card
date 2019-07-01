using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ViewOrderDetails : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Display();
            DisplayMemberDetails();
        }
    }
    public void DisplayMemberDetails()
    {
        obj.RelationalNumber = Session["RelationalRef"].ToString();
        DataTable dt = new DataTable();
        dt = obj.DisplayFamilyDetailsByRelationalNumber();
        if (dt.Rows.Count > 0)
        {
            lblRegCode.Text= Session["RelationalRef"].ToString();
            lblName.Text = dt.Rows[0]["FName"].ToString() + " " + dt.Rows[0]["MName"].ToString() + " " + dt.Rows[0]["LName"].ToString();
            lblEmailID.Text = dt.Rows[0]["Email"].ToString();
            lblContact.Text = dt.Rows[0]["ContactNo"].ToString();
            lblAddress.Text = dt.Rows[0]["Address"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            lblDistrict.Text = dt.Rows[0]["District"].ToString();
            lblTaluka.Text = dt.Rows[0]["Taluka"].ToString();
            lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
            lblIncome.Text = dt.Rows[0]["AnnualIncome"].ToString();
            Image1.ImageUrl= dt.Rows[0]["Image"].ToString();
        }
    }
    public void Display()
    {
        List<DataEntityBinder> lobjDataEntityBinderList = new List<DataEntityBinder>();
        obj.OrderId = Session["OrederId"].ToString();
        DataTable dt = new DataTable();
        dt = obj.DisplayOrderDetailsByOrderId();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataEntityBinder lobjDataEntityBinder = new DataEntityBinder();
                string lstrId = dt.Rows[i]["ItemId"].ToString();
                DataTable dt1 = new DataTable();
                obj.id =Convert.ToInt32(lstrId);
                dt1 = obj.DisplayItemDetailsById();
                if (dt1.Rows.Count > 0)
                {
                    lobjDataEntityBinder.lstr1= dt1.Rows[0]["Name"].ToString();
                }
                lobjDataEntityBinder.lstr2= dt.Rows[i]["Quantity"].ToString();
                lobjDataEntityBinder.lstr3 = dt.Rows[i]["Amount"].ToString();
                lobjDataEntityBinder.lstr4 = dt.Rows[i]["RecievedBy"].ToString();

                lobjDataEntityBinderList.Add(lobjDataEntityBinder);
            }
        }
        rptData.DataSource = lobjDataEntityBinderList;
        rptData.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderDetails.aspx");
    }
}