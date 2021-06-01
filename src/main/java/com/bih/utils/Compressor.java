package com.bih.utils;


import java.io.*;

public class Compressor {
    public static boolean toMoveCompressor(String srcFold,String desFold){
        File srcFolder = new File(srcFold);
        //ԭʼ�ļ���
        String srcFloderName = srcFolder.getName();
        //Ҫ���Ƶ����ļ�
        File desFolder = new File(desFold,srcFloderName);
        //���Ҫ���Ƶ����ļ�û������ļ��У��ʹ���һ��
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
    //�����ļ���
    private static void copyFolder(File srcFolder, File desFolder) throws IOException {
        //����ԭʼ�ļ�������������ļ����ļ���
        System.out.println(srcFolder);
        File[] files = srcFolder.listFiles();
//        File[] files = {srcFolder};
        for (File srcFile : files) {
            //������ļ���
            if (srcFile.isDirectory()){
                //���µ��ļ����ڴ���һ����srcFile�ļ���ͬ���ļ��У�Ȼ���ٵݹ���ã��ж��ļ�������������Ȼ��������Ӧ����
                String srcFileName = srcFile.getName();
                File newFolder = new File(desFolder, srcFileName);
                if (!newFolder.exists()){
                    newFolder.mkdir();
                    copyFolder(srcFile,newFolder);
                }
                //������ļ�
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
            int len = 0;//��������
            while((len = fis.read(datas))!=-1)
            {
                fos.write(datas,0,len);
            }
            fis.close();//�ͷ���Դ
            fos.close();//�ͷ���Դ
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }


    public static  boolean DeleteFolder(String sPath) {

         boolean flag = false;
        File file = new File(sPath);
        // �ж�Ŀ¼���ļ��Ƿ����
        if (!file.exists()) {  // �����ڷ��� false
            return flag;
        } else {
            // �ж��Ƿ�Ϊ�ļ�
            if (file.isFile()) {  // Ϊ�ļ�ʱ����ɾ���ļ�����
                return deleteFile(sPath);
            } else {  // ΪĿ¼ʱ����ɾ��Ŀ¼����
                return deleteDirectory(sPath);
            }
        }
    }
    /**
     * ɾ�������ļ�
     * @param   sPath    ��ɾ���ļ����ļ���
     * @return �����ļ�ɾ���ɹ�����true�����򷵻�false
     */
    public static boolean deleteFile(String sPath) {
        boolean flag = false;
        File file = new File(sPath);
        // ·��Ϊ�ļ��Ҳ�Ϊ�������ɾ��
        if (file.isFile() && file.exists()) {
                System.out.println(file.delete());
            flag = true;
        }
        return flag;
    }
    /**
     * ɾ��Ŀ¼���ļ��У��Լ�Ŀ¼�µ��ļ�
     * @param   sPath ��ɾ��Ŀ¼���ļ�·��
     * @return  Ŀ¼ɾ���ɹ�����true�����򷵻�false
     */
    public static boolean deleteDirectory(String sPath) {
        //���sPath�����ļ��ָ�����β���Զ�����ļ��ָ���
        if (!sPath.endsWith(File.separator)) {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        //���dir��Ӧ���ļ������ڣ����߲���һ��Ŀ¼�����˳�
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        boolean flag = true;
        //ɾ���ļ����µ������ļ�(������Ŀ¼)
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            //ɾ�����ļ�
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath());
                if (!flag) break;
            } //ɾ����Ŀ¼
            else {
                flag = deleteDirectory(files[i].getAbsolutePath());
                if (!flag) break;
            }
        }
        if (!flag) return false;
        //ɾ����ǰĿ¼
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
