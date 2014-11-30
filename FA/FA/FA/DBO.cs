using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace FA
{
    class DBO
    {
      public static String Connection = ConfigurationManager.ConnectionStrings["FA.Properties.Settings.AccountDBConnectionString"].ToString();
      public static SqlConnection AccountsConnection = new SqlConnection();
      public static SqlCommand AccountsCommand = new SqlCommand();
      public static SqlTransaction AccountTransaction;
    }
}
