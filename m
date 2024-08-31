Return-Path: <linux-kbuild+bounces-3298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D1966F69
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 07:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B62283BDB
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 05:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9784C13C90A;
	Sat, 31 Aug 2024 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eKYteXHX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bgwwoyck"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342D763F8;
	Sat, 31 Aug 2024 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725082146; cv=fail; b=u8Dn2Fe1+fyYW6/QczmJ3lmfAcArIUOqv7kfcN+mZXHNXUDKSgY6Fo9TTaq8rJnWUuIJcxV2cnsE6ZPDErwBwFI/g82sKIP6OdhhqQxbq+9PYYFZGZYlPaIGjObDp0P8YW7q3klHc/jHYBQT0wkJLDz6OVsupn5JwJ7yI4KRILY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725082146; c=relaxed/simple;
	bh=THj040YqFxy2iOmmGuf54OmN9vxHLAc5oIOzM876TzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iprUo8Qnt8KDuvcpqPnRmAdUjJDljjvkRBr+TQbKiViLEJ0IUjGYhHhwtf03xmwyP+gRFVGmVCiGWOTGwhrSvdqHzh3kUZk+n64Rbr8ya7OO7ORoNSc8n5x2U031tqgAHfWy86nlcV/W0zvXYVyTY/lmfnVyT1k2w9pKOeK4/gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eKYteXHX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bgwwoyck; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47V5S3vh010307;
	Sat, 31 Aug 2024 05:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=HTfKGDqWBZV5dJ6
	qXwWtBGsj/fSAPiyGTOzH5K5UTuQ=; b=eKYteXHXyVNHDuVT5Gh3Gbui4NxQdI+
	ncIEQAYDpA6LdTomwKNVbscOAKe/XiAJZ3ZaFSGJkk+YND7/0wT3REVIhw4tngOM
	48YHfTxTUCaTQ3kTVV2QBgjOAb4DYTPPsSZqiaYYB4kQN+8OdmkmzibfKTlVXLO8
	SPOB4DwiadtjCLTkPmyCAMedcjuuJRsf9KXVrGBgRxnXrF8oPnpd2SyeKmvBGIJL
	C2jOB1RIqwk4LJ+YTyel1YQcFX44vm1Gyp2BQ3eevrhOhRJwJR5vHWcVLi9ff97l
	RXtfxINBOK3pSljEyVWz/si270y3LuoJAhbRkLQIy+Z3YLIOYBUorGQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41bvjb00gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 31 Aug 2024 05:28:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47V43mQw008919;
	Sat, 31 Aug 2024 05:28:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm5k7pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 31 Aug 2024 05:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFpAea/h4MmOiCxu2xac57+6ZALlNW/J2neIoIeGfiXN7jWIDLm/H9v8r317Oa2PCaRg5ukhLTa8/aD6QN4BtYR/TOYpGxQjFqOAL8kY1ez/+8WTQc50P2cmw1ecE/TLQOPoZhwDxH/nMcl4qvm1lAppUTYAIiXiR8+1rvJco240Mhk2lmO3tT+wOMZZ8bObEPwGXPkGcM68wghr4Tb3QszR+L2imqUcQSuzd+pXi1q+RLyvQa+aKP5fC9RCScHpbsbh33JpMErxC0NsEw4vE3Gy1HSFADHIgN1QiCqbMNoylmmhTJPLzGrGdGCntcy8J9DR9LkLbmen8kQKnC6+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTfKGDqWBZV5dJ6qXwWtBGsj/fSAPiyGTOzH5K5UTuQ=;
 b=bej64Ca0fzPQgFMp4EgdbEj9q4UbkXc8tmDZmSVrHkpLef0foIfwYbwmzpA4Ls6c8TSU77DcqXxBphKWsoIYgM6p6UiL8VIu8JOKw49nIbsUV07xCSzE+Vty9YQbXpqLSG/HKYYwDhCfKRaS8QqZpyOJT5gARKaQaD4BHB88aG0P292yk9TGvZJJM5aZmF+DdQhXLZvnZjg6QACZStxLugZjFtLfRkuMqJZEQxDss2fd8OhSomC5/IYRZdVUHyFZgcBRMg18iCkzvM0X2l3AgNvLCS23rgAzAHvquBVUuI7VI2UMyK8FfxSv2kxIi5M1VFg2z+eSbIptJ6EegolZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTfKGDqWBZV5dJ6qXwWtBGsj/fSAPiyGTOzH5K5UTuQ=;
 b=bgwwoyck3oWPjf4B4x5NWuwVZ2a+6Ne9Ksb9OEPtzYnbh12+u3NjhLqxJro7I8St5yv4x/mxtnIeIVSH/aeIypknKK3C+HP/vjD3X62F0q0hWKF5xwnVTy4MxDidz2Ic7aLu/P0gYFMDQ+u6qe7KdRhNUhecrgPc0a4kGQAZjA8=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by LV8PR10MB7989.namprd10.prod.outlook.com (2603:10b6:408:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Sat, 31 Aug
 2024 05:28:52 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7918.019; Sat, 31 Aug 2024
 05:28:49 +0000
Date: Sat, 31 Aug 2024 01:28:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v9 3/4] scripts: add verifier script for builtin module
 range data
Message-ID: <ZtKqDsgtxFgE8P8U@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
 <20240824033757.52005-4-kris.van.hees@oracle.com>
 <CABCJKufBPaVu-C4bKY=jWxOQJX1OR+7=+DE-wtcy7=d=9ZFFcQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKufBPaVu-C4bKY=jWxOQJX1OR+7=+DE-wtcy7=d=9ZFFcQ@mail.gmail.com>
X-ClientProxiedBy: BLAPR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:208:32a::25) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|LV8PR10MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e754e06-3883-499c-d5b9-08dcc97dcb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AtogmYJFMsuxj/iThLq81AfaOz2Yr2TSML/sKgkfMqKMZXQBD4dFdLqMvT16?=
 =?us-ascii?Q?XT0w+ceqGlvq10RnjxOpRhHdsIO2XleVnsGNo6rP7VxSamoTydMlaEz2fv+N?=
 =?us-ascii?Q?PS1CQeMSkBihoDezU1/sgQ0CicQYo+musldz7XJnyBcj5bMTxq+SP1HqCB68?=
 =?us-ascii?Q?oCtfMfKX6rcIEk/QC3WVLGTc9ZPwv6YRaolMsvMQrsuqE2mBlaB3Rh2N3c6w?=
 =?us-ascii?Q?349BZQCtZpLRZfeDGcfZ63c1ZG+UsOYaeYcExnHuX7m88h8uQ+gC5K1onfNx?=
 =?us-ascii?Q?LxqhB12yyz9MdFlsZRMvmsIhtA1UxIC1w1wYQM6gWsepbHnqDxHcPeXJWS//?=
 =?us-ascii?Q?6+1hEdBA7WCMz/lvBog8GRRG7kpwAOLIfhcSKrBi0b3Ww8fg2Tw7vh7/FQfX?=
 =?us-ascii?Q?54RZrDiKR8BK8V0lJ3R6Wk94yhpzOH5mlQHCluKTtLwq7tCsi3V2chNwXxwF?=
 =?us-ascii?Q?Bp+4tLfc5NIJfTrNZPTpCZnL84P9kM8+jZfpUG2il1AGmb8xAl6tacbkiHmb?=
 =?us-ascii?Q?RZIf7uQp3Wb1YwK/Mni68WGqtEKA5ovLNX7NJv2kNJJdiJ8RHuw/j0DjVoFS?=
 =?us-ascii?Q?kCftvLn9Q5LXFOB8LDKgJ+q6Q2jAjwzxC2rfM+eDFEYKvUEpxm550ngCOiXD?=
 =?us-ascii?Q?QrpudwsjqW3V+ZqHkg7cZ0jSXDvst3ZcE+DILuA8zkemDBZJGkimUQoPuxyD?=
 =?us-ascii?Q?D+1imZAzc0M0NWja6pcRxBJxbtRpaIbvnMnBwlGaVq03wC7bbW6vXzaBnRyF?=
 =?us-ascii?Q?ZIIvIFXVHzhqDH4HW+Qullp9aq9QTPHLiLCj+Jr8WcP4nu54/6zk9TyBv2IJ?=
 =?us-ascii?Q?/2pB0vcvTYnoolMY8/5B5rewQM8uWXGDXdeAKTm3G1RLo+mPbmzyTW09sUEU?=
 =?us-ascii?Q?6m4WtWuAjvB3ZhvWRiUeGpIzJvFPWK9PjNbrlDzc6GxAt63Z+wL7ZsF6JJgD?=
 =?us-ascii?Q?IzKuJKqtKx4x0mtqx+gXF2AHVv7iyUtLRwqCv7QHxDeCpP17/aEmmt8CkHtU?=
 =?us-ascii?Q?lqeShkB59VaW6N+AUPhibhbL7/ksaJBJIdJKYe2qu3VHDg5wGYT5yd2Ib3gL?=
 =?us-ascii?Q?RrXa04VZkJnW1FbxURgjnWO8qmLM3eCQghXDh+DBxaEkNZajmauKRh3XeZyQ?=
 =?us-ascii?Q?qKxNfbgd2LtDY/SllS2U0Ss8+B8gGGTVKV1sy2qCrYaOudEB3Mei5okxtOVN?=
 =?us-ascii?Q?DQL02+6Ab6WG+OqnHf3cZUpu8PW/6vsqH6rN3GdBrBCW85YeSMxChCt1HGxK?=
 =?us-ascii?Q?1bENPEhwMC6XHLmdXxZ1iGHJRnGNjahKqT+X3Of6bbQnRvkjtvGHf6hI45uc?=
 =?us-ascii?Q?H8MbfsmxR/JPEzBMJnAriQBKKDzfYj/bneDYDJwOBNLDGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fz2KkiI3JEdj37sl8y5osZhXfWwWTUrFl6Ftrqr5Sjyu3g3sjPfpe/hGEoUQ?=
 =?us-ascii?Q?f1BhEGQjsa0LDTOGlNVQwxnlHDCK8H2/rQ/TRloXua4s4jhawDumh4EDK2Gk?=
 =?us-ascii?Q?jJg1LJjX2IWEEzTRBK5ujskmR3IQd6VydO8ER+TmURW5blGtwnKPE/cE/3Ub?=
 =?us-ascii?Q?Dtx6qTN4joWMqcr0xgtH3xu4rbqOrJ964Z4gNJYI0ozkoGmHyCzrbs1Np6wp?=
 =?us-ascii?Q?bXy2jXTQT+oeAvYdufxjBk/yqPIisbVYLb65CYRwi7nTZjPj6v6UvtjZvy5S?=
 =?us-ascii?Q?lQMbI4Uo27y9WVRxwXJVJZFiFOWTI8r2pK1EXaPfAShCPkROVdBjheKyiTWY?=
 =?us-ascii?Q?Q7/jVgjq/5aABfYevZEIrScEvcnJHJxW5PqHFOa13upqYNJ9dbIGE55BNnNX?=
 =?us-ascii?Q?HPHkhWsRH2Cgnn8jxIOa5rqg15wmLSWf4dOPl4GNNAqktpCcUAmtcA75L9x6?=
 =?us-ascii?Q?FVmGqfMZhd3bk6XwkO687Re3SCTjGEn8Bt+Nx/ehVrthYN7QPF8CpQUYN+WI?=
 =?us-ascii?Q?brGp9VzHYlw057FjipWsl6AHr4ggvWWZBznu3FTVoO1YQ4vdf3tRW4TPflKo?=
 =?us-ascii?Q?bmBwRO34sAvCzlVayRj9FghGLbaty0X0bfTLFKq8EuWYcWvhIXaFIAFUTGIQ?=
 =?us-ascii?Q?Vtwlij3AXMXhkS0udbfmtGgqrkAGULQlCNl4xTaBKruowrv4VsZTkek0wExm?=
 =?us-ascii?Q?bKrAfgPUrG2i5KNN3V0hdTpoVgyCcyDGFFSPJeeNpeoQyxr14OiUHNmq7oFx?=
 =?us-ascii?Q?+ZPQt+sc2Y9HK76l78Zv98OvvutSq2pOLa982tXbxpDf9jRXomu24VBUUDuE?=
 =?us-ascii?Q?3hdCr8fN4OD3iBpdp1uRFphHCLTfQ9j6XJX+AeuazBn2FX3YKN0ATmH6qq/m?=
 =?us-ascii?Q?b1q9zzXzAnvTKeksvNj7Y5XxML+o5+lgt3cnudQAwEmQJrEuSYgtDA5S0FeK?=
 =?us-ascii?Q?gTkGff90gCap54h0mNstnnqDdR9UAB5L7iWaLxrjIFpmIFIJVvK35n8D3wt3?=
 =?us-ascii?Q?j9u0M5i/V1duAhnbvAz2e6FWBz2YI0H9qX31Us530jOLG3dJY+vVY11vgXDn?=
 =?us-ascii?Q?QqQunBkX+XaPcG4JeNXsF1Y25wCV+htfkDVjHA5sxpjQ7GHQX0Np5hqiaGrd?=
 =?us-ascii?Q?QbgF5qtBDw7PZCO5Fqqsq8WVdiDkCiDqGscduy+KRiIyVA3A0nYkR8ImGW4r?=
 =?us-ascii?Q?L1EvSm71tUwXWWFGBbjl+XUnJWsNANt4UgqcT6nU1nn3F75JR5jiirZRvfrL?=
 =?us-ascii?Q?B+yDTvybFV1sYCyg+qO/h1fW6gVQ24fWKKXYgy0CdvMftDPsNB24OtA6Fkzo?=
 =?us-ascii?Q?Mx+4rH+7gZUKGOrKgZe+g2OgNaHpip9wQs/Kd1X+kPGwT1NzlbQY9M6FfEW8?=
 =?us-ascii?Q?Y2eLZ4INhotN0NZtBWhYBnwBT+2lni98oYNyFXFEUbLeGEnTnBVEeWxK12CI?=
 =?us-ascii?Q?c1+E/KVqE009USzKstbV9/tidVBMvrChNhLYxY7MkaEbYT+5kykFdXoE7deo?=
 =?us-ascii?Q?kiVHYCRLJtKQsrHNS5pV3tMasDggKaNUIMNhw+HBt9LSzsxHEC0xKVlFqtcS?=
 =?us-ascii?Q?P9yphcSq0VW3GW6IDZA5a4UA8ZGGaBFsAvGXVlr8IVLoRxL8dLHojuZN1bs2?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8o6eDDnAUmiPYOX331IJEnBiTQGrDRlNtFZKRD90V/I0Big1LUMCCR/AvjEhTrjsYdo7q8pPqJGm+QhtSI2jumQN/S3bUYosTmxPObdcGdXNIAVlN3aOz3SKXDgzobUGRl7YMsPqhZ3ZVzuocuQgSDAOoMSrUox/1koIbt9Qeck4LCwIlhRyS+5Zfq5m8JfDjZmtM8Yc90Fo1VBoSowORgXD7TVxSagc5SdkPXwqxeEJONhxithH+T2+GEKP1rHQOlR/JgGQ9rWmERlgClPq6cd1oyys7nGy1pwBSM7HLEIL9pVvjarRF467rMaFDYislUJgT8yfvfFyAslNIrN7wYeI1KgrGQWE9PG2hFNmxFFbH9JElNKEfX5XeNkAHYbHqvx2RzVLqEmQa9UoTl69zmDWVHYrbnqe0YbMLclkrWFp8flM9c+xtzeMm+GycMfrJ/1a/RXY/YR8oPwOeJzW/JRTwvhpL1fN23xGgKanlHQ97M4nuH6LXiOhayOxP3gcYmHfOu659HviyWETvCZNuHWI/ceNjT7S+WzOouI0tEAX+rrgd0X94fIjZ8SxnBoe/VduPMZ1dklOpG6jzKlW8kFU9z8TdcHTSCM6q7ZzlQw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e754e06-3883-499c-d5b9-08dcc97dcb19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 05:28:49.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0t1jhtc1RmKxrCYzdTxc4lKjWLNYOO3kMZAADvJjV10zWuPhW70VhlLtb6tmZLuap63Aybn3j0YFWSsu9RPwKSM8vJuAu/YckxKCmzpxeqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-31_01,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408310040
X-Proofpoint-ORIG-GUID: mJTTrEIsWuh_pa28o-8YouVzIGBQZ50_
X-Proofpoint-GUID: mJTTrEIsWuh_pa28o-8YouVzIGBQZ50_

On Fri, Aug 30, 2024 at 04:48:37PM -0700, Sami Tolvanen wrote:
> Hi Kris,
> 
> On Fri, Aug 23, 2024 at 8:38???PM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..f513841da83e
> > --- /dev/null
> > +++ b/scripts/verify_builtin_ranges.awk
> > @@ -0,0 +1,356 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# verify_builtin_ranges.awk: Verify address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> > +#                                 modules.builtin vmlinux.map vmlinux.o.map \
> > +#                                 [ <build-dir> ]
> 
> While I was testing this, I did an arm64 build and I'm getting a long
> list of errors that ends with this:
> 
> ERROR: Failed to read:
> ././drivers/firmware/efi/libstub/.lib.a(efi-stub-entry.stub.o.cmd
> 
>   Invalid kernel build directory (.)
>   or its content does not match modules.builtin.ranges
> 
> That path looks a bit funky. Have you tested this with other
> architectures? I was able to get this to work on x86 builds just fine.

I did test on arm64 and it works perfectly well for me with GNU ld.  But I
just tested with LLVM (and thus the lld linker map format) and that gave me
the same error as you report with the verifier script.

Looking into it...  Thanks for reporting this!

The good news is that it looks like the modules.builtin.ranges data is
actually generated correctly.  It seems to be just the verifier script
that is failing to handle that unusual entry correctly.

	Kris

