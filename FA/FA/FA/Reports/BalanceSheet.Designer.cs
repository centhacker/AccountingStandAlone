namespace FA.Reports
{
    partial class BalanceSheet
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.accountDBDataSet = new FA.AccountDBDataSet();
            this.reportBalanceSheetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.reportBalanceSheetTableAdapter = new FA.AccountDBDataSetTableAdapters.ReportBalanceSheetTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportBalanceSheetBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "BalanceSheetDS";
            reportDataSource1.Value = this.reportBalanceSheetBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "FA.Reports.BalanceSheetRpt.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(1284, 1006);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // accountDBDataSet
            // 
            this.accountDBDataSet.DataSetName = "AccountDBDataSet";
            this.accountDBDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // reportBalanceSheetBindingSource
            // 
            this.reportBalanceSheetBindingSource.DataMember = "ReportBalanceSheet";
            this.reportBalanceSheetBindingSource.DataSource = this.accountDBDataSet;
            // 
            // reportBalanceSheetTableAdapter
            // 
            this.reportBalanceSheetTableAdapter.ClearBeforeFill = true;
            // 
            // BalanceSheet
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 1006);
            this.Controls.Add(this.reportViewer1);
            this.Name = "BalanceSheet";
            this.Text = "BalanceSheet";
            this.Load += new System.EventHandler(this.BalanceSheet_Load);
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportBalanceSheetBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource reportBalanceSheetBindingSource;
        private AccountDBDataSet accountDBDataSet;
        private AccountDBDataSetTableAdapters.ReportBalanceSheetTableAdapter reportBalanceSheetTableAdapter;

    }
}