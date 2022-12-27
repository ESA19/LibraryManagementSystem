using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;

namespace LibraryManagmentSystem
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localhost;port=5432; Database=Library; user ID=postgres; password=9833");

        private void List_Click(object sender, EventArgs e)
        {
            string sorgu = "select*from book";
            NpgsqlDataAdapter da=new NpgsqlDataAdapter(sorgu,baglanti);
            DataSet ds=new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

        }

        private void Add_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut=new NpgsqlCommand("insert into book(book_id, book_name, book_author, book_publisher, book_publicationyear, book_section, book_status, book_language) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)",baglanti);
            komut.Parameters.AddWithValue("@p1", txtbook_ID.Text);
            komut.Parameters.AddWithValue("@p2", txtbook_Name.Text);
            komut.Parameters.AddWithValue("@p3", int.Parse(comboAuthor.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p4", int.Parse(comboPublisher.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p5", int.Parse(txtPublicatonYear.Text));
            komut.Parameters.AddWithValue("@p6", int.Parse(comboSection.SelectedValue.ToString()));
            komut.Parameters.AddWithValue("@p7", int.Parse(comboStatus.Text));
            komut.Parameters.AddWithValue("@p8", int.Parse(comboLanguage.SelectedValue.ToString()));
            komut.ExecuteNonQuery();
            baglanti.Close();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select*from language", baglanti);
            DataTable dt = new DataTable();
            da.Fill(dt);
            comboLanguage.DisplayMember = "language_name";
            comboLanguage.ValueMember = "language_id";
            comboLanguage.DataSource = dt;
            baglanti.Close();



            baglanti.Open();
            NpgsqlDataAdapter dp = new NpgsqlDataAdapter("select*from status", baglanti);
            DataTable dk = new DataTable();
            dp.Fill(dk);
            comboStatus.DisplayMember = "status_id";
            comboStatus.DataSource = dk;
            baglanti.Close();


            baglanti.Open();
            NpgsqlDataAdapter dy = new NpgsqlDataAdapter("select*from section", baglanti);
            DataTable dl = new DataTable();
            dy.Fill(dl);
            comboSection.DisplayMember = "section_name";
            comboSection.ValueMember = "section_id";
            comboSection.DataSource = dl;
            baglanti.Close();


            baglanti.Open();
            NpgsqlDataAdapter dq = new NpgsqlDataAdapter("select*from author", baglanti);
            DataTable dz = new DataTable();
            dq.Fill(dz);
            comboAuthor.DisplayMember = "author_name";
            comboAuthor.ValueMember = "author_id";
            comboAuthor.DataSource = dz;
            baglanti.Close();


            baglanti.Open();
            NpgsqlDataAdapter dm = new NpgsqlDataAdapter("select*from publisher", baglanti);
            DataTable dn = new DataTable();
            dm.Fill(dn);
            comboPublisher.DisplayMember = "publisher_name";
            comboPublisher.ValueMember = "publisher_id";
            comboPublisher.DataSource = dn;
            baglanti.Close();
        }

        private void Delete_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("Delete from book where book_id=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", (txtbook_ID.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
        }

        private void Update_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update book set book_name=@p1,book_publisher=@p2,book_status=@p3 where book_id=@p4 ", baglanti);
            komut3.Parameters.AddWithValue("@p1",txtbook_Name.Text);
            komut3.Parameters.AddWithValue("@p2",int.Parse(comboPublisher.SelectedValue.ToString()));
            komut3.Parameters.AddWithValue("@p3",int.Parse(comboStatus.Text));
            komut3.Parameters.AddWithValue("@p4",txtbook_ID.Text);
            komut3.ExecuteNonQuery();
            baglanti.Close();

        }
    }
}