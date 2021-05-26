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
    $searchResult = "";
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
        $stmt = $conn->prepare("SELECT FirstName,LastName FROM Contacts where FirstName=? and LastName=?");
        $searchInput = "%" . $inData["search"] . "%";
        $stmt->bind_param("ss", $searchInput,$inData["lastName"]);
        $stmt->execute();

        $result = $stmt->get_result();

        while ($row = $result->fetch_assoc())
        {
            if($searchCount > 0)
            {
                $searchResult .= ",";
            }
            $searchCount++;
            $searchResult .= '"' . $row["FirstName"] . '"' ' ' '"' . $row["LastName"] '"';
        }

        if ($searchCount == 0)
        {
            returnWithError("No Contacts Found");
        }
        else
        {
            returnWithInfo($searchResult);
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
		$retValue = '{"firstName":"","lastName":"","error":"' . $err . '"}';
		sendResultInfoAsJson( $retValue );
	}
	
	function returnWithInfo( $searchResults )
	{
		$retValue = '{"results":[' . $searchResults . '],"error":""}';
		sendResultInfoAsJson( $retValue );
	}

?>