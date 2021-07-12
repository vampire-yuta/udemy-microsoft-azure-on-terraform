<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
protected void Page_Load(Object source, EventArgs e) {
    if (IsPostBack) {
        return;
    }
    // 接続文字列を作成
    string connectString = "Data Source=udemy-sql-server.database.windows.net;";
    connectString += "Initial Catalog=udemy-database;";
    connectString += "User ID=sqladministrator;";
    connectString += "Password=P@$$w0rd1234!;";
    connectString += "Trusted_Connection=False;";
    // 取得したデータ退避用
    DataTable dt = new DataTable();
    using (SqlConnection con = new SqlConnection(connectString))
    using (SqlDataAdapter adapter = new SqlDataAdapter()) {
        con.Open();
        // クエリを実行して、結果をDataTableに退避
        string query = "SELECT * FROM table1";
        adapter.SelectCommand = new SqlCommand(query, con);
        adapter.Fill(dt);
    }
    // 画面上のDataGridとバインド
    datagrid.DataSource = new DataView(dt);
    DataBind();
}
</script>
<html>
<body>
<asp:DataGrid id="datagrid" runat="server" />
</body>
</html>
