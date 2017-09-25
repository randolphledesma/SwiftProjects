$sql = "SELECT *
        FROM table
        WHERE id=:id";
$sql = $db->bindVars($sql, ':id', $rep_id, 'integer');
$res = $db->Execute($sql);
if ($res->RecordCount()) {
    $info = $res->fields;
}