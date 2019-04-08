package verification;

import net.minecraft.client.settings.KeyBinding;

public class VerificationKeyBind extends KeyBinding 
{
	public VerificationKeyBind(String description, int keyCode, String category)
	{
		super(description, keyCode, category);
		
	}
	
	/**
     * Returns true if the key is pressed (used for continuous querying). Should be used in tickers.
     */
	@Override
    public boolean isKeyDown()
    {
        return true;
    }

    /**
     * Returns true on the initial key press. For continuous querying use {@link isKeyDown()}. Should be used in key
     * events.
     */
	@Override
    public boolean isPressed()
    {
        return false;
    }
}
