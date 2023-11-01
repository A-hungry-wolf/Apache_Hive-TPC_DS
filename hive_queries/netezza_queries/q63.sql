
select  s_store_name
      ,sum(ss_net_profit)
 from store_sales
     ,date_dim
     ,store,
     (select ca_zip
     from (
      SELECT substr(ca_zip,1,5) ca_zip
      FROM customer_address
      WHERE substr(ca_zip,1,5) IN (
                          '31133','52908','97884','97644','93783','20034',
                          '17024','46840','91575','19744','58977',
                          '55184','73486','87417','73172','44184',
                          '65439','16179','38102','18301','17839',
                          '58830','89901','20746','59705','18569',
                          '47351','96216','46324','45262','85427',
                          '75357','20699','44728','45344','71644',
                          '87558','20832','52595','36428','35480',
                          '31386','39130','45235','32986','13224',
                          '85608','24749','63790','20579','57621',
                          '94618','49699','67828','71103','71402',
                          '64581','62381','60671','79654','36167',
                          '61101','10828','32675','20956','74689',
                          '97450','79993','53474','50476','52567',
                          '44703','58398','25520','78811','29036',
                          '91116','23410','91309','36777','47058',
                          '74899','62068','62589','99157','75796',
                          '37323','68877','43726','98320','35622',
                          '39877','64526','51296','81303','82304',
                          '97475','24357','78527','38751','25114',
                          '29734','36980','73650','42892','38110',
                          '25110','10424','89627','18764','88965',
                          '19932','15444','30861','35730','36501',
                          '58733','22550','11486','68560','88920',
                          '33414','35696','69800','18079','15809',
                          '20333','66160','13878','53902','53600',
                          '92398','23562','64634','81688','74397',
                          '47201','18820','19901','69959','45226',
                          '61358','20185','68627','89647','53003',
                          '61608','31301','39164','19531','25580',
                          '23064','47686','56593','87179','31918',
                          '58997','35290','68034','69979','49710',
                          '95816','30808','61399','30247','76693',
                          '60574','99827','77454','31142','34106',
                          '81614','74515','23618','68894','97613',
                          '54246','30317','35955','83123','15025',
                          '21508','43949','30895','51793','95391',
                          '46725','14174','94296','21462','75749',
                          '85076','31236','51114','43786','28067',
                          '39666','82673','44955','74685','85389',
                          '70798','13188','31602','61768','31941',
                          '28477','75171','11666','19407','97683',
                          '27968','40222','24549','56783','14687',
                          '42240','48867','60743','76142','83885',
                          '89917','14230','25482','39697','77931',
                          '28801','47826','18161','53924','21438',
                          '20453','50576','40464','43324','29470',
                          '18003','79785','59447','56713','59547',
                          '57921','94255','14438','53245','27165',
                          '44644','58122','42650','26172','50013',
                          '41100','55608','67439','67914','54784',
                          '68089','32330','87996','94180','13091',
                          '52406','19669','56683','74270','10206',
                          '99094','96381','82679','44204','89012',
                          '80897','42190','61636','73630','12727',
                          '88362','42771','55804','52520','16581',
                          '67793','56685','11734','91213','22939',
                          '41507','27682','62687','75524','18589',
                          '28073','34716','17168','69269','46413',
                          '28986','21537','18260','39808','68943',
                          '83368','65165','72648','99140','85957',
                          '14108','24194','49672','89137','11000',
                          '12413','20144','99799','61679','66884',
                          '73582','19898','76741','26731','93072',
                          '92467','50908','56391','65803','38412',
                          '17712','47457','16536','85150','13888',
                          '87099','36719','25000','63629','13505',
                          '49104','56990','81822','29354','28635',
                          '82170','37642','10324','35753','71087',
                          '87326','12037','72450','90992','13068',
                          '63305','75080','79055','23995','70973',
                          '12778','53878','40241','69284','12215',
                          '20345','98834','80990','55936','72521',
                          '20729','19530','53267','64542','63333',
                          '15412','47927','64410','69675','24812',
                          '52014','87377','91546','58463','97692',
                          '13763','56701','71759','32074','94470',
                          '64570','72046','88422','65036','61016',
                          '24349','76678','15934','97436','86914',
                          '83246','72486','55156','97779')
     intersect
      select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count(*) cnt
            FROM customer_address, customer
            WHERE ca_address_sk = c_current_addr_sk and
                  c_preferred_cust_flag='Y'
            group by ca_zip
            having count(*) > 10)A1)A2) V1
 where ss_store_sk = s_store_sk
  and ss_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

