using BussinessLogic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for EntityDL
/// </summary>
public class EntityDL : EntityBL
{
    public EntityDL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DateTime StringToDatetime(string pstrDate)
    {
        string[] lstrDateList = null;
        if (pstrDate.Contains("-"))
        {
            lstrDateList = pstrDate.Split("-".ToCharArray());
        }
        else
        {
            lstrDateList = pstrDate.Split("/".ToCharArray());
        }

        string strDate = lstrDateList[1] + "/" + lstrDateList[0] + "/" + lstrDateList[2];
        DateTime value = new DateTime(Convert.ToInt32(lstrDateList[2]), Convert.ToInt32(lstrDateList[1]), Convert.ToInt32(lstrDateList[0]));
        return value;
    }

    public string convertFormat(DateTime dtDOB)
    {
        string lstrDOB = string.Empty;
        string[] lstrDateList = null;
        string dob = dtDOB.ToString("dd/MM/yyyy");
        if (dob.Contains("-"))
        {
            lstrDateList = dob.Split("-".ToCharArray());
        }
        else
        {
            lstrDateList = dob.Split("/".ToCharArray());
        }
        lstrDOB = dtDOB.Day.ToString().PadLeft(2, '0') + "/" + dtDOB.Month.ToString().PadLeft(2, '0') + "/" + dtDOB.Year;
        return lstrDOB;
    }

    public void MailPassword(string pstrToAddress, string pstrSubject, string pstrMessage)
    {
        var fromAddress = "erationcardinfo@gmail.com";
        // any address where the email will be sending
        var toAddress = pstrToAddress;
        //Password of your gmail address
        const string fromPassword = "erationcardpass";
        // Passing the values and make a email formate to display
        string subject = pstrSubject;
        string body = "From: " + "erationcardinfo@gmail.com" + "\n";
        body += "Email: " + "erationcardinfo@gmail.com" + "\n";
        body += "Subject: " + pstrSubject + "\n";
        body += "Message: " + pstrMessage + "\n";
        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 200000;
        }
        smtp.Send(fromAddress, toAddress, subject, body);
    }

    public DataTable CheckAdminLogin()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { Username, Password };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_CheckAdminLogin", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }

    public DataTable DisplayAllFamilyHeadDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayAllFamilyHeadDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayAllFamilyHeadDetailsById()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayAllFamilyHeadDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];
    }
    public void InsertUpdateFamilyHeadDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id, FName, MName, LName, Image, DOB, Gender, ContactNo, Email, Password, Address, State, District, Taluka, Designation, AnnualIncome, RelationalNumber };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_InsertUpdateFamilyHeadDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }

    }
    public void DeleteFamilyHeadDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DeleteFamilyHeadDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
    }
    public void UpdateFamilyHeadDetailsPassword()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { RelationalNumber,Password };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_UpdateFamilyHeadDetailsPassword", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
    }

    public DataTable DisplayFamilyDetailsByFamilyHeadId(int id)
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayFamilyDetailsByFamilyHeadId", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayFamilyDetailsByRelationalNumber()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { RelationalNumber };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayFamilyHeadDetailsByRelationalNumber", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayFamilyDetailsByName()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { FName };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayFamilyHeadDetailsByName", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayFamilyDetailsById()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayFamilyDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];
    }
    public void InsertUpdateFamilyDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id, FamilHeadId, FName, MName, LName, Image, DOB, Gender, ContactNo, Email, Password, Address, State, District, Taluka, Designation, AnnualIncome };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_InsertUpdateFamilyDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }

    }
    public void DeleteFamilyDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DeleteFamilyDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
    }


    public DataTable DisplayAllItemDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayAllItemDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayAvailableItemDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayAvailableItemDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayItemDetailsById()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayItemDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];
    }
    public void InsertUpdateItemDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id, FName, Amount,Availability };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_InsertUpdateItemDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }

    }
    public void DeleteItemDetailsById()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { id };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DeleteItemDetailsById", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
    }
    public DataTable DisplayItemDetailsByName()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { FName };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayItemDetailsByName", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];
    }

    public DataTable DisplayAllOrderDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayAllOrderDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayOrderDetailsByRelationalNumber()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { RelationalNumber };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayOrderDetailsByRelationalNumber", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];
    }
    public void InsertOrderDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { OrderId, RelationalNumber, ItemId, Quantity, Amount, RecievedBy };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_InsertOrderDetails", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }

    }
    public DataTable DisplayOrderDetailsByOrderId()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { OrderId };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayOrderDetailsByOrderId", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
    public DataTable DisplayDistinctOrderDetails()
    {
        DataSet ds = new DataSet();
        object[] arrparam = new object[] { };
        try
        {
            ds = SqlHelper.ExecuteDataset(connec, "sp_DisplayDistinctOrderId", arrparam);
        }
        catch (Exception ex)
        {
            errormsg = ex.Message;
        }
        return ds.Tables[0];

    }
}