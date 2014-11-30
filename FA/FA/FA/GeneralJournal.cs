using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FA
{
    public partial class GeneralJournal : Form
    {
        public GeneralJournal()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            String[] Get = ddlAccount.Text.Split('|');


            grdVoucher.Rows.Add(1);
            //Adding Debit
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[0].Value = dtDate.Value.ToShortDateString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[1].Value = Get[0].ToString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[2].Value = Get[1].ToString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[3].Value = txtDescription.Text;
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[5].Value = txtDebit.Text;
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[4].Value = "DEBIT";
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[6].Value = "0";
            txtDebit.Text = String.Empty;

           
        }


        private void ClearControls() {
            txtCredit.Text = String.Empty;
            txtDebit.Text = String.Empty;
            txtDescription.Text = String.Empty;
            grdVoucher.Rows.Clear();

            
        }

        private void GeneralJournal_Load(object sender, EventArgs e)
        {
            ddlAccount.DataSource = Accounts.ShowAccountsInfo();
        }

        private String AccountId = String.Empty, Debit = String.Empty, Credit = String.Empty, Description = String.Empty;
        private void button3_Click(object sender, EventArgs e)
        {
            
            String[] Get = ddlAccount.Text.Split('|');
            grdVoucher.Rows.Add(1);
            //Adding Credit
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[0].Value = dtDate.Value.ToShortDateString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[1].Value = Get[0].ToString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[2].Value = Get[1].ToString();
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[3].Value = txtDescription.Text;
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[5].Value = "0";
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[4].Value = "CREDIT";
            grdVoucher.Rows[grdVoucher.RowCount - 1].Cells[6].Value = txtCredit.Text;
            txtCredit.Text = String.Empty;
        }

        private void button2_Click(object sender, EventArgs e)
        {

            try
            {
                DBO.AccountsConnection.Open();
                DBO.AccountTransaction = DBO.AccountsConnection.BeginTransaction();
                for (int i = 0; i < grdVoucher.RowCount; i++)
                {
                    String AccountId = grdVoucher.Rows[i].Cells[1].Value.ToString();
                    String Edate = Convert.ToDateTime(grdVoucher.Rows[i].Cells[0].Value.ToString()).ToShortDateString();
                    String AccountNum = grdVoucher.Rows[i].Cells[2].Value.ToString();
                    String Description = grdVoucher.Rows[i].Cells[3].Value.ToString();
                    String TransactionType = grdVoucher.Rows[i].Cells[4].Value.ToString();
                    String Amount = grdVoucher.Rows[i].Cells[5].Value.ToString();
                    Accounts.InsertJournalAndPosting(AccountId, AccountNum, Amount, Description, TransactionType, Convert.ToDateTime(Edate));

                }
                DBO.AccountTransaction.Commit();
                DBO.AccountsConnection.Close();

            }
            catch (Exception Ep)
            {
                DBO.AccountTransaction.Rollback();
                DBO.AccountsConnection.Close();
                MessageBox.Show(Ep.ToString());

            }
            
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            try
            {
                DBO.AccountsConnection = new System.Data.SqlClient.SqlConnection(DBO.Connection);
                DBO.AccountsConnection.Open();
                DBO.AccountTransaction = DBO.AccountsConnection.BeginTransaction();
                for (int i = 0; i < grdVoucher.RowCount; i++)
                {
                    String AccountId = grdVoucher.Rows[i].Cells[1].Value.ToString();
                    String Edate = Convert.ToDateTime(grdVoucher.Rows[i].Cells[0].Value.ToString()).ToShortDateString();
                    String AccountNum = grdVoucher.Rows[i].Cells[2].Value.ToString();
                    String Description = grdVoucher.Rows[i].Cells[3].Value.ToString();
                    String TransactionType = grdVoucher.Rows[i].Cells[4].Value.ToString();
                    String Amount = grdVoucher.Rows[i].Cells[5].Value.ToString();
                    if (Amount=="0")
                    {
                        Amount = grdVoucher.Rows[i].Cells[6].Value.ToString(); 
                            
                    }
                   
                    Accounts.InsertJournalAndPosting(AccountId, AccountNum, Amount, Description, TransactionType, Convert.ToDateTime(Edate));

                }
                DBO.AccountTransaction.Commit();
                DBO.AccountsConnection.Close();
                ClearControls();

            }
            catch (Exception Ep)
            {
                DBO.AccountTransaction.Rollback();
                DBO.AccountsConnection.Close();
                MessageBox.Show(Ep.ToString());

            }
        }
    }
}
