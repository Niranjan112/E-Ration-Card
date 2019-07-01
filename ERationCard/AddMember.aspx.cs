using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddMember : System.Web.UI.Page
{
    EntityDL obj = new EntityDL();
    public Int32 ID
    {
        get
        {
            return Convert.ToInt32(Request.QueryString["ID"].ToString());
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            Display();
        }
    }
    public void Display()
    {
        if (ID != -1)
        {
            obj.id = ID;
            DataTable dt = new DataTable();
            dt = obj.DisplayAllFamilyHeadDetailsById();
            if (dt.Rows.Count > 0)
            {
                txtFName.Text = dt.Rows[0]["FName"].ToString();
                txtMName.Text = dt.Rows[0]["MName"].ToString();
                txtLName.Text = dt.Rows[0]["LName"].ToString();
                lblfilename.Text = dt.Rows[0]["Image"].ToString().Substring(Convert.ToInt32(dt.Rows[0]["Image"].ToString().LastIndexOf('/')) + 1, (dt.Rows[0]["Image"].ToString().Length - dt.Rows[0]["Image"].ToString().LastIndexOf('/')) - 1);
                txtDOB.Text = obj.convertFormat(Convert.ToDateTime(dt.Rows[0]["DOB"]));
                ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                txtContact.Text = dt.Rows[0]["ContactNo"].ToString();
                TxtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                ddlState.SelectedValue = dt.Rows[0]["State"].ToString();
                txtDistrict.Text = dt.Rows[0]["District"].ToString();
                txtTaluka.Text = dt.Rows[0]["Taluka"].ToString();
                txtDesignation.Text = dt.Rows[0]["Designation"].ToString();
                txtIncome.Text = dt.Rows[0]["AnnualIncome"].ToString();
            }
            if (lblfilename.Text != "")
            {
                imgbtn1.Visible = true;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Uplaod();
    }
    public void Uplaod()
    {
        if (FileUpload1.HasFile == true)
        {
            string fileExt = Path.GetExtension(FileUpload1.FileName).ToLower();
            if (fileExt == ".jpg" || fileExt == ".gif" || fileExt == ".bmp" || fileExt == ".jpeg" || fileExt == ".png")
            {
                string filename1 = System.IO.Path.GetFileName(FileUpload1.FileName);
                Session["FName"] = filename1;
                lblfilename.Text = filename1;
                FileUpload1.SaveAs(Server.MapPath("~/Upload/") + lblfilename.Text);
                SaveBook();
            }
            else
            {
                lblerror.Visible = true;

            }
        }
        else
        {
            SaveBook();
        }
    }
    public void SaveBook()
    {
        obj.id = ID;
        obj.RelationalNumber = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Millisecond.ToString();
        obj.FName = txtFName.Text;
        obj.MName = txtMName.Text;
        obj.LName = txtLName.Text;
        if (lblfilename.Text != "")
        {
            obj.Image = "~/Upload/" + lblfilename.Text;
        }
        else
        {
            obj.Image = "";
        }
        obj.DOB = obj.StringToDatetime(txtDOB.Text);
        obj.Gender = ddlGender.SelectedValue;
        obj.ContactNo = txtContact.Text;
        obj.Email = TxtEmail.Text;
        obj.Password = GeneratePassword();
        obj.Address = txtAddress.Text;
        obj.State = ddlState.SelectedValue;
        obj.District = txtDistrict.Text;
        obj.Taluka = txtTaluka.Text;
        obj.Designation = txtDesignation.Text;
        obj.AnnualIncome = txtIncome.Text;
        obj.InsertUpdateFamilyHeadDetails();
        if (ID == -1)
        {
            try
            {
                obj.MailPassword(TxtEmail.Text, "Member Register", "Dear " + txtFName.Text + " " + txtLName.Text + ", Thank your for registration. your reference code is " + obj.RelationalNumber + " and password is " + obj.Password + ". Use this credential for login.");
            }
            catch (Exception ex)
            {
                Response.Redirect("MemberList.aspx");
            }
        }
        Response.Redirect("MemberList.aspx");
    }
    protected void DeleteFile(object sender, ImageClickEventArgs e)
    {
        lblfilename.Text = "";
        imgbtn1.Visible = false;
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Display();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberList.aspx");
    }

    private static Random random = new Random();
    public string GeneratePassword()
    {
        int length = 8;
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
}