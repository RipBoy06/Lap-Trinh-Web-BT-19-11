package vn.iotstar.configs;

import jakarta.servlet.annotation.WebFilter;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

@WebFilter(filterName = "sitemesh", urlPatterns = "/*")
public class SiteMeshConfig extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        // Cấu hình decorator cho các trang admin và web thông thường
        builder.addDecoratorPath("/admin/*", "/views/decorators/admin.jsp")
               .addDecoratorPath("/*", "/views/decorators/web.jsp")
               // Loại trừ các endpoint không cần decorate (hình ảnh, tài nguyên tĩnh)
               .addExcludedPath("/image*")
               .addExcludedPath("/assets/*")
               .addExcludedPath("/static/*");
    }
}
