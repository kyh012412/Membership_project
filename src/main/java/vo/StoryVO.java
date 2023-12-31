package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoryVO {
	private int s_idx,
				m_idx,
				s_read_hit,
				s_like_count;
    private String s_content,
    			   s_posted_date,
    			   s_expected_expiration_time,
    			   s_filename,
    			   sl_isliked;
    private MultipartFile s_file;
}
