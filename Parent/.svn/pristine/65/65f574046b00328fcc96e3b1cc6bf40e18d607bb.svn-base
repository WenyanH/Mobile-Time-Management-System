package com.tms.dao.core;

import java.util.List;

public interface IDao<E, K> {

	public abstract E save(E entity);

	public abstract void update(E entity);

	public abstract void remove(K key);

	public abstract E find(K key);

	public abstract List<E> findAll();

	public abstract E findUnique(final String queryString, final Hints hnts, final Object... values);

}
