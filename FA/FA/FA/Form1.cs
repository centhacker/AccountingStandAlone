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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            using (AccountsDataContext obj = new AccountsDataContext())
            {
                obj.UpdateFiscalYearOnlogin(DateTime.Now.AddDays(1));
            }
        }

        private void generalJournalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GeneralJournal obj = new GeneralJournal();
            obj.ShowDialog();
        }

        private void chartOfAccountsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            COA obj = new COA();
            obj.ShowDialog();
        }

        private void fiscalYearToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FiscalYearClosing obj = new FiscalYearClosing();
            obj.ShowDialog();
        }
    }
}
