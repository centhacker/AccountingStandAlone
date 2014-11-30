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
    public partial class OwnerEquityRpt : Form
    {
        public OwnerEquityRpt()
        {
            InitializeComponent();
        }

        private void OwnerEquityRpt_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'accountDBDataSetReportOwnerEquity.ReportOwnerEquity' table. You can move, or remove it, as needed.
            this.reportOwnerEquityTableAdapter.Fill(this.accountDBDataSetReportOwnerEquity.ReportOwnerEquity, Accounts.FromDate, Accounts.ToDate);

            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
