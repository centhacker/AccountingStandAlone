namespace FA.Reports
{
    partial class IncomeStatementRpt
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
            this.accountDBDataSetIncomeStatement = new FA.AccountDBDataSetIncomeStatement();
            this.reportIncomeStatementBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.reportIncomeStatementTableAdapter = new FA.AccountDBDataSetIncomeStatementTableAdapters.ReportIncomeStatementTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetIncomeStatement)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportIncomeStatementBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "IncomeStatement";
            reportDataSource1.Value = this.reportIncomeStatementBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "FA.Reports.IncomeStatementRpt.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(1284, 1006);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // accountDBDataSetIncomeStatement
            // 
            this.accountDBDataSetIncomeStatement.DataSetName = "AccountDBDataSetIncomeStatement";
            this.accountDBDataSetIncomeStatement.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // reportIncomeStatementBindingSource
            // 
            this.reportIncomeStatementBindingSource.DataMember = "ReportIncomeStatement";
            this.reportIncomeStatementBindingSource.DataSource = this.accountDBDataSetIncomeStatement;
            // 
            // reportIncomeStatementTableAdapter
            // 
            this.reportIncomeStatementTableAdapter.ClearBeforeFill = true;
            // 
            // IncomeStatementRpt
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 1006);
            this.Controls.Add(this.reportViewer1);
            this.Name = "IncomeStatementRpt";
            this.Text = "IncomeStatementRpt";
            this.Load += new System.EventHandler(this.IncomeStatementRpt_Load);
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetIncomeStatement)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportIncomeStatementBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource reportIncomeStatementBindingSource;
        private AccountDBDataSetIncomeStatement accountDBDataSetIncomeStatement;
        private AccountDBDataSetIncomeStatementTableAdapters.ReportIncomeStatementTableAdapter reportIncomeStatementTableAdapter;
    }
}