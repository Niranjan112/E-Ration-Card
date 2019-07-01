using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class FamilyMemberList : System.Web.UI.Page
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
        List<EntityBL> lobjEntityBLList = new List<EntityBL>();
        obj.RelationalNumber = Convert.ToString(Session["RelationalRef"]);
        DataTable dt = new DataTable();
        dt = obj.DisplayFamilyDetailsByRelationalNumber();
        if (dt.Rows.Count > 0)
        {
            EntityBL objEntityBL = new EntityBL();
            objEntityBL.id = Convert.ToInt32(dt.Rows[0]["id"]);
            objEntityBL.FName = dt.Rows[0]["FName"].ToString();
            objEntityBL.MName = dt.Rows[0]["MName"].ToString();
            objEntityBL.LName = dt.Rows[0]["LName"].ToString();
            objEntityBL.AnnualIncome = "1";
            objEntityBL.Relation = "HOF";
            lobjEntityBLList.Add(objEntityBL);

            int familyheadid= Convert.ToInt32(dt.Rows[0]["id"]);
            DataTable dt1 = new DataTable();
            dt1 = obj.DisplayFamilyDetailsByFamilyHeadId(familyheadid);
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    objEntityBL = new EntityBL();
                    objEntityBL.id = Convert.ToInt32(dt1.Rows[0]["id"]);
                    objEntityBL.FName = dt1.Rows[i]["FName"].ToString();
                    objEntityBL.MName = dt1.Rows[i]["MName"].ToString();
                    objEntityBL.LName = dt1.Rows[i]["LName"].ToString();
                    objEntityBL.AnnualIncome = "2";
                    objEntityBL.Relation = dt1.Rows[i]["Relation"].ToString();
                    lobjEntityBLList.Add(objEntityBL);
                }
            }

            rptData.DataSource = lobjEntityBLList;
            rptData.DataBind();
        }
    }
    protected void showdata(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        Session["id"] = Convert.ToInt32(btn.Attributes["PID"].ToString());
        Session["Relation"] = btn.Attributes["RID"].ToString();
        Response.Redirect("FamilyMemberDetails.aspx");
    }
}