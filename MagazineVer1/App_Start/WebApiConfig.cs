using System.Web.Http;

namespace MagazineVer1.App_Start
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API 設定和服務

            // Web API 路由
            config.MapHttpAttributeRoutes();

            // 允許跨源存取
            config.EnableCors();

            config.Routes.MapHttpRoute(
                name: "AdvertisingApi",
                routeTemplate: "api/Advertising/{action}/{id}",
                defaults: new { controller = "Advertising", id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "BroadcastApi",
                routeTemplate: "api/Broadcast/{action}/{id}",
                defaults: new { controller = "Broadcast", id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}