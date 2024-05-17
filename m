Return-Path: <linux-kbuild+bounces-1880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD58C8074
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0B0BB207E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B1FC2D6;
	Fri, 17 May 2024 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ChuqsNFE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iK1gz32p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D066910A09;
	Fri, 17 May 2024 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920337; cv=fail; b=SCvKp1x3kquHR0PUutZpUN9W3HPTrqHezjkaDJ9gTCsqrnRX01mVHjKQl/4kKzhUckBx997eBilcSQCZEjurSSdeEzYx7blTrAzsx69XUFxuETeZ+vsJP9BvbTnAIDPM0BigdPL+kKXNm41De67thoxAivoZQUjetr41XXzuhMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920337; c=relaxed/simple;
	bh=0mrgoX/ecMRptMm/3JqLAketUUWrCeS15wfajbw4X6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwXRSZcjfikjkwTOGu2sYKrfs8lpCpieCV0QCjAkC0hUCDdgaeGYa8XyZL0mvmYt+3uS0FEK7WzjK4cq7w51FD0jzb3/Yb3oxrNrZJmDcln2l3LLUnajHNqdHzvU9h6aO6NEZl2Po8Cat/FlkaMu1GwegwA8/5plY3FJcvlLDRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ChuqsNFE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iK1gz32p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4V6jj004385;
	Fri, 17 May 2024 04:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=NhSF3Zh4E9nkCkMk11/kegI7L0J93Md1E83v3afjuOs=;
 b=ChuqsNFESA5ZNLnT+WF4JmBv5XtnpaDkJXawYqphAsoLUi6fAZ2tsIQmCRpZRiygDaSx
 3Mjnh+5Ppf2N6umYzrsHmdFhmvEssJ2dsliYFs74Vjl/LSHhLAwATlr5ejkTBs8eWmh/
 5DIhkh4sM6OF3v6t3g8bXZks9cM3New4eSQUbDA9V1pBuNkfbUxxtP39UUE83Y+J9qGN
 A+14sBr5q4kL4wDpGuNjcwBk1THR0Zz1mBrRddH0zehpafS1+QGtEXxwWczRpQYnuRkl
 e9elB1AhdNw11ZSBCI16MqnTctJ843DiSycjMGMYS2nHogdzEsfhs0Qk1C6edNvib/Bv nQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3srry79u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:32:09 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H3uUJx018819;
	Fri, 17 May 2024 04:32:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y4bfq5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:32:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG1smhnb1GXgGW0j2WL1MEh0yGb4l9uEbuE0X5PHuj+Z4TdG8tQXbytMrYA236Xtl0r6UZTkKXtMU5y1wxiJBidVRMPKgNckb8s6fsv2X5TQSPvMAf7fYMAOWR8NlVJUn+B4Wc8BQuSrs0+a6L+lbSle+euqIsVbKnR8RrTp5tJQOHh1jLOp/0HgvdHVgafv5iA8zaspxM0xWrvDlJsW8H8nOq16z59JecMEcS8W0Pn4cVqiKQT0kUl94Y5ZmFI1+PL4l680WClAEYczB93V9hO/yoyC4RqUAFgmkk1IqWnzT2Ink1cCwID3AuL7TkLB3jUcLD9Lt3ChaMfuEi4K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhSF3Zh4E9nkCkMk11/kegI7L0J93Md1E83v3afjuOs=;
 b=ZfWtaGwKo2Hg/Je10MKqZtkUyg9ARvfwq7IVL7gku9Y1PE+eOgX0SqhrxpC2VxW2gLmXmoKuByQ1G6p9EdTv/reauIXHZv8cL3G6MOi1rdcPhQV0BY2F8GmvW+n/S23bpoPDDre02WVw1A0XFQDX5eBjz6BNpHIB/OBOff5Hi7up5MaGh7vTrgwosIpgYLw//lTNRXFxmXYeXbK0+0der7WjUtlurUg5lgkhlZ6hX/PejPRJlX1sFA55sxmtzMou3omYgTgeZZ8FcJx7+DrGpAFsUdb/SiaR4T3gpHg+zsWKzjfwoVLcPy7kh2VispeZCLmg3D4EOKXOWei9/qOxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhSF3Zh4E9nkCkMk11/kegI7L0J93Md1E83v3afjuOs=;
 b=iK1gz32prqq0cDk8a6y/f3ScoN1ZKBn6iURDGn9hxLctC9069DtPl0xQ4wGJhOWD8cIq7ReO+kaE2/notMbvvkv8opyy2zw+Abx73vH7VsPKqjjjfT2/tk+KQWb3WA7mP7WGQsFI+OXiZogDGCcKJfFYiwBLRaJ1uFgDGoxUdcg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:32:07 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:32:06 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 5/6] kbuild: generate modules.builtin.ranges when linking the kernel
Date: Fri, 17 May 2024 00:28:38 -0400
Message-ID: <20240517042839.544650-6-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:91::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 217835b8-c8a2-4e26-93af-08dc762a4f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sBGhfNuIAAfLBua8e+feA393JKL8IHBEx9hB4Lx1OvWZOzCBLmjMsh3iLAlx?=
 =?us-ascii?Q?4mJtTIke8U9NOVhQeEDB5rJIUAYv+69FZle8YSsQ78RRJAnVlTulhOpdzdgP?=
 =?us-ascii?Q?y80VIksmCZM/kNGxUncOC/PlaoA/MaiLykqbhCcMtpbnkel5xZK7ehfkArZP?=
 =?us-ascii?Q?9QM23CWHxB4JRkmKFbKua16j638g3Az9z/nhCflG0aIINpEJNpOG5KuZ7JbH?=
 =?us-ascii?Q?B/4rC30F/y5dPcx+BHdORsxMa2kcn0PWysq9cD8849KxF9Q7ZV81DSHVnO8i?=
 =?us-ascii?Q?0MKgxBVX1EChZBT4mXe9cCo7M1ATXKsu1F9hOZbebUffPYQWrm2ztdjGQaYp?=
 =?us-ascii?Q?3Nat3Sb1E1VvUR3H0UE/y66RrvqanDzi/uvHS6pBQ6/ENwvdVMzPXNfMdyIx?=
 =?us-ascii?Q?jlur3+LdZHrpC3bgKpcY81FBZQv0K2sUUgc95OV4Ej7p2bOI3nFdbu4K1j5W?=
 =?us-ascii?Q?4f544H6Of8ptlN+dCLyUqFzFx1Kf04C5mJwfptbX+OwU6y26sdGEPBCeci4v?=
 =?us-ascii?Q?/ZOu8wRc3EfX+pxgUQRiR2PzfblXlTDHkaJPCgdYq59bgPR2DdEj8VYTqUSN?=
 =?us-ascii?Q?+987/XdOjJQaeVRbilmjUBZpJPIE1RQZreNvfCJ6BTuIg/if9mJe2UgPnVEY?=
 =?us-ascii?Q?fR723WNiax4Z6FVn201Z25aJ3x+WFGLsQinlK0/Ze6iZe1PEuenGbEJXXjVr?=
 =?us-ascii?Q?OUT1hDoYTwnOA17jNFsMynB3MNEtqJz7lJeoyy7jg3dektHP92J90BZYJQ3e?=
 =?us-ascii?Q?HcyfxE0HXKqKUTENTwkWU4ENOBUc0Zx0KCRwhhb4Y90gLfJ2VzxZJ34hivT0?=
 =?us-ascii?Q?OmrCewEiROkcpgLpV+FWZmz4xT1uzr10mUm+984cJwFm0KndNXZAcrKwow/q?=
 =?us-ascii?Q?UrSR6knZfnHCYlilnky+V6ButaWXJQb8EKEzR/C0NybgIB+oDxxa0DrFkLJS?=
 =?us-ascii?Q?6FCqKGVrFCxuXdvk9B5iXKQf2LKvMR7c+4ZQ0OpBw6jZL1hqMzlpciGuj/0J?=
 =?us-ascii?Q?QYt+t2y30lDGXkonDPZMlwlMliulgj/kWyxgYk5qYcNN+zKyK/UbgreYSeoY?=
 =?us-ascii?Q?go9JZDKcL7z+AxE3WJZnBRPxvyRMx2vxUFn+2ETD+vgctymLqw80eu/XoB98?=
 =?us-ascii?Q?PG6ZJj2A/3eUj7f6Go+OJLtCmGa896u9rAcabPEGADAApMo8sJtfWYj2mmQr?=
 =?us-ascii?Q?GQSM4j+Zg/QN/c5c3AXdxAlUEhFKVCIGGOrep8ynvKp9IOTepCLQwnreOlup?=
 =?us-ascii?Q?Zq9MdWp5ZWn7hgBH7EUUp1RFiqugDZyab2Vc07rejQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IbdQnHmogaMrLVaqBfy+18tdISq6yfRHEqs9PQjRd5DmlQMc+H9w0HtTF7FU?=
 =?us-ascii?Q?ljetoVdCHH/2xwOnRX3DlEKuPRUx6IsnQL1M07bDXY2zWWXxN1jw72FIzq5N?=
 =?us-ascii?Q?lJ1DBnQG/0482+XtxwkC0127IFC3ZaapCurg04f2+mnkJd0qydG7iE4x5I1J?=
 =?us-ascii?Q?VYWFsoJjrte4A1jn7G0tpWlDTJW5xBKwo/CfddVcY59asBLUf9mSFvDanNz7?=
 =?us-ascii?Q?GHumDPHNGdBnBcgtAoaxVoAtnKQIkq4k4hLQpxA07Wn+sz0tHLr+m3JJYVlO?=
 =?us-ascii?Q?K2xnGSWP8dp4/CxpxKTjisu4+aWYqwI9TmmoEeflYs46HguSZ4LYEFFLLgz3?=
 =?us-ascii?Q?0cy5oCVpH6zKgeKEZBQjPwsZhGaaIXnwebcFrtdXxGU1R1KHbMAXRg1TkVLn?=
 =?us-ascii?Q?WG7BvUsUbhiinvkHj9NQcIkdX0AHsWbuCEp7kJIw9jqeUWqGcBXA2+FuYky7?=
 =?us-ascii?Q?o5OnSlZhnG591+zpsXBpu+OwwajUa4k19bjH7005FwZqLq9wcKN4SHm/DaeM?=
 =?us-ascii?Q?wqrspQUS2qNqLv2R/38Y2eO2fTT+inO525pwiicnb3OuWmNIqpkzl+zOQTNh?=
 =?us-ascii?Q?qFfy8EoJYj9pI06mV7oaiZkKcya1nTRDnyUBFD+AMXVeNKotWY/vwfFcMkdD?=
 =?us-ascii?Q?fTX9/SzqLwOLn9e51TlbK26zy96CVaG0Q3kI4Lu4A0iD2xYxZ/x6b2zW3D6D?=
 =?us-ascii?Q?RmU0XoR3UPRKkf8gUNwX+4Vw8oZHauBy7TAFNGr6mRczmesDBywhFpjh8mfF?=
 =?us-ascii?Q?+ficKFjkzIX9Gd5NQCwtypYDszuj9EITxzrY2J4SZUv3Gw/1mNvmOcdXFqAu?=
 =?us-ascii?Q?EjjLutewQ4gnqXsa7Z98VFGlC7u0/zyNv9naWCN+NVeprfcu3KcGiXEvwTzP?=
 =?us-ascii?Q?lTiD39kqggUIiw2sSm0L5hczUxhbRrNI2CEQyxKid+YuDQoNTio2PQ3MgVIQ?=
 =?us-ascii?Q?5QZh+9T5yJiFKoJZNIP0n/SP0RZx1j1pDArvKQDCBUEcpWrNusxh/TInnErm?=
 =?us-ascii?Q?Uy7p94/M/1NltUi4xLzSrU7nGKfQcN5lp/7z51x8sSsN3MD2EhXCUg1VQwnS?=
 =?us-ascii?Q?hWux7XIC0BPDXuCSA/r6ZZCxZOMM9Wp6dCUNSdeuKUcMeEmyhjnwrqYpGlnP?=
 =?us-ascii?Q?8LxLkqCKvAt6eHIj7MGPEocgh846kqzv1XFNBJlMVQSHZReXEBIIZDAqnhF3?=
 =?us-ascii?Q?GoYs/fVir9LOzZhSfLhUtrWwPYNcd2MXwGHs0XuoBjkrrmq++ST3FPUZgI8G?=
 =?us-ascii?Q?D6gLsV/TQHbOQ5loU/82n8A+VRLit1sgbd8NwRVKeMK9vtZFWL1C6lJLCrnS?=
 =?us-ascii?Q?ZzGBsBHZquWeRRELZrC3/p/SzRW1fl0trlGdS/HzM4ySuJcXTrU9yncAt2Bd?=
 =?us-ascii?Q?6M+14rC/V2knIyZ7HYJW+EByL+wjTacgFhfEoMzmEpG70lh5/HjVnp24mPRc?=
 =?us-ascii?Q?J1g+JBrZAwdLVYuqwJEV//jcXr7ius15+2Q8uWKuzSGGUQRtLc21Yan6V3Tg?=
 =?us-ascii?Q?gDf2db0AWgI4vSb+GOSpsqrtaRU7+pnVt9/DudS6iinEz/V5gGSTVF/TxDOF?=
 =?us-ascii?Q?4JoUHX5M85ksBmE45sMdqKG8+HOf35xG7MuJt9CfDx7bIhfOADOR8FcfJmBb?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	z07jlB6qhDxPFNfyV904SbqJSE1boNqWx+DgPS2CnCJj6cP48z93yhy/KE6RCh7ZVxMAD1lyHv3him7uaM6b7Awln0WpXEclE8lY/V5j7BSoYkQ+S8RkT38qO2V8IVnxV5Li2xeRkn7ABwHXlWeLaPQEM0I0469B054dUGuOFRvYlsOsWc2VLZEO3iiVOvL0AL0k+X/scbJGEsoL+h+PVAn5YBi8U5WTgPgQ4JH51dKrVOr6uQZFAf/yG3qlQ/lQxZN7nJ1LcsgljUuXweOE2swAhFUnD2B34m9DgHK4oSrl4Sy+FF6gCYXboB7cowEbX3g+UA/hvb4vNvsB2who+75YDrKXzEfZlWs+7WAs3LrL9LNApD38SBCY/f9TF4/DKBLg5Gr4bkRorm5G4sY19wI++KVQgZiPx2ojfqeXJU57CoP4YBCTXWxjSRxDaPIdrlsGATMKPXoeuvOGZIU3wXK1RD3BtMD6ZyL5vbtEgExpnNgR6bezIP156RHIxLJaVzLF1WlJIacVkHkK550K4ZuCNENUtFZp59GPbWVx9EqiyvxaovHONipp313pU2OVifKUcaVyVUUG4wKGJ/HSPcLdOJZM5yQYm2YiYATAkSo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217835b8-c8a2-4e26-93af-08dc762a4f21
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:32:06.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uju9xsSffIzBGqd2QOstq9D5IO4/JY/P/wACHZcjJBjlbdZGRnVkgmpnpaVERkcP3z9N5nXJODrNXbUITWs+AVhB5WYalDrrS56kIvgOYlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405170034
X-Proofpoint-ORIG-GUID: -1gHYEWlKQzcp8SiYAN83oHzN0dtzxz6
X-Proofpoint-GUID: -1gHYEWlKQzcp8SiYAN83oHzN0dtzxz6

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v2:
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Use $(real-prereqs) rather than $(filter-out ...)
---
 scripts/Makefile.vmlinux | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index c9f3e03124d7f..afe8287e8dda0 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -36,6 +36,22 @@ targets += vmlinux
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
+modules.builtin.ranges: modules.builtin.modinfo vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+endif
+
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
-- 
2.43.0


