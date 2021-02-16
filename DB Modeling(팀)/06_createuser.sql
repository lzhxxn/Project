drop user FLIGHT CASCADE;
create user FLIGHT identified by JAVA;
grant CONNECT, RESOURCE to FLIGHT;
conn FLIGHT/JAVA;