package cmd.thread;

public class MainThread{

	public static void main(String sit_id) throws InterruptedException{
		
		new ThreadOne(sit_id).start();
		
	}
	
}
