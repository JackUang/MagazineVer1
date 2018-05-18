using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MagazineVer1.Startup))]
namespace MagazineVer1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
