using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace FA
{
    class Accounts
    {
        public static DateTime FromDate, ToDate;

        public static void SetDates(String DateFormat)
        {
            FromDate = DateTime.MinValue;
            ToDate = DateTime.MaxValue;
            String GetCurrentDates = String.Empty;
            if (String.IsNullOrEmpty(DateFormat) == false)
            {
                GetCurrentDates = DateFormat ;
                String[] SplitDates = GetCurrentDates.Split('|');
                FromDate = Convert.ToDateTime(SplitDates[0]);
                ToDate = Convert.ToDateTime(SplitDates[1]);


            }
        }
        public static void UpdateFiscalYearForLogin()
        {
            using (AccountsDataContext obj = new AccountsDataContext())
            {

                try
                {
                    obj.UpdateFiscalYearOnlogin(DateTime.Now.AddDays(1));
                }
                catch (Exception)
                {
                    
                    throw;
                }

                
            }
        }

        public static String[] ShowFiscalYEar()
        {
            String[] Set ;
            using (AccountsDataContext obj = new AccountsDataContext())
            {
                List<ShowFiscalYearResult> Get = obj.ShowFiscalYear().ToList();
                Set = new String[Get.Count];
                for (int i = 0; i < Get.Count; i++)
                {
                    Set[i] = Convert.ToDateTime(Get[i].f_from.ToString()).ToShortDateString() + "|" + Convert.ToDateTime(Get[i].f_to.ToString()).ToShortDateString();
                }
            }
           
            return Set;
        }

        public static bool InsertFiscalYear(DateTime ClosingTo)
        {
            try
            {
                using (AccountsDataContext obj = new AccountsDataContext())
                {
                    DateTime FromNew = ClosingTo;
                    DateTime ToNew = DateTime.Now;
                    obj.InsertFiscalYear(ClosingTo, ToNew, ClosingTo);
                }
               
                return true;
            }
            catch (Exception ex)
            {
                
                return false;

            }
        }
        public static String[] ShowAccountsInfo()
        {
            String[] Set;
            using (AccountsDataContext obj = new AccountsDataContext())
            {


                List<ShowChartOfAccountsResult> Get = obj.ShowChartOfAccounts().ToList();
                Set = new String[Get.Count];
                for (int i = 0; i < Get.Count; i++)
                {
                    Set[i] = Get[i].ID + "|" + Get[i].ACCOUNT_ID + "|" + Get[i].NAME;
                }
            }
            return Set;

        }

       
        public static void InsertChartOfAccounts(String Name, String AccountType, DateTime E_date)
        {
            try
            {
                
                    
                
                String Query = "select max(cast(substring(num,2,10) as int)) from chartofaccounts where (type = '" + AccountType + "')";
                String AccountNum = String.Empty;

                String ID = String.Empty;
                try
                {
                    DBO.AccountsConnection = new SqlConnection(DBO.Connection);
                    int IncrementID = 0;
                    DBO.AccountsConnection.Open();
                    DBO.AccountsCommand = new SqlCommand(Query, DBO.AccountsConnection);
                    var GetId = DBO.AccountsCommand.ExecuteScalar();
                    IncrementID = (Convert.ToInt32(GetId));
                    IncrementID++;
                    ID = (IncrementID).ToString();
                    DBO.AccountsConnection.Close();
                }
                catch
                {
                    DBO.AccountsConnection.Close();
                    ID = "1";
                }

                if (ID.Length == 1)
                {
                    AccountNum = "00" + ID;
                }
                else if (ID.Length > 1)
                {
                    AccountNum = "0" + ID;
                }
                if (AccountType == "Assets")
                {
                    AccountNum = "1" + AccountNum;
                }
                else if (AccountType == "Equity")
                {
                    AccountNum = "2" + AccountNum;
                }
                else if (AccountType == "Expense")
                {
                    AccountNum = "3" + AccountNum;
                }
                else if (AccountType == "Liability")
                {
                    AccountNum = "4" + AccountNum;
                }
                else if (AccountType == "Revenue")
                {
                    AccountNum = "5" + AccountNum;
                }

                using (AccountsDataContext obj = new AccountsDataContext())
                {
                    obj.InsertChartOfAccounts(AccountNum, Name, AccountType, E_date);
                }
               
                
            }
            catch (Exception ex)
            {
                
               
            }
        
        }


        public static void InsertJournalAndPosting(String AccountId, String AccountNum, String Amount, String Description, String Type, DateTime eDate)
        {
            using (AccountsDataContext obj = new AccountsDataContext())
            {
                obj.InsertJournalAndPosting(Convert.ToInt32(AccountId), AccountNum,
               Convert.ToSingle(Amount), Description, Type, eDate);
            }
           

        }


        public static bool CheckNames(String NameOfAccount)
        {

            using (AccountsDataContext obj = new AccountsDataContext())
            {
                List<CheckNameOfChartOfAccountsResult> Get = obj.CheckNameOfChartOfAccounts(NameOfAccount).ToList();

                if (Get.Count > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }


        }

        public static List<ShowChartOfAccountsResult> ShowChartOfAccounts()
        {
            using (AccountsDataContext obj = new AccountsDataContext())
            {
                return obj.ShowChartOfAccounts().ToList();
            }
        }
        public static String[] ShowLedgerTypes()
        {
            String[] Set;
            using (AccountsDataContext obj = new AccountsDataContext())
            {
                List<ShowLedgersResult> Get = obj.ShowLedgers().ToList();
               Set = new String[Get.Count];
                for (int i = 0; i < Get.Count; i++)
                {

                    Set[i] = Get[i].type;
                }
            }
            return Set;

        }

    }
}
