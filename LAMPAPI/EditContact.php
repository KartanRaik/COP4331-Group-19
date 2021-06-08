<?php
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345";
    $dbname = "group_19A";

    // Data required to find contact to update
    $id = $inData["id"];

    // new contact info
    $firstName = $inData["FN"];
    $lastName = $inData["LN"];
    $phoneNumber = $inData["P"];
    $email = $inData["E"];

    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        // Change contact info
        $stmt = $conn->prepare("UPDATE Contacts SET FirstName=?, LastName=?, PhoneNumber=?, Email=? WHERE ID=?");
        $stmt->bind_param("sssss",$firstName,$lastName,$phoneNumber,$email,$id);
        $stmt->execute();
        $stmt->close();
        $conn->close();

        returnWithError("");
    }

    function getRequestInfo()
    {
        return json_decode(file_get_contents('php://input'), true);
    }

    function sendResultInfoAsJson($obj)
    {
        header('Content-type: application/json');
        echo $obj;
    }

    function returnWithError($err)
    {
        $retValue = '{"error":"' . $err . '"}';
        sendResultInfoAsJson($retValue);
    }

?>
