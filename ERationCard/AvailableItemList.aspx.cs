using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AvailableItemList : System.Web.UI.Page
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
        rptData.DataSource = obj.DisplayAllItemDetails();
        rptData.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        obj.FName = txtValue.Text;
        rptData.DataSource = obj.DisplayItemDetailsByName();
        rptData.DataBind();
    }

    protected void btnSearchAll_Click(object sender, EventArgs e)
    {
        Display();
    }
}