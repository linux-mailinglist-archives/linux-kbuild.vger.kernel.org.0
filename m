Return-Path: <linux-kbuild+bounces-2987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E89522DC
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 21:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB24286982
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473BB1BE876;
	Wed, 14 Aug 2024 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XtUYER/2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pVxTXnCY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F71BF32D;
	Wed, 14 Aug 2024 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723665154; cv=fail; b=VuqJV3Zp7Y3F/YJkpkxevCmZXIqLjzwY8k2OszXehzRYMV5qYDUORaML+ArzgnZ87GM7lQZFQTwko6mB85x5TvkPwb1TGpkcxRdKBRJLXKKC3ZruKLa+4I6CQfwcRQccPiHUZvC2+DEX1FuTcZCblvRY2X1lQYkZofyeZ7oNIxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723665154; c=relaxed/simple;
	bh=ttRecMoXamk58H9TQ31uNvdg28PPZokh+5qD5tkLxew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jy4lvrGJ6D6Wt+jtieVTq+9M5vPMOl3LFsZmtAwULVS4fxJKPT/rmtheQOVLQZUD659AgYWMrViqQ3JRsWqSGWPwqXsIGcATOhi4kQUZz178xT/UQE4ccP+uYPrtubiJ6qsPsVdMHitIL87MIvlfvrYs3dmFNtT1uX5lPFV9ZNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XtUYER/2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pVxTXnCY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIdHkY013664;
	Wed, 14 Aug 2024 19:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=r+sKzpLrmVa8ter
	HIfQrYeFw66KvhtJv3fM+xdoaJIE=; b=XtUYER/2XzEPENc/AJozmxobITO1kmB
	g4Ved4qT27T3IGto3vQ4mzqfgC2bma1eO+W0rWXAzGtfE9bvJ5BHSVAmyI6TKUCw
	TyuU8sPdMvZMZFxMs8yQz+KsQ7GXkunKvbf9S5bNkgFgFGOxNLKv+fNtXHhVgsOa
	ZX7wAPZuMmENStduj/VHphg3WUCvwSaOJOtJchaXwowoE8XZrEiuP/FU3IRMphn+
	NhvwKUz8503levUYJvCoB8FTxiIB8mq7ISF/ztFGgyH/Arh5bSJpqVM+CnyEdmBU
	N7hd2PhAzq4F0ELogxS439Hy4lYc1BOHiG1ujhBb/lUzfF3/+AVQRSA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0rts8m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 19:52:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EI9nce010920;
	Wed, 14 Aug 2024 19:52:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnach9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 19:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUPjfB3/Dqb97gK50FZisF3jWarTBnBrZ6HleuO17GQboXp26cXuytex/rB8ffKP+4wQLZHtmkLSq/WAWHumieiNwYdxsktp2sIJBI5opEhokcwaVmwNsLrKRgSvmcwPk2MvHdjOFMvNvEScerv6akOVwFpGBiQlq7PXQEu03+uyQpOp9sulihDFcwR2QopntlnhCg08+ce+F9hxSZuQ3Ve7Kg3znF/eJlJBgtlbUpGYqzBTqunuMMqUhWwu0zenKl575ZSJUdk6Z6LbWjPQO6JOJvQedbYGzryDg854yZCOOXpJxkS3x/xqvV/VmyxaWLm5TD+l5F372QPlRPHA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+sKzpLrmVa8terHIfQrYeFw66KvhtJv3fM+xdoaJIE=;
 b=tgqeCmfKKuR0YrD3QN3kw1mloyl/mHGj2ECFANOaA1WUs3jH1c8X2uXtFSl8jKh6q0oNB2xQrlfe8o5/UShnpfh6DPUrb+/ZoJ+XqYNtp0wfOWAG8/K9N94hLS+Ky2FI+p20LCVhcvkkYyQL8+yiMetGJoGABMeqC+vELKcj1j/JP39m2SsGlbwO2oxMHKuWPh5TTdKfH6S406XF63pxdaMcJSQ7Pbo9rrPlYJXKXmefNHXCmUVcCUKmPORKaYSEc0JNhCZ0+SBa8/PI3/PTL2dGBnaIwsuDzpgSCbJeH/ykPzL1Ina5YQhO3Ql4p04Oezr/CSfhDBvob1em3i+4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+sKzpLrmVa8terHIfQrYeFw66KvhtJv3fM+xdoaJIE=;
 b=pVxTXnCYVZa8r+tHgUGQ5ZLByVETmuN+xXNCT1m14A5J/8Rz9J9fxmQcbFZaF8HRAAYbZPe9s9JPCQJ/26nXcdmD14hK1yRN5vrygdD3maX0lCkXJI9xqA0fTd3ARp7LK9AQukq+KiQlzK/Y45tv2oMmL3A9vrUsldkTZKzIsws=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB7027.namprd10.prod.outlook.com (2603:10b6:510:280::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 19:52:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 19:52:20 +0000
Date: Wed, 14 Aug 2024 15:52:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 2/4] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <Zr0K8De8Y4zuvDVb@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
 <20240716031045.1781332-3-kris.van.hees@oracle.com>
 <20240814150405.0f55335d@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814150405.0f55335d@gandalf.local.home>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 067d5d12-d76c-4917-7181-08dcbc9a9bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w4dwR9ByKUjJBYqcdPd2y1iDtjqVbkwM12bOv3wwJDQW6uw+g6vLgQThIRpD?=
 =?us-ascii?Q?7H7kXZHoHjkuO+MTdV0MB4BAn/WEvV8lSWK90lSzkinsVJOCDPv6OMgPCeAA?=
 =?us-ascii?Q?dJ3gCX8bqolAtzy9TLG7CzfHNNA/2liouYI15uqTnv6wShRnlz1Mm8TngUqo?=
 =?us-ascii?Q?9uln32istiWEQW+LMg6zu0KYK6Q1WhttR+7pxyBnG4hepmqFjFKk5WXBYRXC?=
 =?us-ascii?Q?82iv18FcE1/+zvWPQzZt93q25PBi13QZ9lf0UYpOm7vnGutKsvLQz9mcC/OK?=
 =?us-ascii?Q?k2/xkoQIAAMcDOFuMQzUcaaqCEL/fUVkA4reLeikl6zaZNDoWEQIeGBNQo+B?=
 =?us-ascii?Q?znd7Kp+ZOeVr5gC878MfgOiRx89M6wFtPgH3N3l+WA2ygPBpAm/mPCoIEJEW?=
 =?us-ascii?Q?+VnVpVnhjSpNdnWuqHJXD+YDwOJk3ng5pwd8dqxku5uU4pxr/6VFcb4/DJs6?=
 =?us-ascii?Q?/t3XpJfQWrj7eEWVX69PxGWY48VC9OAbDTVnqAnA53go4h9fzUXyAPuNzx3E?=
 =?us-ascii?Q?dwwdlvzM9X+elviJbE2Ld7k8x4e0ddcaazhXdK8Xn77Z3soflOo6CToSeevW?=
 =?us-ascii?Q?xXJlbTi593xWjyqI7cK1gpHdQbilnSVZwpDGRxOUfrqKN8Z7iGCIj30LbwFv?=
 =?us-ascii?Q?7l8v8oKJru0OLBFtIu1XJ1COoaknNhRmvIyY1hjhCMA4jFSE93sqOy3OvWr5?=
 =?us-ascii?Q?fUOCOWJ2wx8cugL0srVl4X1zSZCZkX0q4zOTeDW5ksY4dXJCc5GyvE1G6sEs?=
 =?us-ascii?Q?q9qGcKR0iaJnD7LXAYylrZQMA7nbyfbBhXAOIlzMxZmhrtwh3VzLCYAlnWAM?=
 =?us-ascii?Q?dXI2DN4i4T5LoMBBqVhN05Zly1d66N2z41uU0TrregFqpfEU7VIeTkoZMHmh?=
 =?us-ascii?Q?HOmXLcHlEEyP0u1lu2prdh7kiYe+kIllO38LW38IsMk2MnLvifJEMyv7yYaU?=
 =?us-ascii?Q?vi4aRYwtD8YGhzvNgL9JSsTnQOOC9zS3uK8HOPVSB3lewpqQ2ooMZ8d/dhJG?=
 =?us-ascii?Q?Mz8J0CGhbxo/0uzCZXXXDqhitZSBhDZNMIUxHi/U1/GNaE+AGxudPsTrJgxU?=
 =?us-ascii?Q?64mqVG6EGB9TQhzS+gfC2gS/vGnM4SzHh6UwtMxggEm7Weo6OKilLVN6FKS9?=
 =?us-ascii?Q?lwg5OeX/WPupSCzrICr0dBWdkejTM1tajkuEIN/Mvk/ZD6/QCtFSsO+IcNx1?=
 =?us-ascii?Q?lpGA95yD+ii2Du3YWIrUA0IZcQ55y6LPjHBuNtKNG+D2yqwZnKyRigMnkABV?=
 =?us-ascii?Q?UQHWdgnt4hfiYQMqlfdjWAmXWLGBQYMXzONqyM0l4XfplKF2IkFcHdICZPup?=
 =?us-ascii?Q?W9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?87Fo9/MtbuRuthnv4Fz7R4CLnEzsrP0u//Zd5XDeG4ogCFM3Sos85s6GdF0/?=
 =?us-ascii?Q?ulvz6zEFC/c34+ZpGZTGzNCk3gKrKhT9u/Qpp9Sc2Wd13k/gPUXkOB3uzrrN?=
 =?us-ascii?Q?4DlpwqpJWvqtkKDooORU5ZjMWtpy1lJVd4R+3VK/ozoamaaIqwYORSsrNjHt?=
 =?us-ascii?Q?Rgdy/GeVwNesALh5Uvk6RBtbLchbA9Xy/dQ39bZG5KeUricw37hNBQq4lifD?=
 =?us-ascii?Q?UXIhWgpnFcgF0VABlqU8L9On6y1n7D6eSpvsYYzR1k1f/ZDUI4n73+tcVMqg?=
 =?us-ascii?Q?g5mXzBbP0wJ0/Ka+fA0s0p0okCz7b2bXFfl34lim0dP61WwIWarU7wTtV8Oz?=
 =?us-ascii?Q?+ALzpWG/oOUYPiYQ3QpA1OdDh6mGWlG2Bb5l2wFC+f0FJAbLgo02Ef03kTvm?=
 =?us-ascii?Q?sBUWLqtLXUNDXCxFMgzQq/JS2WIHEcHwjKyj0jgw0KLgfZ6HTiqW2p1hjeA/?=
 =?us-ascii?Q?5k+RzgPosHrxbnL9mNa73wlD1KIYdFCv2Lhgb7OW0zrEDB1WA3ukyuUxSUJE?=
 =?us-ascii?Q?g8UbuF/l56JUUglR/6fdJwv6jTCNPm3g8FqTDx5IkpNsG6/v6DLTfPnjRK6b?=
 =?us-ascii?Q?hi5G1qqHL0rLEIsXUg643141wx8xutVGdDDdU7mVMYOaneAk4MZqISLEU/2i?=
 =?us-ascii?Q?dSx5cZ3Y6KtgyIiCQETZxl+pQm7UT+JyQnBvacEiuL4Dt9B5p+fyi76RlPtZ?=
 =?us-ascii?Q?xtIkztXdDnXavfFYHmcwu+TNPkBbUP12cVmytaHAzOAnOwxXwcmF91b9oYb6?=
 =?us-ascii?Q?6oe8EtM/ia1ua73zK27N+vW2dd7gYSTr9yjOMOmtA8ySzjOjbhlCCpEvgcJy?=
 =?us-ascii?Q?9aFaPlTUjjauB3X/eu4fwoqKGa+m6MDZfBsdSRuN85SdTCgJZx4LP1CQ8/hh?=
 =?us-ascii?Q?NJm8+gf7Ar4HcfatwcGIezWfISIYFtdJhn7spRA4paPVZApeFVV+70yZxVxL?=
 =?us-ascii?Q?ozp1Ps1oetG4VgCsQlnN7duGoBKXkm+TU+cZ38XQcw3oAf1SgJQDcJ6hrJ55?=
 =?us-ascii?Q?15DmY6M3DhaNyaDsgt1Ve6OytwFVIWUQNu6q388YvQy5p4ImZFVuQ4fgI0vZ?=
 =?us-ascii?Q?zi2d9WZd4UyXEdF4hVqiJJJL5ndw2CTBj7sLOnPn4Arpcy+UanK8C6dYxFzc?=
 =?us-ascii?Q?KiPBbDgx92Z8Z4lxoX9SUdtYbXDXWvWrVDj4+ut2f0EimpwtbkUyZo55JjRw?=
 =?us-ascii?Q?CqjJ4HO4Pp+tXQjwRClto1PiDlhUPk4Ziv+5e8GvHLA2kQ13VJubFSNSVI6b?=
 =?us-ascii?Q?zykdtdx8DK6oWrDH3Osh96TKivwBgl8ear3Tw7z4OmEQVbDK4rSyr5WSw5i3?=
 =?us-ascii?Q?Yb/DeS0HLnwpoPPOZbBKe2P1lOaNd7CbNdexXVaiZ5SmBte9v/RIxHj4vUNr?=
 =?us-ascii?Q?I8S8Nr+WW/cqvNclOFeu+cbOYZD/yzyHGII0vlE9iTnPvyXnUO7O1zBPJoiA?=
 =?us-ascii?Q?GMSTWXT7bMosh0qbx17zE2M+pPvxouApBkZTJsdjpmlEO/meY+/6P1MUiYSj?=
 =?us-ascii?Q?z2/MoWTD2pcHWBN0FU7nOiwcIQacAiz7rOfvmMbwZEG+7oeNJPOHmipthu2A?=
 =?us-ascii?Q?Cx/zIgsmSSVnR6i89URcyq1RYnyXuvVg1GpCTJF8fNlc8iotDBTzIcRKeaeu?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TRqtlBU6dtaaGH5+r/J3fP2j+T04tog/BHIyfNr9gkrHD9S0JdWrozU5MinDR+FRbIbrRuGpOjLQq5d6PrDaxZgxFB8KpNOjOFNBJzQbCPrVsAV8a4JvNyZ13adJght9GRND813KF9P0ozjKieCvQ7G+s/vC8JufITxKsSQH1O+Fp6dTJ4xhdRfzVa7o5XH11Osig9wUkL60ohLdd9rxVOjQWNhQpAbvmV+6yxpR7keUpdf0huD9u5zYJVuOsQssIpoaVT6uzAf/sKE7vAo+K2N5lfEQiHq4MxQ/stW5nOimSonivuBm4e5QNdQnA4ETurYZ+8E2YDF9FmbgMlpmFlw0997QgEV9QU9fYzRXrTjDbvyTtCfi0mhP1vd7/QOvQzWz9U5oTqpVl1j1nSgh7eYTwycqCf3nuhipNHGPXx0P95uUhMc7+FI+yTbNTJMekZ8maugwAdGtVEjWnypWOf20TEWVG6bW16EiKsS97+Qnmios3xajubY/YqS3DMRiN3ZBW0jDyl+9CW6PmRnteyAMGAFU3+7d+AuWR/NqE8dn5Sf1eMt5qnt1odTXsPIbAWtQqaLE5tWpGRbqa2sVg6TOKr/vjLX4oUPDwpYqIDY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067d5d12-d76c-4917-7181-08dcbc9a9bde
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:52:20.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dS0hvpwc3diUJbiD4/rrSqjoTqgXZlzuP39Wb7kZ/8w5F2bl5jahUi87Tq7Ldg+dwxWo5V0q9ntOg2xZqwJrdWeXSlS8goAPsQPFfzQRSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7027
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_16,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140136
X-Proofpoint-ORIG-GUID: 7RJATJ4ENs29FC0uzp7dCf-XIKrylpcY
X-Proofpoint-GUID: 7RJATJ4ENs29FC0uzp7dCf-XIKrylpcY

On Wed, Aug 14, 2024 at 03:04:05PM -0400, Steven Rostedt wrote:
> On Mon, 15 Jul 2024 23:10:43 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
> 
> No where in the change log does it state the name of the file that is going
> to be created. That should be the first thing mentioned.
> 
>    Create file module.builtin.ranges that can be used to find where
>    built-in modules are located by their addresses. This will be useful for
>    tracing tools to find what functions are for various built-in modules.

Updated.  Thanks.

> > 
> > The generated data will look like:
> > 
> > .text 00000000-00000000 = _text
> > .text 0000baf0-0000cb10 amd_uncore
> > .text 0009bd10-0009c8e0 iosf_mbi
> > ...
> > .text 008e6660-008e9630 snd_soc_wcd_mbhc
> > .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> > .text 008ea610-008ea780 snd_soc_wcd9335
> > ...
> > .data 00000000-00000000 = _sdata
> > .data 0000f020-0000f680 amd_uncore
> > 
> > For each ELF section, it lists the offset of the first symbol.  This can
> > be used to determine the base address of the section at runtime.
> > 
> > Next, it lists (in strict ascending order) offset ranges in that section
> > that cover the symbols of one or more builtin modules.  Multiple ranges
> > can apply to a single module, and ranges can be shared between modules.
> > 
> > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> > is generated for kernel modules that are built into the kernel image.
> > 
> > How it works:
> > 
> >   1. The modules.builtin file is parsed to obtain a list of built-in
> >      module names and their associated object names (the .ko file that
> >      the module would be in if it were a loadable module, hereafter
> >      referred to as <kmodfile>).  This object name can be used to
> >      identify objects in the kernel compile because any C or assembler
> >      code that ends up into a built-in module will have the option
> >      -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> >      can be found in the .<obj>.cmd file in the kernel build tree.
> > 
> >      If an object is part of multiple modules, they will all be listed
> >      in the KBUILD_MODFILE option argument.
> > 
> >      This allows us to conclusively determine whether an object in the
> >      kernel build belong to any modules, and which.
> > 
> >  2. The vmlinux.map is parsed next to determine the base address of each
> >     top level section so that all addresses into the section can be
> >     turned into offsets.  This makes it possible to handle sections
> >     getting loaded at different addresses at system boot.
> > 
> >     We also determine an 'anchor' symbol at the beginning of each
> >     section to make it possible to calculate the true base address of
> >     a section at runtime (i.e. symbol address - symbol offset).
> > 
> >     We collect start addresses of sections that are included in the top
> >     level section.  This is used when vmlinux is linked using vmlinux.o,
> >     because in that case, we need to look at the vmlinux.o linker map to
> >     know what object a symbol is found in.
> > 
> >     And finally, we process each symbol that is listed in vmlinux.map
> >     (or vmlinux.o.map) based on the following structure:
> > 
> >     vmlinux linked from vmlinux.a:
> > 
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> > 
> >     vmlinux linked from vmlinux.o:
> > 
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             vmlinux.o         -- need to use vmlinux.o.map
> >               <symbol>        -- ignored
> >               ...
> > 
> >       vmlinux.o.map:
> >         <section>
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> > 
> >  3. As sections, objects, and symbols are processed, offset ranges are
> >     constructed in a striaght-forward way:
> > 
> >       - If the symbol belongs to one or more built-in modules:
> >           - It we were working on the same module(s), extend the range
> 
>              "If we" ?

Oops, yes, thanks.

> >             to include this object
> >           - If we were working on another module(s), close that range,
> >             and start the new one
> >       - If the symbol does not belong to any built-in modules:
> >           - It we were working on a module(s) range, close that range
> 
>              "If we" ?

Oops, yes, thanks.

> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > ---
> > 
> > Notes:
> >     Changes since v4:
> >      - Improved commit description to explain the why and how.
> >      - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
> >      - Improved comments in generate_builtin_ranges.awk
> >      - Improved logic in generate_builtin_ranges.awk to handle incorrect
> >        object size information in linker maps
> >     
> >     Changes since v3:
> >      - Consolidated patches 2 through 5 into a single patch
> >      - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
> >      - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
> >      - Disable CONFIG_BUILTIN_MODULE_RANGES if
> > CONFIG_LTO_CLANG_(FULL|THIN)=y
> >      - Support LLVM (lld) compiles in generate_builtin_ranges.awk
> >      - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
> >     
> >     Changes since v2:
> >      - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
> >      - 1st arg to generate_builtin_ranges.awk is now
> > modules.builtin.modinfo
> >      - Switched from using modules.builtin.objs to parsing .*.cmd files
> >      - Parse data from .*.cmd in generate_builtin_ranges.awk
> >      - Use $(real-prereqs) rather than $(filter-out ...)
> >     ---
> > 
> >  Documentation/process/changes.rst   |   7 +
> >  lib/Kconfig.debug                   |  19 +
> >  scripts/Makefile.vmlinux            |  16 +
> >  scripts/Makefile.vmlinux_o          |   3 +
> >  scripts/generate_builtin_ranges.awk | 515 ++++++++++++++++++++++++++++
> >  5 files changed, 560 insertions(+)
> >  create mode 100755 scripts/generate_builtin_ranges.awk
> > 
> > diff --git a/Documentation/process/changes.rst
> > b/Documentation/process/changes.rst index 5685d7bfe4d0..a37b9c22241d
> > 100644 --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -63,6 +63,7 @@ cpio                   any              cpio --version
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> >  mkimage (optional)     2017.01          mkimage --version
> > +GNU AWK (optional)     5.1.0            gawk --version
> 
> Note, this needs to be rebased on top of the latest Linus tagged branch as
> it didn't apply cleanly.

Yes, as I prepare v6 I'll ensure to rebase.  Thanks.

> >  ====================== ===============
> > ======================================== 
> >  .. [#f1] Sphinx is needed only to build the Kernel documentation
> > @@ -198,6 +199,12 @@ platforms. The tool is available via the
> > ``u-boot-tools`` package or can be built from the U-Boot source code. See
> > the instructions
> > at https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux 
> > +GNU AWK
> > +-------
> > +
> > +GNU AWK is needed if you want kernel builds to generate address range
> > data for +builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> > +
> >  System utilities
> >  ****************
> >  
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 59b6765d86b8..ab8428c0e2fd 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -571,6 +571,25 @@ config VMLINUX_MAP
> >  	  pieces of code get eliminated with
> >  	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> >  
> > +config BUILTIN_MODULE_RANGES
> > +	bool "Generate address range information for builtin modules"
> > +	depends on !LTO_CLANG_FULL
> > +	depends on !LTO_CLANG_THIN
> > +	select VMLINUX_MAP
> > +	help
> > +	 When modules are built into the kernel, there will be no module name
> > +	 associated with its symbols in /proc/kallsyms.  Tracers may want to
> > +	 identify symbols by module name and symbol name regardless of whether
> > +	 the module is configured as loadable or not.
> > +
> > +	 This option generates modules.builtin.ranges in the build tree with
> > +	 offset ranges (per ELF section) for the module(s) they belong to.
> > +	 It also records an anchor symbol to determine the load address of the
> > +	 section.
> > +
> 
> 
> > +	 It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
> > +	 address-modification options.
> 
> Hmm, is the above needed? Usually a comment like that is for incompatible
> usages.

I'm happy to take it out - I mostly put it in there because someone asked me
about it when I stared developing this patch and I figure people might wonder.
But I will remove it in the interest of being more brief and following
convention.

> > +
> >  config DEBUG_FORCE_WEAK_PER_CPU
> >  	bool "Force weak per-cpu definitions"
> >  	depends on DEBUG_KERNEL
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index 49946cb96844..7e21162e9de1 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -33,6 +33,22 @@ targets += vmlinux
> >  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> >  	+$(call if_changed_dep,link_vmlinux)
> >  
> > +# module.builtin.ranges
> > +#
> > ---------------------------------------------------------------------------
> > +ifdef CONFIG_BUILTIN_MODULE_RANGES +__default: modules.builtin.ranges
> > +
> > +quiet_cmd_modules_builtin_ranges = GEN     $@
> > +      cmd_modules_builtin_ranges = \
> > +	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) >
> > $@ +
> > +vmlinux.map: vmlinux
> > +
> > +targets += modules.builtin.ranges
> > +modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> > +	$(call if_changed,modules_builtin_ranges)
> > +endif
> > +
> >  # Add FORCE to the prequisites of a target to force it to be always
> > rebuilt. #
> > --------------------------------------------------------------------------- 
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index 6de297916ce6..252505505e0e 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> > @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
> >  # Link of vmlinux.o used for section mismatch analysis
> >  #
> > --------------------------------------------------------------------------- 
> > +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
> > +
> >  quiet_cmd_ld_vmlinux.o = LD      $@
> >        cmd_ld_vmlinux.o = \
> >  	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> > +	$(vmlinux-o-ld-args-y) \
> >  	$(addprefix -T , $(initcalls-lds)) \
> >  	--whole-archive vmlinux.a --no-whole-archive \
> >  	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..9b647781d5fe
> > --- /dev/null
> > +++ b/scripts/generate_builtin_ranges.awk
> > @@ -0,0 +1,515 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# generate_builtin_ranges.awk: Generate address range data for builtin modules +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> > +#		vmlinux.o.map > modules.builtin.ranges
> > +#
> 
> My only concern about this script is how fragile it may be. Is there any
> possibility that the input files may change that will break this script,
> and if so, is there a way we can detect and warn about it?

It is fragile in some sense since it clearly depends on the format of the
linker map files.  On the other hand, that format does not change much at all.
As with similar scripts, it will need to be maintained and adjusted if and when
such input file format changes happen.  But that is to be expected.  I would
say it is similar to other scripts that e.g. use objdump and expect output to
be a certain way.

> Other then that:
> 
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks!

> 
> -- Steve
> 
> 
> > +
> > +# Return the module name(s) (if any) associated with the given object.
> > +#
> > +# If we have seen this object before, return information from the cache.
> > +# Otherwise, retrieve it from the corresponding .cmd file.
> > +#
> > +function get_module_info(fn, mod, obj, mfn, s) {
> > +	if (fn in omod)
> > +		return omod[fn];
> > +
> > +	if (match(fn, /\/[^/]+$/) == 0)
> > +		return "";
> > +
> > +	obj = fn;
> > +	mod = "";
> > +	mfn = "";
> > +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > +	if (getline s <fn == 1) {
> > +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> > +			mfn = substr(s, RSTART + 16, RLENGTH - 16);
> > +			gsub(/['"]/, "", mfn);
> > +
> > +			mod = mfn;
> > +			gsub(/([^/ ]*\/)+/, "", mod);
> > +			gsub(/-/, "_", mod);
> > +		}
> > +	}
> > +	close(fn);
> > +
> > +	# A single module (common case) also reflects objects that are not part
> > +	# of a module.  Some of those objects have names that are also a module
> > +	# name (e.g. core).  We check the associated module file name, and if
> > +	# they do not match, the object is not part of a module.
> > +	if (mod !~ / /) {
> > +		if (!(mod in mods))
> > +			mod = "";
> > +		if (mods[mod] != mfn)
> > +			mod = "";
> > +	}
> > +
> > +	# At this point, mod is a single (valid) module name, or a list of
> > +	# module names (that do not need validation).
> > +	omod[obj] = mod;
> > +	close(fn);
> > +
> > +	return mod;
> > +}

