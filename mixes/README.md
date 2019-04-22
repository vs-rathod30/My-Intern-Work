# Web service :

  •	(generic) a service offered by an electronic device to another electronic device, communicating with each other via the World Wide Web, or

  •	(specific) a web service implemented in the particular technology or brand, e.g W3C Web Services.

  In a web service, the Web technology such as HTTP—originally designed for human-to-machine communication—is utilized for machine-to-machine communication, more specifically for transferring machine-readable file formats such as XML and JSON.

  In relation to W3C Web Services, the W3C defined a web service as:
        
        "A web service is a software system designed to support interoperable machine-to-machine interaction over a network. It has an interface described in a machine-processable format (specifically WSDL). Other systems interact with the web service in a manner prescribed by its description using SOAP-messages, typically conveyed using HTTP with an XML serialization in conjunction with other web-related standards".
    
  — W3C, Web Services Glossary

          The term "web service" describes a standardized way of integrating web-based applications using the XML, SOAP, WSDL and UDDI open standards over an Internet Protocol backbone.
 
 XML is the data format used to contain the data and provide metadata around it, SOAP is used to transfer the data, WSDL is used for describing the services available and UDDI lists what services are available.

For example:
	
  Many organizations use multiple software systems for management. Different software systems often need to exchange data with each other, and a web service is a method of communication that allows two software systems to exchange this data over the internet. The software system that requests data is called a service requester, whereas the software system that would process the request and provide the data is called a service provider

Rules for communication between different systems need to be defined, such as:
  
  •	How one system can request data from another system.

  •	Which specific parameters are needed in the data request.

  •	What would be the structure of the data produced. (Normally, data is exchanged in XML files, and the structure of the XML file is validated against an .xsd file.)
  
  •	What error messages to display when a certain rule for communication is not observed, to make troubleshooting easier.

 All of these rules for communication are defined in a file called WSDL (Web Services Description Language), which has a .wsdl extension.
  A directory called UDDI (Universal Description, Discovery and Integration) defines which software system should be contacted for which type of data. So when one software system needs one particular report/data, it would go to the UDDI and find out which other system it can contact for receiving that data. Once the software system finds out which other system it should contact, it would then contact that system using a special protocol called SOAP (Simple Object Access Protocol). The service provider system would first validate the data request by referring to the WSDL file, and then process the request and send the data under the SOAP protocol
"""''''''

# Why we use ?
	
  Web services is used to make the application platform and technology independent.

# What is Web Service?
  
  Web service is a standardized medium to propagate communication between the client and server applications on the World Wide Web.
 
 Web services provide a common platform that allows multiple applications built on various programming languages to have the ability to communicate with each other

  # Popular Web Services Protocols are:

  SOAP ( Simple Object Access Protocol ):
	
  SOAP was developed as an intermediate language so that applications built on various programming languages could talk quickly to each other and avoid the extreme development effort.
https://www.tutorialspoint.com/soap/what_is_soap.htm

  WSDL ( Web Services Description Language ):
	WSDL is an XML-based file which tells the client application what the web service does and gives all the information required to connect to the web service.

  REST ( REpresentational State Transfer ):
	REST is used to build Web services that are lightweight, maintainable, and scalable.

  Important Point
      
      •	Web services do not require the use of browsers or HTML.

      •	Web services are not tied to any one operating system or programming language


# REST :
    
    •	REST (REpresentational State Transfer) is an architectural style for developing web services.

    •	REST is also a language-independent architectural style. REST-based applications can be written using any language, be it Java, Kotlin, .NET, AngularJS or JavaScript.


# MVC Design Pattern

With MVC design pattern, we have following components on which our design depends:

•	The model which is transferred from one layer to the other.

•	The View which is responsible to show the data present in the application.

•	The controller is responsible to accept a request from a user, modify a model and send it to the view which is shown to the user. 

•	The Model contains only the pure application data, it contains no logic describing how to present the data to a user.

•	The View presents the model’s data to the user. The view knows how to access the model’s data, but it does not know what this data means or what the user can do to manipulate it.

•	The Controller exists between the view and the model. It listens to events triggered by the view (or another external source) and executes the appropriate reaction to these events. In most cases, the reaction is to call a method on the model. Since the view and the model are connected through a notification mechanism, the result of this action is then automatically reflected in the view
https://www.brainvire.com/six-benefits-of-using-mvc-model-for-effective-web-application-development/




# What is Web Application?
	
  A Web Application or Web App is Software that runs on a Web Server. Unlike traditional desktop applications, which are launched by a Web Browser.
	
  In order to access/use any Software Application (Desktop or Web Application) Operating System is required/mandatory.	
	
  If it is Desktop Application like Notepad or Acrobat Reader we can launch those applications from the Operating System, just switch on the Computer, and after booting the System we can operate Desktop Applications. If it is Web Application Boot the System, launch a Browser and navigate to Web Application by typing the URL of the Web Application in the Browser Address bar, then access the Application, at end close the browser.
https://www.quora.com/What-is-web-application

In computing, a web application or web app is a client–server computer program which the client (including the user interface and client-side logic) runs in a web browser. Common web applications include webmail, online retail sales, and online auction.
 
# What Are the Benefits of Using Web Applications?
	
  A web application relieves the developer of the responsibility of building a client for a specific type of computer or a specific operating system, so anyone can use the application along as they have internet access.
	
  Since the client runs in a web browser, the user could be using an IBM-compatible or a Mac. They can be running Windows XP or Windows Vista.
	
  They can even be using Internet Explorer or Firefox, though some applications require a specific Web browser.
	
  Web applications commonly use a combination of server-side script (ASP, PHP, etc) and client-side script (HTML, Javascript, etc.) to develop the application. The client-side script deals with the presentation of the information while the server-side script deals with all the hard stuff like storing and retrieving the information.

# How Have Web Applications Evolved?
	
  Most web applications are based on the client-server architecture where the client enters information while the server stores and retrieves information. Internet mail is an example of this, with companies like Google's Gmail and Microsoft's Outlook offering web-based email clients.




# ORM (Object Relational Mapping) 
	
  When we work with an object-oriented system, there is a mismatch between the object model and the relational database. RDBMSs represent data in a tabular format whereas object-oriented languages, such as Java or C# represent it as an interconnected graph of objects.

	ORM stands for Object-Relational Mapping (ORM) is a programming technique for converting data between relational databases and object oriented programming languages such as Java, C#, etc.
	
  A simple answer is that you wrap your tables or stored procedures in classes in your programming language, so that instead of writing SQL statements to interact with your database, you use methods and properties of objects.
	
  An object-relational mapper (ORM) is a code library that automates the transfer of data stored in relational databases tables into objects that are more commonly used in application code.

# Why are ORMs useful?
 	
  ORMs provide a high-level abstraction upon a relational database that allows a developer to write Python code instead of SQL to create, read, update and delete data and schemas in their database. Developers can use the programming language they are comfortable with to work with a database instead of writing SQL statements or stored procedures.

  For example, without an ORM a developer would write the following SQL statement to retrieve every row in the USERS table where the zip_code column is 94107:

  SELECT * FROM USERS WHERE zip_code=94107;

  The equivalent Django ORM query would instead look like the following Python code:

   obtain everyone in the 94107 zip code and assign to users variable
  
  users = Users.objects.filter(zip_code=94107)
