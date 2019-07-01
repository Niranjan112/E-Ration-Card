using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberList : System.Web.UI.Page
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
        rptData.DataSource = obj.DisplayAllFamilyHeadDetails();
        rptData.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddMember.aspx?ID=-1");
    }
    
    protected void showdata(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.Attributes["PID"].ToString());
        Response.Redirect("AddMember.aspx?ID=" + id.ToString());
    }
    protected void showorderdetails(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        Session["RelationalRef"] = btn.Attributes["PID"].ToString();
        Response.Redirect("MemberOrderList.aspx");
    }
    protected void showdetails(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        Session["FamilyHeadId"] = Convert.ToInt32(btn.Attributes["PID"].ToString());
        Response.Redirect("MemberFamilyList.aspx");
    }
    protected void DeleteData(object sender, EventArgs e)
    {
        LinkButton ibtn = (LinkButton)sender;
        obj.id = Convert.ToInt32(ibtn.Attributes["PID"].ToString());
        obj.DeleteFamilyHeadDetails();
        Display();
    }
    //public void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    grdshow.PageIndex = e.NewPageIndex;
    //    Display();
    //}



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlSearch.SelectedValue == "1")
        {
            obj.RelationalNumber = txtValue.Text;
            rptData.DataSource = obj.DisplayFamilyDetailsByRelationalNumber();
            rptData.DataBind();
        }
        else
        {
            obj.FName = txtValue.Text;
            rptData.DataSource = obj.DisplayFamilyDetailsByName();
            rptData.DataBind();
        }
    }

    protected void btnSearchAll_Click(object sender, EventArgs e)
    {
        Display();
    }
}