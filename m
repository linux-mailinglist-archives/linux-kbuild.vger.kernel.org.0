Return-Path: <linux-kbuild+bounces-2548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16128931F25
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 05:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65BC1B21F8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 03:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DE612B7F;
	Tue, 16 Jul 2024 03:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rrs02kTT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oY+QRDbs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864BB15E9B;
	Tue, 16 Jul 2024 03:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099473; cv=fail; b=h9hXCF0aHeZTQSz6oYPqhGtM3Vnxfrxg8DBAhwfJaspnsBFMHdW1g1mw0UxQ7rZiJmCBy5bcg4iD3XMQeAWcFc8a4YwLF2qgfroAVEzmD0kmO/paYEsH+Prw8hjsEFtADvANdKFPAYYQkzKz07q+YilZSI8QeX1fYoN/qHYNdCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099473; c=relaxed/simple;
	bh=MsFphNNzIrm665GZs44FV83fIgDjHbgKAL8za6iw04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LRh3SY4e1OJk48SeWUp3GimPw9+W6dYDKTFJZLcakoTuc8oEC+x364bzEuAKyxzzEi3GfldqvXanTuUNOVCfJVZO02N/0X5NIXlodepvwI7lGKrTcAUJVfcyzhiRxAlfBm0J5tRe4rhtUaZF0wVKXb+HeJ3+IaNrNnpI1IMKPNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rrs02kTT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oY+QRDbs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G2tVw7018675;
	Tue, 16 Jul 2024 03:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=m4c3ucOqmDr97syXOU7V70SqxL89q4TiuShyDeknilc=; b=
	Rrs02kTTM4XEi/53ikchud3sAOm3QQmS+aJ0/g7B9ZQ8qHlmOpv0JI3M0vb2Rvz+
	b69emcZ0O+i3eHVXWIay+SQPBPAzeM7cZ7tBfML8ZHVSTN36ZgfBP2Bma4WrNCoi
	hwg7fFQp27YGEXANyOMyAXXE9NH3jCKDjW1uqBFPgXCvF/Ny9lIKJSHBrsDFK3Od
	oRCDZE+vVcZ7JP4EazqXX6CZwNEbO1Dn+sWVEFFRlDnFSYO8sJ6Y2AWNZyNfV1EP
	HkZmEPaMeNpk69WIes/VcOqY/hhgN4guyOQBA+hK0xSlj/7xpQD5yYlPIuo6LZ0U
	gp9m9AwwDc/EPt3t31tnwA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bg0cmtfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46G1YjQa005860;
	Tue, 16 Jul 2024 03:11:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40bg18pnem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMVO1faA6ByhNsdkejYw8TRgNq6euH+BskZyHltS2rDVCAzpmnT+gopLRIAjsQVuERN9yCwMmO6B2FOOwF0WnirtEvi16YuRDCVeXS4oymUUixW4wsCbIyX07zM5byJKHswrPb5EljOpKVfLGYui4WZk1r6BwmCKFjHkAaQh2rbPSUi5qi2X0HaQ/tNEWj4vT9BLVuVeM7h3xj5A8qliYlu0fqzirOY/s0aO0SyJcNJ+RUfb3bC7yheMLeh0nB1yeya2Z9xd6x0hu4TUChOI+tqVubZ0VOozQ1GWw43uyqSBcQhIsnwOQmI7gqR5rcJ5Uup1eftSOOGlbUM7L2/R+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4c3ucOqmDr97syXOU7V70SqxL89q4TiuShyDeknilc=;
 b=TCi8zZ6q4eYNJalEEr0rQFeZmMr1KDj7xrhnXn4XxlK7RgFiqfT9p15NKjJPM+UtlNaezUPNZgj7JRQOyGC3s7Onm70q+ezC9g3mh1KSNF5PJTIsnhh5aRfLFI1DiA3gG2i8AeUGsJyxpHutR/wKAdVtPbiLNmcF+sOTexV2PYl8rQY1wV07ZsaPgmqGxBsELSuMAThj2yXRJLJQWgOZGent4rXOiMSkLlW7s2xN3akBEGOw5J2VV49l020SAhAedL0XaRJVmy8kq2L2l6KYM03tdcMF7N8AS8aN/7OUWssjaF/Fix5PuOzfMWU2rjorAaTv2vWIojGSM75/X4LD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4c3ucOqmDr97syXOU7V70SqxL89q4TiuShyDeknilc=;
 b=oY+QRDbsEXZdf7z+821yDiji66vKBMT6B9ldAjh6rrmjZsfU8RQE8B7v9B61TUBwiwFsx1+er7mTCmqS+gMVuWg315VpdhCyc9bjwgm06uK+0POscZwE7ToN/n2BWP1askIL6Clzb26v9CD+fF6T7ZaXDcjM+TPwrgW1+hb3Goc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:10:58 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 03:10:58 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v5 2/4] kbuild, kconfig: generate offset range data for builtin modules
Date: Mon, 15 Jul 2024 23:10:43 -0400
Message-ID: <20240716031045.1781332-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240716031045.1781332-1-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 945fb540-1d9a-4497-eb28-08dca544e9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ngxtiY9/PaPSRpv2ikC+A+Oqkp0Sx7CHhQJDusb6/ttP70pA6UYA0WMeEfrr?=
 =?us-ascii?Q?dkOZvox+UfdhkizALbVpLDYGEsdVkoOsu6QeJvYmdUejooIOebOzNq9jJ2mq?=
 =?us-ascii?Q?F4XhCAcOv8TiQ5/nIsJI67UJzntNBRBsiWgQpJtNyS625yuOa/MtycASxf5s?=
 =?us-ascii?Q?XwZpZAupYNiy5hr3UJH0nN6IKsECfFtJz2FDshk7eOuCYcJY9BjSctubJ58F?=
 =?us-ascii?Q?MnQon7H0cwHGoq8BEkMIM29lPieumGjW+Ip1gxUKD8tlNvarE14RmoR1cXsX?=
 =?us-ascii?Q?udnF990G3Mq+iKyOeJ5iSn3KhMK5xsR/zB10iPZmnk9y8o4VTk6Gl+ae+JIE?=
 =?us-ascii?Q?mfFO7OSGngfE4VVJmFQ/NDFkhYyxXDDYNXnsU+DxZE4lUVDt6+SiIMKU7MpL?=
 =?us-ascii?Q?m0sY+w+wNgKT0CkG06ZIyZMjZEi+O4zGwaJzenrD+pUSdmQZeDVVstNhYQ+V?=
 =?us-ascii?Q?uvklEwYCl/Xc8DgC9P4WkaDUPoyJmnK3Dv3a/EmCbDDpBfvn+BRqdOdFCPZ1?=
 =?us-ascii?Q?q64E8ITuEPhMM4PpVCL9dojNKUlC2On9HdW6K6Ghly7at6WHc7GFGh8BXtEq?=
 =?us-ascii?Q?QznPEJAS4q8V1eHZDfYqFhisZIpVWw2VYTg3/Dgagt9W9ijumPvaj2DyH6Z/?=
 =?us-ascii?Q?9mqwNxXsq4MpMoGPlTRUU6WNmoPbspO6pt1lHXvSXdACYc6JU148UJqBwspg?=
 =?us-ascii?Q?LB4mDQ7htU0MqVQRGyaD70g6NLZeVhtB4RcjB86ISiC9ysaWKV0ibc133KWo?=
 =?us-ascii?Q?9S2dTJlyiJ8/hRKbD+tSEze2fiD5bjbEg+6njeOrysdgP4I6s+wwC+tsvhef?=
 =?us-ascii?Q?3jZee8IJO+kZ48ysokKVCcQINM4irpsVQZm4/uSGlSQGawtDmxbG7O+wyjnn?=
 =?us-ascii?Q?aDA2IDygcxbKt2KA8ZG6BCFTeOFdfSplH+KAZwOjhSNlxohphJinGS+yvIDE?=
 =?us-ascii?Q?UIBaQ8Pha8N35JL2lTpMBvY5NExxmkXz3bBlRcyptQINoV9gdz3kvMEabNs8?=
 =?us-ascii?Q?B/wTanm1ENZ/+gh7U0ETkiW1XPWP0Y+tzQFbT97+h1LUcj0jSFKDpJjC7jXk?=
 =?us-ascii?Q?GfERRHnfqdcEwdSTJRkZQqwwYLbquXYMBSNvCbRBlAnj2TPuA+Ua3mR1FaG5?=
 =?us-ascii?Q?pKdCNRMAbXibtrzWokNw/wDhsHnII/wE4PRNPbOevkE8i5HYekPgbqBmuxVh?=
 =?us-ascii?Q?WBmMgbWU5rW2BVWDtB1nnMR1xqN37oYN5Ia7Kr5mcyOggIAm5huJh86lrTsc?=
 =?us-ascii?Q?FypOZKeb0sNQYhCVtt2J2lBbzrpDQepnSao5qvI6L+GmhiMFmymuae2LGt1R?=
 =?us-ascii?Q?6vk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QMAtkMwMLW52viN1l1Eu2NJ1qTOAacJZmM8+IlArwETnC0njYeAAjsvXu/9e?=
 =?us-ascii?Q?sUtp6TCLiNMWTaLL8eaZd/BzOszObdDxprQy0V/vEo3nKm6HtBocFeCTWvSB?=
 =?us-ascii?Q?vx28gJHe/n7CXYW7vG5gDxVoeECmu9HiBH0efoGfgwHNQb1dx6FzL2sT+mZe?=
 =?us-ascii?Q?C0vKO6UvFdsF6w4U/AiJVy1fBsdF2OYNQONYiFuJMF+LacNWVmgaIuWBI5Uh?=
 =?us-ascii?Q?l1lzwFNx2fFOZ2Y9lExzOSLgHHH6T5UN+tB6glDhp1J6qTGpKwymbtPkkQI6?=
 =?us-ascii?Q?MPscvnJ8thRpR9aRykyWeiJC5XtmsUqOJHPNbvdQRq4llPzEgc8ht0qCIuDy?=
 =?us-ascii?Q?PcIIle2FEpXLfuFYDYFPr9F3bkmK6pDA23YCiRlY/3LQejCQzKLMpeC9JuA3?=
 =?us-ascii?Q?Vvb8XU0JsxqmkEHVRAJnmiDDSV/AAs00vWM3Sw/1CbHPdEbsnyXNOwwWPhnx?=
 =?us-ascii?Q?GepN/sWCIppTvvnjQ+Ql9Q3E+ILg2UamvFcsPFKGXW57uxvDQvPQn9f4wMlF?=
 =?us-ascii?Q?EGilneSwP+Wc7ePkEjjGQ64q7GycuSHLdeyuRTg0VtbraoHR1jcJH/RD9QS1?=
 =?us-ascii?Q?3bA/wxSdqzTCC6Vwz7KUCs9dgLAk5CtZUriMaYYrHbcS8dSVczxLnuwwi/hJ?=
 =?us-ascii?Q?oSiBNREKP2CBzsZHMJtcQJgjonCcNlRaaWn0Hkml4Meruk1vQkYBjjqOSDHL?=
 =?us-ascii?Q?oEZpTpXFpLSQ1h08ypF4nn3rZJpuYbRkjJuArpn0cJTh7PfdwYDuyX4Xyeml?=
 =?us-ascii?Q?K/MXPuKGscqJBmRjntpyNGBvYhR9jSg8RL53x3fkU34Fd43EDxEHp4rvO5Hq?=
 =?us-ascii?Q?HamxHJHmKlA8Zsu7k9MCFqKwk+RVKt7eZP+RRsC8o9RCSgOKURX18iGpPwP6?=
 =?us-ascii?Q?E59EQ7eBR04+g2GfG0Gnb/XagzpmMaXs0UhsCCSsWlFIOM7U4kT3OLTWrjgk?=
 =?us-ascii?Q?Sdp+G2hX2yq9aD9ZESRqItLN0WCe1Og7NdeHdiTLPvm0EqAfvmEx4wAT3Ah3?=
 =?us-ascii?Q?LWMq7ogbvoWlhG4EYBclnAxFc3NmC3rpmAYAq0kp5GLVafRGIkVJKjlAF2kQ?=
 =?us-ascii?Q?D8ikWB6Ijj2a3MIuWYcP3GqUhGxoqlw2hqWrlz2b4b+buJxW9AbpQQL1FJct?=
 =?us-ascii?Q?mzG9XDrLduu0pX9rAA37IwNHAP/R7+sU6kgYVPvD2dEIUqOF9qzsAx58Njqb?=
 =?us-ascii?Q?poDxOOwIiSexy73K3YQNpJ1w93HhAlS+QUa6KdSBsfOlzi5vyY4EISbOeBvb?=
 =?us-ascii?Q?dLESGxkPVTazPodMgVt+XjVgaMPXtdRKKQnTXQOdpDgsa6/XRlwDhtpj0BqT?=
 =?us-ascii?Q?9KKjwj0/z+pfEm43fjpLFts7qXKS4JXpUdvBXUyK/tlg56BEyM7Scj2AmmSG?=
 =?us-ascii?Q?Wd7BssxWyV76WNT57Gl2zvN7SIQgJqVCeIpM7jvKg/XGqyWFsPmw1ya/V8LL?=
 =?us-ascii?Q?s1hTY+FtShLLDaCaXzEzlOFir9z/Z7TS2rhiZaOTNp85DfpLsHQTsft3AvLY?=
 =?us-ascii?Q?0SrL3qRR6+nFIYeESjJlyNrbCLr/n+0Ei0wnPhYm1oOsLTo+uy9sEBleax7J?=
 =?us-ascii?Q?5Jgn6WFgEw8rOoGKAdUJzqBvV4z1Mjq4g+AJmh4iqhRwNr5Aa+J8M8hsgdlF?=
 =?us-ascii?Q?Zt1f14SXtVHvt/nys5ekQ+c=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xQqODvukHBfSKJ2y3UfJ8sokupI6TQ9zhV0xjIPODewyc66iF75E9sDfeP0ljWLmbslboC85xKR42PEjBI1brReEjs4l3dLfZUgRhllCm2z7AVeuf0ydo36tlsCJNZcQFy34pse492uM8UHBL1//KuIUn8DDS9ZRV1ahZK4dpkZC8HrUVcVvk+gud3Zl/E6l5dGjCz0f5cW8DfeJ6ukDW/L70z3H08wzUm2wjNnXIMbtz/y91Cr1/v7sTKIJlB0wk05jIPFAnIUFCMBWw+mKZpKORyNalzySXJ5YJ9SAc9QVEuCwT+NXz6RZa4irR4Mc0HggUqqlxeKA9UU5oCeC32iPbWB6auxbeaUL6DgTUx+8mr6cFo4ATU9qzsGg43Jar0Bjs6FXgcfOsDsTXq1Sl5xtacG9QXKZFGUJ+BzoFKJYb6CU4uagAwQd8G6sIeilCZi0fWCA158w/tCOpYrCLmU13STsjHDaUmWgk3g8KUVvk+UjtE9XlAdq/LjhePWXK3U4elkf97RRuG+J1ogQqbGuLgxHheiPg8oP46dyRfULmU+eT+QERCbXGgCx1nzVSRs9BIQ5AXsmBjla1lrbmFa8SuUbZWMNjOK8OntXPys=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945fb540-1d9a-4497-eb28-08dca544e9d4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 03:10:58.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WeqMYbW10h1S/bknYIf7T8ksp8J6Oh6tSwWPSWbQwhUiKWItKYjJje7GkCILN/Xn9Ein5giUmMRGyyCQHLdt6E7/c/625+VnNuB1A3+MH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407160023
X-Proofpoint-GUID: fGL6fVAzpbiga0O9Sc79MzO98oevqo1S
X-Proofpoint-ORIG-GUID: fGL6fVAzpbiga0O9Sc79MzO98oevqo1S

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
          - It we were working on the same module(s), extend the range
            to include this object
          - If we were working on another module(s), close that range,
            and start the new one
      - If the symbol does not belong to any built-in modules:
          - It we were working on a module(s) range, close that range

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---

Notes:
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
 lib/Kconfig.debug                   |  19 +
 scripts/Makefile.vmlinux            |  16 +
 scripts/Makefile.vmlinux_o          |   3 +
 scripts/generate_builtin_ranges.awk | 515 ++++++++++++++++++++++++++++
 5 files changed, 560 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5685d7bfe4d0..a37b9c22241d 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -63,6 +63,7 @@ cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
+GNU AWK (optional)     5.1.0            gawk --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -198,6 +199,12 @@ platforms. The tool is available via the ``u-boot-tools`` package or can be
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
index 59b6765d86b8..ab8428c0e2fd 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -571,6 +571,25 @@ config VMLINUX_MAP
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
+	 It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
+	 address-modification options.
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
2.45.1


