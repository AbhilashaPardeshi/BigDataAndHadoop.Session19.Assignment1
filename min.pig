/** Load data from HBase**/
data = LOAD 'hbase://customer' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('details:*','-loadKey true') as (id:int,details:MAP[]);


record = FOREACH data GENERATE id,details#'name' AS name,details#'age' AS age;


/** Order data by age in ascending order**/
orderedData = ORDER record BY age; 


/** Get data with lowest age**/
limitedData = LIMIT orderedData 1;

/**Dump output on console**/
dump limitedData;
