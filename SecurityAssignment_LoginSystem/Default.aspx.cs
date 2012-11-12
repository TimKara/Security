/* This cs file was written by Engin Tim Kara */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using MySql.Data.MySqlClient;

namespace SecurityAssignment_LoginSystem
{
    public partial class Default : System.Web.UI.Page
    {

        private bool userAccess; // userAccess=(false) is standard user. And userAccess=(true) is webmaster.
        private string username, password, sqlQuery, connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = @"Server=db15.meebox.net;Port=3306;database=karavend_assignment;Uid=karavend_root;Password=Stv6bawFxOo6;";
            username = TextBoxName.Text;
            password = TextBoxPass.Text;
            this.Page_Reload();
        }

        private void Page_Reload()
        {
            try
            {
                userAccess = (bool)Session["access"];
            }
            catch
            {
                userAccess = false;
                Session["access"] = userAccess;
            }
            finally
            {
                if ((bool)Session["access"])
                {
                    ButtonWebMaster.Visible = true;
                }
                else
                {
                    ButtonWebMaster.Visible = false;
                }
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            LabelMessage.Text = null;
            sqlQuery = @"select * from Security where user = @user and pwhash = md5(concat(@salt,@pwhash))";
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string salt = this.GetSalt(connection);
                    using (var cmd = new MySqlCommand(sqlQuery, connection))
                    {
                        cmd.Parameters.Add("@user", MySqlDbType.VarChar, 32);
                        cmd.Parameters.Add("@pwhash", MySqlDbType.VarChar, 32);
                        cmd.Parameters.Add("@salt", MySqlDbType.VarChar, 32);
                        cmd.Parameters["@user"].Value = username;
                        cmd.Parameters["@pwhash"].Value = password;
                        cmd.Parameters["@salt"].Value = salt;

                        MySqlDataReader dataReader = cmd.ExecuteReader();
                        if (dataReader.Read())
                        {
                            LabelMessage.Text = "Hello: " + dataReader["user"] + ", User ID: " + dataReader["user_ID"];
                            
                            // Her bruges Compare metoden, som har "ignore case" funktionen til.
                            if (0 == string.Compare("Admin", dataReader["user"].ToString(), true))
                            {
                                userAccess = true;
                            }
                            else
                            {
                                userAccess = false;
                            }
                        }
                        else
                        {
                            LabelMessage.Text = "Error: Wrong name and password combination";
                            userAccess = false;
                        }
                        //close Data Reader
                        dataReader.Close();
                    }
                    connection.Close();
                }
            }
            catch (MySqlException ex)
            {
                //When handling errors, you can your application's response based on the error number.
                //The two most common error numbers when connecting are as follows:
                //0: Cannot connect to server.
                //1045: Invalid user name and/or password.
                switch (ex.Number)
                {
                    case 0:
                        LabelMessage.Text = "Cannot connect to server.  Contact administrator";
                        break;

                    case 1045:
                        LabelMessage.Text = "Invalid server username/password, please try again";
                        break;
                    default:
                        LabelMessage.Text = ex.ToString() + ".";
                        break;
                }
                userAccess = false;  
            }
            finally
            {
                Session["access"] = userAccess;
            }

           Console.WriteLine(sqlQuery);
           this.Page_Reload();
        }

        private string GetSalt(MySqlConnection connection)
        {
            string salt = "";
            string query = @"select salt from Security where user = @user";
            try
            {
                using (var cmd = new MySqlCommand(query, connection))
                {
                    cmd.Parameters.Add("@user", MySqlDbType.VarChar, 32);
                    cmd.Parameters["@user"].Value = username;

                    MySqlDataReader dataReader = cmd.ExecuteReader();

                    while (dataReader.Read())
                    {
                        salt = dataReader.GetString(0);
                    }
                    dataReader.Close();
                }
            }
            catch (MySqlException ex)
            {
                LabelMessage.Text = ex.Message;
                salt = ex.Message;
            }
            return salt;
        }

        protected void ButtonWebMaster_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebMaster.aspx");
        }
    }
}