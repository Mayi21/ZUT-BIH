package com.bih.test;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TreeTest {
    public static void main(String[] args) {
        TestBinTree testBinTree = new TestBinTree();
        Scanner input=new Scanner(System.in);
        int i = input.nextInt();
        if (i<=0){
            System.out.println("N");
            System.exit(1);
        }
        if (i>12){
            System.out.println("O");
            System.exit(1);
        }
        int b=1;
        for (int a=0;a<i;a++){
            b=b*2;
        }
        b--;
        char[] arr = new char[b];
        for (int c= 0;c<b;c++){
            if (c%2==0){
                arr[c] = 'R';
            }else {
                arr[c] = 'G';
            }
        }
        testBinTree.midTrival(testBinTree.initBinTree(arr));
    }
}
        class TestBinTree {
            /**
             * 将一个arry数组构建成一个完全二叉树
             * @param arr 需要构建的数组
             * @return 二叉树的根节点
             */
            public Node initBinTree(char[] arr) {
                if(arr.length == 1) {
                    return new Node(arr[0]);
                }
                List<Node> nodeList = new ArrayList<>();
                for(int i = 0; i < arr.length; i++) {
                    nodeList.add(new Node(arr[i]));
                }
                int temp = 0;
                while(temp <= (arr.length - 2) / 2) {
                    if(2 * temp + 1 < arr.length) {
                        nodeList.get(temp).leftchild = nodeList.get(2 * temp + 1);
                    }
                    if(2 * temp + 2 < arr.length) {
                        nodeList.get(temp).rightchild = nodeList.get(2 * temp + 2);
                        temp++;
                    }
                }
                return nodeList.get(0);
            }
            public void midTrival(Node root) {
                if(root == null) {
                    return;
                }
                midTrival(root.leftchild);
                System.out.print(root.data+"");
                midTrival(root.rightchild);
            }
    }
    class Node {
        public Node leftchild;
        public Node rightchild;
        public char data;

        public Node(char data) {
            this.data = data;
        }
    }
