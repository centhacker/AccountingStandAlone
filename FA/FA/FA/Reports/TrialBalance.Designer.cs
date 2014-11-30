namespace FA.Reports
{
    partial class TrialBalance
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
            this.accountDBDataSetTrialBalance = new FA.AccountDBDataSetTrialBalance();
            this.generateTrialBalanceBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.generateTrialBalanceTableAdapter = new FA.AccountDBDataSetTrialBalanceTableAdapters.GenerateTrialBalanceTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetTrialBalance)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.generateTrialBalanceBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "TrialBalanceDS";
            reportDataSource1.Value = this.generateTrialBalanceBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "FA.Reports.TrialBalanceRpt.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(1284, 1006);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // accountDBDataSetTrialBalance
            // 
            this.accountDBDataSetTrialBalance.DataSetName = "AccountDBDataSetTrialBalance";
            this.accountDBDataSetTrialBalance.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // generateTrialBalanceBindingSource
            // 
            this.generateTrialBalanceBindingSource.DataMember = "GenerateTrialBalance";
            this.generateTrialBalanceBindingSource.DataSource = this.accountDBDataSetTrialBalance;
            // 
            // generateTrialBalanceTableAdapter
            // 
            this.generateTrialBalanceTableAdapter.ClearBeforeFill = true;
            // 
            // TrialBalance
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 1006);
            this.Controls.Add(this.reportViewer1);
            this.Name = "TrialBalance";
            this.Text = "TrialBalance";
            this.Load += new System.EventHandler(this.TrialBalance_Load);
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetTrialBalance)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.generateTrialBalanceBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource generateTrialBalanceBindingSource;
        private AccountDBDataSetTrialBalance accountDBDataSetTrialBalance;
        private AccountDBDataSetTrialBalanceTableAdapters.GenerateTrialBalanceTableAdapter generateTrialBalanceTableAdapter;
    }
}