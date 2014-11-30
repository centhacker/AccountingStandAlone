namespace FA.Reports
{
    partial class OwnerEquityRpt
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
            this.accountDBDataSetReportOwnerEquity = new FA.AccountDBDataSetReportOwnerEquity();
            this.reportOwnerEquityBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.reportOwnerEquityTableAdapter = new FA.AccountDBDataSetReportOwnerEquityTableAdapters.ReportOwnerEquityTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetReportOwnerEquity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportOwnerEquityBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "OwnerEquityDS";
            reportDataSource1.Value = this.reportOwnerEquityBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "FA.Reports.OwnerEquityRpt.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.Size = new System.Drawing.Size(1284, 1006);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // accountDBDataSetReportOwnerEquity
            // 
            this.accountDBDataSetReportOwnerEquity.DataSetName = "AccountDBDataSetReportOwnerEquity";
            this.accountDBDataSetReportOwnerEquity.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // reportOwnerEquityBindingSource
            // 
            this.reportOwnerEquityBindingSource.DataMember = "ReportOwnerEquity";
            this.reportOwnerEquityBindingSource.DataSource = this.accountDBDataSetReportOwnerEquity;
            // 
            // reportOwnerEquityTableAdapter
            // 
            this.reportOwnerEquityTableAdapter.ClearBeforeFill = true;
            // 
            // OwnerEquityRpt
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1284, 1006);
            this.Controls.Add(this.reportViewer1);
            this.Name = "OwnerEquityRpt";
            this.Text = "OwnerEquityRpt";
            this.Load += new System.EventHandler(this.OwnerEquityRpt_Load);
            ((System.ComponentModel.ISupportInitialize)(this.accountDBDataSetReportOwnerEquity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.reportOwnerEquityBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.BindingSource reportOwnerEquityBindingSource;
        private AccountDBDataSetReportOwnerEquity accountDBDataSetReportOwnerEquity;
        private AccountDBDataSetReportOwnerEquityTableAdapters.ReportOwnerEquityTableAdapter reportOwnerEquityTableAdapter;
    }
}