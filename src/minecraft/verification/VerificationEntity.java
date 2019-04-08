package verification;

import java.util.HashMap;
import java.util.Map;

public class VerificationEntity 
{
	public VerificationEntity()
	{
		boolCache = new HashMap<String, Boolean>();
		intCache = new HashMap<String, Integer>();
		
		proxy = VerificationLibProxy.get();
	}
	
	public void OnEntityCreated(String entityType) 
	{
		entityID = proxy.onEntitySpawned(entityType);
	}
	
	public void OnEntityDestroyed()
	{
		proxy.onEntityDestroyed(entityID);
	}
	
	public void UpdateProperty(String Name, boolean Value)
	{
		Boolean Cached = boolCache.get(Name);
		if(Cached != null && Cached.booleanValue() == Value) return;
		
		boolCache.put(Name, Value);
		proxy.boolPropertyChanged(entityID, Name, Value);
	}
	
	public void UpdateProperty(String Name, int Value)
	{
		Integer Cached = intCache.get(Name);
		if(Cached != null && Cached.intValue() == Value) return;
		
		intCache.put(Name, Value);
		proxy.intPropertyChanged(entityID, Name, Value);
	}
	
	private Map<String, Boolean> boolCache;
	private Map<String, Integer> intCache;
	private VerificationLibProxy proxy;
	private EntityID entityID;
}
