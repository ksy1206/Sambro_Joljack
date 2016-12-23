package cmd.fcm;

import java.util.ArrayList;

public class App {

	private static final String apiKey = "AIzaSyDghhCtIO-WtzKinUxOFBtYf_21ykXgCfY";

	public static void main(String[] args) {
		System.out.println("Sending POST to FCM");
		// String regId =
		// "APA91bFcpapp5o2ef1P_ynz8G0jKfEwcABoM5mwhcxsLgm4yw8ZX2g20pBjJxGT6DrVVMqqn-zo1C5ioQ2gZuaw_z20ezqvDYzwzdm3p6ci08LL21tc5Zrbp1nvI857qzYMDjkoQWjfZ";

		String regId = "";
		/*
		 * 
		 * .......................................... Content content =
		 * createContent(regId);
		 * 
		 * String response = POST2GCM.post(apiKey, content);
		 */
		// System.out.println("response : " + response);
		String mainMessage = "FCM by Znfod";
		postSingleGCM(regId, mainMessage);
	
	}

	public static Content createContent(String regId, String mainMessage) {

		Content c = new Content();

		c.addRegId(regId);
		c.createData("Test Title", "default", mainMessage);

		return c;
	}

	/*
	 * ���������� GCM ������ input regList = �޴� ������� regId ���� List
	 */
	public static ArrayList<String> postMultiGCM(ArrayList<String> regList, String mainMessage) {
		ArrayList<String> responses = new ArrayList<String>();

		int listSize = regList.size();
		if (listSize < 999) {
			Content content = createContent(regList.get(0), mainMessage);
			for (int i = 1; i < regList.size(); i++) {
				content.addRegId(regList.get(i));
			}
			String response = POST2GCM.post(apiKey, content);
			responses.add(response);
		} else {
			int max = listSize/1000;
			for(int a=0;a<max;a++) {
				int count =1;
				Content content = createContent(regList.get(a*1000), mainMessage);
				while(count <= 999) {
					content.addRegId(regList.get((a*1000)+count));
					count++;
				}
				String response = POST2GCM.post(apiKey, content);
				responses.add(response);
			}
			Content content = createContent(regList.get(max*1000), mainMessage);
			for (int i = (max*1000)+1; i < regList.size(); i++) {
				content.addRegId(regList.get(i));
			}
			String response = POST2GCM.post(apiKey, content);
			responses.add(response);
		}

		return responses;
	}

	/*
	 * �Ѹ����� GCM ������ input regId = �޴� ������� regId
	 */
	public static String postSingleGCM(String regId, String mainMessage) {

		Content content = createContent(regId, mainMessage);
		System.out.println(regId);
		String response = POST2GCM.post(apiKey, content);

		return response;
	}

}
