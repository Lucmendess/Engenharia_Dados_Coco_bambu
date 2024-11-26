CREATE TABLE guest_checks (
    guest_check_id BIGINT PRIMARY KEY,            
    chk_num INT,                                  
    opn_bus_dt DATE,                              
    opn_utc TIMESTAMP,                            
    opn_lcl TIMESTAMP,                            
    clsd_bus_dt DATE,                             
    clsd_utc TIMESTAMP,                          
    clsd_lcl TIMESTAMP,                           
    last_trans_utc TIMESTAMP,                     
    last_trans_lcl TIMESTAMP,                     
    last_updated_utc TIMESTAMP,                   
    last_updated_lcl TIMESTAMP,                   
    clsd_flag BOOLEAN,                            
    gst_cnt INT,                                  
    sub_ttl DECIMAL(10, 2),                       
    non_txbl_sls_ttl DECIMAL(10, 2),              
    chk_ttl DECIMAL(10, 2),                       
    dsc_ttl DECIMAL(10, 2),                       
    pay_ttl DECIMAL(10, 2),                       
    bal_due_ttl DECIMAL(10, 2),                   
    rvc_num INT,                                  
    ot_num INT,                                   
    oc_num INT,                                   
    tbl_num INT,                                  
    tbl_name VARCHAR(50),                         
    emp_num INT,                                  
    num_srvc_rd INT,                              
    num_chk_prntd INT                             
);

REATE TABLE taxes (
    tax_num INT PRIMARY KEY,                      
    guest_check_id BIGINT,                        
    txbl_sls_ttl DECIMAL(10, 2),                  
    tax_coll_ttl DECIMAL(10, 2),                  
    tax_rate DECIMAL(5, 2),                       
    type INT,                                    
    FOREIGN KEY (guest_check_id) REFERENCES guest_checks(guest_check_id)
);

CREATE TABLE detail_lines (
    guest_check_line_item_id BIGINT PRIMARY KEY,  
    guest_check_id BIGINT,                        
    line_num INT,                                 
    detail_utc TIMESTAMP,                         
    detail_lcl TIMESTAMP,                         
    last_update_utc TIMESTAMP,                    
    last_update_lcl TIMESTAMP,                    
    bus_dt DATE,                                  
    ws_num INT,                                   
    dsp_ttl DECIMAL(10, 2),                       
    dsp_qty INT,                                  
    agg_ttl DECIMAL(10, 2),                       
    agg_qty INT,                                 
    chk_emp_id INT,                               
    svc_rnd_num INT,                              
    seat_num INT,                                 
    menu_item_id INT,                             
    FOREIGN KEY (guest_check_id) REFERENCES guest_checks(guest_check_id)
);

