using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for common
/// </summary>
public class common
{
	public common()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string connec = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
}