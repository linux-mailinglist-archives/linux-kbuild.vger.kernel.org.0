Return-Path: <linux-kbuild+bounces-3489-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F59722F2
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 21:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6961A1C220BD
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2024 19:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1DF17C9B8;
	Mon,  9 Sep 2024 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fCs05su1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jfOwtdIQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB143CF51;
	Mon,  9 Sep 2024 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725911039; cv=fail; b=vF9hCgECzdZftf+nS6dCDEd5bDuE2cpSutHg07nxMrzt4x56McUV6sR9BejOTHpXLPbZ3uOVIKld1Tw4HWFDMjYJB5WRqUFdOifvvA0Rk3WWfi9hJ59NFQglcbQseRhKVk0brLpNIoAXH+TgskUUE7B22cXnt9o/4SKL+IiqbJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725911039; c=relaxed/simple;
	bh=YGFAesBOHjFHb3xrCL2m2nCebo/n8BjyIWe4BMZ0pac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MruxFYOGlWaldsh4oq1uciRvL0qb/Fs68fPdIqXJBSHAXJ+kKRgT0xVTy32AIWOOVfGqqccqbO/hY6K7wwszyldi7V7vAU/X4b4SnlYdd2908WZUmHUTJydTihNjyxTX7ijLXz7Ta4Z9+fesQZoONftT9td/uAzQsKEws2c8sfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fCs05su1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jfOwtdIQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489HBTkP024339;
	Mon, 9 Sep 2024 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=PA0KbdFYBRpJcL8
	SlssyTeb8949jBg8Rbj1wZb922Lc=; b=fCs05su1Ok+UIUpqIM7ByZa4U2xHtqE
	sqS1hR0lXiEFkmh0jnb+NxyYbhvnpbQEqm6o1Ex17u7sJ28pFGg+QeY/IyeGghzw
	VO0JSZE2HEiivv6lZT2BHjKEKjaVfMinmrHUoH76BK5eHnz/32GPd9XHE6MnqTt/
	WUIUafev+3czdKLOZC4eTVZJCEWlry02KZq6YJBccw2wp0fzvhSIs2G1ya52pUuD
	yZczltGSNd5jNEcQCOix5AGnc3gAFFIittnpAgB3miXbXNW6nDfB6bzyCDhjMTOG
	sgMCEJIKTTF0YKB+GDabeOPCDHa0v/JLCCrjYrjgIXjMWC0ZKd99Z1w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gfctbuqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Sep 2024 19:43:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 489J9tAd005070;
	Mon, 9 Sep 2024 19:43:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97mt2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Sep 2024 19:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULlZaAN0P1/bq+W1762URxpJUkAiJ23DUj6f6aaAckY6THhm5bDU8OiXvN71MuqkG0orHhqjYX3JIijsN4JMNqc7ULs/VM49wqnIjjbQj9D/4FyoGF7PPO3pIGruvsk+kY2igz0KQVNVpYqSeufwJBFRiGPjS9tyd+pq3L7i1mPCtfcCGF23fg5XjJ8S1GKuIHZBavZGeEAfeAGUK/lSDkHFZfDMyW/7x3YESx64azR9ouX+3ljOCXT3ErUvMRkQAbMac7YFkcPhU0j+rgsISAAVrADnAyO3D4Jbz4JrvbbwrhJIcmnno1SBr35RyHSKcgKMCTCZzCGI1avQMkKAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA0KbdFYBRpJcL8SlssyTeb8949jBg8Rbj1wZb922Lc=;
 b=uX8cvsYNrksoQInB6iKkDk0KhEbrOPGMhvTZ/NdpEZmfMH6WMJTTPlK8ZmuiasdjDxZdhiUubHgJhLVkpNHNAuYD8BLbeIVLNbE6TZVmW6EBIHCil3i9M2xYHvibBkDT0yc5Zar8ftHKYOHS7bQPZRQqxqXmMWzT3e32wrc5fkkN6GwWSJQrsoL3/5BbhwOx3V1lUWg6/8uHYusdRV67WYQANBK6HxO23O60uZnBdkmiL6xRMF4jf4+YP6Z37X2JIvkdHG7zxsvzpYUHCaDGPHtlzxPZAknNdFJkfWJp/tdo/wZ5vb9yS4ERZ+phLHK5IKBzPFARm6aoKYPqlvBebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA0KbdFYBRpJcL8SlssyTeb8949jBg8Rbj1wZb922Lc=;
 b=jfOwtdIQl0hnzCKyxvAPh6YC+3b0CwImUUmgVwZKi4FU7yci32mg+YMJ3e8CmrRRDjfuapf+5l/m08qQHp6DfcRCUWGQlplZWTtNGGFen4HokdHO1EJqRr9PZlIZj1XNjwmnUtD89zns9TgtxOcQx8IASZv8SSBftfHc3vD9HOg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN6PR10MB8022.namprd10.prod.outlook.com (2603:10b6:208:4f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Mon, 9 Sep
 2024 19:43:39 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Mon, 9 Sep 2024
 19:43:39 +0000
Date: Mon, 9 Sep 2024 15:43:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <Zt9P5p6XGBp2Uwde@oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
 <20240906144506.1151789-3-kris.van.hees@oracle.com>
 <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN6PR10MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: b200bd14-382c-4852-b12f-08dcd107b3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZYLEcXz4uaOWbIkRz2jygSRtn2jujgjIpcleQvfUg5/Xk7SeXl0nqLMM3BtX?=
 =?us-ascii?Q?GRcs77RchiKykRaOwyz2Jq9OG2iofHf+ZYoKLuYuYtVjB88buSrhfMguOSI9?=
 =?us-ascii?Q?xeOyXMtibpJqmR3MBJmUYXdTJJhlLjaUUa5H48xNsO29PbEDaRXw6f0MWNkq?=
 =?us-ascii?Q?eDcYdcRtj6YO5rUtsue+bfSRG/jRGYC0cqxapkhiTjemql3KeN9Q78dwdqId?=
 =?us-ascii?Q?7QexnZy2c1tupoxNlYZP58LiWl3J/e/yS7/sGEdMg8tE6RqKMArYTfskBuA8?=
 =?us-ascii?Q?kFais5Ep+FcbNDAKbwrBYNZ5pgm9sipKJkdl15m4HqLR7PZl7NN9JsqWjAXi?=
 =?us-ascii?Q?LiyMDyEzDRQPZAtqRlyfIao+/9gG4roU2FbwxSX30cBoUTuX7nzgEySEYiW1?=
 =?us-ascii?Q?Yf0NRxs01vEpSvXdZPUDUieJfNSim3P2aBS4SLcf3rd5aa/pu8EL/zn+NUnY?=
 =?us-ascii?Q?MYhOdByBHSsh8V/V8UqUV60Cg+ieMnDMo7JM51bHRmfXv15WzA8BFGywGl6F?=
 =?us-ascii?Q?dHE9sYFKHmcMDm6wk1wfQTRWIrFekDzDB1ir6zL7vKKOkVhVS6SuW2f8uk3N?=
 =?us-ascii?Q?46ldx+iFhB2fN61AtFvvHpMg8Kq91UmWdJgFZ6cn0j2bs48TEaKZ4ho0ncuQ?=
 =?us-ascii?Q?jRTD3zPETZDQTK6Y5h2IuuOxTKL8zyEKjdjtBFZHZTj5zep3Mevr57rXjaSu?=
 =?us-ascii?Q?cYYtkxkHzNWk7Wu0uxcyJJwaKqiu19wc1TItioRGS1ciqlAa05rlAiCCX6vg?=
 =?us-ascii?Q?NyucanI9lX+Rnkp8nQckv9pwtQpw8oJxOd7m5PlxF5hhtFXN9ABm2Xg2jNu3?=
 =?us-ascii?Q?x1B5mPuNsH8Gefv+np6NkSdDyG0MBclTjrH7Itv5CRi2jT5aR4GHgmS7/gN6?=
 =?us-ascii?Q?yVVP7PF8DtqkGBMkzVm2OAAstVHr1jIWbJa14JTO6IFm0uF7+PtgJJtByWHl?=
 =?us-ascii?Q?RIl64d4qU5pnwjJ1EcOlXijT0vP7Z7hBQA7iKvj9aemGzecQD5FPmad/WHfz?=
 =?us-ascii?Q?1JY26F7mRlq4acfWlvHu53CcWP8ngBI4Nu3xvRrwVqXYKjlcabA5vTsHZ1DQ?=
 =?us-ascii?Q?umDFy8jH+JH7o1Otr4gxka+N/dwgAvBHZvXpw+7cwj54XH8EffzMnLfvG5ns?=
 =?us-ascii?Q?NQ8CAtR0nlfU5Q6LWKleI9MIyTAf34ofV+8J3/yFPMV7C08tG7sYbttnSrEf?=
 =?us-ascii?Q?pjarMeH0IP0iXFw+/HnqBOJQs7LbiG/ItKwNeZ972QJZzV8nB/GVQQDE9X1K?=
 =?us-ascii?Q?1zDm5PLkFckdYEoW6rmsNZmPGS/K/nJYfs+jRBP+75Soa+3y9rFzgnQF5/Xq?=
 =?us-ascii?Q?qcJUCmsvzLwUQ+bHI2elcvCoRBAdCehXv47fMg8WlwZTMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WERRCYcM/z/G1fTHbsNaOIkpTbgtUbdUtjKbpP+lRxUejJkec0s4H5l2uHmY?=
 =?us-ascii?Q?cUhM+tuyx8tPW1Zk6XmcKepJTMFoyKcBfr1LWiY+g37CA01rFR3G8+orjlts?=
 =?us-ascii?Q?OFf0yYv3bnJGXUJ17uU5qlUqyACFkR7PUCKuZi1MYF4lswlo/zBtvjBe8jJa?=
 =?us-ascii?Q?wm4/9B1fBeRUx1N3ROsux0t419jp/LKQZKHbsMND1ZLJ7Pr15KDNYjYhrvOm?=
 =?us-ascii?Q?DL2D4ZDutg58JKV2e7jDzpeAxol0Ji04OMn50jeP5SY3adeOz9ObZ0cyLo30?=
 =?us-ascii?Q?m3+YKhgNKZcF4uThwVQggvR24B2jfmmimxjVi2wnciL6YOLz5LafbwXfPjK2?=
 =?us-ascii?Q?Y70NQ1GEcJ2PAybjaBi5ja2cVxiq8CpxqLhc02BxGsRBzqBWCALUc0j67Cm6?=
 =?us-ascii?Q?9EultY45UF1WwS+WB2mSFDTFpQtSMsRn931Rp6HmYDz0J25gf1ITJMUA3Uxe?=
 =?us-ascii?Q?KQQirrlAg11tmMMEc53hwH3kqhSM+pSxsT47FlO+FImMpgLLCKAhcE6+LC40?=
 =?us-ascii?Q?XFuKILR0H3Mjk9R9bh00cDbCHlVAW/2yBiv1camQv7lT4WaLH5YtoeJDjkRG?=
 =?us-ascii?Q?gVN5yhVe3h12phUhk/j1uggjKrChE5FhbmHCQLlbY37vuJUZHK5UnQP6GPyh?=
 =?us-ascii?Q?oTiw9MBPX6/0fMTRKZl1BnmQCse7dmomqLWY2nFdc/bM6f4+s25AEH2R8lil?=
 =?us-ascii?Q?r4pOl3um8KoTUrKiYseBcoNLIx9zjesEPA4WpKscPc/7u2NVa66cy0PyQImW?=
 =?us-ascii?Q?0Eg0Aensg4i5TjRWjlqlDicr+l+82oxxNvmPZuHn7bXsWWNFqAvVf1Hmnqnz?=
 =?us-ascii?Q?ku8ZuZkcG/2Wya7T+gWxaSqTpyhPkYRMoFsL4NhI09HCua+yePwLeDbnfXaC?=
 =?us-ascii?Q?B12yQIkr2lPs2tSp0rh85NAvSgso8e41sfsEfhboFJvMR3E4+ywJmWe2dybJ?=
 =?us-ascii?Q?obGDtRaiVqoQGiFMcUOWxuRnFQXFXzHlqryU7400GTSpeKoC2sL3ktS2Bs4t?=
 =?us-ascii?Q?dGCW6SusWHklXdBaJ40HkzcsQcxujSr+FNiMb1PTIAq2INz+DsbRVtIrbJ/h?=
 =?us-ascii?Q?Nv/J28Y/pvi45tu2EM1QomPRlhUwWOz3wTquWXuP+dHUw+AG7G/ZYnBLwTR/?=
 =?us-ascii?Q?H+UZOF0Bx9lXOlwvxItEgSYdgUbFqhzxBxT4bihZTXZ2DKg3aaz+JWIliyaj?=
 =?us-ascii?Q?6jerW5Yfi98EL1x+4fd5g3xfaVoHbPXyOqvFCt82+UVmTWT7cYJ2ZCHtDPbU?=
 =?us-ascii?Q?Oky+Vj90PXe+OnuVvrIQXl8tYu2Mcuq5wWuAhzhHZTi5itYP1CycpIykpBS7?=
 =?us-ascii?Q?8NUcEj88bWWQhGdBuo7Bl6aZrhSMs4986x0b5F20MnOS9mT3QYNjmwGYYEMh?=
 =?us-ascii?Q?CFQ8eaB25pEQcSvBpnqaxA8ek7D3VfpmnXGl+JCvs58F2mJuBQGu+eL6+AtM?=
 =?us-ascii?Q?iRWYei8yXNluNP1q99WnAvtdNcbQYFwTp14OZxVhKwqPpCTLwVzgylYBIBT8?=
 =?us-ascii?Q?npqIWiAp3iSr8SH+JFA2Wecs63GQplb2G9Sys/veqmYyzQDzMCWaI9fa7AuG?=
 =?us-ascii?Q?k4DiGP1CN01qZs92DccpZ/w0zUkiTH3kbiyO7J/fAqrkP58/kkqmOA8eU6mr?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ysJcGQrsHGoF+SJKfMxoYVhrmSykdiNvu/BhNAXOS1QTOZjFOW3KRV54HAyrR/kpCqhMq3plcKz9Puy4+9HgcFTCOYHhaPam5Ks39MCWvhWlLPUvkkCB6LwvjF+qf1qrAxps8CljMlMKDSCeBgTkHkYkZlqQ+JBGL5rGxVQ5E3+PsamrCfQkhJwi7gruNjKCXXxEE1KbJWBWmNsnNUGQ0c5lXLszaUbeUyu3b7wAUw9PknvGlJ0JXh1F38IvpOdXef/jb76O3dwUw4cVHCRHTzk2SORetXb4klNM193JdSVa0p+lp69mg/fTepAizNQ1vYTJOAqqzmWc0hotnh/R4nrtTnyVSUK7KOvod6g86WV6Q1Hb600bVLi82/gwxjL+GyI1KTwwrvan0WbN8kB5gYVV/ippEkJdi8qqMO1NTXeb7NqoEXp5BSKKMbGhOOufC5nbAByMnIeeIoJG0xCA4uao6ul30/bRfmPrmjTaOnZLr68+HnvTz2+TI8PQBxaPsHgAyRZWmwoclux099G3A69qauZbHhq4Ap2eWEfGArvdW59LdciDANSEdmDnhZdzGCecsxYexDhoi5ktLNqqAU0DsZqpdsEoHT2ARc1Evgo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b200bd14-382c-4852-b12f-08dcd107b3e8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 19:43:39.5357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8Vgjby/5XnxhwkBMZNbm//rKlLUzJsSMydpkA4aqd12xv8F0Mu0iaTA+7yLND5J7R2sALdbs0HigW7r02RTarsvQT6K0rUYQ5SrNxsRhjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8022
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_10,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409090155
X-Proofpoint-GUID: bH-etw0aVYpkNS5WQGQTAZjv0g1ECVH4
X-Proofpoint-ORIG-GUID: bH-etw0aVYpkNS5WQGQTAZjv0g1ECVH4

On Sun, Sep 08, 2024 at 11:50:51AM +0900, Masahiro Yamada wrote:
> On Fri, Sep 6, 2024 at 11:45???PM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > Create file module.builtin.ranges that can be used to find where
> > built-in modules are located by their addresses. This will be useful for
> > tracing tools to find what functions are for various built-in modules.
> >
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE
> >
> > The generated data will look like:
> >
> > .text 00000000-00000000 = _text
> > .text 0000baf0-0000cb10 amd_uncore
> > .text 0009bd10-0009c8e0 iosf_mbi
> > ...
> > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
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
> >  1. The modules.builtin file is parsed to obtain a list of built-in
> >     module names and their associated object names (the .ko file that
> >     the module would be in if it were a loadable module, hereafter
> >     referred to as <kmodfile>).  This object name can be used to
> >     identify objects in the kernel compile because any C or assembler
> >     code that ends up into a built-in module will have the option
> >     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> >     can be found in the .<obj>.cmd file in the kernel build tree.
> >
> >     If an object is part of multiple modules, they will all be listed
> >     in the KBUILD_MODFILE option argument.
> >
> >     This allows us to conclusively determine whether an object in the
> >     kernel build belong to any modules, and which.
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
> >     constructed in a straight-forward way:
> >
> >       - If the symbol belongs to one or more built-in modules:
> >           - If we were working on the same module(s), extend the range
> >             to include this object
> >           - If we were working on another module(s), close that range,
> >             and start the new one
> >       - If the symbol does not belong to any built-in modules:
> >           - If we were working on a module(s) range, close that range
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > Tested-by: Sam James <sam@gentoo.org>
> > ---
> 
> 
> If v10 is the final version, I offer to locally squash the following:

Thanks!  That would be great!  v10 is indeed the final version (see bwlow).

> diff --git a/.gitignore b/.gitignore
> index c06a3ef6d6c6..625bf59ad845 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -69,6 +69,7 @@ modules.order
>  /Module.markers
>  /modules.builtin
>  /modules.builtin.modinfo
> +/modules.builtin.ranges
>  /modules.nsdeps
> 
>  #
> diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> index 3c399f132e2d..a867aea95c40 100644
> --- a/Documentation/dontdiff
> +++ b/Documentation/dontdiff
> @@ -180,6 +180,7 @@ modpost
>  modules-only.symvers
>  modules.builtin
>  modules.builtin.modinfo
> +modules.builtin.ranges
>  modules.nsdeps
>  modules.order
>  modversions.h*

> If Sami reports more errors and you end up with v11,
> please remember to fold it.

Sami confirmed v10 [0].  Can you squash his reviewed-by and tested-by as well?

Thanks for all the help!

	Kris

[0] https://lore.kernel.org/lkml/20240909191801.GA398180@google.com/

