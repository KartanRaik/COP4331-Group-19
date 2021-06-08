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
    $Phone = "";
    $Email = "";
    $Id = 0;
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
        $searchInput = "%" . $inData["search"] . "%";
        $stmt = $conn->prepare("SELECT ID, FirstName, LastName, PhoneNumber, Email FROM Contacts WHERE FirstName LIKE ? AND UserID=? OR LastName LIKE ? AND UserID=?");
        $stmt->bind_param("sisi",$searchInput ,$inData["userId"] ,$searchInput ,$inData["userId"]);
        $stmt->execute();

        $result = $stmt->get_result(); 

        while ($row = $result->fetch_assoc())
        {
            $searchCount++;

	    $Name = $row['FirstName'] . " " . $row['LastName'];
	    $Id = $row['ID'];
	    $Phone = $row['PhoneNumber'];
	    $Email = $row['Email'];

	    $myarray .= $Id . "," . $Name . "," . $Phone . "," . $Email . "," ;
	    
	}

        if ($searchCount == 0)
        {
            returnWithError("No Contacts Found");
        }
        else
        {
            returnWithInfo($myarray, $searchCount);
        }

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
	
    function returnWithInfo( $array, $number )
    {
	$retValue = '{"results":"' . $array . '", "TotalContacts":' . $number . ', "error":""}';
	sendResultInfoAsJson( $retValue );
    }

?>