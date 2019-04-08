package verification;

public class VerificationLibProxy 
{
	static
	{
		// add the verification directory to the path
		String propertyKey = "java.library.path";
		String path = System.getProperty(propertyKey);
		
		System.load(path + "\\Verification\\VerificationRuntime.dll");
	}
	
	private static VerificationLibProxy instance;
	public static VerificationLibProxy get()
	{
		if(instance == null) instance = new VerificationLibProxy();
		return instance;
	}
	private VerificationLibProxy() {}

	
	native void initialise(String configPath);
	native void shutdown();
	
	native void startSession();
	native void endSession();
	
	native void sendFrameBoundry();
	
	public EntityID onEntitySpawned(String entityType) { return (EntityID)entitySpawned(entityType); }
	public void onEntityDestroyed(EntityID entityID) { entityDestroyed(entityID); }
	
	native Object entitySpawned(String entityType);
	native void entityDestroyed(Object entityID);

	public void intPropertyChanged(EntityID entityID, String property, int value) { propertyChanged_int(entityID, property, value); }
	public void boolPropertyChanged(EntityID entityID, String property, boolean value) { propertyChanged_bool(entityID, property, value); }
	
	native void propertyChanged_int(Object entityID, String property, int value);
	native void propertyChanged_bool(Object entityID, String property, boolean value);
	
	native void startDriving(String projectPath);
	native void executeActions();
	
	public native void destroyAgent(String agentName);
	public native void createAgent(String agentName, String aslFilepath);
	
	public native void updateBelief(String beliefStr);
}
