using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnquiryForm : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnquiry_Click(object sender, EventArgs e)
    {
        try
        {
            obj.MailPassword("erationcardinfo@gmail.com", txtSubject.Text, txtMessage.Text + ". Message sent by Reference No. " + Convert.ToString(Session["RelationalRef"]));
            lblStatus.Text = "Message sent successfully.";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Error : No Internet Connection.";
        }
    }
}