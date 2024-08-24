Return-Path: <linux-kbuild+bounces-3192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506595DB12
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1129B21DBE
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7DA2C859;
	Sat, 24 Aug 2024 03:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fwr3FIZc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vpc6PDyC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83034EEB1;
	Sat, 24 Aug 2024 03:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470707; cv=fail; b=orsRwqyS+7pJFcwzYqTBmRptuBcpaMEmATu3dkkfIOnAHwLnh8AWGhosil7ul2kWAX9Jk/0rNTMT166nz1AmdwPfWLgcoMW1kTwtG01Nsi+rUUn6sITrnnorIcpXsNxV9HYCo+WG0n5h8Bv3QUkgOTJq0TEGr9YUlYZsR0TVNso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470707; c=relaxed/simple;
	bh=euyO5YaxPcS4BZKbXWNqZUoTnUme63dRFaVktnN35cU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qGmIFt/9ZzWEm9slGjoF4MyuwDd2IRWjpObXHgLIE8PC422Idi+iITK/k+YWxtKsWxtFPeaZUbh2tIFRsAyBvly9YD7d45Zkw2wbCyrIe8jBz9xtD525Gc8zkOeJgDbPvwUACGfxiTaQP/L0757N/87xZoeeM+OihkncoWe2A6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fwr3FIZc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vpc6PDyC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3U25D018199;
	Sat, 24 Aug 2024 03:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=WIc5mz6ZvxCmgf
	peHgTX3Bw8OXSwdbdkfSgbPM5sMDU=; b=fwr3FIZc5nHAL4LWGYhbCi4apEkWaq
	lmaL5TCktZgi7wbMhmKM5Ck1quh1Vl6YH/6lNwtKJms8al9ygl7TR3d0jF2By7Mf
	rMOqk2+JdkiFEwd6EDz6JefFbTuvcZzsLDfQl0IiV0l3PWzJt+40QAqyFpqTLTAP
	9aCddFjOuGOBW/og1FxEM34qFDqTsx01ZX9z29rqc37vnr50qecf6M1TRwnovhXx
	KjqilTLlBJ0/e+xwR9tKAVJkX1O+q+r+LT1PdxnCcIA63uzWHznvW3z2p304qgsw
	jkypDmbaWdRAiO0SLDfpXV2l4Rbn6NrzVj6vB7POJVfEw1bBC33Pam6Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177n4007b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47O2H0IG027642;
	Sat, 24 Aug 2024 03:38:15 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4176kgh9r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjrZw7HxI/clNiRwlsPNuZxXZw08tHATjbNorKfeHuD2x5+koCA3ba8caKQUoQqO03O9rJOvoV7Lh2yhOVEvOGRQRrcQpoZDFmbHUS2d8xKq1Ki3xFVmL5cCNYm8c0xCJ8wMGxQVAxgz7XfEiX48JDE2sxnskuBQDLdqR8EiND40WMTiTvDUtHwIut11uR3Q2efoi9DHCfIMWu7JoBpjMIhS6zusiRcxy/a8aS7NmElwMY7kQok1Xyax0kuzALnRDCM2K09pbVJMVD7nq5JATu4GGdmHsOamRn1QyDPyNwZmqbBII3Bjdt73tGByCj2vd3RF1NwKsKrAjNUJRAeMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIc5mz6ZvxCmgfpeHgTX3Bw8OXSwdbdkfSgbPM5sMDU=;
 b=dXas7bdPDQfMEE4vixeJSqO4yRJ1QLt+zcwWlk718+YKruLTneqRPnG4lt8oz23mCLrHOzOantsqVJYBt94QsfzEJgURVJVn8Nip7yx+U9FP46o8t34CcFwFbXz73qbrEnZNdwI8dwRhYT+SLnR9r4fadJP4lGDmtPGpEqKCY/MRLwkZwckZD+BsI5YNqha70FQwF+yYWUk5dtY4MpObl+EscSayX+rY2cAhj2Uw8uah8ap1YxKP1XsegjZdUsoCgugU5mShx0QpWRxQ25Kply0MXCcGTd1WY6FZsQp+8yXH02NsNuF5SP/+sje0HATcEqO4RTGYGE5Uwxp7DXOfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIc5mz6ZvxCmgfpeHgTX3Bw8OXSwdbdkfSgbPM5sMDU=;
 b=Vpc6PDyCtqR3PWzoEDBrM+Yfl5asFTKFQIIY1nbLR9rjDCtC6TcfexpL1NSBluzXN9N/0nJzJZMXhGSxDUsqP6D0CR2LOGZ44Mm+Vg651kDpHtZlPADme5aHwAGhEZ3dhKskp0DqpKECe18ceOsn7w598AAwdsSvSNeONSqX+cg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Sat, 24 Aug
 2024 03:38:12 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.011; Sat, 24 Aug 2024
 03:38:12 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v9 0/4] Generate address range data for built-in modules
Date: Fri, 23 Aug 2024 23:37:53 -0400
Message-ID: <20240824033757.52005-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de264da-771c-4f29-f8f9-08dcc3ee2e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R3PeHJKeAsQ5RgW93dSTB2/Eu0X3lWIMWzXGKCl+vn6rwkEKzD8lzEU/djvG?=
 =?us-ascii?Q?3wq8HEMLKSLk7PjtS/1MYdliY64IuaUunerUsJl8oOHBJ8Ns6xNetImyzmZn?=
 =?us-ascii?Q?o+ejTEXjrXLr8NJh/tSWpYsZtXbdKVDToeSZTF9oR60Yc6hk7GUf2gdx7IsZ?=
 =?us-ascii?Q?CgOiW0aqvB2zp2SEDuNQTCP+pQy/j90mcj/QwkpGGp2JhowfRHWLvjqltNlE?=
 =?us-ascii?Q?79nDeDTm2A5Xo6NnbxtijlCHpXWcsoRzd3q2BLzdiP1X7kH0D0kpCUTUNNfg?=
 =?us-ascii?Q?hbsAecTIhEhz15WCAsHoSkh4Da3R0LrAmHHYYkqkX3OAwSlmAubOLuJ7CSp/?=
 =?us-ascii?Q?HgO5dXmPTX8lHZNQLMPw2TTLsQ4rLDcNIpNLWnOICIo0OyK3jZj1NhX02Qal?=
 =?us-ascii?Q?656Gf3suyCeuO1tOud5vQZBm+EqWOulc+7mTyQzZ+WKy9MNo/hIQSdS0K+1D?=
 =?us-ascii?Q?Zsr19VI14jDSyCgi5LY7aeju8+nKFiFFAgt1AZD6cwD8P+OClf0wf1AWcYWK?=
 =?us-ascii?Q?tGWzsmcKO7/IpQNZ9PsBb5RGnq1/FxAJWNVvj1fHXkrdP1Napzn+tZn4c3O7?=
 =?us-ascii?Q?cqzKJkBhii0BsleF9az2MC75E1t9nCwZeNYaxbOmNabjNUJ1PtT4YFMxzRmZ?=
 =?us-ascii?Q?h+HrsqIfGh52Y5ec8HAW3SjtFAnGRxhuuCBD20XsBW0FleEwm62GEyy0etD6?=
 =?us-ascii?Q?AReV/UkO0VRK47PJPnFxisMS7SB6SWcRlxHTMcy15a6BTU+jrurEEb2qiGlY?=
 =?us-ascii?Q?rtNEvuxv8yq8JLQLmL/9Jt1Kri3855gWhFEKTh7/V5914azXDP9qIN+SNjNS?=
 =?us-ascii?Q?cBSA6W1v0GYcD0727ZhtAN9hIs89qcMDdKQ1GJeE0NvtwecqTosAd+1bJp6g?=
 =?us-ascii?Q?waKcTzfc9klZa3ATu83GxM4DtYG/oXP/lnF+L0oDKFYWGEp3mDbBx3KstFnk?=
 =?us-ascii?Q?/Xw/SQAGMv9ChpJ0nTIlP4u3TjjsLYhB/w0f8zpeMLcYI05qlzbKSUqrDFVS?=
 =?us-ascii?Q?d8Sca4G3cKmjVWujaSFB198FuiStXP/SFNZBK6M26WUQ9fK0+IxIZ2pXnCyS?=
 =?us-ascii?Q?VuIdXrXYTyWOJF6vJjX1SfOdDF8FTl88c4Juoc++KN10jO6rt7nPBeJDIVw8?=
 =?us-ascii?Q?k7ecYWgg1jU8rfFGS2sIa+gx89Pqe1hm1Ke1YF3GcRVhcPxEbSwpm820NC+q?=
 =?us-ascii?Q?x+H8vF0s3TdJUUepE+8dhMLYwVztDFZCGfy3NQQflGdTVw1ivpx8korlc7dH?=
 =?us-ascii?Q?/Vax1WrmFG2h6qbrMxxctKEBNaY3Oqt+mT18uPMl4fAOwCPpyty8lLtwQs7+?=
 =?us-ascii?Q?3d3BpQBhCTx9NYDXjdl8mUTc316D2Axlf1Dh/9bPDca9Tg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JZJi4VHoouasVdOxgf3xughtoTZ3KKobMWo/yOeoHJb9JXSQopn5xfhCeZnE?=
 =?us-ascii?Q?d7gNAgwqIrElp3kmi2QNmGAy06eDZF1SnETAGagSi0ZbA85ZcrFKcvIwHevp?=
 =?us-ascii?Q?ZTOnfJ3vqBU3c+Eu5GyDr5cMJmH/yCKqRnDRkFQdt0hWAhGBoAZPCHgZSrBY?=
 =?us-ascii?Q?AM8QzO52tpAoPXtsZBBESXdirCg5yuegT/mGY0ZuCaC1kS1TLG1rhQD2ZeBW?=
 =?us-ascii?Q?VI7XRKZx19uqGcBT+D/3781+aj0UJjQ30oiiQqf8zWEF/QdGPFzGVSSJ6kuL?=
 =?us-ascii?Q?u7/wz0zWUqtiP+Pm8wnHiA7dumWMN5ePRIoDJ+KirLMzbo755TCo4Rt4oLyB?=
 =?us-ascii?Q?gjD8Q5zMtgJKTpTr2YAlGHOwln8jqJFlcKK5zIOB8ppoVWU2WZqlZJsR+nix?=
 =?us-ascii?Q?QWeBjvpUvEi3caxK5EFt85Ua7iO6KXqLuD/Cx78/d90z1cw/GthfQ9W2OJDu?=
 =?us-ascii?Q?KpcW06TX2fPQM24PsyRNQi2QyEtRskmn1DgAbqLt+4J+DrpJZmR4gOQtXvA4?=
 =?us-ascii?Q?eTI9diXAQ/h9H69DGsdeCjtEPqfQq8mIm4bbMVV7AZ+ZgtxYlyFpSusdxfh+?=
 =?us-ascii?Q?L8c2+sxNQEi5Stgo1v+JdEq5afi8slr6n0KmmJrmt7X9EaLgwjbAldtEmyi0?=
 =?us-ascii?Q?cHs/3TsU+h+dZ8LcnZTjpk0xhT7ibB3837vvfQV6bNSY06efe3Fy7kYTDSGU?=
 =?us-ascii?Q?AnLlFhrC3b/vNIwGblSNUMS25W+702ZXnfKJdSrF2ga2PFj1/PFrAMKkdbcT?=
 =?us-ascii?Q?jU6duddPJv+5RNrtS+qtWXvhKvKOnQwNYQtqgbJH5+SqgZloRz+74GD9JGUU?=
 =?us-ascii?Q?phSOUxFXmAbGq2OBNT735TpRzCfNpUCl9ZextVk6ZIVtOrOBJNs4sZELmIC1?=
 =?us-ascii?Q?OG81+gzSb1detNs3L9DXsDNQSMdXOlFFa4c87wWGHnn0vSiQAtZp4BBptK/W?=
 =?us-ascii?Q?XxFOuZDUyUogf1hSKu7aJwteH/0qG4FtWFbLvZeSrgqjdedqkYEnKq3JJpFy?=
 =?us-ascii?Q?Fm42ULVYiWpTC5duTNCNna8FKk85/OeY4ttbNvr4j9i0D3150ZjTyFC8Xfkn?=
 =?us-ascii?Q?wvlqPfzNgMt9DWOLRhpu2Rya80dUNEVKhNPTfYiqVtTW3sSp03uGpOh+Oh0o?=
 =?us-ascii?Q?7iogr8aDmIxyuhl2z9aOJhW5vt7+pcoi/0wuGJ4uY906aLj6kRCqa4X/Sc1Z?=
 =?us-ascii?Q?mIZGP0OpUCfJI7SVSBuoaC+LeNkazGHaXXMqiEmqlZgEyEc836GmXeeKC5JO?=
 =?us-ascii?Q?/wTYvNQ8PGzwy9PU8QBlap30MYK30X83zDqgcFzCo1gaKTP7VPMbMhGBUzZ9?=
 =?us-ascii?Q?abWL/zzwBMhc3YBT85u91K0Voh2FVkKFtBoNFtcBvrnOCpkSVkXfTQxnmPux?=
 =?us-ascii?Q?3p8ClauknVlRgzQjwAqRUdUeXdjnJ3fJsyjCx5c7wWZAepj17NdwKz8wfaP+?=
 =?us-ascii?Q?nGfmg/MA70BSSiwd6gHXNmKTRsjeFkFT2Xrjc3NLieDbGR+zhwrjzTWQbDZ2?=
 =?us-ascii?Q?DrpOxG48apQnra6+B8sioKLRySvWPQAXC3dAvTaFkJT5GMzeJ5Qg04bdUaB8?=
 =?us-ascii?Q?5wkBRfRy1OjYzffAMKEsog7f9o/qeITadEtBSaFdxtgRQ8kr9IwY2pG5fD7v?=
 =?us-ascii?Q?baYmGdi+omjsWcHddBIR5tg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zMi2Ot0sn04LvQx+LitmRRib5tt8RZ8q0fYS95cLAeWQrUWh7zSDEzGnU79l9vPG9vFzH1gZmiXw39/vJQRbmA3KBIjkxwyw7PxUCF1S4HVRZWbAepVKesfA7jIzh3TCgXw8RsSQPfkme+b4hKeXcOc1MEFq7LvRxGdQyLrEpG3qUFtTng9zDnj06TCAzi/uqHiJqXuWZIyOxe1M2869Kt3TLkNJr2bbFQrhX0KyEM2B7QfZIMIs1r4TcgE8EUrU1AsSSxqoQrHHLCRxusaCAjHSqqYAib/JgEoAMqO6Gq26h8dvyngQq4oDevGMNXOAM05LqtlgjA9M2CxtgbzSi3HiJBioAUKUfBqTtv0BkRDt4CECjoOy4Jsj4BWz7TV4B8L/ItOtTxJEqnr8lBrl7uTVwGU5KrqpJI0cgzSZ2luAjKXdat+09xl1bp+wCKGgLh1qmMAYQICUPp7loF3gVZTLY8Gzdldoef/tVwvNGhNDEmfh/JsA9iW1pzlZY+FkpeMen5Zpp1VG7+wgS6cunk5lj+8anVVV2/PzYHNnXh39/Fm2BT5IsJRZ+WLe+1PEndeBTNh4zDWiOWoDsGj02fividm/ru4pVES2MbDUMfk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de264da-771c-4f29-f8f9-08dcc3ee2e05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 03:38:12.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGDSX+DHYR5W6/liPVKMUa2bPTby7HgwXfFcRtyw3QRpbflcNlaVo/47WQuQSb4de+q6aiK8eiWTQcsgf/eZ5O4Kx/9/PFuZbIoqxbc9IgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240019
X-Proofpoint-GUID: LQ4u_gV-J1XUlJbrGPVxWUodGndXd8J3
X-Proofpoint-ORIG-GUID: LQ4u_gV-J1XUlJbrGPVxWUodGndXd8J3

At build time, create the file modules.builtin.ranges that will hold
address range data of the built-in modules that can be used by tracers.

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v8:
 - Fixed some typos.
 - Added support for built-in Rust modules.
 - Added optional 4th arg to generator to specify kernel build directory.

Changes since v7:
 - Remove extra close(fn) in scripts.
 - Make CONFIG_BUILTIN_MODULE_RANGES depend on !LTO.

Changes since v6:
 - Applied Masahiro Yamada's patches for kconfig, makefile, and scripts.

Changes since v5:
 - More improved commit descriptions to explain the why and how.
 - Removed unnecessary compatibility info from option description.
 - Added optional 6th arg to verifier to specify kernel build directory.
 - Report error and exit from verifier if .*.o.cmd files cannot be read.

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.42.0


