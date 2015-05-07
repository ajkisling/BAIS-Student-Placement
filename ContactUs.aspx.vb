Imports System.Net.Mail
Imports System.Net
Partial Class ContactUs
    Inherits System.Web.UI.Page

    Protected Sub sendMail_Click(sender As Object, e As EventArgs) Handles sendMail.Click
        'Declare variables to create a new mail message and client connection.
        Dim msg As New MailMessage
        Dim client As New SmtpClient

        msg.To.Add("kellen-roberts@uiowa.edu")  'destination email address
        msg.From = New MailAddress(senderAddress.Text)  'get the address from the textbox
        msg.Subject = "web contact form test"  'set the message subject line
        msg.Body = senderMessage.Text  'get the message body from the textbox

        client.Host = "smtp.gmail.com"  'place your smtp server inside quotation marks - gmail is smtp.gmail.com
        client.Port = 587  'place your smtp port here - gmail is 587
        client.Credentials = New NetworkCredential("ui.6k183", "6k183U*I")  'enter you username and password for gmail
        client.EnableSsl = True  'gmail uses ssl
        client.Send(msg)  'send you msg (variable from above)

        'Clear out the textboxes after the message is sent.
        'If not, it does not appear to send and the user will click "send" repeatedly, sending multiple messages.
        senderAddress.Text = ""
        senderMessage.Text = ""

        'Write into the label that the message has been sent.
        confirmSent.Text = "Thank you.  Your message has been sent."

        'After the message has displayed for 2 seconds, "reload" the page.
        Response.AddHeader("REFRESH", "2;URL=Default.aspx")


    End Sub



End Class
