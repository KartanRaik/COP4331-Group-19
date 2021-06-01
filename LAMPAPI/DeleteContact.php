<?php
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345";
    $dbname = "group_19A";

    //info required to identify contact
    $firstName = "firstName";
    $lastName = "lastName";
    $phoneNumber = "phoneNumber";
    $email = "email";
    $userId = "userId";


    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        // Delete from Contacts
        $stmt = $conn->prepare("DELETE FROM Contacts WHERE FirstName=? and LastName=? and PhoneNumber=? and Email=? and UserID=?");
        $stmt->bind_param("sssss",$firstName,$lastName,$phoneNumber,$email,$userId);
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
