using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OrderDetails : System.Web.UI.Page
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
        DataTable dt = new DataTable();
        dt = obj.DisplayDistinctOrderDetails();
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataEntityBinder lobjDataEntityBinder = new DataEntityBinder();
                lobjDataEntityBinder.lstr1 = dt.Rows[i]["OrderID"].ToString();

                DataTable dt1 = new DataTable();
                obj.OrderId = lobjDataEntityBinder.lstr1;
                dt1 = obj.DisplayOrderDetailsByOrderId();
                if (dt1.Rows.Count > 0)
                {
                    lobjDataEntityBinder.lstr2 = dt1.Rows[0]["RelationalNumber"].ToString();
                    lobjDataEntityBinder.lstr4 = obj.convertFormat(Convert.ToDateTime(dt1.Rows[0]["OrderDate"]));
                    int totalamount = 0;
                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        int amount = Convert.ToInt32(dt1.Rows[0]["Amount"]);
                        totalamount = totalamount + amount;
                    }
                    lobjDataEntityBinder.lstr3 = Convert.ToString(totalamount);
                }

                lobjDataEntityBinderList.Add(lobjDataEntityBinder);
            }
        }
        rptData.DataSource = lobjDataEntityBinderList;
        rptData.DataBind();
    }

    protected void showdata(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        Session["OrederId"] = btn.Attributes["PID"].ToString();
        Session["RelationalRef"] = btn.Attributes["RID"].ToString();
        Response.Redirect("ViewOrderDetails.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
        List<DataEntityBinder> lobjDataEntityBinderList = new List<DataEntityBinder>();

        DataEntityBinder lobjDataEntityBinder = new DataEntityBinder();
        lobjDataEntityBinder.lstr1 = txtValue.Text;

        DataTable dt1 = new DataTable();
        obj.OrderId = lobjDataEntityBinder.lstr1;
        dt1 = obj.DisplayOrderDetailsByOrderId();
        if (dt1.Rows.Count > 0)
        {
            lobjDataEntityBinder.lstr2 = dt1.Rows[0]["RelationalNumber"].ToString();
            lobjDataEntityBinder.lstr4 = obj.convertFormat(Convert.ToDateTime(dt1.Rows[0]["OrderDate"]));
            int totalamount = 0;
            for (int j = 0; j < dt1.Rows.Count; j++)
            {
                int amount = Convert.ToInt32(dt1.Rows[0]["Amount"]);
                totalamount = totalamount + amount;
            }
            lobjDataEntityBinder.lstr3 = Convert.ToString(totalamount);
            lobjDataEntityBinderList.Add(lobjDataEntityBinder);
            if (lobjDataEntityBinderList.Count > 0)
            {
                rptData.DataSource = lobjDataEntityBinderList;
                rptData.DataBind();
            }
        }
    }

    protected void btnSearchAll_Click(object sender, EventArgs e)
    {
        Display();
    }
}