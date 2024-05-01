

select * from Data$

--Demographic Analysis
select Gender, count(gender) from Data$
group by gender

  Select [Full Name], Age,
	case
	  WHEN Age < 35 THEN 'Young'
	  WHEN Age BETWEEN 36 AND 54 THEN 'Middle_age'
	 ELSE 'Senior'
	 End AS Age_catergory
from Data$;

select 
	Case
	When [Ethnicity] = 'Asian' then 'Asian'
	When [Ethnicity] = 'Black' then 'Black'
	When [Ethnicity] = 'Caucasian' then 'Caucasian'
	When [Ethnicity] = 'Latino' then 'Latino'
	Else ' Other'
	 End as Ethnic_Category ,
	 count(*) as Total_Employee
From Data$
 group by Case
	When Ethnicity = 'Asian' then 'Asian'
	When [Ethnicity] = 'Black' then 'Black'
	When [Ethnicity] = 'Caucasian' then 'Caucasian'
	When [Ethnicity] = 'Latino' then 'Latino'
	Else ' Other'
End 

--Salary Analysis

Select 
	[Full Name],
	[Annual Salary],
	Case
		When [Annual Salary] < 49000 then 'Low Salary Earners'
		When [Annual Salary] Between 60000 and 100000 then 'Mid Salary Earners'
		Else 'High Salary Earners'
  End AS Salary_category
From Data$
--Determine Avg. salary
select 
	[Job Title],
		avg(Case When [Annual Salary] < 49000 then [Annual Salary] Else 0 end) as low_salary,
		avg(Case When [Annual Salary] BETWEEN 55000 AND 100000 then [Annual Salary] Else 0 END) as Mid_salary,
		avg(case When [Annual Salary] > 100000 then [Annual Salary] else 0 end) as High_salary
From Data$
Group by [Job Title]


--Tenure Analysis
--determine tenure with company
select
	Case 
		when [Hire Date] between '2019-12-31' and '2022-02-25' then 'Less than 5 years'
		When [Hire Date] between '2014-012-31' and '2017-12-31' then '5 to 10 years'
		wHEN [Hire Date] >'1993-01-30' then 'More than 10 years'
		end as Tenure,
		count(*) as Total_Employee
From Data$
group by Case 
		when [Hire Date] between '2019-12-31' and '2022-02-25' then 'Less than 5 years'
		When [Hire Date] between '2014-012-31' and '2017-12-31' then '5 to 10 years'
		wHEN [Hire Date] >'1993-01-30' then 'More than 10 years'
end

--b.
select
[Full Name],[Hire Date],
	case 
		when [Hire Date] between '2019-12-31' and '2022-02-25' then 'Short'
		When [Hire Date] between '2014-012-31' and '2017-12-31' then 'Medium'
		wHEN [Hire Date] >'1993-01-30' then 'High'
end as Tenure_category
from Data$


--Departmental Analysis
select [Department],
	case
	when [Department] in ('IT','Engineering','Sales','Finance','Accounting','Marketing','Human Resources') then Avg([Age])
	else 'null'
	end as Avg_Age
	  From Data$
	  group by [Department];
	  --or
	  select [Department], avg(age) as Avg_Age
	  from Data$
	  group by [Department]
--b.
select 
	Department,
		avg(Case When [Annual Salary] < 49000 then [Annual Salary] Else 0 end) as Low,
		avg(Case When [Annual Salary] BETWEEN 55000 AND 100000 then [Annual Salary] Else 0 END) as Mid,
		avg(case When [Annual Salary] > 100000 then [Annual Salary] else 0 end) as High
From Data$
Group by Department
order by Department Asc;

--Performance Analysis
Select [Bonus %],
	Case 
	When [Bonus %] =0 then 'No Bonus'
	when [Bonus %] >=0.3 then 'High bonus'
	else 'low Bonus'
	End as Bonus_status,
	count(*) as Total_Employee 
from Data$
group by [Bonus %]
Order by [Bonus %] Asc;


select [Bonus %],
	avg(Case When [Bonus %] between 0 and 0.19 then [Bonus %] else 0 end) as Low_Bonus,
	avg(case when [Bonus %] >0.2 then [Bonus %] else 0 end) as Medium_Bonus,
	avg(case when [Bonus %] >0.3 then [Bonus %] else 0 end) as High_Bonus
From Data$
group by [Bonus %]
Order by [Bonus %]

--Geographic Analysis
Select [Country],
	case
	when [Country] in ('Brazil','United States','China') then Avg([Annual Salary])
	else 'null'
	end as Avg_Country_Salary
from Data$
group by [country]

select [city], count([Employee ID]) as Total_Employees,
	case
	when count([Employee ID])< 49 then 'low'
	when count([Employee ID])between 49 and 59 then 'Medium'
	else  'Large'
	End as Employee_count
from Data$
group by City  
order by Total_Employees desc;


--Exit Analysis
Select  
	[Full Name], [Exit Date], 
      CASE 
		when [Exit Date] is null then 'Exited'
	  else 'Active'
	End AS Employment_Status
from Data$

--b.
select
[Full Name],[Hire Date],[Exit Date],
	case
	when dateDiff(day,[Hire Date],GetDate()) <'1993' AND [Exit Date] Is null then 'still Active'
	when dateDiff(day,[Hire Date],[Exit Date]) < '2019' then 'less than 5 years'
	when dateDiff(day,[Hire Date],[Exit Date]) between '2014' AND '2017' then'5-10 years' 
	else 'more than 10 years'
	end as Tenure_category
from Data$



--Ethnicity and Age Analysis
select [Ethnicity], Age,
	case
    When [Ethnicity] = 'Asian' then 'Asian'
	When [Ethnicity] = 'Black' then 'Black'
	When [Ethnicity] = 'Caucasian' then 'Caucasian'
	When [Ethnicity] = 'Latino' then 'Latino'
	Else 'Other'
	 End as Ethnicity_Category,
Case 
	when Age <35 then 'Young'
	when Age between 35 and 50 then 'Mid_Age'
	else 'Senior'
	End as Age_Category,
	count(*) as Total_count
From Data$
group by [Ethnicity], Age


Select
	case
    When [Ethnicity] = 'Asian' then 'Asian'
	When [Ethnicity] = 'Black' then 'Black'
	When [Ethnicity] = 'Caucasian' then 'Caucasian'
	When [Ethnicity] = 'Latino' then 'Latino'
	Else ' Other'
	 End as Ethnicity_Category,
Case 
	when Age < 35 then 'Young'
	when Age between 35 and 50 then 'Mid_Age'
	else 'Senior'
	End as Age_Category,
	count(*) as Total_count,
	avg([Annual Salary]) as Avg_Salary,
	min([Annual Salary]) as Min_Salary,
	Max([Annual Salary]) as Max_Salary
From Data$
Group by case
    When [Ethnicity] = 'Asian' then 'Asian'
	When [Ethnicity] = 'Black' then 'Black'
	When [Ethnicity] = 'Caucasian' then 'Caucasian'
	When [Ethnicity] = 'Latino' then 'Latino'
	Else ' Other'
	 End,
Case 
	when Age <35 then 'Young'
	when Age between 35 and 50 then 'Mid_Age'
	else 'Senior'
	End
