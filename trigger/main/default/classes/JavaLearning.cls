public class JavaLearning {
	public static void trimSingleString()
    {
        String myFilePath = 'fdtlt88/main/salesforce/lightning/classes/JavaLearning.cls';
        System.debug(myFilePath);
        
        // Output = JavaLearning.cls
        
        List<String> myFilesList = myFilePath.split('/');
        System.debug(myFilesList);
        
        String fileName = myFilesList[myFilesList.size() - 1];
        System.debug(fileName);
    }
    
    public static void trimMultipleFiles()
    {
        List<String> myFiles = new List<String>{'fdtlt88/main/salesforce/lightning/classes/JavaLearning.cls', 'fdtlt88/groups/fdgroup.group', 'trigger/AccTrigger.trigger'};
        System.debug('Original Files - ' + myFiles);
            
        List<String> outputFiles = trimList(myFiles);
        System.debug('Output Results - ' + outputFiles);
    }
    
    private static List<String> trimList(List<String> myFiles)
    {
        List<String> outputFiles = new List<String>(); // EMPTY
        for (String files : myFiles)
        {
            List<String> myFilesList = files.split('/');
            outputFiles.add(myFilesList[myFilesList.size() - 1]);
        }
        
        return outputFiles;
    }
}