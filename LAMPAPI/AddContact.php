<?php
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345"; 
    $dbname = "group_19A";

    // Data require to insert into database
    $firstName = $inData["firstName"];
    $lastName = $inData["lastName"];
    $phoneNumber = $inData["phoneNumber"];
    $email = $inData["email"];
    $userId = $inData["userId"];


    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        // Insert into Contacts
        $stmt = $conn->prepare("INSERT into Contacts (FirstName,LastName,PhoneNumber,Email,UserID) VALUES(?,?,?,?,?)");
        $stmt->bind_param("sssss",$firstName,$lastName,$phoneNumber,$email,$userId);
        $stmt->execute();
        $stmt->close();
        $conn->close();
        // Why do we use this line?
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