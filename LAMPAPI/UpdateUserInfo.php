<?php
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345";
    $dbname = "group_19A";

    // Data required to find user to update
    $id = $inData["id"];

    // new user info
    $firstName = $inData["firstName"];
    $lastName = $inData["lastName"];
    $login = $inData["login"];
    $password = $inData["password"];

    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        // Change user info
        $stmt = $conn->prepare("UPDATE Users SET FirstName=?, LastName=?, Login=?, Password=? WHERE ID=?");
        $stmt->bind_param("sssss",$firstName,$lastName,$login,$password,$id);
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
