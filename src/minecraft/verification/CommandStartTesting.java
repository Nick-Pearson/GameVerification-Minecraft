package verification;

import net.minecraft.command.CommandBase;
import net.minecraft.command.CommandException;
import net.minecraft.command.ICommandSender;
import net.minecraft.server.MinecraftServer;

public class CommandStartTesting extends CommandBase 
{
	@Override
	public String getCommandName() 
	{
		return "test";
	}

	@Override
	public String getCommandUsage(ICommandSender sender) 
	{
		return "";
	}

	@Override
	public void execute(MinecraftServer server, ICommandSender sender, String[] args) throws CommandException 
	{
		VerificationLibProxy proxy = VerificationLibProxy.get();
		proxy.updateBelief("start");
	}

}
