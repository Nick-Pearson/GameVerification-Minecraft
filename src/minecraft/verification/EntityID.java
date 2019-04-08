package verification;

public final class EntityID
{
	private EntityID(int inType, int inIdx)
	{
		this.EntityType = inType;
		this.EntityIdx = inIdx;
	}
	
	public int EntityType;
	public int EntityIdx;
}
