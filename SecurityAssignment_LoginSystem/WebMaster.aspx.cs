using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace SecurityAssignment_LoginSystem
{
    public partial class WebMaster : System.Web.UI.Page
    {
        private bool userAccess;
        private string connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
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
                if (userAccess != true)
                {
                    Response.Redirect("403.aspx");
                }
                else
                {
                    connectionString = @"Server=db15.meebox.net;Port=3306;database=karavend_assignment;Uid=karavend_root;Password=Stv6bawFxOo6;";
                }
            }
        }
        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {
            userAccess = false;
            Session["access"] = userAccess;
            Response.Redirect("Default.aspx");
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (userAccess != true)
            {
                Response.Redirect("403.aspx");
            }
            else if(this.PasswordOk(TextBoxPass.Text))
            {
                try
                {
                    using (var connection = new MySqlConnection(connectionString))
                    {
                        connection.Open();
                        bool userOK = this.UsernameOk(TextBoxName.Text, connection);
                        if (userOK)
                        {
                            string sqlQuery = @"INSERT INTO Security(user, pwhash, salt) VALUES (@user, md5(concat(@salt, @pass)), @salt)";
                            string salt = this.CreateSalt(connection);

                            using (var cmd = new MySqlCommand(sqlQuery, connection))
                            {
                                cmd.Parameters.Add("@user", MySqlDbType.VarChar, 32);
                                cmd.Parameters.Add("@pass", MySqlDbType.VarChar, 32);
                                cmd.Parameters.Add("@salt", MySqlDbType.VarChar, 32);
                                cmd.Parameters["@user"].Value = TextBoxName.Text;
                                cmd.Parameters["@pass"].Value = TextBoxPass.Text;
                                cmd.Parameters["@salt"].Value = salt;

                                MySqlDataReader dataReader = cmd.ExecuteReader();

                                LabelMessage.Text = "User: " + TextBoxName.Text + " created";

                                //close Data Reader
                                dataReader.Close();
                            }
                        }
                        else
                        {
                            LabelMessage.Text = "Invalid username or the user already exists in current database";
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
                }
            }
            else
            {
                LabelMessage.Text = "Please use minimum length of 6, with at least one digit, one non-alphanumerical character, one lowercase character and one Uppercase character";
            }


        }
        private string CreateSalt(MySqlConnection connection)
        {
            string salt = @"select md5(rand())";
            try
            {
                using (var cmd = new MySqlCommand(salt, connection))
                {
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
        
        public bool PasswordOk(string pwd)
        {
            //(will match a password with a minimum length of 6, with at least one digit, one non-alphanumerical character, one lowercase character and one Uppercase character)
            if (pwd.Length >= 6 && Regex.IsMatch(pwd, "[a-z]") && Regex.IsMatch(pwd, "[A-Z]") && Regex.IsMatch(pwd, "[0-9]") && Regex.IsMatch(pwd, "[@#$%^&+=!¤()*£€{}|]"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool UsernameOk(string newUser, MySqlConnection connection)
        {
            if (newUser == "")
            {
                return false;
            }
            else
            {
                string user = @"SELECT user FROM Security WHERE user = @user;";
                bool notFound;
                try
                {
                    using (var cmd = new MySqlCommand(user, connection))
                    {
                        cmd.Parameters.AddWithValue("@user", newUser);
                        
                        MySqlDataReader dataReader = cmd.ExecuteReader();

                        if (dataReader.HasRows)
                        {
                            notFound = false;
                        }
                        else
                        {
                            notFound = true;
                        }
                    
                        dataReader.Close();
                    }
                }
                catch (MySqlException ex)
                {
                    LabelMessage.Text = ex.Message;
                    notFound = false;
                }
                return notFound;
            }
        }
    }
}