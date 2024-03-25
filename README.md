This repo consists of terraform modules for confluent resource provisioning. The resources include (topic, acl, rbac, service account, apikey) creation. 

1. Service account creation - modify sas.json file 

{
    "sas": [
       {
         "name": "abcd"
       }
    ]
  }

2. Topic creation - modify topics.json
{
    "topics": [
      {
        "name": "stephane100",
        "partitions" : 1,
        "config": {
          "delete.retention.ms": "10000000"
        }
      },
      {
        "name": "stephane101",
        "partitions" : 1,
        "config": {
          "delete.retention.ms": "10000000"
        }
      }
    ]
  }

3. RBAC for schema registry access - modify rbacs.json
{
    "rbacs": {
      "schema_registry": [
        {
          "role": "ResourceOwner",
          "resource": "sandesh-value",
          "principal": "test-sandesh81"
        },
        {
            "role": "ResourceOwner",
            "resource": "sandesh1-value",
            "principal": "test-sandesh81"
          }
      ]
    }
  }

4. ACL creation - modify acls.json
{
    "acls": [
      {
        "resource_type": "TOPIC",
        "resource_name": "stephane55",
        "pattern_type": "LITERAL",
        "principal": "test-sandesh81",
        "host": ["10.0.0.1","10.0.0.2","10.0.0.3"],
        "operation": "WRITE",
        "permission": "ALLOW"
      }
   ]
}
