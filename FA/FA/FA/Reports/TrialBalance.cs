using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FA.Reports
{
    public partial class TrialBalance : Form
    {
        public TrialBalance()
        {
            InitializeComponent();
        }

        private void TrialBalance_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'accountDBDataSetTrialBalance.GenerateTrialBalance' table. You can move, or remove it, as needed.
            this.generateTrialBalanceTableAdapter.Fill(this.accountDBDataSetTrialBalance.GenerateTrialBalance, Accounts.FromDate, Accounts.ToDate);

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
