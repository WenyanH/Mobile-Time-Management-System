package com.tms.dao.core;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.util.StringUtils;

public class AbsDao<E, K extends Serializable> implements IDao<E, K> {

	private Class<E> persistentClass;

	public AbsDao() {
		this.persistentClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	private SessionFactory sessionFactory;

	@Resource
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<E> findPaged(final String queryString, final Hints hnts, final Object... values) {

		if (StringUtils.isEmpty(queryString)) {
			return new ArrayList<E>();
		}

		Query query = sessionFactory.getCurrentSession().createQuery(queryString);

		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}

		if (hnts.getOffset() > 0) {
			query.setFirstResult(hnts.getOffset());
		}
		if (hnts.getLength() > 0) {
			query.setMaxResults(hnts.getLength());
		}

		return query.list();
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public E findUnique(final String queryString, final Hints hnts, final Object... values) {
		if (StringUtils.isEmpty(queryString)) {
			return null;
		}
		return uniqueResult(find(queryString, hnts, values));
	}
	
	private static <E> E uniqueResult(Collection<E> results) {
		if (results == null || results.isEmpty())
			return null;
		if (results.size() > 1)
			throw new IllegalArgumentException("the Collection size is larger than 1");
		return results.iterator().next();
	}
	
	public long findCount(String hql, Object... values) {

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		if (values != null) {
			for (int i = 0; i < values.length; i++)
				query.setParameter(i, values[i]);
		}

		List list = query.list();
		if (list != null && !list.isEmpty()) {
			return (Long) list.get(0);
		}

		return 0;

	}
	
	public List<E> find(final String queryString, final Hints hints, final Object... values) {

		if (StringUtils.isEmpty(queryString)) {
			return new ArrayList<E>();
		}

		Query query = sessionFactory.getCurrentSession().createQuery(queryString);

		if (values != null) {
			for (int i = 0; i < values.length; i++)
				query.setParameter(i, values[i]);
		}
		if (hints.getOffset() > 0)
			query.setFirstResult(hints.getOffset());
		if (hints.getLength() > 0)
			query.setMaxResults(hints.getLength());

		return query.list();

	}
	
	public List<E> findSql(final String queryString, final Hints hints) {

		if (StringUtils.isEmpty(queryString)) {
			return new ArrayList<E>();
		}

		Query query = sessionFactory.getCurrentSession().createQuery(queryString);

		
		if (hints.getOffset() > 0)
			query.setFirstResult(hints.getOffset());
		if (hints.getLength() > 0)
			query.setMaxResults(hints.getLength());

		return query.list();

	}

	@Override
	public E save(E entity) {
		getSession().save(entity);
		return entity;
	}

	
	@Override
	public void remove(K key) {
		getSession().delete((E) getSession().get(this.persistentClass, key));
	}
	
	
	@Override
	public void update(E entity) {
		getSession().merge(entity);
	}

	@Override
	public E find(K key) {
		return (E) getSession().get(this.persistentClass, key);
	}

	@Override
	public List<E> findAll() {
		return getSession().createQuery("FROM " + this.persistentClass.getSimpleName()).list();
	}

	
	public String sortHQL(String order, String sort) {
		
		StringBuffer hql = new StringBuffer();
		if (order!=null){
			hql.append(" order by ");
			hql.append(order);
			if (sort!=null)
				hql.append(" ");
				hql.append(sort);
		}
		
		return hql.toString();
	}

}
