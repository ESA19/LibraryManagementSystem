namespace LibraryManagmentSystem
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.book_id = new System.Windows.Forms.Label();
            this.Add = new System.Windows.Forms.Button();
            this.book_Name = new System.Windows.Forms.Label();
            this.book_Publisher = new System.Windows.Forms.Label();
            this.book_Language = new System.Windows.Forms.Label();
            this.book_Author = new System.Windows.Forms.Label();
            this.book_PublicationYear = new System.Windows.Forms.Label();
            this.book_Status = new System.Windows.Forms.Label();
            this.book_Section = new System.Windows.Forms.Label();
            this.Update = new System.Windows.Forms.Button();
            this.List = new System.Windows.Forms.Button();
            this.Delete = new System.Windows.Forms.Button();
            this.txtbook_ID = new System.Windows.Forms.TextBox();
            this.txtbook_Name = new System.Windows.Forms.TextBox();
            this.txtPublicatonYear = new System.Windows.Forms.TextBox();
            this.comboLanguage = new System.Windows.Forms.ComboBox();
            this.comboStatus = new System.Windows.Forms.ComboBox();
            this.comboSection = new System.Windows.Forms.ComboBox();
            this.comboPublisher = new System.Windows.Forms.ComboBox();
            this.comboAuthor = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView1.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(7, 13);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(4);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 29;
            this.dataGridView1.Size = new System.Drawing.Size(842, 544);
            this.dataGridView1.TabIndex = 0;
            // 
            // book_id
            // 
            this.book_id.AutoSize = true;
            this.book_id.Location = new System.Drawing.Point(906, 13);
            this.book_id.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_id.Name = "book_id";
            this.book_id.Size = new System.Drawing.Size(89, 28);
            this.book_id.TabIndex = 1;
            this.book_id.Text = "Kitap ID:";
            // 
            // Add
            // 
            this.Add.Location = new System.Drawing.Point(797, 747);
            this.Add.Margin = new System.Windows.Forms.Padding(4);
            this.Add.Name = "Add";
            this.Add.Size = new System.Drawing.Size(129, 41);
            this.Add.TabIndex = 2;
            this.Add.Text = "Ekle";
            this.Add.UseVisualStyleBackColor = true;
            this.Add.Click += new System.EventHandler(this.Add_Click);
            // 
            // book_Name
            // 
            this.book_Name.AutoSize = true;
            this.book_Name.Location = new System.Drawing.Point(907, 103);
            this.book_Name.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Name.Name = "book_Name";
            this.book_Name.Size = new System.Drawing.Size(99, 28);
            this.book_Name.TabIndex = 3;
            this.book_Name.Text = "Kitap Adı:";
            // 
            // book_Publisher
            // 
            this.book_Publisher.AutoSize = true;
            this.book_Publisher.Location = new System.Drawing.Point(906, 302);
            this.book_Publisher.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Publisher.Name = "book_Publisher";
            this.book_Publisher.Size = new System.Drawing.Size(144, 28);
            this.book_Publisher.TabIndex = 4;
            this.book_Publisher.Text = "Kitap Yayıncısı:";
            // 
            // book_Language
            // 
            this.book_Language.AutoSize = true;
            this.book_Language.Location = new System.Drawing.Point(914, 642);
            this.book_Language.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Language.Name = "book_Language";
            this.book_Language.Size = new System.Drawing.Size(98, 28);
            this.book_Language.TabIndex = 5;
            this.book_Language.Text = "Kitap Dili:";
            // 
            // book_Author
            // 
            this.book_Author.AutoSize = true;
            this.book_Author.Location = new System.Drawing.Point(906, 204);
            this.book_Author.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Author.Name = "book_Author";
            this.book_Author.Size = new System.Drawing.Size(120, 28);
            this.book_Author.TabIndex = 6;
            this.book_Author.Text = "Kitap Yazarı:";
            // 
            // book_PublicationYear
            // 
            this.book_PublicationYear.AutoSize = true;
            this.book_PublicationYear.Location = new System.Drawing.Point(893, 381);
            this.book_PublicationYear.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_PublicationYear.Name = "book_PublicationYear";
            this.book_PublicationYear.Size = new System.Drawing.Size(156, 28);
            this.book_PublicationYear.TabIndex = 7;
            this.book_PublicationYear.Text = "Kitap Basım Yılı:";
            // 
            // book_Status
            // 
            this.book_Status.AutoSize = true;
            this.book_Status.Location = new System.Drawing.Point(893, 554);
            this.book_Status.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Status.Name = "book_Status";
            this.book_Status.Size = new System.Drawing.Size(144, 28);
            this.book_Status.TabIndex = 9;
            this.book_Status.Text = "Kitap Durumu:";
            // 
            // book_Section
            // 
            this.book_Section.AutoSize = true;
            this.book_Section.Location = new System.Drawing.Point(917, 470);
            this.book_Section.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.book_Section.Name = "book_Section";
            this.book_Section.Size = new System.Drawing.Size(109, 28);
            this.book_Section.TabIndex = 8;
            this.book_Section.Text = "Kitap Türü:";
            // 
            // Update
            // 
            this.Update.Location = new System.Drawing.Point(1175, 747);
            this.Update.Margin = new System.Windows.Forms.Padding(4);
            this.Update.Name = "Update";
            this.Update.Size = new System.Drawing.Size(129, 41);
            this.Update.TabIndex = 10;
            this.Update.Text = "Güncelleme";
            this.Update.UseVisualStyleBackColor = true;
            this.Update.Click += new System.EventHandler(this.Update_Click);
            // 
            // List
            // 
            this.List.Location = new System.Drawing.Point(1355, 747);
            this.List.Margin = new System.Windows.Forms.Padding(4);
            this.List.Name = "List";
            this.List.Size = new System.Drawing.Size(129, 41);
            this.List.TabIndex = 11;
            this.List.Text = "Listele";
            this.List.UseVisualStyleBackColor = true;
            this.List.Click += new System.EventHandler(this.List_Click);
            // 
            // Delete
            // 
            this.Delete.Location = new System.Drawing.Point(984, 747);
            this.Delete.Margin = new System.Windows.Forms.Padding(4);
            this.Delete.Name = "Delete";
            this.Delete.Size = new System.Drawing.Size(129, 41);
            this.Delete.TabIndex = 12;
            this.Delete.Text = "Silme";
            this.Delete.UseVisualStyleBackColor = true;
            this.Delete.Click += new System.EventHandler(this.Delete_Click);
            // 
            // txtbook_ID
            // 
            this.txtbook_ID.Location = new System.Drawing.Point(1070, 13);
            this.txtbook_ID.Name = "txtbook_ID";
            this.txtbook_ID.Size = new System.Drawing.Size(234, 34);
            this.txtbook_ID.TabIndex = 13;
            // 
            // txtbook_Name
            // 
            this.txtbook_Name.Location = new System.Drawing.Point(1070, 103);
            this.txtbook_Name.Name = "txtbook_Name";
            this.txtbook_Name.Size = new System.Drawing.Size(234, 34);
            this.txtbook_Name.TabIndex = 14;
            // 
            // txtPublicatonYear
            // 
            this.txtPublicatonYear.Location = new System.Drawing.Point(1070, 375);
            this.txtPublicatonYear.Name = "txtPublicatonYear";
            this.txtPublicatonYear.Size = new System.Drawing.Size(234, 34);
            this.txtPublicatonYear.TabIndex = 18;
            // 
            // comboLanguage
            // 
            this.comboLanguage.FormattingEnabled = true;
            this.comboLanguage.Location = new System.Drawing.Point(1070, 642);
            this.comboLanguage.Name = "comboLanguage";
            this.comboLanguage.Size = new System.Drawing.Size(234, 36);
            this.comboLanguage.TabIndex = 29;
            // 
            // comboStatus
            // 
            this.comboStatus.FormattingEnabled = true;
            this.comboStatus.Location = new System.Drawing.Point(1070, 554);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Size = new System.Drawing.Size(234, 36);
            this.comboStatus.TabIndex = 30;
            // 
            // comboSection
            // 
            this.comboSection.FormattingEnabled = true;
            this.comboSection.Location = new System.Drawing.Point(1070, 470);
            this.comboSection.Name = "comboSection";
            this.comboSection.Size = new System.Drawing.Size(234, 36);
            this.comboSection.TabIndex = 31;
            // 
            // comboPublisher
            // 
            this.comboPublisher.FormattingEnabled = true;
            this.comboPublisher.Location = new System.Drawing.Point(1070, 299);
            this.comboPublisher.Name = "comboPublisher";
            this.comboPublisher.Size = new System.Drawing.Size(234, 36);
            this.comboPublisher.TabIndex = 32;
            // 
            // comboAuthor
            // 
            this.comboAuthor.FormattingEnabled = true;
            this.comboAuthor.Location = new System.Drawing.Point(1070, 204);
            this.comboAuthor.Name = "comboAuthor";
            this.comboAuthor.Size = new System.Drawing.Size(234, 36);
            this.comboAuthor.TabIndex = 33;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 28F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1507, 856);
            this.Controls.Add(this.comboAuthor);
            this.Controls.Add(this.comboPublisher);
            this.Controls.Add(this.comboSection);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.comboLanguage);
            this.Controls.Add(this.txtPublicatonYear);
            this.Controls.Add(this.txtbook_Name);
            this.Controls.Add(this.txtbook_ID);
            this.Controls.Add(this.Delete);
            this.Controls.Add(this.List);
            this.Controls.Add(this.Update);
            this.Controls.Add(this.book_Status);
            this.Controls.Add(this.book_Section);
            this.Controls.Add(this.book_PublicationYear);
            this.Controls.Add(this.book_Author);
            this.Controls.Add(this.book_Language);
            this.Controls.Add(this.book_Publisher);
            this.Controls.Add(this.book_Name);
            this.Controls.Add(this.Add);
            this.Controls.Add(this.book_id);
            this.Controls.Add(this.dataGridView1);
            this.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DataGridView dataGridView1;
        private Label book_id;
        private Button Add;
        private Label book_Name;
        private Label book_Publisher;
        private Label book_Language;
        private Label book_Author;
        private Label book_PublicationYear;
        private Label book_Status;
        private Label book_Section;
        private Button Update;
        private Button List;
        private Button Delete;
        private TextBox txtbook_ID;
        private TextBox txtbook_Name;
        private TextBox txtPublicatonYear;
        private ComboBox comboLanguage;
        private ComboBox comboStatus;
        private ComboBox comboSection;
        private ComboBox comboPublisher;
        private ComboBox comboAuthor;
    }
}