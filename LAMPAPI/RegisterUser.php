<?php
    $inData = getRequestInfo();

    // Info for establishing connection
    $servername = "localhost";
    $username = "admin1";
    $password = "admin12345";
    $dbname = "group_19A";

    // Data require to insert into database
    $firstName = $inData["FName"];
    $lastName = $inData["LName"];
    $login = $inData["UserName"];
    $Password = $inData["Password"];


    $conn = new mysqli($servername,$username,$password,$dbname);
    if ($conn->connect_error)
    {
        echo "Failed to connect to MySQL: " . $conn->connect_error;
        exit();
    }
    else
    {
        // Insert into Users
        $stmt = $conn->prepare("INSERT into Users (FirstName,LastName, Login, Password) VALUES(?,?,?,?)");
        $stmt->bind_param("ssss",$firstName,$lastName,$login,$Password);
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
