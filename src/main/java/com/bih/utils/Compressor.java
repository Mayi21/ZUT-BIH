package com.bih.utils;


import java.io.*;

public class Compressor {
    public static boolean toMoveCompressor(String srcFold,String desFold){
        File srcFolder = new File(srcFold);
        //原始文件名
        String srcFloderName = srcFolder.getName();
        //要复制到的文件
        File desFolder = new File(desFold,srcFloderName);
        //如果要复制到的文件没有这个文件夹，就创建一个
        if (!desFolder.exists()){
            boolean mkdir = desFolder.mkdirs();
        }
        try {
            copyFolder(srcFolder,desFolder);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //复制文件夹
    private static void copyFolder(File srcFolder, File desFolder) throws IOException {
        //遍历原始文件夹里面的所有文件及文件夹
        System.out.println(srcFolder);
        File[] files = srcFolder.listFiles();
//        File[] files = {srcFolder};
        for (File srcFile : files) {
            //如果是文件夹
            if (srcFile.isDirectory()){
                //在新的文件夹内创建一个和srcFile文件夹同名文件夹，然后再递归调用，判断文件夹里面的情况，然后做出相应处理
                String srcFileName = srcFile.getName();
                File newFolder = new File(desFolder, srcFileName);
                if (!newFolder.exists()){
                    newFolder.mkdir();
                    copyFolder(srcFile,newFolder);
                }
                //如果是文件
            }else {
                String srcFileName = srcFile.getName();
                System.out.println(srcFileName);
                File desFile = new File(desFolder, srcFileName);
                copyFile(srcFile,desFile);
            }

        }
    }

    private static void copyFile (File srcFile, File desFile) throws IOException {
        try
        {
            FileInputStream fis = new FileInputStream(srcFile);
            FileOutputStream fos = new FileOutputStream(desFile);
            byte datas[] = new byte[1024*8];
            int len = 0;//创建长度
            while((len = fis.read(datas))!=-1)
            {
                fos.write(datas,0,len);
            }
            fis.close();//释放资源
            fos.close();//释放资源
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }


    public static  boolean DeleteFolder(String sPath) {

         boolean flag = false;
        File file = new File(sPath);
        // 判断目录或文件是否存在
        if (!file.exists()) {  // 不存在返回 false
            return flag;
        } else {
            // 判断是否为文件
            if (file.isFile()) {  // 为文件时调用删除文件方法
                return deleteFile(sPath);
            } else {  // 为目录时调用删除目录方法
                return deleteDirectory(sPath);
            }
        }
    }
    /**
     * 删除单个文件
     * @param   sPath    被删除文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
    public static boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
                System.out.println(file.delete());
            flag = true;
        }
        return flag;
    }
    /**
     * 删除目录（文件夹）以及目录下的文件
     * @param   sPath 被删除目录的文件路径
     * @return  目录删除成功返回true，否则返回false
     */
    public static boolean deleteDirectory(String sPath) {
        //如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!sPath.endsWith(File.separator)) {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        //如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        boolean flag = true;
        //删除文件夹下的所有文件(包括子目录)
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            //删除子文件
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath());
                if (!flag) break;
            } //删除子目录
            else {
                flag = deleteDirectory(files[i].getAbsolutePath());
                if (!flag) break;
            }
        }
        if (!flag) return false;
        //删除当前目录
        if (dirFile.delete()) {
            return true;
        } else {
            return false;
        }
    }
//@TOdo
    public static void main(String[] args) {
        Compressor.DeleteFolder("E:/DeskTop/222");
    }
}
