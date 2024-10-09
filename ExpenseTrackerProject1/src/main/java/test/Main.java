package test;

import java.util.ArrayList;

import com.expensetracker.bean.Bean;
import com.expensetracker.service.GetAllDataService;

public class Main {

	public static void main(String[] args) {
		try {
			GetAllDataService ob=new GetAllDataService();
			ArrayList<Bean> al=ob.showdata();
			for(Bean b:al) {
				System.out.println(b.getSlno()+" "+b.getAmount()+" "+b.getCategory()+" "+b.getInvestmentType()+" "+b.getTime());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
