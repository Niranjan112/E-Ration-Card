using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ForgotPassword : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Value.Length > 0)
        {

            obj.RelationalNumber = txtUsername.Value;
            DataTable dt = new DataTable();
            dt = obj.DisplayFamilyDetailsByRelationalNumber();
            if (dt.Rows.Count > 0)
            {
                string password = dt.Rows[0]["Password"].ToString();
                string email = dt.Rows[0]["Email"].ToString();
                try
                {
                    obj.MailPassword(email, "Password Recovery", "Hello, your e ration card password is " + password);
                    lblStatus.Text = "Password has been sent to your registered email id.";
                    txtUsername.Value = "";
                }
                catch(Exception ex)
                {
                    lblStatus.Text = "Error : No Internet Connection.";
                }
            }
            else
            {
                lblStatus.Text = "Invalid username";
            }
        }
        else
        {
            lblStatus.Text = "Please enter username";
        }
    }
}