// Get a token / refresh token
curl -X POST --data "id=<id>&secret=<secret>" -i https://api-qa.venzee.com/api/app/token

    // Response
    {
      "access_token":"0efmPvHttDJs2R0x5BmJMqYfqMTB28B7",
      "expires_in":3600,
      "token_type":"Bearer"
    }



//10. create collection
curl -X POST -H "Authorization: Bearer 0efmPvHttDJs2R0x5BmJMqYfqMTB28B7"  -d "name=api-curl-created2&privacy=private&imap=2&currency=USD" -i https://api-qa.venzee.com/api/orgs/msylvestre-corp/collections

    // Response
    {
      "name":"api-curl-created",
      "privacy":"private",
      "map":null,
      "currency":"USD",
      "created":"2015-06-09T16:19:57.542Z",
      "lastUpdated":"2015-06-09T16:19:57.542Z"
    }



//13. create a record inside a collection
curl -X POST -H "Authorization: Bearer 0efmPvHttDJs2R0x5BmJMqYfqMTB28B7" -d "name=Nokia-9921&sku=nok9929-US&cost=689&imap=1.2&status=active&inventory=9999&description=Nokia new version&brand=Nokia&recordId=28" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/records

    // Response
    {
      "name":"Nokia-9921",
      "recordId":"28",
      "cost":689,
      "map":null,
      "images":null,
      "videos":null,
      "customFields":null,
      "collectionId":"4FSKKYXGJY",
      "id":"W5DR6PX6UF",
      "created":"2015-06-09T16:21:23.237Z",
      "lastUpdated":"2015-06-09T16:21:23.237Z"
    }



//17. Get list of records inside a collection from an organization
curl -X GET -H "Authorization: Bearer 0efmPvHttDJs2R0x5BmJMqYfqMTB28B7" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/records?offset=0\&limit=100

    //Response
    [
      {
        "map":1.3,
        "cost":499.99,
        "id":"P4O12KZ5KR",
        "customFields":{"color":"black"},
        "recordId":"12",
        "lastUpdated":"2015-06-09T15:57:03.627Z",
        "name":"Galaxy S4",
        "images":null,
        "videos":["http://youtube.com/galaxys4"],
        "created":"2015-06-09T15:57:03.627Z",
        "collectionId":"4FSKKYXGJY"
      },
      {
        "map":null,
        "cost":689,
        "id":"F9YK93J2AB",
        "customFields":null,
        "recordId":"27",
        "lastUpdated":"2015-06-09T15:54:15.457Z",
        "name":"Nokia-9929",
        "images":null,
        "videos":null,
        "created":"2015-06-09T15:54:15.457Z",
        "collectionId":"4FSKKYXGJY"
      }
    ]




// Get a single product information
curl -X GET -H "Authorization: Bearer SYbYiFL1mkeXqu2EstQ6XRBT1k8Ck1kO" -d "" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/records/P4O12KZ5KR

    // Response
    {
      "map":1.3,
      "cost":499.99,
      "id":"P4O12KZ5KR",
      "customFields":{"color":"black"},
      "recordId":"12",
      "lastUpdated":"2015-06-09T15:57:03.627Z",
      "name":"Galaxy S4",
      "images":null,
      "videos":["http://youtube.com/galaxys4"],
      "created":"2015-06-09T15:57:03.627Z",
      "collectionId":"4FSKKYXGJY",
      "relatives":{"children":[]}
    }



// Update a product
curl -X PUT -H "Authorization: Bearer SYbYiFL1mkeXqu2EstQ6XRBT1k8Ck1kO" -d "name=Galaxy-S5&cost=339.99&map=" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/records/P4O12KZ5KR

    // Response
    {
      "Attributes":
      {
        "map":null,
        "cost":339.99,
        "lastUpdated":"2015-06-09T19:49:17.625Z",
        "name":"Galaxy-S5",
        "customFields":null,
        "images":null,
        "videos":null,
        "recordId":"12"
      }
    }




// Invite a partner
curl -X POST -H "Authorization: Bearer 0efmPvHttDJs2R0x5BmJMqYfqMTB28B7" -d "emails[]=my_partner@venzee.com&template=SHARE&message=" -i https://api-qa.venzee.com/api/orgs/msylvestre-corp/partnership

    // Response
    {
      "newInvitation":1,
      "confirmedInvitation":0,
      "resentInvitation":0,
      "details":{
        "my_partner@venzee.com":"cb523123-7552-4e65-b110-b11c1c97e3f4"
      },
      "errors":[]
    }



// Share a collection to everyone
curl -X POST -H "Authorization: Bearer quXrAUcAFJM6ILjsO6RWuYxz5MoGgqUa" -d "type=public" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/share

    // Response
    {
      "name":"api-curl-created",
      "privacy":"public",
      "map":null,
      "currency":"USD",
      "created":"2015-06-09T15:51:24.847Z",
      "lastUpdated":"2015-06-09T19:08:16.703Z"
    }
    

// Stop sharing a collection 
curl -X POST -H "Authorization: Bearer quXrAUcAFJM6ILjsO6RWuYxz5MoGgqUa" -d "type=private" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/share

    // Response
    {
      "name":"api-curl-created",
      "privacy":"private",
      "map":null,
      "currency":"USD",
      "created":"2015-06-09T15:51:24.847Z",
      "lastUpdated":"2015-06-09T21:58:24.539Z"
    }


 // Update a collection
    
curl -X PUT -H "Authorization: Bearer quXrAUcAFJM6ILjsO6RWuYxz5MoGgqUa" -d "name=api-curl-created&currency=USD&map=" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created

    // Response
    {
      "map":null,
      "id":"4FSKKYXGJY",
      "currency":"USD",
      "creatorId":"1CUVMVMXUG",
      "organizationId":"PFAO2F8L9B",
      "lastUpdated":"2015-06-09T19:54:21.125Z",
      "name":"api-curl-created",
      "created":"2015-06-09T15:51:24.847Z",
      "privacy":"public"
    }

// Upload an image to S3 bucket

curl -X PUT -H "Authorization: Bearer quXrAUcAFJM6ILjsO6RWuYxz5MoGgqUa" -d "" -i https://api-qa.venzee.com/api/user/image/upload




// Upload a local image to an existing product
curl -X POST -H "Authorization: Bearer w18JZI6xkQR6FHMtJMAWyIb52F1ALj9t" -i https://api-qa.venzee.com/api/collections/msylvestre-corp/api-curl-created/records/P4O12KZ5KR/images -F "file=@image.png"

    // Response




// Remove an image from a product 
curl -X POST -H "Authorization: Bearer w18JZI6xkQR6FHMtJMAWyIb52F1ALj9t" -i https://api-qa.venzee.com//api/collections/msylvestre-corp/api-curl-created/records/P4O12KZ5KR/images/image.png

    // Response




// Get Access token
curl -X POST --data "id=2c93068ca4454c79e7be6bed754dc5a2&secret=6210229b4946875f5b6f3b4073b07b5f575c7e51" -i https://api-qa.venzee.com/api/app/token

// Get Collection list
curl -X GET -H "Authorization: Bearer K1SoLTM7PUr8vxNvfSR82khNCzZtSwB5" -i https://api-qa.venzee.com/api/orgs/jmetercorp/collections


// Get Authenticated user
curl -X GET -H "Authorization: Bearer K1SoLTM7PUr8vxNvfSR82khNCzZtSwB5" -i https://api-qa.venzee.com/api/user

//Get Specific Company info
curl -X GET -H "Authorization: Bearer K1SoLTM7PUr8vxNvfSR82khNCzZtSwB5" -i https://api-qa.venzee.com/api/orgs/jmetercorp

// Get Usercomapny info 
curl -X GET -H "Authorization: Bearer K1SoLTM7PUr8vxNvfSR82khNCzZtSwB5" -i https://api-qa.venzee.com/api/user/orgs

