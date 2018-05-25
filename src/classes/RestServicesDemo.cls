@RestResource(urlMapping='/Cases/*')  
global with sharing class RestServicesDemo {  
    @HttpGet  
    global static Case getCaseById() {  
        RestRequest req = RestContext.request;  
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);  
        Case result = [SELECT CaseNumber, Subject, Status, Origin, Priority  
                       FROM Case  
                       WHERE Id = :caseId];  
        return result;  
    }  
    /*  
HttpGet步骤：  
1、创建RestRequest类型的req对象(RestContext.request的返回值类型就是RestRequest)  
2、通过req对象的requestURI属性利用字符串检索技术拿到caseId  
3、创建Case对象result，并将通过caseId查到的记录赋值给该对象,注意“WHERE Id = :caseId”  
4、返回Case对象  
*/  
    @HttpPost  
    global static ID createCase(String subject, String status,  
        String origin, String priority) {  
        Case thisCase = new Case(  
            Subject=subject,  
            Status=status,  
            Origin=origin,  
            Priority=priority);  
        insert thisCase;  
        return thisCase.Id;  
    }  
    /* 
HttpPost步骤： 
1、声明并创建一个Case类型对象thisCase，并为该对象的标准字段赋值 
2、将自定义对象插入到Case表中形成一条记录 
3、返回一个新纪录的类型为ID的变量Id用于查找新纪录 
*/  
    @HttpDelete  
    global static void deleteCase() {  
        RestRequest req = RestContext.request;  
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);  
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];  
        delete thisCase;  
    }  
    /* 
思路： 
要删除某一条记录首先要找到该记录，而方法可以是利用soql语言查找到某一记录的主码，这里是Id（使用rest服务请求获取到uri后从uri中取得的id） 
HttpDelete步骤： 
1、创建ResrRequest对象req 
2、声明caseId，并将rest请求到的uri截取/后的值赋给该变量 
3、利用soql语句查到Id = :caseId的那条记录 
4、删除该记录 
*/  
    @HttpPut  
    global static ID upsertCase(String id, String subject, String status, String origin, String priority) {  
        Case thisCase = new Case(  
        Id = id,  
            Subject = subject,  
            Status = status,  
            Origin = origin,  
            Priority = priority  
        );  
        upsert thisCase;  
        return thisCase.Id;  
    }  
    /* 
HttpPut步骤： 
1、声明并创建一个Case类型对象thisCase，并为该对象定义标准字段赋值 
2、将自定义对象插入到Case表中形成一条记录或者更新Id为id的记录 
3、返回一个新纪录的类型为ID的变量Id用于查找新纪录 
*/  
    @HttpPatch  
    global static ID updateCaseFields() {  
        RestRequest req = RestContext.request;  
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);  
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];  
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestBody.toString());  
        for(String fieldName : params.keySet()) {  
            thisCase.put(fieldName, params.get(fieldName));  
        }  
        update thisCase;  
        return thisCase.Id;  
    }  
    /* 
HttpPatch步骤： 
1、创建RestRequest类型的req对象(RestContext.request的返回值类型就是RestRequest) 
2、通过req对象的requestURI属性利用字符串检索技术拿到caseId 
3、创建Case对象，并把按Id查到的Case表记录赋值给该对象 
4、将请求获得的requestBody转化成字符串后，反序列化为对象强制转化为Map<String, Object>后赋值给Map变量params 
5、遍历对象的key，并在通过id找到的Case对象thisCase中写入key-value 
6、更新记录 
7、返回记录的id 
*/  
}  
/* 
共性： 
1、每个对象系统自带一个Id属性，它是系统自动分配的； 
2、每一种Http方法均为global static 
3、@HttpPut与@HttpPost的区别（upsert，insert） 
*/