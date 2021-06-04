var urlBase = 'http://csmajorproject.xyz/LAMPAPI';
var extension = 'php';

var userId = 0;
var firstName = "";
var lastName = "";

function doLogin()
{
	userId = 0;
	firstName = "";
	lastName = "";
	
	//Puts the loginName in login
	var login = document.getElementById("loginName").value;

	//Puts the loginPassword in password
	var password = document.getElementById("loginPassword").value;
	
	//This is for a messege which tell the user that login was successful or not
	document.getElementById("loginResult").innerHTML = "Logging In...";

	var jsonPayload = '{"login" : "' + login + '", "password" : "' + password + '"}';
	var url = urlBase + '/Login.' + extension;
	
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{	//document.getElementById("loginResult").innerHTML = "Logging In..." + this.readyState + " " + this.status;		
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of LoginAPI comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				userId = jsonObject.id;

				

				if( userId < 1 )
				{		
					//Error message for invlid userId
					document.getElementById("loginResult").innerHTML = "User/Password combination incorrect";
					return;
				}
		
				firstName = jsonObject.firstName;
				lastName = jsonObject.lastName;
				
				//Saves the data for the next 
				saveCookie();
	
				window.location.href = ('contacts.html');
				
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("loginResult").innerHTML = err.message;
	}

}

function saveCookie()
{
	var minutes = 20;
	var date = new Date();
	date.setTime(date.getTime()+(minutes*60*1000));	
	document.cookie = "firstName=" + firstName + ",lastName=" + lastName + ",userId=" + userId + ";expires=" + date.toGMTString();
}

function readCookie()
{
	userId = -1;
	var data = document.cookie;
	var splits = data.split(",");
	for(var i = 0; i < splits.length; i++) 
	{
		var thisOne = splits[i].trim();
		var tokens = thisOne.split("=");
		if( tokens[0] == "firstName" )
		{
			firstName = tokens[1];
		}
		else if( tokens[0] == "lastName" )
		{
			lastName = tokens[1];
		}
		else if( tokens[0] == "userId" )
		{
			userId = parseInt( tokens[1].trim() );
		}
	}
	
	if( userId < 0 )
	{
		window.location.href = "index.html";
	}
	else
	{
		document.getElementById("userName").innerHTML = "Logged in as " + firstName + " " + lastName;
	}
}


function doLogout()
{
	userId = 0;
	firstName = "";
	lastName = "";
	document.cookie = "firstName= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
	window.location.href = "index.html";
}

function searchContact()
{
	//gets input of the search input bar
	var searchInput = document.getElementById("searchInput").value;
	
	//Status of search
	document.getElementById("searchStatus").innerHTML = "Looking for the Contact....";

	//making a jsonpayload
	var jsonPayload = '{"search" : "' + searchInput + '", "userId" : ' + userId + '}';
	
	var url = urlBase + '/SearchContact.' + extension;
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{	document.getElementById("searchStatus").innerHTML = "Error Check" + this.readyState + " " + this.status;		
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of LoginAPI comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				document.getElementById("searchStatus").innerHTML = "Check";
				var data = jsonObject.results;
 				var TotalContacts = jsonObject.TotalContacts;

				var Table = document.getElementById("myTable");
				//start a new table
				Table.remove();

				document.getElementById("searchStatus").innerHTML = "Contacts Found!!!";
				
				//Table Making
				var i = 0;
				var r = 1;
				var j = 0;
				var newTable = document.createElement("TABLE");
  				newTable.setAttribute("id", "myTable");
  				document.body.appendChild(newTable);
								
				//Header
				var row = newTable.insertRow(0);
				var No = row.insertCell(0);
				var Name = row.insertCell(1);
				var Phone = row.insertCell(2);
				var Email = row.insertCell(3);
				var Delete = row.insertCell(4);
				var Edit = row.insertCell(5);
				var conId = '';
				var numRow = '';
				var btn;
				No.innerHTML = "No.";
				Name.innerHTML = "Name";
				Phone.innerHTML = "Phone";
				Email.innerHTML = "Email";
				Delete.innerHTML = "DeleteButtons";
				Edit.innerHTML = "EditButtons";
				

				while(i < data.length)
				{
					
					row = newTable.insertRow(r);
					while(data.charAt(i) != ',')
					{
						i++;
					}
					conId = data.substr(j, i - j);
					i++;
					j = i;

					row.setAttribute("id", "Row" + r);
					row.setAttribute("title", conId);

					No = row.insertCell(0);
					No.setAttribute("id", "No" + r);

					Name = row.insertCell(1);
					Name.setAttribute("id", "Name" + r);

					Phone = row.insertCell(2);
					Phone.setAttribute("id", "Phone" + r);

					Email = row.insertCell(3);
					Email.setAttribute("id", "Email" + r);

					Delete = row.insertCell(4);
					Delete.setAttribute("id", "Delete" + r);

					Edit = row.insertCell(5);
					Edit.setAttribute("id", "Edit" + r);
					
					btn = document.createElement("BUTTON");
					btn.innerHTML = "Delete";
					btn.id = r;
					var name = "Row" + r;
					var R = toString(r);
					btn.onclick = function() {deleteContact(this.title, this.id)};
					Delete.appendChild(btn);
					
					btn = document.createElement("BUTTON");
					btn.innerHTML = "Edit";
					btn.onclick = function() {};
					Edit.appendChild(btn);
					
					No.innerHTML = r;
					while(data.charAt(i) != ',')
					{
						i++;
					}
					Name.innerHTML = data.substr(j, i - j);
					i++;
					j = i;

					while(data.charAt(i) != ',')
					{
						i++;
					}
					Phone.innerHTML = data.substr(j, i - j);
					i++;
					j = i;

					while(data.charAt(i) != ',')
					{
						i++;
					}
					Email.innerHTML = data.substr(j, i - j);
					i++;
					j = i;
					r++;
				}				
				
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("searchResult").innerHTML = err.message;
	}

}

function readContact()
{	
	//Status of search
	document.getElementById("readStatus").innerHTML = "Looking for the Contact....";

	//making a jsonpayload
	var jsonPayload = '{"userId" : ' + userId + '}';
	
	var url = urlBase + '/ReadContact.' + extension;
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{	document.getElementById("readStatus").innerHTML = "Error Check" + this.readyState + " " + this.status;		
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of LoginAPI comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				var data = jsonObject.results;
 				var TotalContacts = jsonObject.TotalContacts;

				var Table = document.getElementById("myTable");
				//start a new table
				Table.remove();

				document.getElementById("readStatus").innerHTML = "Contacts Found!!!";
				
				//Table Making
				var i = 0;
				var r = 1;
				var j = 0;
				var newTable = document.createElement("TABLE");
  				newTable.setAttribute("id", "myTable");
  				document.body.appendChild(newTable);
								
				//Header
				var row = newTable.insertRow(0);
				var No = row.insertCell(0);
				var Name = row.insertCell(1);
				var Phone = row.insertCell(2);
				var Email = row.insertCell(3);
				var Delete = row.insertCell(4);
				var Edit = row.insertCell(5);
				var conId = '';
				var numRow = '';
				var btn;
				No.innerHTML = "No.";
				Name.innerHTML = "Name";
				Phone.innerHTML = "Phone";
				Email.innerHTML = "Email";
				Delete.innerHTML = "DeleteButtons";
				Edit.innerHTML = "EditButtons";
				

				while(i < data.length)
				{
					
					row = newTable.insertRow(r);
					while(data.charAt(i) != ',')
					{
						i++;
					}
					conId = data.substr(j, i - j);
					i++;
					j = i;

					row.setAttribute("id", "Row" + r);
					row.setAttribute("title", conId);

					No = row.insertCell(0);
					No.setAttribute("id", "No" + r);

					Name = row.insertCell(1);
					Name.setAttribute("id", "Name" + r);

					Phone = row.insertCell(2);
					Phone.setAttribute("id", "Phone" + r);

					Email = row.insertCell(3);
					Email.setAttribute("id", "Email" + r);

					Delete = row.insertCell(4);
					Delete.setAttribute("id", "Delete" + r);

					Edit = row.insertCell(5);
					Edit.setAttribute("id", "Edit" + r);
					
					btn = document.createElement("BUTTON");
					btn.innerHTML = "Delete";
					btn.id = r;
					btn.setAttribute("title", conId);
					var name = "Row" + r;
					var R = toString(r);
					btn.onclick = function() {deleteContact(this.title, this.id)};
					Delete.appendChild(btn);
					
					btn = document.createElement("BUTTON");
					btn.innerHTML = "Edit";
					btn.onclick = function() {};
					Edit.appendChild(btn);
					
					No.innerHTML = r;
					while(data.charAt(i) != ',')
					{
						i++;
					}
					Name.innerHTML = data.substr(j, i - j);
					i++;
					j = i;

					while(data.charAt(i) != ',')
					{
						i++;
					}
					Phone.innerHTML = data.substr(j, i - j);
					i++;
					j = i;

					while(data.charAt(i) != ',')
					{
						i++;
					}
					Email.innerHTML = data.substr(j, i - j);
					i++;
					j = i;
					r++;
				}				
				
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("readResult").innerHTML = err.message;
	}


}


function deleteContact(Id, no)
{
	//Id of the contact
	var jsonPayload = '{"Id" : "' + Id + '"}';
	
	//URL to the api
	var url = urlBase + '/DeleteContact.' + extension;
	
	//Connection
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{	document.getElementById("Name" + no).innerHTML = this.readyState + ", " + this.status;		
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of API comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				
				document.getElementById("Name" + no).innerHTML = "Content Deleted!!";
				document.getElementById("Phone" + no).innerHTML = "Content Deleted!!";
				document.getElementById("Email" + no).innerHTML = "Content Deleted!!";
				document.getElementById("Delete" + no).innerHTML = "Content Deleted!!";
				document.getElementById("Edit" + no).innerHTML = "Content Deleted!!";

			}
		};
		xhr.send(jsonPayload);
	}catch(err)
	{
		document.getElementById("Name" + no).innerHTML = err.message;
	}

}

function addContact()
{
	//get input of the new contact
	var fName = document.getElementById("addFirstName").value;
	var lName = document.getElementById("addLastName").value;
	var phoneNumber = document.getElementById("addPhoneNumber").value;
	var email = document.getElementById("addEmail").value;

	//AddStatus
	document.getElementById("addStatus").innerHTML = "Adding new Contact....";
	
	//Error Cases
	if(fName.localeCompare('') == 0 || lName.localeCompare('') == 0 || phoneNumber.localeCompare('') == 0 || email.localeCompare('') == 0)
	{
		document.getElementById("addStatus").innerHTML = "All the informating needs to be filled";
		return;
	}

	//making a jsonpayload
	var jsonPayload = '{"FName" : "' + fName + '", "LName" : "' + lName + '", "Phone" : "' + phoneNumber + '", "Email" : "' + email + '"}';
	
	var url = urlBase + '/AddContact.' + extension;
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{	//document.getElementById("addResult").innerHTML = "Error Check" + this.readyState + " " + this.status;		
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of LoginAPI comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				
				document.getElementById("addStatus").innerHTML = "New Contact Added!!!"				
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("addResult").innerHTML = err.message;
	}

	
}



function registerUser()
{
	
	//get register Information
	var uName = document.getElementById("regUserName").value;
	var fName = document.getElementById("regFirstName").value;
	var lName = document.getElementById("regLastName").value;
	var password = document.getElementById("regPassword").value;
	var repassword = document.getElementById("regrePassword").value;
	document.getElementById("regStatus").innerHTML = "Registering a New User...";

	//Password Match Check
	if(password.localeCompare(repassword) != 0)
	{
		document.getElementById("regStatus").innerHTML = "Password and re-Password Dosent match";
		return;
	}
	
	//Error Cases
	if(uName.localeCompare('') == 0 || fName.localeCompare('') == 0 || lName.localeCompare('') == 0 || password.localeCompare('') == 0 || repassword.localeCompare('') == 0)
	{
		document.getElementById("regStatus").innerHTML = "All the informating needs to be filled";
		return;
	}
	
	//making a jsonpayload
	var jsonPayload = '{"FName" : "' + fName + '", "LName" : "' + lName + '", "Password" : "' + password + '", "UserName" : "' + uName + '"}';
	
	var url = urlBase + '/RegisterUser.' + extension;
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function() 
		{			
			if (this.readyState == 4 && this.status == 200) 
			{				
				//This is where the result of LoginAPI comes back to
				var jsonObject = JSON.parse( xhr.responseText );
				var error = jsonObject.error;
				
				if(error.localeCompare(""))
				{
					document.getElementById("regStatus").innerHTML = "New User Has been Registered";
				}
			}
		};
		xhr.send(jsonPayload);
	}
	catch(err)
	{
		document.getElementById("addResult").innerHTML = err.message;
	}
}

function update()
{
	
}
