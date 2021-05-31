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
    $Name = "Name";
    $Num = "No.";
    $Phone = "Phone";
    $Email = "Email"; 
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
        $stmt = $conn->prepare("SELECT FirstName, LastName, PhoneNumber, Email FROM Contacts WHERE UserID=?");
        $stmt->bind_param("i",$inData["userId"]);
        $stmt->execute();

        $result = $stmt->get_result(); 

        while ($row = $result->fetch_assoc())
        {
            $searchCount++;
            $Name = $row['FirstName'] . " " . $row['LastName'];
            $Phone = $row['PhoneNumber'];
            $Email = $row['Email'];
            $myarray .= $Name . "," . $Phone . "," . $Email . "," ;
	    }

        if ($searchCount == 0)
        {
            returnWithError("You have no contacts. Please add.");
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