package vn.iotstar.util;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Map;

public class CloudinaryUtil {
    // Thông tin tài khoản Cloudinary (bạn có thể thay thế bằng cloud_name, api_key, api_secret của bạn)
    private static final String CLOUD_NAME = "duy8k9n7e";
    private static final String API_KEY = "187515286466723";
    private static final String API_SECRET = "Z9b7fXl2fW4P1jK9qRtS_EXAMPLE";

    private static Cloudinary cloudinary;

    public static Cloudinary getCloudinary() {
        if (cloudinary == null) {
            cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", CLOUD_NAME,
                    "api_key", API_KEY,
                    "api_secret", API_SECRET,
                    "secure", true
            ));
        }
        return cloudinary;
    }

    /**
     * Upload file Part lên Cloudinary bằng multipart.
     * Có cơ chế tự động fallback lưu cục bộ nếu chưa cấu hình API Secret của Cloudinary.
     */
    @SuppressWarnings("rawtypes")
    public static String uploadImage(Part part) {
        if (part == null || part.getSize() <= 0) {
            return null;
        }

        try {
            // Thử upload lên Cloudinary
            File tempFile = File.createTempFile("cloud_", "_" + part.getSubmittedFileName());
            try (InputStream input = part.getInputStream()) {
                Files.copy(input, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            Map uploadResult = getCloudinary().uploader().upload(tempFile, ObjectUtils.asMap(
                    "folder", "hcmute_users"
            ));
            tempFile.delete();

            if (uploadResult != null && uploadResult.containsKey("secure_url")) {
                String cloudUrl = (String) uploadResult.get("secure_url");
                System.out.println(">>> [CLOUDINARY SUCCESS] Uploaded to: " + cloudUrl);
                return cloudUrl;
            }
        } catch (Exception e) {
            System.err.println(">>> [CLOUDINARY NOTICE] Upload Cloudinary gặp ngoại lệ: " + e.getMessage() + ". Hệ thống chuyển sang lưu file Multipart cục bộ.");
        }

        // Fallback: Lưu file local vào Constant.DIR
        try {
            String uploadPath = Constant.DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String fname = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
            part.write(uploadPath + File.separator + fname);
            return fname;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
