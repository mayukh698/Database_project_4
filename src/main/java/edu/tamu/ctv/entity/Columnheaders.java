package edu.tamu.ctv.entity;
// Generated Sep 7, 2015 3:40:07 PM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Columnheaders generated by hbm2java
 */
public class Columnheaders implements java.io.Serializable
{

	private Long id;
	private Columnheaders columnheaders;
	private Columntypes columntypes;
	private String code;
	private String name;
	private String notes;
	private Integer color;
	private Date registereddt;
	private Set<Columnheaders> columnheaderses = new HashSet<Columnheaders>(0);
	private Set<Components> componentses = new HashSet<Components>(0);

	public Columnheaders()
	{
	}

	public Columnheaders(Long id, Columnheaders columnheaders, Columntypes columntypes, String code, String name, Date registereddt)
	{
		this.id = id;
		this.columnheaders = columnheaders;
		this.columntypes = columntypes;
		this.code = code;
		this.name = name;
		this.registereddt = registereddt;
	}

	public Columnheaders(Long id, Columnheaders columnheaders, Columntypes columntypes, String code, String name, String notes, Integer color, Date registereddt, Set<Columnheaders> columnheaderses,
			Set<Components> componentses)
	{
		this.id = id;
		this.columnheaders = columnheaders;
		this.columntypes = columntypes;
		this.code = code;
		this.name = name;
		this.notes = notes;
		this.color = color;
		this.registereddt = registereddt;
		this.columnheaderses = columnheaderses;
		this.componentses = componentses;
	}

	public Long getId()
	{
		return this.id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public Columnheaders getColumnheaders()
	{
		return this.columnheaders;
	}

	public void setColumnheaders(Columnheaders columnheaders)
	{
		this.columnheaders = columnheaders;
	}

	public Columntypes getColumntypes()
	{
		return this.columntypes;
	}

	public void setColumntypes(Columntypes columntypes)
	{
		this.columntypes = columntypes;
	}

	public String getCode()
	{
		return this.code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getNotes()
	{
		return this.notes;
	}

	public void setNotes(String notes)
	{
		this.notes = notes;
	}

	public Integer getColor()
	{
		return this.color;
	}

	public void setColor(Integer color)
	{
		this.color = color;
	}

	public Date getRegistereddt()
	{
		return this.registereddt;
	}

	public void setRegistereddt(Date registereddt)
	{
		this.registereddt = registereddt;
	}

	public Set<Columnheaders> getColumnheaderses()
	{
		return this.columnheaderses;
	}

	public void setColumnheaderses(Set<Columnheaders> columnheaderses)
	{
		this.columnheaderses = columnheaderses;
	}

	public Set<Components> getComponentses()
	{
		return this.componentses;
	}

	public void setComponentses(Set<Components> componentses)
	{
		this.componentses = componentses;
	}

}
