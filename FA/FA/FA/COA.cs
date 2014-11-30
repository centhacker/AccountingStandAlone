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
    public partial class COA : Form
    {
        public COA()
        {
            InitializeComponent();
        }

        private void COA_Load(object sender, EventArgs e)
        {
            ddlAccount.DataSource = Accounts.ShowLedgerTypes();
            grdVoucher.DataSource = Accounts.ShowChartOfAccounts();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Accounts.CheckNames(txtDescription.Text))
            {
                Accounts.InsertChartOfAccounts(txtDescription.Text, ddlAccount.Text, DateTime.Now);
                grdVoucher.DataSource = Accounts.ShowChartOfAccounts();
                txtDescription.Clear();
            }
        }
    }
}
