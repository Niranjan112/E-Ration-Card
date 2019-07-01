using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MemberOrderDetails : System.Web.UI.Page
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
        Response.Redirect("MemberOrderList.aspx");
    }
}