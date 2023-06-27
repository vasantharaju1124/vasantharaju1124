`include "uvm_macros.svh"
import uvm_pkg::*;
class mon2 extends uvm_agent;
  `uvm_component_utils(mon2)
  function new (string name="mon2",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display($time,"B2 called");
  endfunction
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display($time,"c2 called");
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
   
   phase.raise_objection(this);
    #40;
    $display($time,"R2 called");
    phase.drop_objection(this);
  endtask
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display($time,"E2 called");
  endfunction
endclass
class mon1 extends uvm_agent;
  `uvm_component_utils(mon1)
  mon2 m_h2;
  function new (string name="mon1",uvm_component parent=null);
    super.new(name,parent);
   // m_h2=new();
  endfunction
  function void build_phase(uvm_phase phase);
  //m_h2=mon2::type_id::create("xtn2_h",this);//create method
    m_h2=new("xtn2_h",this);
    super.build_phase(phase);
    $display($time,"B1 called");
  endfunction
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    $display($time,"C1 called");
  endfunction
   task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
      #20;
     phase.raise_objection(this);
     $display($time,"R1 called");
     phase.drop_objection(this);
  endtask
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    $display($time,"E1 called");
  endfunction
endclass


module tb;
  
  mon1 m_h1;
  initial
    begin
     
      m_h1=new();
      run_test();//if we comment this linne whatwill be hpping.
