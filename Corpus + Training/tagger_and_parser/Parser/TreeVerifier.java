import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Stack;

/**
 * Created with IntelliJ IDEA.
 * User: Radzinzki
 * Date: 11/11/13
 * Time: 12:37 AM
 * To change this template use File | Settings | File Templates.
 */
public class TreeVerifier {
    public static void main (String[] args)
    {
        String outputFile = "data/output_1.txt";
        String trainFile = "data/train1.txt";
        if(args.length > 0)
        {
            outputFile = args[0];
            trainFile  = args[1];
        }
        List<List<String>> outputList = getTagListForFile(outputFile);
        //System.out.println('\n');
        List<List<String>> correctedList = getTagListForFile(trainFile);
        //System.out.println("\n" + outputList.size() + " | " + correctedList.size());
        int tp = 0, fp = 0, fn =0;
        for (int i = 0; i < outputList.size(); i++)
        {
            tp --; // to ignore the count for the root
            List<String> outputTreeList = outputList.get(i);
//            System.out.println(outputTreeList.toString());
            List<String> correctedTreeList = correctedList.get(i);
//            System.out.println(correctedTreeList.toString());
            int fnForTree = correctedTreeList.size();
            for (String node : outputTreeList)
            {
                //System.out.println(node);
                if (correctedTreeList.contains(node))
                {
                    tp ++;
                    fnForTree--;
                }
                else
                {
                    fp ++;
//                    fn ++;
                }
            }
            fn += fnForTree;
            System.out.println("TP: " + tp + " | FP: " + fp + " | FN: " + fn);
        }
        System.out.println();
        
        System.out.println("Summary\t");
        
        System.out.println("TP\t" + tp);
        System.out.println("FP\t" + fp);
        System.out.println("FN\t" + fn);
    }
    public static List<List<String>> getTagListForFile(String filename)
    {
        List <List<String>> tagsForFile = new ArrayList<List<String>>();
        try {
            Scanner sc = new Scanner (new File(filename));
            int wordPos = 0;
            String s;
            List<String> tagsForTree = new ArrayList<String>();
            Stack<String> stack = new Stack<String>();
            while (sc.hasNext())
            {
                s = sc.next();
                if (s.startsWith("("))
                {
                    stack.push(s.substring(1)+"("+ wordPos +",");
//                    System.out.print(stack.peek());
                }
                if (s.endsWith(")"))
                {
//                    System.out.print(s);
                    wordPos ++;
                    int count = 1 + s.lastIndexOf(")") - s.indexOf(")");
                    for (int i = 0; i < count; i ++)
                    {
                        String tag = stack.pop();
                        tagsForTree.add(tag + wordPos + ")");
                    }
                    if (stack.isEmpty())
                    {
                        wordPos = 0;
                        tagsForFile.add(tagsForTree);
//                        System.out.println("\n" + tagsForTree.toString());
                        tagsForTree = new ArrayList<String>();
                    }
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return tagsForFile;
    }
}
