<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
      <title>Show Salary by Employee Name</title>
   </head>
   <body>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
  Full Name: <input type="text" name="fname" id="fname">
  <input type="submit">
 </form>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    # collect input data
     $empName = $_POST['fname'];

     if (!empty($empName)){
		$empName = prepareInput($empName);
                $sal_title = getSalaryFromDB($empName);
                $salary = $sal_title[0];
                $title = $sal_title[1];
		echo "Salary: of $empName is $salary, they are an $title <br>";
	 }
}
function getSalaryFromDB($name){
	//connect to your database
	$conn=oci_connect('dlee','helloworld', '//dbserver.engr.scu.edu/db11g');
	if(!$conn) {
	     print "<br> connection failed:";
        exit;
	}
	//	 Parse the SQL query
	$query = oci_parse($conn, "SELECT salary, title FROM AlphacoEmp where name= :bv");

	oci_bind_by_name($query,':bv',$name);
	// Execute the query
	oci_execute($query);

	if (($row = oci_fetch_array($query, OCI_BOTH)) != false) {
		// We can use either numeric indexed starting at 0
		// or the column name as an associative array index to access the colum value
		// Use the uppercase column names for the associative array indices
		echo $row[0] . " and " . $row['SALARY']   . " are the same<br>\n";
                $salary = $row['SALARY'];
                $title = $row['TITLE'];
	}
	else {
		echo "No such employee <br>\n";
	}
	oci_free_statement($query);
	oci_close($conn);

	return array($salary, $title);
}
function prepareInput($inputData){
	// Removes any leading or trailing white space
	$inputData = trim($inputData);
	// Removes any special characters that are not allowed in the input

  	$inputData  = htmlspecialchars($inputData);

  	return $inputData;
}

?>
<!-- end PHP script -->
   </body>
</html>
