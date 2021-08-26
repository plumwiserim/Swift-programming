using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Azure.Storage.Blobs;
using System.Collections.Generic;
using System.Linq;

namespace YeRim.Function
{
    public static class UploadJSON
    {
        [FunctionName("UploadJSON")]
        public static string Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            string connStrA = Environment.GetEnvironmentVariable("AzureWebJobsStorage");
            string requestBody = new StreamReader(req.Body).ReadToEnd(); //json file
            string dateTime = DateTime.UtcNow.AddHours(9).ToString("yyyyMMdd hh:mm");

            JObject objB = (JObject)JsonConvert.DeserializeObject(requestBody); //type casting

            BlobServiceClient clientA = new BlobServiceClient(connStrA); //client 생성
            BlobContainerClient containerA = clientA.GetBlobContainerClient("json"); //container 생성 
            BlobClient blobA = containerA.GetBlobClient(dateTime + ".json");

            string respA = "No Data";
            JObject objA = new JObject();

            if(blobA.Exists()) {
                using (MemoryStream msA = new MemoryStream()) {
                    blobA.DownloadTo(msA);
                    respA = System.Text.Encoding.UTF8.GetString(msA.ToArray());
                    objA = JObject.Parse(respA);
                }
            }
            IList<string> keys = objB.Properties().Select(p => p.Name).ToList();

            foreach (var item in keys)
            {
                objA.Add(item, objB[item]);

            }

            string tagData = Newtonsoft.Json.JsonConvert.SerializeObject(objA);
            using (Stream streamA = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(tagData))) {
                blobA.Upload(streamA, true);
            }


            return "";
        }
    }
}
