using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using UserModels;
using System.Drawing;


namespace Business_
{
    public class UsersConection

    {

        public Usuarios Login(string Usuario, string Contrasena)
        {

            Usuarios users = new Usuarios();
            string conectar = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string cmdText = string.Format("SP_MasterUsuarios");
            string patron = "login";

            try
            {
                using (var conection = new SqlConnection(conectar))
                {

                    conection.Open();
                    using (var comando = new SqlCommand(cmdText, conection))
                    {
                        comando.CommandType = System.Data.CommandType.StoredProcedure;
                        //comando.Parameters.AddWithValue("@Patron", patron);

                        comando.Parameters.AddWithValue("@Usuario", Usuario);
                        comando.Parameters.AddWithValue("@Contrasena", Contrasena);
                        //comando.Parameters.AddWithValue("@Rol", Rol);

                        comando.Parameters.AddWithValue("@Patron", patron);

                        SqlDataReader sqlDataReader;
                        sqlDataReader = comando.ExecuteReader();

                        if (sqlDataReader.HasRows == true)
                        {
                            while (sqlDataReader.Read())
                            {
                                users = new Usuarios
                                {
                                    id_usuario = Convert.ToInt32(sqlDataReader[0].ToString()),
                                    Nombre = sqlDataReader[1].ToString(),
                                    Apellido = sqlDataReader[2].ToString(),
                                    Usuario = sqlDataReader[3].ToString(),
                                    Contrasena = sqlDataReader[4].ToString(),
                                    Estado = sqlDataReader[5].ToString(),                                    
                                    Rol = sqlDataReader[6].ToString(),
                                    Imagen = sqlDataReader[7].ToString()

                                };
                            }
                        }
                    }
                    conection.Close();
                }
            }
            catch (Exception e)
            {

            }
            return users;
        }
        public Usuarios ConsultaxID(int id_usuario)
        {

            Usuarios users = new Usuarios();
            string conectar = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string cmdText = string.Format("SP_MasterUsuarios");
            string patron = "Consultar";

            try
            {
                using (var conection = new SqlConnection(conectar))
                {

                    conection.Open();
                    using (var comando = new SqlCommand(cmdText, conection))
                    {
                        comando.CommandType = System.Data.CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@id_usuario", id_usuario);
                        comando.Parameters.AddWithValue("@Patron", patron);

                        SqlDataReader sqlDataReader;
                        sqlDataReader = comando.ExecuteReader();

                        if (sqlDataReader.HasRows == true)
                        {
                            while (sqlDataReader.Read())
                            {
                                users = new Usuarios
                                {
                                    id_usuario = Convert.ToInt32(sqlDataReader[0].ToString()),
                                    Nombre = sqlDataReader[1].ToString(),
                                    Apellido = sqlDataReader[2].ToString(),
                                    Usuario = sqlDataReader[3].ToString(),
                                    Contrasena = sqlDataReader[4].ToString(),
                                    Estado = sqlDataReader[5].ToString(),
                                    Rol = sqlDataReader[6].ToString(),
                                    Imagen = sqlDataReader[7].ToString()
                                };
                            }
                        }
                    }
                    conection.Close();
                }
            }
            catch (Exception e)
            {

            }
            return users;
        }
        public DataTable Roles(Usuarios obje)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            string patron = "login";

            SqlCommand cmd = new SqlCommand("SP_MasterUsuarios", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Patron", patron);
            cmd.Parameters.AddWithValue("@Nombre", obje.Nombre);
            cmd.Parameters.AddWithValue("@Apellido", obje.Apellido);
            cmd.Parameters.AddWithValue("@Rol", obje.Rol);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


       
        public DataTable Gestion(string Filtro, string Estado)
        {
            DataTable table = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string commandText = string.Format("SP_MasterUsuarios");
            string patron = "ListarUsuarios";

            try
            {
                SqlConnection conection = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand();
                //SqlDataReader leer;
                conection.Open();
                cmd.CommandText = commandText;
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Patron", patron);
                cmd.Parameters.AddWithValue("@Filtro", Filtro);
                cmd.Parameters.AddWithValue("@Estado", Estado);
                //cmd.ExecuteNonQuery();
                //cmd.Parameters.Clear();
                cmd.Connection = conection;
                SqlDataAdapter leer = new SqlDataAdapter(cmd);
                leer.Fill(table);
                conection.Close();

            }
            catch (Exception e)
            {

            }

            return table;
        }





        #region Metodos para Gestion de usuarios
       
        public bool existeUsuario(string Usuario)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection conection = new SqlConnection(connectionString);
            string patron = "ExistUser";
            SqlDataReader reader;

            if (conection.State == ConnectionState.Closed)
                conection.Open();
            SqlCommand cmd = new SqlCommand("SP_MasterUsuarios", conection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Patron", patron);
            cmd.Parameters.AddWithValue("@Usuario", Usuario);

            reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int Registro(Usuarios uss)
        {
            Usuarios users = new Usuarios();

            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection conection = new SqlConnection(connectionString);
            conection.Open();

            SqlCommand cmd = new SqlCommand();
            string commandText = string.Format("SP_MasterUsuarios");
            cmd.CommandText = commandText;
            string patron = "insert";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Patron", patron);
            cmd.Parameters.AddWithValue("@id_usuario", uss.id_usuario).ToString();
            cmd.Parameters.AddWithValue("@Nombre", uss.Nombre);
            cmd.Parameters.AddWithValue("@Apellido", uss.Apellido);
            cmd.Parameters.AddWithValue("@Usuario", uss.Usuario);
            cmd.Parameters.AddWithValue("@Contrasena", uss.Contrasena);
            cmd.Parameters.AddWithValue("@Estado", uss.Estado);
            cmd.Parameters.AddWithValue("@Rol", uss.Rol);         
            cmd.Parameters.AddWithValue("@Imagen", uss.Imagen);

            cmd.Connection = conection;

            int result = cmd.ExecuteNonQuery();
            conection.Close();
            return result;
        }

        public int Edit(Usuarios uss)
        {
           
            string conectar = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string cmdText = string.Format("SP_MasterUsuarios");
            string patron = "edit";
            using (var connection = new SqlConnection(conectar))
            {
                connection.Open();

                using (var cmd = new SqlCommand(cmdText, connection))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Patron", patron);
                    cmd.Parameters.AddWithValue("@id_usuario", uss.id_usuario);
                    cmd.Parameters.AddWithValue("@Nombre", uss.Nombre);
                    cmd.Parameters.AddWithValue("@Apellido", uss.Apellido);
                    cmd.Parameters.AddWithValue("@Usuario", uss.Usuario);
                    cmd.Parameters.AddWithValue("@Contrasena", uss.Contrasena);
                    cmd.Parameters.AddWithValue("@Estado", uss.Estado);
                    cmd.Parameters.AddWithValue("@Rol", uss.Rol);
                    cmd.Parameters.AddWithValue("@Imagen", uss.Imagen);
                    cmd.Connection = connection;

                    int result =  cmd.ExecuteNonQuery();
                    connection.Close();
                    return result;
                }
            }
        }
        public int CambiarImagen(Usuarios uss)
        {

            string conectar = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            string cmdText = string.Format("SP_MasterUsuarios");
            string patron = "cambiarimagen";
            using (var connection = new SqlConnection(conectar))
            {
                connection.Open();

                using (var cmd = new SqlCommand(cmdText, connection))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Patron", patron);
                    cmd.Parameters.AddWithValue("@id_usuario", uss.id_usuario);
                    cmd.Parameters.AddWithValue("@Imagen", uss.Imagen);
                   
                    cmd.Connection = connection;

                    int result = cmd.ExecuteNonQuery();
                    connection.Close();
                    return result;
                }
            }
        }
        
        public int Delete(Usuarios uss)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection conection = new SqlConnection(connectionString);
            string patron = "delete";
            using (conection)
            {
                using (SqlCommand cmd = new SqlCommand("SP_MasterUsuarios", conection))
                {
                    conection.Open();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_usuario", uss.id_usuario);
                    cmd.Parameters.AddWithValue("@Patron", patron);

                    cmd.Connection = conection;

                   int resultado= cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    conection.Close();
                    return resultado;
                    
                }


            }
        }
    
        
        #endregion

    }
}

