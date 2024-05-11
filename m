Return-Path: <linux-kbuild+bounces-1829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAFA8C348C
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE4F1F21D45
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B639B24B26;
	Sat, 11 May 2024 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KnfxhLDr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xwvMVP3H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1139A1F5F6;
	Sat, 11 May 2024 22:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467394; cv=fail; b=HAiDxfuHRqMzzJ88f2Qdl46zwryzdruJA9Tt8do9rj0X9vol41IjK/9uEuWPAGUxYbo6pIFUxSHkCk6jGotlbbDzOvLEpyY2N2nP+mBDOIoslr0xTTrMRVSM5+ZtWaICL/XBqOljgm6+qIPTj4VQNe1JQbtaDvffUr2sIMz3KVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467394; c=relaxed/simple;
	bh=w25XWH4uVOaHi9cPWWtoshai7ZlQnKzdqlLFYnl/2oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jG7K7FNYJj+28ggkzBOLNupPHbdr60rlzDaEXjYuYk6LYxTrWlRsiPGx4t/UxSo78gmRiITmIsl5KfYlkACPrQ51lxZXDEtYv/+zQ/9kQRiU0UukESSAN/ePq6pfnIFxNwVGqgaSsPBuoUDh8IJZhRzxUVkBfldgVSCeCERXhsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KnfxhLDr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xwvMVP3H; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMVvJr028246;
	Sat, 11 May 2024 22:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=R9h/Myr9EnGDUVmUjl0iFjhTIfEaG2vBvC4y2xxuKFQ=;
 b=KnfxhLDrtGDPQdJWaUSpjNliE500xrrE63Qwqntkr2e08jpttctDCCmJdv8wKrPLp7Ye
 XcT97W0n3UZ+Y4VROOruyh3MROtVi3XjSXqnTyspf/3jdLo0UlvZA0BnzQjkS8mjKOBn
 s5YbrHAQgLKMn6XsrsWvjuzwnhpCwC/0foDIsQWVTtl7Cct0Rs8Ea+Q4f8rwu3YQMP8p
 IyORXcMxV9OWHg5F2dbswL1MUDi+dYW6SVAG8XXIKODnDuWfLMXxs0cele6GNUgFOnaV
 TvBwkZEoC5uETWA66wWmeXre3qtijTRoAPD2W0slSM+A6/xqItNwLlaEFgHd5AnEqycE 6A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2hhu805e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:43:06 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BL2925022375;
	Sat, 11 May 2024 22:43:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44jej6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8lfI5vFpvZ1IHMkpgI++1c0ghTVCTYyv7UsFEHOxYFd8kv0x3b62adQEdz5vaBcfwPbv+F/n+ZWzXCW4Xkb8dSXXGqdXMjUUot4mFlj1Nn7AA4PqDK6tBPFiLWA1sLtiRvA8QRTRTFw3LjFOHJ5G2qsrHc/bNhqTZ7CsezzdMeFOVcVAiJVy22fYn19eJ5t/qWZYtnrcdsj4PV1BsZVoWUkuFIGYihqhy42qYHGL2jPgcYydqr8HDL17abR0/oZZDBtQLI/FIS0CSQ1RbcAQTxXc60Ny0tooANdjqwSFR/KOXdI99B2039oK4QaWXmOyTxDWGGSepeqhXkNwI9Dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9h/Myr9EnGDUVmUjl0iFjhTIfEaG2vBvC4y2xxuKFQ=;
 b=fm2kviuQHGrf5kJG08NOXUDD7p9cYSZwIyzbSVQtWy94QDpiekCYgjXyA6ZNxTQdhS1AZWKmwCNJkrhUZZWF/ZUqZbOrX2S57BN9qeVbH8bU3IHE/FLcMMB+dgk0mTAg2w5kXNlpziVVR4qxZBCEr+wec8j39tvsGnLGDolWyudBcDQFq6K2XSbR6TuEMNLSrIYxGFjA2QASdZ7h9OX8AVx5y3QqnyA7E76rWyIL8wI1teblRr96ziqwL/GfLVExJc1nkYv1Pwz4H78LW0kZMFi9GRUiDNr1s7YhhCW/JzUjhwAL3OAToj9o9AtnfqwoF+VIT7CtxPeK7xXbT1XPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9h/Myr9EnGDUVmUjl0iFjhTIfEaG2vBvC4y2xxuKFQ=;
 b=xwvMVP3HIM5uq/gPWaBAdJVoD5CF+KceR6mINEEP4yOC20fw98b4gbsyU6F9BEMJTiircqX4TdbqYEHPWXYDFjaq11Ezt1nCGiblhGbTmn4UG3KQ9sjnF2P8mrZHzFiunonPuP6JWpwDiIpqmvCm6IxL92QftkO3l0JV8FH1+vw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:43:03 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:43:03 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 3/6] kbuild: generate a linker map for vmlinux.o
Date: Sat, 11 May 2024 18:40:32 -0400
Message-ID: <20240511224035.27775-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:208:234::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: dbebf08e-f2bb-4d76-c9e5-08dc720bb7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TARvOV/z1sNv+LZXApKeML94g2S2wODxCv9E7/7e7BayB1lm+gUPwfWPmEAE?=
 =?us-ascii?Q?m1gh7u2F9O0vh4leMzuv9WGYUCOCNBCkgZ5mCknl+poH3VwsQp+RO/nYGDPx?=
 =?us-ascii?Q?SKJZrSKr4I5IQyA3Yc80mPPA1ZZOVoNek1eZhYHk0W6nalZzH64ZRTFsupOM?=
 =?us-ascii?Q?FQPJJ/ib9MpLf9EcNkBr0lZMAVyNeeycyarPkpg3csaHmze9xBgarDIxUbDN?=
 =?us-ascii?Q?nt/WkwAJTgMtrRJ1pdRPRL45Gg1HPpcZEqPtEzYaSnvB3wytqyMbgefiE8qD?=
 =?us-ascii?Q?TBi9usTsB+Wm9s7Q4SW9PONlLw6FCchMj/azGiq8+0WlK1jeZBUTwPVIstrf?=
 =?us-ascii?Q?W67EO8EfGuJiKthBaSHMQHZ+T2qVOily7x66ZKX4q0tZuobyEBf3pnoXgxj8?=
 =?us-ascii?Q?rZMbKEdfzMjWeeUeUsx3Jm7i4yGUpEz4+SNHWpFg+VPSc9RvF02AhVtXcrZq?=
 =?us-ascii?Q?XNzVlSSohTqwERu/6yXRelnL3JZ65UjGo+i6kadOG85AlQSbzAKAiHK6cv8c?=
 =?us-ascii?Q?XHgPk/dvTzuREQOKIZlpiW8LlDqQgREx5lp0Rrh+d2DadM1hlMnPNwhXktWT?=
 =?us-ascii?Q?f4gwgm7YT4oVmWqF+YmIZmcPoLl+gEWlZRgA3GyEBZ/57NWAn+h1zWwGBegN?=
 =?us-ascii?Q?x8P1ofaaeOUeX6xLC8bkBrdj5bpTiK0Me0WG+wy9yFBMjG+OBgz2yF1vMu1y?=
 =?us-ascii?Q?D+r4Lpu/Ji7vjhx7Rg3s4QYlH5Zs456YNjJzwhQ87YsHhakIXZAttLxqLALv?=
 =?us-ascii?Q?km5kdvFwFBUdCT84VFzvnZn0SoLFR8CVpPVvVACMKFJd4o3ouXwFQeFJO4BX?=
 =?us-ascii?Q?8s1wq9L4RZWzxfFeDUHx+ardrvVROJA6FDUqGKP4sTlUmW51DdgTZdKQ8oxB?=
 =?us-ascii?Q?UeeMKbdn7OEE/xITda/mDLE3NrOsBwAKm/I8IFqlU8RAPUsSu9Ty9eU0ByaJ?=
 =?us-ascii?Q?0ooeeOt1WSmxcOIG+N175BqrV1JUEeXFEYkOUiHx+bucN7An7KAPKak6yME3?=
 =?us-ascii?Q?TwIH+zg/x3dzxJNCh2htpXbOEWAg/+wBdWMM4xLWe2IYs7E8LrYVvjVNnrFW?=
 =?us-ascii?Q?Hzgp5iBdLTxwHoeHcFOAtl5WqGfMTtsbdNCAYYegStAJw2Kue2/cltzNGqI0?=
 =?us-ascii?Q?jZ0xUoccS1p6IiBbgFtmDz21jzWQ4DuXeMQyAbVdGRvVx8NWHdND/kUtNMxe?=
 =?us-ascii?Q?xobDaSF+89LjV5P3QwiEskw7TQXHHDsc2mocEEfDHbwCy//Cr3tiR1pWg/Ba?=
 =?us-ascii?Q?A3Ymu8IKsYAUkUQc435eRd52wqQZDiN/kVNaO2C7UQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nd+JMlccDpTEKlDpy577yqOn+o+cB7a/mYCS8LbknGROg7f4P3WtJC5tTtWD?=
 =?us-ascii?Q?6fqJBOVb9YbzFTeIB2vqukb+iZ4sejMbFvNZqUGlInXo2aadUwdHGR5y8j8g?=
 =?us-ascii?Q?91dRc/rI6qvJfvXFD+DFU9rYCO0ilEsdOh8tGPv/pL8oW664AIQhCKA6H7+Y?=
 =?us-ascii?Q?iY6LLJu7FIn9Ycn/O4XxicfI+E/O3zjzKpaTl+hYpdTjZ5fGCxpsBr/jvaCk?=
 =?us-ascii?Q?aiYIOyoWPSukVKkYI5Me5ZUoeoxQBp1IhwidVSaEh3YqHM9weMBVHsh/WPmo?=
 =?us-ascii?Q?PFNK3p2vJfxb3BAVARhYa+2N7wPEburFOZJJAk/0FA1AwpcEowkUFeelqQ0J?=
 =?us-ascii?Q?Ey/VtCT9pGh7W+C5+V5xs5eQOu4r2RE275mqktXPf2i62RpGwcGHf06++GiE?=
 =?us-ascii?Q?H91+zDu1Ke2m91NKRCqs/P4BYaEJOqxflclTlly01FOO4m+PJgmHG+0mYUC3?=
 =?us-ascii?Q?OpOVyvJXOdtalxoSMnUFmLWVKOEFjrZyIQtjpFQmvg1iCJ3pJBKiqE/WFcp9?=
 =?us-ascii?Q?mtTUGFtNPs/KN4vevYukSTIjAlgIPmzTarUVDJzR4BtJI2aFc5qH9FpU8XZn?=
 =?us-ascii?Q?RHABhSsTyelzbTN476+ybmK2RCs8r3U7iStrESpBemPYUooVMDB4FI7iLqzX?=
 =?us-ascii?Q?Z0eGwxKr1BHzMQbk5YD8v8488y8FPnh8YZQUE7nRDIigzzLhck/dqi3G1MyM?=
 =?us-ascii?Q?BuMi+hh3R0Bt/yN8/tiD+6P4Bcmzzb5PiR+9GjJOSkRYZvcU09jPacv89FpW?=
 =?us-ascii?Q?ZE3KouxpFw5Wk2KXCXsbJqx4zLMjmOInkDRDsuQycHM6siFuUVPKYXvhlnA7?=
 =?us-ascii?Q?8Gc0orCa9ec75FfSLsYnZvO3sBGH/x3rFibrU5nhPhq+dzsZm3pJ9LQ05UXy?=
 =?us-ascii?Q?q11kaFuEKV1Z5a6cfNaGwTI+tl8pgWBv4VRM410kQzws9RYbPJP17OZ50ysL?=
 =?us-ascii?Q?Ezn0rK2RCOqbNYXe90Ez2jtsWymEGjM2tTlCYawHlSHGOfojUQMLQVUV/rNY?=
 =?us-ascii?Q?2XvwGF6I5heEIQOd1sjdMJNKmjhNj+WBWylTCkoJ8rr2EOpM+VoqIaAycn6F?=
 =?us-ascii?Q?d6CffT+n0V8cX8BfXNWKEIibF/eqUxBwN9n1IxlJs7rZB/UgZGpqDpvZs5bW?=
 =?us-ascii?Q?J6KyX7ae+hdcbG4siuCTr+FlcqqAWkS6+8UJTb6cOXhMYwPbff3R9wXwItgj?=
 =?us-ascii?Q?mXgXzGThtKHK9RRtxLaV30Y00mwo3aBNuzXImYxfpQIRdKhYSNWrPzsWbRw3?=
 =?us-ascii?Q?g+/PpJxqU2FlXFgO/CjAdTAeF2zfLOB9nWScWX3LZbzWwQZ1cYX+Wyv8V+2X?=
 =?us-ascii?Q?eNL/DzDDlAcLNMQAWzBUIkRr/okV4oC1SoUj0G6PC7OGizSxsQc60uhJz6iU?=
 =?us-ascii?Q?wOgv9zE52UfMYT1XA5ZzhNi8FwSW1ef/DJe4pDIQgWMh9CtmGjqcaGeV4ok0?=
 =?us-ascii?Q?A1xRARnnlE4uw0RYqchJlQX6wTIFAy3fE/4ilimSvkc6K7iEGcx3cii7DZ+d?=
 =?us-ascii?Q?9gps1SDTbHe/+px4ss0FoFrhrTroA8Cw0nBeMLf+uF/eJWeVJ+QX/XuMpt8N?=
 =?us-ascii?Q?IbzVuGEJB1rbjvHCuROGmD0kkzfYOjLgfxaWhV274yzQiMt5q7EF0orPnJWH?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SgOVY3NgEMxC4kUPyEMewSZ96c5zzx0XZZu3NUWlH7y0CGRv4edWvTFwd+CGhsF0Bfn3wm2efIKIVEH+Fgja+Tp5mU0k6dvxQzSb/wmMdsBZzr9eUFKLhtLP5K+pMrpzqA7Pc3juLdE65pWS5G+LQa+BM5AcpU54TrXlpfJcITwTG8uzcI5efl0ICeXCXrtmAIPQky/FFnlop1orLQ7WJrS46xkCMjcheXZY/aJq3fAKbbNjupi7fc/WsGMhjg1OtKRcAb18wviSJ1eFMcxtvvqkDXPJRX7OcKBWI3XV6moK2ipiJNjEyDrzyx8uletynlyMjaJymby0yvUxhDi4R6VLjmbhteRU327MreMMUb6IP6/wnHr7GVDpSqO13eRuxIeizbNomfRnESUQpx23G4Vgvmz5O7EKwOxxBNdvtZXVk5/su2TTe0BmbR9ww1woNY1UhQ6gZvGfRsXsuGpbPPFhrCcHoiSQg18N/NcSHbdpcSCYJ+8sa3+0FMJRFVeLUw7i7to3ROF1/00MaA2aMf5+9HspxuTVYJk1XJ/Pd+5WScvRoWIJtTm1MwcclmQwj4FLzl92GrXgTYLox6RPaVGcpPfr+V/2M+p4JYdsr2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbebf08e-f2bb-4d76-c9e5-08dc720bb7dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:43:03.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: macHHg0pDa8FL8oIq3gW8XklnMMmqMWl8le7B94x8o1pQ9UJUAGBtxiXVg3ITgKAsd54ah2n2YheVETBIyPZTohHY8aPSyT1ny0lNiCU73w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405110171
X-Proofpoint-GUID: jUTHAVBN2C5w31VM2qqsx5jADYgSZj6w
X-Proofpoint-ORIG-GUID: jUTHAVBN2C5w31VM2qqsx5jADYgSZj6w

When CONFIG_BUILTIN_MODULE_RANGES is set, a linker map for vmlinux.o needs
to be generated.  The generation of offset range data for builtin modules
depends on that linker map to know what offsets in an ELF section belong
to an object file for a particular builtin module.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
---
 scripts/Makefile.vmlinux_o | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 508b3294e2cf1..e4a92838780d5 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
 
+vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
+
 quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
 	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
+	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
-- 
2.43.0


