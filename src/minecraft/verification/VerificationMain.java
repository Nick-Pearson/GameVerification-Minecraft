package verification;

import java.nio.file.Path;
import java.nio.file.Paths;

import net.minecraft.client.Minecraft;
import net.minecraft.client.settings.GameSettings;

public class VerificationMain 
{

	VerificationLibProxy proxy;
	
	public VerificationMain()
	{
		proxy = VerificationLibProxy.get();
       System.out.println("Working Directory = " +
               System.getProperty("user.dir"));
		proxy.initialise("../verification.conf");
	}

	@Override
	protected void finalize() throws Throwable 
	{
		proxy.shutdown();
		proxy = null;
		
		super.finalize();
	}
	
	
	public VerificationLibProxy getProxy()
	{
		return proxy;
	}
	
	public void onGameStart()
	{
		proxy.startSession();
		
		Path p = Paths.get(System.getProperty("user.dir"));
		p = p.resolve(Paths.get("..", "asl", "minecraft.mas2j"));
				
		proxy.startDriving(p.toString());
	}
	
	public void onGameEnd()
	{
		proxy.endSession();
	}
	
	public void tick()
	{
		proxy.sendFrameBoundry();
		proxy.executeActions();
	}
	
	protected void replaceKeybindings()
	{
		Minecraft mc = Minecraft.getMinecraft();
		GameSettings settings = mc.gameSettings;
		
		settings.keyBindForward = new VerificationKeyBind(
				settings.keyBindForward.getKeyDescription(),
				settings.keyBindForward.getKeyCode(),
				settings.keyBindForward.getKeyCategory());
	}
}
