<?php
    // getRequestInfo function - takes input (possibly from client side) and read into string and convert to php var
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345"; 
    $dbname = "group_19A";

    // Variables required for search
    // searchResult - concatenate existing/or nonexisent result and output to user
    $Name = "";
    $Num = "";
    $Phone = "";
    $Email = ""; 
    $myarray = ""; 

    // depicts if there are results found
    $searchCount = 0;

    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;    
        exit();
    }
    else
    {
        // Prepare a SQL statement of selecting first and last name from contacts
        $stmt = $conn->prepare("SELECT FirstName, LastName, PhoneNumber, Email FROM Contacts WHERE ID=?");
        $stmt->bind_param("i",$inData["Id"]);
        $stmt->execute();

        $result = $stmt->get_result(); 

        if ($row = $result->fetch_assoc())
        {
            $Name = $row['FirstName'] . " " . $row['LastName'];
            $Phone = $row['PhoneNumber'];
            $Email = $row['Email'];
	    }else
		{
			returnWithError("You have no contacts. Please add.");
		}
		returnWithInfo($Name, $Phone, $Email);

        $stmt->close();
        $conn->close();
    }

    function getRequestInfo()
    {
	    return json_decode(file_get_contents('php://input'), true);
    }

    function sendResultInfoAsJson( $obj )
    {
        header('Content-type: application/json');
        echo $obj;
    }
	
    function returnWithError( $err )
    {
        $retValue = '{"results":"","error":"' . $err . '"}';
        sendResultInfoAsJson( $retValue );
    }
	
    function returnWithInfo( $N, $P, $E)
    {
        $retValue = '{"Name":"' . $N . '", "Phone":"' . $P . '", "Email":"'. $E .'"}';
        sendResultInfoAsJson( $retValue );
    }

?>