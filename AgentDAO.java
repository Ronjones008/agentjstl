package com.infinite.hidagentjsp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class AgentDAO {
	
	SessionFactory sessionFactory;
	Session session;
	
	
	public String insertAgent(Agent agent){
		sessionFactory = SessionHelper.getConnection();
		session = sessionFactory.openSession();
		Transaction trans = session.beginTransaction();
		session.save(agent);
		trans.commit();
		return "Record was inserted";
	}
	
	public List<Agent> showAgent(){
		
		sessionFactory = SessionHelper.getConnection();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Agent");
		List<Agent> agentlist = query.list();
		return agentlist;
	}
	
	public Agent searchAgent(String agentId){
		sessionFactory = SessionHelper.getConnection();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Agent where AgentId="+agentId);
		List<Agent> agentlist = query.list();
		if(agentlist.size()==1){
			return agentlist.get(0);
		}
		return null;	
	}
	
	public String deleteAgent(String agentId){
		sessionFactory = SessionHelper.getConnection();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Agent where agentId="+agentId);
		List<Agent> agentlist = query.list();
		if(agentlist.size()==1){
			Transaction trans = session.beginTransaction();
			session.delete(agentlist.get(0));
			trans.commit();
			return "Record deleted...";
		}
		return "no Record is found..";
	}
	
	public String updateAgent(Agent agent){
		Agent agentNew = searchAgent((agentNew.getAgentId()));
		sessionFactory = SessionHelper.getConnection();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Agent where agentId="+agent.getAgentId());
		List<Agent> agentlist = query.list();
		session.close();
		if(agentlist.size()==1){
		    session = sessionFactory.openSession();
			Transaction trans = session.beginTransaction();
			session.saveOrUpdate(agent);
			trans.commit();
			return "Record Updated";
		}
		return "No Record is Found";
	}
}
