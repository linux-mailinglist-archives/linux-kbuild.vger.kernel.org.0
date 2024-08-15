Return-Path: <linux-kbuild+bounces-3002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EEF953693
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5917A1F233AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42691AC427;
	Thu, 15 Aug 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fn+m6Cko";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IvMeVUaG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60C1AAE1F;
	Thu, 15 Aug 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734264; cv=fail; b=bBORnt2zL1IGuJfa0jLP+WbW47iqEFa7tt/KIj1h5oBOLvofZWYgrj9AJlqdXrLxf27HiMyhNHkgxHd/SDK+xakCuDMWb+u4BYCWoHssrDFY6AUsptc/b8dnTK6dpUqWgM9dtUisrwiwE8FYMHOODqaGJuHeinU/1ankgLkY3cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734264; c=relaxed/simple;
	bh=pRe2TzdsTc5G2CIIWyS9XeM2rziIb11t6UGeOjRQ5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1gavD3BxCTyud+s2xYk0LdmSSvWC3hOm6/JtB2Jeo1QCt0bvItyuurCJiEXcobhsHoJewoZm4uf4yS6SdHjXjbQj1oShy7YERsmD5P8BzfvyP/W2TM9eUQm5zqGp4k6nwrA1U8DDxMP6W3j17mt79DpibFVN+hui4fhdDAofOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fn+m6Cko; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IvMeVUaG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEta6U007719;
	Thu, 15 Aug 2024 15:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=GaaM6snQg/N8OYuCQG1wPoYERypmgLeF+WQh6Am2mQg=; b=
	fn+m6Ckosx9mH2tNKoovzwttqkznLrO6jhJrGpu25+MAQIhXnWC1raMGVCIYZ8w3
	gOjW3xVRzlWOID/oyc2UO2lwIKF6s2HS9ZtHPTQmXvoo0XtDyTh6sBvzqqLP/x/k
	Qh+PS3Jf2cQ0AaOqk3gGWzzHPlrzrR0KelPUGEJ3Nt/MHxKhT4dLrN6pG16Fo3YE
	Ugf749QiF6jVMahb9lb2IAp5oscraa24vHhGyqrIykaK9K1viF6IhdXlZlLpufXZ
	URsGtuflCfZpybrGgy/iNiFvUT2h7H3IYveHg3nqlZm8lDpZ0yg75MB56BM5oPs1
	BhITGX5XdWIMXa7xaQHrAw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039ag03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FDbUPN021064;
	Thu, 15 Aug 2024 15:04:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnhqu05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcTLLIT0FkxWqvQnx3tfNcQqk35tUx7OQ4BxTkWJzthGo0evcJuYvZ+pZ+ypKtGpiEGNLysG5NLeHQFXmln88OOh7AYdaKILWm2G58oQdKrzFHKfbNlkazdQEQbMXubvlbrPZtL1ygILWeN9XgJlsFkvdjurwe4qcnhHFuW41jId4i1BdYdLYvra7e2bMA15gvLDsO5Y4oZcbKNFlZqswqWmjGg0hdRl9y0FYpxhqCSmc5q4C5DQiPfIKu1LZkT9wkpJUyXEpPuTDUMM3w2Oz4Fd9ggDVo8EaQ9xcgGqhVy6t2RP5hHLA8isFsaMYr4Q+B11OPggm2Y5ENkwPld9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaaM6snQg/N8OYuCQG1wPoYERypmgLeF+WQh6Am2mQg=;
 b=XYJBNAs0aQDr398gev/oJW/Twg6ykvqqs8Hb6LLn/CpFSvoYYaxogqtgQXWLOC4kf51DZ8t/AGKzYmA7tDVx6tzSyl/yg3aYOehVbLXiFCyVWRVpg9yef28T5NUiooeuL31wYDD/QxWLuIt1rv3eHzFSW49JMaQBmy9LfgfPqwrRQgRqVAPyqlDqsCoMVSokAfcWRR81Qwo6+F+6Uv+q62taIyJssqrPgYZvhmiuoPILjU4jrS+tRsrO/bpLuKVF8iIqbmCqSdDF2AWbX5Z2M7ux6Lmh+ZqtQ2KyC69EyAmJEByOEWZRud9X6ijESWM1cibbYBMKOaVNCGNc9qPJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaaM6snQg/N8OYuCQG1wPoYERypmgLeF+WQh6Am2mQg=;
 b=IvMeVUaGita5no23FjndJzPrq7Ui/Kf0ZMpsV03yc/Qn6ymG0fKWwcRG7xwCH/RcmT8AIq5c8RQg2oxktsecwsn5JVGYPQ5TZzUKcvzLF5VUf1AVUgyciAG+VUDrYyiXyuUntStnzNV4tJHtXMnUsUl78c0o4SfJZOT02wgxAek=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 15:04:07 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 15:04:07 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v6 2/4] kbuild, kconfig: generate offset range data for builtin modules
Date: Thu, 15 Aug 2024 11:03:37 -0400
Message-ID: <20240815150339.1564769-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815150339.1564769-1-kris.van.hees@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBP288CA0009.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: c89baa2c-b22a-4117-8fb5-08dcbd3b82ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6MKFsZPtGR7mALHudfM4pFddFAwDEUE7G3vsdiRKzz3jX/0Y2HPaTKR/b/Q?=
 =?us-ascii?Q?f/SfcqUQs/6PENuLeizomSlpgaEf1clPqPAnKN3sjYlA4/1ckapAuWG8tX4E?=
 =?us-ascii?Q?P0htvOdGymhBhh1Cun3aBVwTcyRS1TBm0HVCOegyZ8cviKTpg1C0tP4YLDqF?=
 =?us-ascii?Q?juGYfjQaVakgUGo03Slh1PpWcD+pU7NoULPW5LZ/jlIceXCkIVzyYmGNPh3Z?=
 =?us-ascii?Q?h+VHE0b0OS5acmEarwOydzut8MRJRI7MrqmWdT7+VqKYl6lXpR3BVGZ3+tTg?=
 =?us-ascii?Q?Z0DwHt7Kv3I36m2S7LvDYeVTYl8JiEUaGO3vHkpqC4klwLTkCnTCgSKryRIn?=
 =?us-ascii?Q?iAVxaer+gtjMiSHtioHg76EIMAFIHDi70DnS+k8T5sJU/x9wiI1hwNfEvw3B?=
 =?us-ascii?Q?OH5NLgTUwvDy2rhl0p1nPStJnjq+t/ua1pqucrx9hMCsmMRW7HSvya5gBmdh?=
 =?us-ascii?Q?MGXASy2O0QPPwUHxjzFy/mr7tFNGodclGZPHggJMLFaQlyBhqqIDD7+Q/o7g?=
 =?us-ascii?Q?AHYFw00Hhv7lXyZ+Y5BEGJX2sqvYlQ3LrBr6fvgEs3NiqXxfIaAinqdm/jc4?=
 =?us-ascii?Q?b4HR45WFKkpylONm7pyGFUiLdK0fDEDuYxuEySHauLbPH7IGnXjzenMxu3jD?=
 =?us-ascii?Q?UKPtaQh3u0jGK1/VQxHdAJHuNpo/f8OePZY1kw6zeTZEppfPD0qPuRWYbS04?=
 =?us-ascii?Q?jSx5zjSjYCbBP+fR0IHPpQCA+d46vwm3nBQ007ZgVe2SbWbvPpMt+ARWRA3Q?=
 =?us-ascii?Q?RjPsvO0IGfLTxaHCU8qBihELS8aPRgaQoFfzjoQ1sppa8igUWkzjrdqJdJNB?=
 =?us-ascii?Q?kYXqSbNhUghvXHyv5MrwKMLM7rirn3dTExuLd43C8oeLziF9aQs6JB3c7I4/?=
 =?us-ascii?Q?XR/xaJpRgVrINWA8FI4J6g+uAhbNg+jpPEPtd5jjaUTwGVx6urswGk5dcc6e?=
 =?us-ascii?Q?9TN0DOEArQo4TZdczSDUyQtsUbefXlgGqDKGEtLntbYmvqZvVd+bAJicMlP0?=
 =?us-ascii?Q?C3p855krgM0ReAsZUqiRuKVEeKHK9hRshZ9J9zhw1fNM4wOQCT3CPAlJHnGZ?=
 =?us-ascii?Q?So/wTAfbhvOm+hTU0pKiyiHnRcur5xeXkjbNRSbvPuC8Sht+2qKd8MbZQOvI?=
 =?us-ascii?Q?TYpgPuk8PtBHFHIt/ynFXeJrLQXWVOpxwf7uz8tj2CxvGzebFMW2Ue72XlY0?=
 =?us-ascii?Q?6QC9iswVcz8C3CyL5+BzY1VbHCOF1+aNQrYFBPrDaHdIlcTf6eg5pN6qr7DL?=
 =?us-ascii?Q?MMpIHwVKbq8c+FKqbyvay/qwoIuFxv9RkAH0RMSehgRmctP68ylRnRzdi8O5?=
 =?us-ascii?Q?Jog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aKnohj2kLbGQIqh2o6oSsLyzHEHIxEp99vc2+F7OPB+FXm1Fra8hzvmQYcVj?=
 =?us-ascii?Q?Ius4WZfcVhKavHtIBB9KXQcvpuPZsgRf5mKwzwZrKyzQ+0zffWBBeZ8S18Eh?=
 =?us-ascii?Q?0KtOCLkJUubqrz8zBtETCN7lpXs4Z1il9xYFFtuHbkPv5PKiwH3stuQJRgti?=
 =?us-ascii?Q?Jt3+JaJRbMYJ93GCqbsMvRO0z33LkOR/LjxhtRiVWINAo6fMqWzKKjLPw63m?=
 =?us-ascii?Q?FbHxwpQZwJaxynHlzFrpc3y03WkhnchYFOrxBNG8E0o3FdT9PmD6M/i/oovD?=
 =?us-ascii?Q?T2z+Qp7xQkT5DjC7CdUSfj0mw1kA6hdRuNBonPy89dAmKKnbkuCO99DAwTtG?=
 =?us-ascii?Q?OdBWNwC614UfPUVojU9fql+jb/vSJASz1kdbxFuvDRMJZY6hRcqu12Q3Ho5c?=
 =?us-ascii?Q?rjh/7B1K0UK3r9/gTxI623qykVlGW5CC0cnQ5zJiwcFf17du05xw+VLWuwXh?=
 =?us-ascii?Q?sZbRyE5suKQLQW5pvwDZv5iHfROfoKTyIKPR82j/JO9ecctK8xQU6YOe9t6U?=
 =?us-ascii?Q?reUzuPKd5SlP57nHtml97Qfl6JukWv40gmm/Dm+hryTZpHGFJ8IzDHhwOQCL?=
 =?us-ascii?Q?vLwadCHxTzRBU5zGsbznefFMooxGKO3Sf5eOzfg1/KfuE4WNKOeoGDwyxhVq?=
 =?us-ascii?Q?x+jBQL2A/fPVLrsK4pP8ECmif0bgToVemAKEG1zqTmv2vIrnueMyxIsPPOvD?=
 =?us-ascii?Q?n063RWxjd7SzVa2c/Q1SWojCLQtOPU79x3jc7mKK/5UafMs54c4xPqaiE19z?=
 =?us-ascii?Q?HRvurdas1KsfVRTRWBOUwdWbWHgBqkiapMKmzFJ8b68OHUszyaa/dolTp66O?=
 =?us-ascii?Q?qDDF4EottvuTWTHtByhaY1k/T2u5KD/by4bqAT1ll2jwp06GP2xKv9bKAwGf?=
 =?us-ascii?Q?oZiU0J7SUoRNwzwX+n7dttowv3GOW7jYvgHXbiESRwfRIpduwiP6nw1zZAHh?=
 =?us-ascii?Q?k0ObWFSkXUABa5D9JTTAx81z57jLKbPcQJVSq4tmJV5psr8dhJQKoR0qGBD2?=
 =?us-ascii?Q?+CaSxStkqK67CPRNFvxlIwzSkvbKXo1oaGHCF1LXClvx1HpWoZei42mtDmkz?=
 =?us-ascii?Q?VtmxLFni8Rk4RS2wzaCPfNKJhGG/4cpE3vsg6iIBbzCr9ruMfOBYdRYglp7p?=
 =?us-ascii?Q?rV9PADtrILCxtCO94zV6gEsEGftHbLbQCt26UldVvzrilgR6sso4HLRlZSVF?=
 =?us-ascii?Q?z+7EeZcsYZcXhFmgkjcbDUMpUdHY9gFp7KuvRAcULXQK73MCK+f9uzo/Bd42?=
 =?us-ascii?Q?j3jYX4Mi7IAYtwrwuzFaZSwriAqLCPxu7NMV0Lx+XBAgqq/2Loe84oLnSfux?=
 =?us-ascii?Q?SPIzfpvs/P0ROxtkFdIEtatWmvs/1dRJNZWfKUf0YZeWhAYoN1HOSyEUHDaS?=
 =?us-ascii?Q?scH706SfJqUTJNyf77lieEm8JjNU6ztzVa3/tOiWsU2q03bz9xWK0k0b1ckM?=
 =?us-ascii?Q?O2hX7wKdWsSb1LM1k7end1FXSqQotTcWbg2cwPtgNAaT9b9RffJhdSx9P17O?=
 =?us-ascii?Q?SYcfR73Ym2zcwPDQyHQ1ijYXXwGNmF3LfhpHc86qfWk2q/8Gthzdn8itMDjH?=
 =?us-ascii?Q?uttKsw9gnRtacCNDna886w4Kch9JP32eC3Ept5VxMlvUuwziHZbR8zlhmxMg?=
 =?us-ascii?Q?6c0k0/KFKWArA20hknW67QI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TgbJejdGafiMQ8BU0aoeERnZev5byNinFGF6/6jkfcuVQHo81LMprbOER/94bcja2RevEpmRyuLkpkhwCiYNnjdu9XqvMDHVzcepJKagbHGWbGHxaoi5vpyKl6rB0uyO8AHns/Aj+0TjhDYA3OTLtF4eW7TRVGNizCBfOxcPAXZsXAyN1RIB7kd8FbU8PnakF/azJD+d+++XbonMoVOU2xvrbc3W6WztkuEb75cDsV5MMtI38rMI6XIYM59roGMuEn0be1+eSLz84uDSrLAU9/zthEjFG+/WKMrBvTZZ5WwNGvymsFtyOfmo+NdPsT1ZpEhPXRgnKPvqBECr6TDtYyBfOS16E9n8kACpXpJv1muRxDsXQmspKqb1NY7bHiy0hALIRWLKl+4GriI5ay7aMXoSdDEJbp8+Sx3HDKnBvEKim8vPpWjnlEXuLBMw3ftC0acVLsa/4dDqx+t15jwHBHwlrk2gvHpIdkyFkwyN8gOb3WyppP2+WN4FhYZ43XXQcUD+4jDiNJMvxjl/BdmcNrc/o1mh30PPecZTKKOE97VVVcthC1pAgFDOLV/Q0y6pA6tNS3g1IxDFow7mT6uegP6xA/TQHOj9NAVZ+2yB2Ro=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89baa2c-b22a-4117-8fb5-08dcbd3b82ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:04:07.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRIJRuw+320YAzBmKFW0/6JbY0ibeTm97718vatOyh3CDHuaZomy22fXur+GgpLX+MkT5GXTiol/sVjpA5mBlG7UbkU2LbP9Ia0IueUDFJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150109
X-Proofpoint-ORIG-GUID: AMVZxAVXoTeN9FpKdFDls7pjnslBYYR5
X-Proofpoint-GUID: AMVZxAVXoTeN9FpKdFDls7pjnslBYYR5

Create file module.builtin.ranges that can be used to find where
built-in modules are located by their addresses. This will be useful for
tracing tools to find what functions are for various built-in modules.

The offset range data for builtin modules is generated using:
 - modules.builtin: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section
 - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 008e6660-008e9630 snd_soc_wcd_mbhc
.text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
.text 008ea610-008ea780 snd_soc_wcd9335
...
.data 00000000-00000000 = _sdata
.data 0000f020-0000f680 amd_uncore

For each ELF section, it lists the offset of the first symbol.  This can
be used to determine the base address of the section at runtime.

Next, it lists (in strict ascending order) offset ranges in that section
that cover the symbols of one or more builtin modules.  Multiple ranges
can apply to a single module, and ranges can be shared between modules.

The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
is generated for kernel modules that are built into the kernel image.

How it works:

  1. The modules.builtin file is parsed to obtain a list of built-in
     module names and their associated object names (the .ko file that
     the module would be in if it were a loadable module, hereafter
     referred to as <kmodfile>).  This object name can be used to
     identify objects in the kernel compile because any C or assembler
     code that ends up into a built-in module will have the option
     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
     can be found in the .<obj>.cmd file in the kernel build tree.

     If an object is part of multiple modules, they will all be listed
     in the KBUILD_MODFILE option argument.

     This allows us to conclusively determine whether an object in the
     kernel build belong to any modules, and which.

 2. The vmlinux.map is parsed next to determine the base address of each
    top level section so that all addresses into the section can be
    turned into offsets.  This makes it possible to handle sections
    getting loaded at different addresses at system boot.

    We also determine an 'anchor' symbol at the beginning of each
    section to make it possible to calculate the true base address of
    a section at runtime (i.e. symbol address - symbol offset).

    We collect start addresses of sections that are included in the top
    level section.  This is used when vmlinux is linked using vmlinux.o,
    because in that case, we need to look at the vmlinux.o linker map to
    know what object a symbol is found in.

    And finally, we process each symbol that is listed in vmlinux.map
    (or vmlinux.o.map) based on the following structure:

    vmlinux linked from vmlinux.a:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

    vmlinux linked from vmlinux.o:

      vmlinux.map:
        <top level section>
          <included section>  -- might be same as top level section)
            vmlinux.o         -- need to use vmlinux.o.map
              <symbol>        -- ignored
              ...

      vmlinux.o.map:
        <section>
            <object>          -- built-in association known
              <symbol>        -- belongs to module(s) object belongs to
              ...

 3. As sections, objects, and symbols are processed, offset ranges are
    constructed in a striaght-forward way:

      - If the symbol belongs to one or more built-in modules:
          - If we were working on the same module(s), extend the range
            to include this object
          - If we were working on another module(s), close that range,
            and start the new one
      - If the symbol does not belong to any built-in modules:
          - If we were working on a module(s) range, close that range

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
    Changes since v5:
     - Removed unnecessary compatibility info from option description.
    
    Changes since v4:
     - Improved commit description to explain the why and how.
     - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
     - Improved comments in generate_builtin_ranges.awk
     - Improved logic in generate_builtin_ranges.awk to handle incorrect
       object size information in linker maps
    
    Changes since v3:
     - Consolidated patches 2 through 5 into a single patch
     - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
     - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
     - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
     - Support LLVM (lld) compiles in generate_builtin_ranges.awk
     - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
    
    Changes since v2:
     - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
     - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
     - Switched from using modules.builtin.objs to parsing .*.cmd files
     - Parse data from .*.cmd in generate_builtin_ranges.awk
     - Use $(real-prereqs) rather than $(filter-out ...)
---
 Documentation/process/changes.rst   |   7 +
 lib/Kconfig.debug                   |  16 +
 scripts/Makefile.vmlinux            |  16 +
 scripts/Makefile.vmlinux_o          |   3 +
 scripts/generate_builtin_ranges.awk | 515 ++++++++++++++++++++++++++++
 5 files changed, 557 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 3fc63f27c226..00f1ed7c59c3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -64,6 +64,7 @@ GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
 Python (optional)      3.5.x            python3 --version
+GNU AWK (optional)     5.1.0            gawk --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -192,6 +193,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
 built from the U-Boot source code. See the instructions at
 https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
 
+GNU AWK
+-------
+
+GNU AWK is needed if you want kernel builds to generate address range data for
+builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
+
 System utilities
 ****************
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a30c03a66172..dcdf14ffe031 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -571,6 +571,22 @@ config VMLINUX_MAP
 	  pieces of code get eliminated with
 	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
 
+config BUILTIN_MODULE_RANGES
+	bool "Generate address range information for builtin modules"
+	depends on !LTO_CLANG_FULL
+	depends on !LTO_CLANG_THIN
+	select VMLINUX_MAP
+	help
+	 When modules are built into the kernel, there will be no module name
+	 associated with its symbols in /proc/kallsyms.  Tracers may want to
+	 identify symbols by module name and symbol name regardless of whether
+	 the module is configured as loadable or not.
+
+	 This option generates modules.builtin.ranges in the build tree with
+	 offset ranges (per ELF section) for the module(s) they belong to.
+	 It also records an anchor symbol to determine the load address of the
+	 section.
+
 config DEBUG_FORCE_WEAK_PER_CPU
 	bool "Force weak per-cpu definitions"
 	depends on DEBUG_KERNEL
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..7e21162e9de1 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -33,6 +33,22 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+# module.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = \
+	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > $@
+
+vmlinux.map: vmlinux
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+endif
+
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce6..252505505e0e 100644
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
diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
new file mode 100755
index 000000000000..9b647781d5fe
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,515 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# generate_builtin_ranges.awk: Generate address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
+#		vmlinux.o.map > modules.builtin.ranges
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, mfn, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	mfn = "";
+	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mfn = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mfn);
+
+			mod = mfn;
+			gsub(/([^/ ]*\/)+/, "", mod);
+			gsub(/-/, "_", mod);
+		}
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			mod = "";
+		if (mods[mod] != mfn)
+			mod = "";
+	}
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+	close(fn);
+
+	return mod;
+}
+
+# Update the ranges entry for the given module 'mod' in section 'osect'.
+#
+# We use a modified absolute start address (soff + base) as index because we
+# may need to insert an anchor record later that must be at the start of the
+# section data, and the first module may very well start at the same address.
+# So, we use (addr << 1) + 1 to allow a possible anchor record to be placed at
+# (addr << 1).  This is safe because the index is only used to sort the entries
+# before writing them out.
+#
+function update_entry(osect, mod, soff, eoff, sect, idx) {
+	sect = sect_in[osect];
+	idx = (soff + sect_base[osect]) * 2 + 1;
+	entries[idx] = sprintf("%s %08x-%08x %s", sect, soff, eoff, mod);
+	count[sect]++;
+}
+
+# (1) Build a lookup map of built-in module names.
+#
+# The first file argument is used as input (modules.builtin).
+#
+# Lines will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we derive the built-in module name from this as "lzo_rle" and associate
+# it with object name "crypto/lzo-rle".
+#
+ARGIND == 1 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mod = $1;
+	sub(/([^/]*\/)+/, "", mod);		# mod = basename($1)
+	gsub(/-/, "_", mod);			# Convert - to _
+
+	mods[mod] = $1;
+	next;
+}
+
+# (2) Collect address information for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+#
+# We collect the base address of the section in order to convert all addresses
+# in the section into offset values.
+#
+# We collect the address of the anchor (or first symbol in the section if there
+# is no explicit anchor) to allow users of the range data to calculate address
+# ranges based on the actual load address of the section in the running kernel.
+#
+# We collect the start address of any sub-section (section included in the top
+# level section being processed).  This is needed when the final linking was
+# done using vmlinux.a because then the list of objects contained in each
+# section is to be obtained from vmlinux.o.map.  The offset of the sub-section
+# is recorded here, to be used as an addend when processing vmlinux.o.map
+# later.
+#
+
+# Both GNU ld and LLVM lld linker map format are supported by converting LLVM
+# lld linker map records into equivalent GNU ld linker map records.
+#
+# The first record of the vmlinux.map file provides enough information to know
+# which format we are dealing with.
+#
+ARGIND == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	if (dbg)
+		printf "NOTE: %s uses LLVM lld linker map format\n", FILENAME >"/dev/stderr";
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+# lld: ffffffff82c00000          2c00000   2493c0  8192 .data
+#  ->
+# ld:  .data           0xffffffff82c00000   0x2493c0 load address 0x0000000002c00000
+#
+ARGIND == 2 && map_is_lld && NF == 5 && /[0-9] [^ ]+$/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an anchor record from lld format to ld format.
+#
+# lld: ffffffff81000000          1000000        0     1         _text = .
+#  ->
+# ld:                  0xffffffff81000000                _text = .
+#
+ARGIND == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
+	$0 = "  0x"$1 " " $5 " = .";
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+# lld:            11480            11480     1f07    16         vmlinux.a(arch/x86/events/amd/uncore.o):(.text)
+#  ->
+# ld:   .text          0x0000000000011480     0x1f07 arch/x86/events/amd/uncore.o
+#
+ARGIND == 2 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/ vmlinux\.a\(/, " ");
+	sub(/:\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+# We only care about these while processing a section for which no anchor has
+# been determined yet.
+#
+# lld: ffffffff82a859a4          2a859a4        0     1                 btf_ksym_iter_id
+#  ->
+# ld:                  0xffffffff82a859a4                btf_ksym_iter_id
+#
+ARGIND == 2 && map_is_lld && sect && !anchor && NF == 5 && $5 ~ /^[_A-Za-z][_A-Za-z0-9]*$/ {
+	$0 = "  0x"$1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND == 2 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# (LD) Section records with just the section name at the start of the line
+#      need to have the next line pulled in to determine whether it is a
+#      loadable section.  If it is, the next line will contains a hex value
+#      as first and second items.
+#
+ARGIND == 2 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	if ($1 !~ /^0x/ || $2 !~ /^0x/)
+		next;
+
+	$0 = s " " $0;
+}
+
+# (LD) Object records with just the section name denote records with a long
+#      section name for which the remainder of the record can be found on the
+#      next line.
+#
+# (This is also needed for vmlinux.o.map, when used.)
+#
+ARGIND >= 2 && !map_is_lld && NF == 1 && /^ [^ \*]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Beginning a new section - done with the previous one (if any).
+#
+ARGIND == 2 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Process a loadable section (we only care about .-sections).
+#
+# Record the section name and its base address.
+# We also record the raw (non-stripped) address of the section because it can
+# be used to identify an anchor record.
+#
+# Note:
+# Since some AWK implementations cannot handle large integers, we strip off the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.  The portion
+# to strip off is stored in addr_prefix as a regexp, so further clauses can
+# perform a simple substitution to do the address stripping.
+#
+ARGIND == 2 && /^\./ {
+	# Explicitly ignore a few sections that are not relevant here.
+	if ($1 ~ /^\.orc_/ || $1 ~ /_sites$/ || $1 ~ /\.percpu/)
+		next;
+
+	# Sections with a 0-address can be ignored as well.
+	if ($2 ~ /^0x0+$/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	base = $2;
+	sub(addr_prefix, "0x", base);
+	base = strtonum(base);
+	sect = $1;
+	anchor = 0;
+	sect_base[sect] = base;
+	sect_size[sect] = strtonum($3);
+
+	if (dbg)
+		printf "[%s] BASE   %016x\n", sect, base >"/dev/stderr";
+
+	next;
+}
+
+# If we are not in a section we care about, we ignore the record.
+#
+ARGIND == 2 && !sect {
+	next;
+}
+
+# Record the first anchor symbol for the current section.
+#
+# An anchor record for the section bears the same raw address as the section
+# record.
+#
+ARGIND == 2 && !anchor && NF == 4 && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", sect, 0, 0, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s (.)\n", sect, 0, $2 >"/dev/stderr";
+
+	next;
+}
+
+# If no anchor record was found for the current section, use the first symbol
+# in the section as anchor.
+#
+ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
+	addr = $1;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr) - base;
+	anchor = sprintf("%s %08x-%08x = %s", sect, addr, addr, $2);
+	sect_anchor[sect] = anchor;
+
+	if (dbg)
+		printf "[%s] ANCHOR %016x = %s\n", sect, addr, $2 >"/dev/stderr";
+
+	next;
+}
+
+# The first occurence of a section name in an object record establishes the
+# addend (often 0) for that section.  This information is needed to handle
+# sections that get combined in the final linking of vmlinux (e.g. .head.text
+# getting included at the start of .text).
+#
+# If the section does not have a base yet, use the base of the encapsulating
+# section.
+#
+ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
+	if (!($1 in sect_base)) {
+		sect_base[$1] = base;
+
+		if (dbg)
+			printf "[%s] BASE   %016x\n", $1, base >"/dev/stderr";
+	}
+
+	addr = $2;
+	sub(addr_prefix, "0x", addr);
+	addr = strtonum(addr);
+	sect_addend[$1] = addr - sect_base[$1];
+	sect_in[$1] = sect;
+
+	if (dbg)
+		printf "[%s] ADDEND %016x - %016x = %016x\n",  $1, addr, base, sect_addend[$1] >"/dev/stderr";
+
+	# If the object is vmlinux.o then we will need vmlinux.o.map to get the
+	# actual offsets of objects.
+	if ($4 == "vmlinux.o")
+		need_o_map = 1;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+# If the final link was done using the actual objects, vmlinux.map contains all
+# the information we need (see section (3a)).
+# If linking was done using vmlinux.a as intermediary, we will need to process
+# vmlinux.o.map (see section (3b)).
+
+# (3a) Determine offset range info using vmlinux.map.
+#
+# Since we are already processing vmlinux.map, the top level section that is
+# being processed is already known.  If we do not have a base address for it,
+# we do not need to process records for it.
+#
+# Given the object name, we determine the module(s) (if any) that the current
+# object is associated with.
+#
+# If we were already processing objects for a (list of) module(s):
+#  - If the current object belongs to the same module(s), update the range data
+#    to include the current object.
+#  - Otherwise, ensure that the end offset of the range is valid.
+#
+# If the current object does not belong to a built-in module, ignore it.
+#
+# If it does, we add a new built-in module offset range record.
+#
+ARGIND == 2 && !need_o_map && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	if (!(sect in sect_base))
+		next;
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) - sect_base[sect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = $1;
+	update_entry($1, mod, soff, mod_eoff);
+
+	next;
+}
+
+# If we do not need to parse the vmlinux.o.map file, we are done.
+#
+ARGIND == 3 && !need_o_map {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# (3) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND == 3 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+
+	sect = $6;
+	if (!(sect in sect_addend))
+		next;
+
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "sect " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (3b) Determine offset range info using vmlinux.o.map.
+#
+# If we do not know an addend for the object's section, we are interested in
+# anything within that section.
+#
+# Determine the top-level section that the object's section was included in
+# during the final link.  This is the section name offset range data will be
+# associated with for this object.
+#
+# The remainder of the processing of the current object record follows the
+# procedure outlined in (3a).
+#
+ARGIND == 3 && /^ [^ ]/ && NF == 4 && $3 != "0x0" {
+	osect = $1;
+	if (!(osect in sect_addend))
+		next;
+
+	# We need to work with the main section.
+	sect = sect_in[osect];
+
+	# Turn the address into an offset from the section base.
+	soff = $2;
+	sub(addr_prefix, "0x", soff);
+	soff = strtonum(soff) + sect_addend[osect];
+	eoff = soff + strtonum($3);
+
+	# Determine which (if any) built-in modules the object belongs to.
+	mod = get_module_info($4);
+
+	# If we are processing a built-in module:
+	#   - If the current object is within the same module, we update its
+	#     entry by extending the range and move on
+	#   - Otherwise:
+	#       + If we are still processing within the same main section, we
+	#         validate the end offset against the start offset of the
+	#         current object (e.g. .rodata.str1.[18] objects are often
+	#         listed with an incorrect size in the linker map)
+	#       + Otherwise, we validate the end offset against the section
+	#         size
+	if (mod_name) {
+		if (mod == mod_name) {
+			mod_eoff = eoff;
+			update_entry(mod_sect, mod_name, mod_soff, eoff);
+
+			next;
+		} else if (sect == sect_in[mod_sect]) {
+			if (mod_eoff > soff)
+				update_entry(mod_sect, mod_name, mod_soff, soff);
+		} else {
+			v = sect_size[sect_in[mod_sect]];
+			if (mod_eoff > v)
+				update_entry(mod_sect, mod_name, mod_soff, v);
+		}
+	}
+
+	mod_name = mod;
+
+	# If we encountered an object that is not part of a built-in module, we
+	# do not need to record any data.
+	if (!mod)
+		next;
+
+	# At this point, we encountered the start of a new built-in module.
+	mod_name = mod;
+	mod_soff = soff;
+	mod_eoff = eoff;
+	mod_sect = osect;
+	update_entry(osect, mod, soff, mod_eoff);
+
+	next;
+}
+
+# (4) Generate the output.
+#
+# Anchor records are added for each section that contains offset range data
+# records.  They are added at an adjusted section base address (base << 1) to
+# ensure they come first in the second records (see update_entry() above for
+# more informtion).
+#
+# All entries are sorted by (adjusted) address to ensure that the output can be
+# parsed in strict ascending address order.
+#
+END {
+	for (sect in count) {
+		if (sect in sect_anchor)
+			entries[sect_base[sect] * 2] = sect_anchor[sect];
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.45.2


