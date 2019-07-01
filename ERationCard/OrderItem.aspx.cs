using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderItem : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    public static List<EntityBL> lobjEntityBL = new List<EntityBL>();
    public static int Amount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            Display();
        }
    }
    public void Display()
    {
        ddlItem.DataSource = obj.DisplayAvailableItemDetails();
        ddlItem.DataTextField = "Name";
        ddlItem.DataValueField = "id";
        ddlItem.DataBind();
        ddlItem.Items.Insert(0, "--Select Item--");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        EntityBL blobj = new EntityBL();
        blobj.id = Convert.ToInt32(ddlItem.SelectedValue);
        blobj.FName = ddlItem.SelectedItem.ToString();
        blobj.Quantity = Convert.ToInt32(ddlQuantity.SelectedValue);
        blobj.Amount = txtAmount.Text;
        lobjEntityBL.Add(blobj);
        DisplayCart();
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (lobjEntityBL.Count > 0)
        {
            obj.OrderId = "OD" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Millisecond.ToString();
            obj.RelationalNumber = txtRelationalReference.Text;
            for (int i = 0; i < lobjEntityBL.Count; i++)
            {

                obj.ItemId = lobjEntityBL[i].id;
                obj.Quantity = lobjEntityBL[i].Quantity;
                obj.Amount = lobjEntityBL[i].Amount;
                obj.RecievedBy = ddlRelation.SelectedValue;
                obj.InsertOrderDetails();
            }
            lobjEntityBL = new List<EntityBL>();
            DisplayCart();
        }
    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        obj.RelationalNumber = txtRelationalReference.Text;
        DataTable dt = new DataTable();
        dt = obj.DisplayFamilyDetailsByRelationalNumber();
        if (dt.Rows.Count > 0)
        {
            int totalFamilyIncome = 0;
            totalFamilyIncome = Convert.ToInt32(dt.Rows[0]["AnnualIncome"]);
            int familyheadid = Convert.ToInt32(dt.Rows[0]["id"]);
            DataTable dt1 = new DataTable();
            dt1 = obj.DisplayFamilyDetailsByFamilyHeadId(familyheadid);
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    int totalIncome = Convert.ToInt32(dt1.Rows[i]["AnnualIncome"]);
                    totalFamilyIncome = totalFamilyIncome + totalIncome;
                }
            }

            if (totalFamilyIncome > 100000)
            {
                lblStatus.Text = "Your are not applicable for this service.";
                btnInsert.Enabled = false;
            }
            else
            {
                lblStatus.Text = "Valid User";
                btnInsert.Enabled = true;
            }
        }
        else
        {
            lblStatus.Text = "Invalid User";
            btnInsert.Enabled = false;
        }
    }
    public void DisplayCart()
    {
        rptData.DataSource = lobjEntityBL;
        rptData.DataBind();
    }
    protected void DeleteData(object sender, EventArgs e)
    {
        LinkButton ibtn = (LinkButton)sender;
        int id = Convert.ToInt32(ibtn.Attributes["PID"].ToString());
        lobjEntityBL.RemoveAll(x => x.id == id);
        DisplayCart();
    }

    protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        string lstrID = ddlItem.SelectedValue;
        if (lstrID != "--Select Item--")
        {
            obj.id = Convert.ToInt32(lstrID);
            DataTable dt = new DataTable();
            dt = obj.DisplayItemDetailsById();
            if (dt.Rows.Count > 0)
            {
                Amount = Convert.ToInt32(dt.Rows[0]["Amount"].ToString());
            }
        }
    }

    protected void ddlQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string lstrID = ddlQuantity.SelectedValue;
        int lintQuantity = Convert.ToInt32(lstrID);
        int lintTotalAmount = lintQuantity * Amount;
        txtAmount.Text = Convert.ToString(lintTotalAmount);
    }
}