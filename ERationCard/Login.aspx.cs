using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Value.Length > 0 && txtPassword.Value.Length > 0)
        {
            if (ddlUserType.SelectedValue == "1")
            {
                obj.Username = txtUsername.Value;
                obj.Password = txtPassword.Value;
                DataTable dt = new DataTable();
                dt = obj.CheckAdminLogin();
                if (dt.Rows.Count > 0)
                {
                    Session["RelationalRef"] = txtUsername.Value;
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblStatus.Text = "Invalid username or password";
                }
            }
            else if (ddlUserType.SelectedValue == "2")
            {
                obj.RelationalNumber = txtUsername.Value;
                string lstrPassword = txtPassword.Value;
                DataTable dt = new DataTable();
                dt = obj.DisplayFamilyDetailsByRelationalNumber();
                if (dt.Rows.Count > 0)
                {
                    string password = dt.Rows[0]["Password"].ToString();
                    if (password.Equals(lstrPassword))
                    {
                        Session["RelationalRef"] = txtUsername.Value;
                        Response.Redirect("MemberDashboard.aspx");
                    }
                    else
                    {
                        lblStatus.Text = "Invalid password";
                    }
                }
                else
                {
                    lblStatus.Text = "Invalid username or password";
                }
            }
            else
            {
                lblStatus.Text = "Please select user type";
            }
        }
        else
        {
            lblStatus.Text = "Please enter username and password";
        }
    }
}