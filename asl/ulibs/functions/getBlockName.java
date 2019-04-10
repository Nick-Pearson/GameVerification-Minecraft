package functions;

import jason.asSyntax.*;
import jason.asSemantics.*;

import java.io.*;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;

import org.json.*;

public class getBlockName extends DefaultInternalAction {
  Map<Integer, String> blockNames;

  public getBlockName() throws Exception
  {
	  blockNames = new HashMap<Integer, String>();

    File file = new File("items.json");
    FileInputStream fis = new FileInputStream(file);
    byte[] data = new byte[(int) file.length()];
    fis.read(data);
    fis.close();

    String str = new String(data, "UTF-8");
    JSONArray ja = new JSONArray(str);
    int len = ja.length();
    for(int i = 0; i < len; i++)
    {
      JSONObject jo = ja.getJSONObject(i);
      int id = jo.getInt("type");
      String name = jo.getString("text_type");

      if(blockNames.containsKey(id))
      {
        continue;
      }

      blockNames.put(id, name);
    }
  }

  public Object execute( TransitionSystem ts, Unifier un, Term[] args ) throws Exception
  {
    if (!args[0].isNumeric()) return false;

    int id = (int)((NumberTerm)args[0]).solve();

    Term outputArg = args[1];
    if (!outputArg.isString() && !outputArg.isVar())
        outputArg = new StringTermImpl(outputArg.toString());

    String outString = blockNames.getOrDefault(id, "unkown_block");
    System.out.println(outString);

    return un.unifies(new StringTermImpl(outString), outputArg);
  }
}
