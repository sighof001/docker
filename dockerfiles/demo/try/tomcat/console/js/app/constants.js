var fileCount=8;
var fileSize=4096000;
var const_rate_type_gd = '1';//利率类型:固定
var const_rate_type_fd = '2';//利率类型:浮动
var const_rate_type_zy = '3';//利率类型:自由报价
var const_payPrincipalFrequency_specific='N';//还本频率:特定日期
var const_payPrincipalFrequency_schedule='P';//还本频率:进度
var const_payPrincipalFrequency_due='O';//还本频率:到期

var const_payInterestFrequency_specific='N';//计息频率:特定日期
var const_payInterestFrequency_due='O';//计息频率:到期

var const_pay_rule_qxrxh = 'qxrxh';//付息生成规则:起息日向后
var const_pay_rule_dqrxq = 'dqrxq';//付息生成规则:到期日向前
var const_pay_rule_scfxr = 'scfxr';//付息生成规则:首次付息日

var const_op_add = 'add';
var const_op_update = 'update';
var const_op_view = 'view';//流程代办页面查看
var const_op_viewList = 'viewList';//列表页面查看
var const_op_viewNew='viewNew';//消息界面查看

var const_op_midDue='midDue';//中间付息
var const_op_lastDue='lastDue';//到期付本息
/**value:审核状态:未提交*/
var const_hs_status_init = "0";
/**value:审核状态:审核中*/
var const_hs_status_in_sh = "1";
/**value:审核状态:审核通过(未记账)*/
var const_hs_status_shtg = "2";
/**value:审核状态:审核拒绝*/
var const_hs_status_shjj = "3";
/**value:审核状态:已记账*/
var const_hs_status_yjz = "4";
/**value:审核状态:审核通过*/
var const_hs_status_tg = "5";
/**value:审核状态:冲正*/
var const_hs_status_cz = "9";

/**保存状态:暂存*/
var const_save_status_temp = "1";
/**保存状态:保存*/
var const_save_status_saved = "2";

/**保存操作状态：保存并提交审核**/
var const_save_opear_status_save_submit = "1";
/**保存操作状态：验证并保存**/
var const_save_opear_status_check_save = "2";
/**保存操作状态：暂存**/
var const_save_opear_status_save = "3";

/**授信占用方类型:交易对手*/
var const_credit_type_counter = "1";
/**授信占用方类型:融资人*/
var const_credit_type_financier = "2";
/**授信占用方类型:客户*/
var const_credit_type_client = "3";

/********************** 工作流流程定义Key " processDefinitionKey " 可用于启动流程 start ***********************/

//到期还本息" 流程定义Key
var pro_def_zdyzc_dqhbx = "FBS8541T";


/********************** 工作流流程定义Key " processDefinitionKey " 可用于启动流程 end ***********************/
/********目的是区分各个流程实例，(工作流流程实例id)表名配置，不一定用表名 " tableName " 可用于启动流程时设置流程变量 start **************/

/**自定义资产交易录入-分部" 流程实例名称**/
var pro_name_zdyzc_jylr= "FBS8572TProcess";
/**自定义资产交易录入-总部" 流程实例名称**/
var pro_name_zdyzc_jylr_zb= "FBS8562TProcess";
/**自定义资产到期还本息" 流程实例名称**/
var pro_name_zdyzc_dqhbx= "FBS8541TProcess";
/**自定义资产卖出-分部" 流程实例名称**/
var pro_name_zdyzc_mc= "FBS8674TProcess";
/**自定义资产卖出-总部" 流程实例名称**/
var pro_name_zdyzc_mc_zb= "FBS8675TProcess";
/**自定义资产中间还本-分部" 流程实例名称**/
var pro_name_zdyzc_zjhb= "FBS8543TProcess";
/**自定义资产中间还本-总部" 流程实例名称**/
var pro_name_zdyzc_zjhb_zb= "FBS8544TProcess";
/**自定义资产利率维护-分部" 流程实例名称**/
var pro_name_zdyzc_llwh= "FBS8682TProcess";
/**自定义资产利率维护-总部" 流程实例名称**/
var pro_name_zdyzc_llwh_zb= "FBS8683TProcess";
/**自定义资产计息计划维护-分部" 流程实例名称**/
var pro_name_zdyzc_jxjhwh= "FBS8684TProcess";
/**自定义资产计息计划维护-总部" 流程实例名称**/
var pro_name_zdyzc_jxjhwh_zb= "FBS8685TProcess";	
/**自定义资产计息管理-分部" 流程实例名称**/
var pro_name_zdyzc_jxgl= "FBS8676TProcess";
/**自定义资产计息管理-总部" 流程实例名称**/
var pro_name_zdyzc_jxgl_zb= "FBS8677TProcess";
/**自定义资产额外收益-分部" 流程实例名称**/
var pro_name_zdyzc_ewsy= "FBS8678TProcess";
/**自定义资产额外收益-总部" 流程实例名称**/
var pro_name_zdyzc_ewsy_zb= "FBS8679TProcess";

/*************************存放同业流程实例开始***********************/
/**"存放同业交易录入分部" 流程实例*/
var pro_name_cfty_jylr = "FBS7508TProcess";
/**"存放同业交易录入总部" 流程实例*/
var pro_name_cfty_jylr_zb = "FBS7507TProcess";
/**"存放同业中间收息管理分部" 流程实例*/
var pro_name_cfty_zjsx = "FBS7519TProcess";
/**"存放同业中间收息管理总部" 流程实例*/
var pro_name_cfty_zjsx_zb = "FBS7518TProcess";
/**"存放同业到期还本收息管理总部" 流程实例*/
var pro_name_cfty_dqhbsx = "FBS7521TProcess";
/**"存放同业到期还本收息管理总部" 流程实例*/
var pro_name_cfty_dqhbsx_zb = "FBS7520TProcess";
/*************************存放同业流程实例结束**********************/

/*************************同业借款流程实例开始***********************/
/**"同业借款交易录入分部" 流程实例*/
var pro_name_tyjk_jylr = "FBS8158TProcess";
/**"同业借款交易录入总部" 流程实例*/
var pro_name_tyjk_jylr_zb = "FBS8157TProcess";
/**"同业借款中间收息管理总部" 流程实例*/
var pro_name_tyjk_zjsx_zb = "FBS8205TProcess";
/**"同业借款中间收息管理分部" 流程实例*/
var pro_name_tyjk_zjsx = "FBS8206TProcess";
/**"同业借款到期还本收息管理总部" 流程实例*/
var pro_name_tyjk_dqhbsx_zb = "FBS8207TProcess";
/**"同业借款到期还本收息管理分部" 流程实例*/
var pro_name_tyjk_dqhbsx = "FBS8208TProcess";
/*************************同业借款流程实例结束***********************/
/********目的是区分各个流程实例，(工作流流程实例id)表名配置，不一定用表名 " tableName " 可用于启动流程时设置流程变量 end **************/

/**付息管理流程启动区分中间付息与到期还本息配置*/
/*"到期还本息（付息管理）"*/
var const_fx_dqhbx= "1";

/**
 * 流程节点连线定义（同意和驳回）
 */
/*同意*/
var const_wf_define_pz= "批准";
/*驳回*/
var const_wf_define_bh = "驳回";

/**
 * 工作流流程节点前中后台定义
 */
/**同业银行部(前台)**/
var const_wf_define_Department_tyrhb = "theSameTradeBank";
/**风险管理部(中台)**/
var const_wf_define_Department_fxglb = "riskManagementDepartment";
/**营运管理部(后台)**/
var const_wf_define_Department_ryglb = "operateManagementDepartment";

var const_withdrawalFlag_all = '1';
var const_withdrawalFlag_part = '2';

//业务流程相关表标识
/**同业存放*/
var const_workflow_related_tycf_identify="1";
/**同业存放利率管理*/
var const_workflow_related_tycfllgl_identify="2";
/**同业存放付息计划维护-编辑*/
var const_workflow_related_tycffxjhwh_identify_1="3";
/**同业存放付息计划维护-审核*/
var const_workflow_related_tycffxjhwh_identify_2="4";
/**同业存放付息管理*/
var const_workflow_related_tycffxgl_identify="5";

//付息状态
/**未付息*/
var const_pay_status_no="1";
/**已付息*/
var const_pay_status_ok="2";

/**自定义资产最终资产字段类型，1:文本框,2:下拉框*/
var const_asset_type_input_type_1="1";
/**自定义资产最终资产字段类型，1:文本框,2:下拉框*/
var const_asset_type_input_type_2="2";	