using System;
using System.Net.Mail;


namespace PatstryShopWebApp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if((tbName.Text == "") || (tbEmail.Text == "")) {
                lblError.Text = "Name or Email cannot be empty!";
            } else
            {
                sendEmail();
                Response.Write(
                    "<script>alert('Email Send')</script>");
            }

            


        }

        protected void sendEmail()
        {
            MailMessage mail = new MailMessage("jsbakeryoakville@gmail.com", "jsbakeryoakville@gmail.com");
            mail.Subject = tbSubject.Text;
            mail.Body = "Client Name: " + tbName.Text + "\n Email Address: " + tbEmail.Text + "\n Message: \n" +
                tbMessage.Text;

            SmtpClient client = new SmtpClient();
            client.Send(mail);

            tbName.Text = "";
            tbEmail.Text = "";
            tbSubject.Text = "";
            tbName.Text = "";
        }
    }
}