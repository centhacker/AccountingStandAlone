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
    public partial class FiscalYearClosing : Form
    {
        public FiscalYearClosing()
        {
            InitializeComponent();
        }

        private void FiscalYearClosing_Load(object sender, EventArgs e)
        {
            listBox1.DataSource = Accounts.ShowFiscalYEar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Accounts.InsertFiscalYear(dateTimePicker1.Value))
                {
                    MessageBox.Show("Fiscal Year Closed");

                }
                else
                {
                    MessageBox.Show("Fiscal Year Was Not Closed");
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
            }
            listBox1.DataSource = Accounts.ShowFiscalYEar();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Accounts.SetDates(listBox1.SelectedValue.ToString());
            Reports.TrialBalance obj = new Reports.TrialBalance();
            obj.ShowDialog();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Accounts.SetDates(listBox1.SelectedValue.ToString());
            Reports.BalanceSheet obj = new Reports.BalanceSheet();
            obj.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Accounts.SetDates(listBox1.SelectedValue.ToString());
            Reports.IncomeStatementRpt obj = new Reports.IncomeStatementRpt();
            obj.ShowDialog();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Accounts.SetDates(listBox1.SelectedValue.ToString());
            Reports.OwnerEquityRpt obj = new Reports.OwnerEquityRpt();
            obj.ShowDialog();
        }
    }
}
