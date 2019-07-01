using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberFamilyList : System.Web.UI.Page
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
        int id = Convert.ToInt32(Session["FamilyHeadId"]);
        rptData.DataSource = obj.DisplayFamilyDetailsByFamilyHeadId(id);
        rptData.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddFamilyMember.aspx?ID=-1");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberList.aspx");
    }
    protected void showdata(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.Attributes["PID"].ToString());
        Response.Redirect("AddFamilyMember.aspx?ID=" + id.ToString());
    }
    protected void DeleteData(object sender, EventArgs e)
    {
        LinkButton ibtn = (LinkButton)sender;
        obj.id = Convert.ToInt32(ibtn.Attributes["PID"].ToString());
        obj.DeleteFamilyDetails();
        Display();
    }
    
}