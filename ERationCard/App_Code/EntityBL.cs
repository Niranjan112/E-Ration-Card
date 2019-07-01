using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EntityBL
/// </summary>
public class EntityBL:common
{
    public EntityBL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int id { get; set; }
    public int FamilHeadId { get; set; }
    public string Username { get; set; }
    public string OrderId { get; set; }
    public string RelationalNumber { get; set; }
    public string FName { get; set; }
    public string MName { get; set; }
    public string LName { get; set; }
    public string Image { get; set; }
    public DateTime DOB { get; set; }
    public string Gender { get; set; }
    public string ContactNo { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string Address { get; set; }
    public string State { get; set; }
    public string District { get; set; }
    public string Taluka { get; set; }
    public string Designation { get; set; }
    public string AnnualIncome { get; set; }
    public string errormsg { get; set; }
    public string Amount { get; set; }
    public int ItemId { get; set; }
    public int Quantity { get; set; }
    public string Relation { get; set; }
    public string RecievedBy { get; set; }
    public DateTime OrderDate { get; set; }
    public string Availability { get; set; }
}