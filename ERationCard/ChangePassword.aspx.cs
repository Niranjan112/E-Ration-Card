using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnquiry_Click(object sender, EventArgs e)
    {
        try
        {
            string ltsrOldPassword = txtPassword.Text;
            obj.RelationalNumber = Convert.ToString(Session["RelationalRef"]);
            DataTable dt = new DataTable();
            dt = obj.DisplayFamilyDetailsByRelationalNumber();
            if (dt.Rows.Count > 0)
            {
                string password = dt.Rows[0]["Password"].ToString();
                if (ltsrOldPassword.Equals(password))
                {
                    obj.Password = txtNewPassword.Text;
                    obj.UpdateFamilyHeadDetailsPassword();
                    lblStatus.Text = "Password change successfully";
                }
                else
                {
                    lblStatus.Text = "Invalid password";
                }
            }
            else
            {
                lblStatus.Text = "Invalid password";
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Error : No Internet Connection.";
        }
    }
}