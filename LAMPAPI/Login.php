<?php
    $inData = getRequestInfo();

    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345"; 
    $dbname = "group_19A";

    $id = 0;
    $firstName = "";
    $lastName = "";

    // Create connection
    // class mysqli - Represents a connection between PHP and MySQL database
    // mysqli($servername,$username,$password,$dbname)    
    $conn = new mysqli($servername,$username,$password,$dbname);

    // mysqli->connect_error - Returns last error message and if no error returns null
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        //msqli->prepare - Prepares an SQL statement for execution and returns the statement object
        $stmt = $conn->prepare("SELECT ID, FirstName, LastName FROM Users WHERE Login=? AND Password=?");
        
	//msqli_stmt->bind_parem binds variables to a prepared statement as parameters
        $stmt->bind_param("ss",$inData["login"],$inData["password"]);
        
	//msqli_stmt->execute executes a prepared Query
        $stmt->execute();
        
	//msqli_stmt->get_result gets a result set from a prepared statement
        $result = $stmt->get_result();

        if($row = $result->fetch_assoc() )
        {
            returnWithInfo($row['FirstName'], $row['LastName'], $row['ID']);
        }
        else
        {
            returnWithError("No Records Found");
        }
        $stmt->close();
        $conn->close();
    }

    function getRequestInfo()
    {
        // json_decode - Takes a JSON encoded string and converts it into a PHP variable
        // file_get_contents - Reads entire file into a string
        return json_decode(file_get_contents('php://input'), true);
    }

    // Outputs to user
    function sendResultInfoAsJson($obj)
    {
        // header - Send a raw HTTP header
        header('Content-type: application/json');
        // echo - Outputs one or more strings
        echo $obj;
    }

    // if returnWithError is called, error return value string will be used
    function returnWithError($err)
    {
        $retValue = '{"id":0,"firstName":"","lastName":"","error":"' . $err . '"}';
        sendResultInfoAsJson($retValue);
    }

    // if no error, returns the appropriate firstName, lastName, and id
    function returnWithInfo($firstName, $lastName, $id)
    {
        $retValue = '{"id":' . $id . ',"firstName":"' . $firstName . '","lastName":"' . $lastName . '","error":""}';
        sendResultInfoAsJson($retValue);
    }
?>