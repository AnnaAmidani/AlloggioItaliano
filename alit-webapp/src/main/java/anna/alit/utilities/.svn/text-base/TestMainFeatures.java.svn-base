package anna.alit.utilities;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class TestMainFeatures {

	public static void main(String[] args) {

		final String ONLINE = "O";
		final String HISTORY = "S";
		final String UNION = "A";

		String which_collection = "A";
		//AuthInfoDateExtraction item = new AuthInfoDateExtraction();

		Map params = new HashMap();
		params.put("pan", "pan");
		params.put("ndg", "ndg");
		params.put("mc_merch_id", "mmid");
		params.put("mc_merch_name", "mmn");
		params.put("date_req_between", "drb");
		params.put("datefrom", "2013-05-21");
		params.put("dateto", "2013-05-31");

		StringBuffer query = new StringBuffer();

		//Online archive prefix
		String WSC3LOGS_prefix = "WSC3LOGS_";
		//Historical archive prefix
		String WSC3LOGH_prefix = "WSC3LOGH_";


		// prepare a different query depending on which_collection has been chosen (O, S, A)
		if (StringUtils.equals(which_collection, ONLINE)) {
           query.append(getQueryOnlineText());
   		   query.append(getMoreWhereClauseParams(WSC3LOGS_prefix, params));
   		   System.out.println("ONLINE Query: "+ query);
		}
		else if (StringUtils.equals(which_collection, HISTORY)) {
	       query.append(getQueryHistoryText());
	       query.append(getMoreWhereClauseParams(WSC3LOGH_prefix, params));
   		   System.out.println("HISTORY Query: "+ query);
		}
		else if (StringUtils.equals(which_collection, UNION)) {
	           query.append(getQueryOnlineText());
	   		   query.append(getMoreWhereClauseParams(WSC3LOGS_prefix, params));
	   		   query.deleteCharAt(query.lastIndexOf(";"));
	   		   query.append(" UNION ALL ");
		       query.append(getQueryHistoryText());
		       query.append(getMoreWhereClauseParams(WSC3LOGH_prefix, params));
	   		   System.out.println("UNION Query: "+ query);
		}

		if (StringUtils.equals(which_collection, UNION)) {
			setQueryParams(params, 1);
		}
		else
		{
			setQueryParams(params, 0);
		}

	  System.out.println("end!");
	}


	private static String getQueryHistoryText() {
		StringBuffer queryWSC3LOGH = new StringBuffer("SELECT " +
				"WSC3LOGH_DATE_REQ," +
				"WSC3LOGH_PAN," +
				"WSC3LOGH_DATE_RESP," +
				"WSC3LOGH_NDG," +
				"WSC3LOGH_TOWER," +
				"WSC3LOGH_USER," +
				"WSC3LOGH_REASON_CODE," +
				"WSC3LOGH_ERROR_MESSAGE," +
				"WSC3LOGH_UC_REASON_CODE," +
				"WSC3LOGH_UC_ERROR_MESSAGE," +
				"WSC3LOGH_FUNCTION," +
				"WSC3LOGH_AUTH_TYPE," +
				"WSC3LOGH_LANGUAGE," +
				"WSC3LOGH_CUST_ID," +
				"WSC3LOGH_DYN_TEXT," +
				"WSC3LOGH_MC_BIN_ACQ," +
				"WSC3LOGH_MC_CNTRY," +
				"WSC3LOGH_MC_MERCH_ID," +
				"WSC3LOGH_MC_MERCH_NAME," +
				"WSC3LOGH_MC_CRCY_PUR," +
				"WSC3LOGH_MC_TMST_PUR," +
				"WSC3LOGH_MC_AMNT_PUR," +
				"WSC3LOGH_MC_CRCY_EXP," +
				"WSC3LOGH_MC_TRNX_ID," +
				"WSC3LOGH_MC_IP_CH," +
				"WSC3LOGH_MC_FP_CH," +
				"WSC3LOGH_ROUTINE_CALLED," +
				"WSC3LOGH_MC_MERCH_URL" +
				" FROM DB2C.WSC3LOGH" +
				" WHERE WSC3LOGH_DATE_REQ BETWEEN '2013-03-14-00.00.00.000000' AND '2013-03-22-23.59.59.999999'" +
				" AND WSC3LOGH_FUNCTION IN ('AUTHENTICATION_INFO', 'VERIFY_TOKEN') ");

				return queryWSC3LOGH.toString();
	}

	private static String getQueryOnlineText() {
		StringBuffer queryWSC3LOGS = new StringBuffer("" +
				"SELECT " +
				"WSC3LOGS_DATE_REQ, " +
				"WSC3LOGS_PAN," +
				"WSC3LOGS_DATE_RESP," +
				"WSC3LOGS_NDG," +
				"WSC3LOGS_TOWER," +
				"WSC3LOGS_USER," +
				"WSC3LOGS_REASON_CODE," +
				"WSC3LOGS_ERROR_MESSAGE," +
				"WSC3LOGS_UC_REASON_CODE," +
				"WSC3LOGS_UC_ERROR_MESSAGE," +
				"WSC3LOGS_FUNCTION," +
				"WSC3LOGS_AUTH_TYPE," +
				"WSC3LOGS_LANGUAGE," +
				"WSC3LOGS_CUST_ID," +
				"WSC3LOGS_DYN_TEXT," +
				"WSC3LOGS_MC_BIN_ACQ," +
				"WSC3LOGS_MC_CNTRY," +
				"WSC3LOGS_MC_MERCH_ID," +
				"WSC3LOGS_MC_MERCH_NAME," +
				"WSC3LOGS_MC_CRCY_PUR," +
				"WSC3LOGS_MC_TMST_PUR," +
				"WSC3LOGS_MC_AMNT_PUR," +
				"WSC3LOGS_MC_CRCY_EXP," +
				"WSC3LOGS_MC_TRNX_ID," +
				"WSC3LOGS_MC_IP_CH," +
				"WSC3LOGS_MC_FP_CH," +
				"WSC3LOGS_ROUTINE_CALLED," +
				"WSC3LOGS_MC_MERCH_URL" +
				" FROM DB2C.WSC3LOGS" +
				" WHERE  WSC3LOGS_DATE_REQ BETWEEN '2013-03-14-00.00.00.000000' AND '2013-03-22-23.59.59.999999'" +
				" AND WSC3LOGS_FUNCTION IN ('AUTHENTICATION_INFO', 'VERIFY_TOKEN')");
		return queryWSC3LOGS.toString();
	}

	private static String getMoreWhereClauseParams(String prefix, Map params) {

		StringBuffer whereClauseParams = new StringBuffer();
		String _AND_ = " AND ";

        String pan = (String) params.get("pan");
		if (StringUtils.isNotEmpty(pan)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" A."+ prefix +"_PAN = ?");
		}

        String ndg = (String) params.get("ndg");
		if (StringUtils.isNotEmpty(ndg)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" A."+ prefix +"_NDG = ?");
		}

        String mc_merch_id = (String) params.get("mc_merch_id");
		if (StringUtils.isNotEmpty(mc_merch_id)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" A."+ prefix +"_MC_MERCH_ID = ?");
		}

        String mc_merch_name = (String) params.get("mc_merch_name");
		if (StringUtils.isNotEmpty(mc_merch_name)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" upper(A."+ prefix +"_MC_MERCH_NAME) LIKE CONCAT(? , '%')");
		}

        String reason_code = (String) params.get("reason_code");
		if (StringUtils.isNotEmpty(reason_code)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" A."+ prefix +"_REASON_CODE = ? ");
		}

        String datefrom = (String) params.get("datefrom");
        String dateto = (String) params.get("dateto");
		if (StringUtils.isNotEmpty(datefrom) && StringUtils.isNotEmpty(dateto)) {
			whereClauseParams.append(_AND_);
			whereClauseParams.append(" A."+ prefix +"_DATE_REQ BETWEEN to_date('" + datefrom
					+ "-00.00.00.000000 "
					+ "','dd.mm.yyyy-hh24.mi.ss.nnnnnn ') AND to_date('"
					+ dateto + "-23.59.59.000000 "
					+ "','dd.mm.yyyy-hh24.mi.ss.nnnnnn ') ");
		}

		whereClauseParams.append(" ORDER BY A."+ prefix +"_DATE_REQ DESC WITH UR; ");

		return whereClauseParams.toString();
	}


	private static void setQueryParams(Map params, int repeat) {
		String pan = (String) params.get("pan");
		String ndg = (String) params.get("ndg");
		String mc_merch_id = (String) params.get("mc_merch_id");
		String mc_merch_name = (String) params.get("mc_merch_name");
		String reason_code = (String) params.get("reason_code");

		int i = 1;

		switch (repeat) {
		case 1:
			if (StringUtils.isNotEmpty(pan)) {
				i++;
			}
			if (StringUtils.isNotEmpty(ndg)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_id)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_name)) {
				i++;
			}
			if (StringUtils.isNotEmpty(reason_code)) {
				i++;
			}
			if (StringUtils.isNotEmpty(pan)) {
				i++;
			}
			if (StringUtils.isNotEmpty(ndg)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_id)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_name)) {
				i++;
			}
			if (StringUtils.isNotEmpty(reason_code)) {
				i++;
			}

			break;
		case 0:
			if (StringUtils.isNotEmpty(pan)) {
				i++;
			}
			if (StringUtils.isNotEmpty(ndg)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_id)) {
				i++;
			}
			if (StringUtils.isNotEmpty(mc_merch_name)) {
				i++;
			}
			if (StringUtils.isNotEmpty(reason_code)) {
				i++;
			}

			break;


		default:
			break;
		}
		System.out.println(i);
	}

}



