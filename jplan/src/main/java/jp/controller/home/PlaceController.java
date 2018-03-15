package jp.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {

		@RequestMapping("/place")
		public String place() {
			return "place";
		}
}

