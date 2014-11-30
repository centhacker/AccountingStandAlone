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
    public partial class IncomeStatementRpt : Form
    {
        public IncomeStatementRpt()
        {
            InitializeComponent();
        }

        private void IncomeStatementRpt_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'accountDBDataSetIncomeStatement.ReportIncomeStatement' table. You can move, or remove it, as needed.
            this.reportIncomeStatementTableAdapter.Fill(this.accountDBDataSetIncomeStatement.ReportIncomeStatement,Accounts.FromDate,Accounts.ToDate);

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
