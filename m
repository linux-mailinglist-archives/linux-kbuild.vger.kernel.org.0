Return-Path: <linux-kbuild+bounces-3436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E034096F740
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97743285701
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11A71D2F44;
	Fri,  6 Sep 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZrzwxP/o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VOIs6m0I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71C1D1F51;
	Fri,  6 Sep 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633943; cv=fail; b=dnbWdnLpw04VRpjqiDX+E5H6Y1hhoXTXmi44TcL6NB8AVL21vmmXUhkazBol3uUaQm4yGuqj01vCT/8ZqGKJrme8otOKvt5bShS0pCud5nQdo/kiDR8nljpJSNCRWcBXCnv8lhZvXDDpXsffZSGDKQy/vfjLgaiLGJnEb5XkWGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633943; c=relaxed/simple;
	bh=/58rePLtCa1xsErFNxflfieAnC/xcwrCxWfcAEtvEGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aP0se5YA7Pw758f/yHYXd6w+2Q/rO42tmNRfAFbOmUca7HmfjECN3m+y11RTcvrrpQpf+vsBjTVCLbMsMX1n9FCIwSbOI/YCSvmpGRTxUScw/lpDNk/X3Vqx33dS7+6ngqlffi7/yzubGX61FZFDYkSF+5ZQWVKrUu6/u0hlHSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZrzwxP/o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VOIs6m0I; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486CkVeG028772;
	Fri, 6 Sep 2024 14:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=0r76XcmUTZJzXV34DV2Z0f/sAoPVqvguW4RwjiLVj0M=; b=
	ZrzwxP/oFtY3JvRnyRxyqaey3VJ4wWMre72muk140lBiVR0oCZMQ7pZzcW2U2TLm
	yl0Gad7XpJXFvS1Vc665jG4WqCcVaLoUuQrKvSAJMwM+5kOXtg3+KP/A8NQbVWiP
	dEUhe29lhU0TCHy9s/qASSTUB30OjBLTqO/dqYMPh0NahgGK/tcvx5BpBCMm6zTz
	TuF/AVEMO9EVM2G8B5ucdsjsi1OAJu012f4NnkjUMcg7asokwKvmCDkPLcWXmJn7
	bjkdMnBwVzSncYrFvl7iRUznuIkHPEytVEuNZnh4vcUHsnrxN6tn1UDyJ92yWNEK
	iTMNYs5WitQiU0maUNzURA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwjhtgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486DZOSR003531;
	Fri, 6 Sep 2024 14:45:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhybbky8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu/F97wX8y67GbgKvL4vsdd6qZLKt7Sy89P6p03ioemGF9ZbehBuZbqWk8xAZHLA5q+1Q8mhT67qsaOAe/QbBMsPRe4+r/uvkUjzF6PbK/x5cjHply6AWhIH4/SMN2YntW+fit/D2LbrIWGxxgzqcvRw30S3LLiZx0pKg7trYB8oSg76ujHl9p26EspIpEZgUqxnz3vdUZFa6N7ial6y/xkiuueK1KH1hOh5yrjH+gUpGpgOvq8iPOIQ4xHA9OZQxbaHsDAFAwxcTASfGJpiqeXmFglXGyzxsizr4b/JTJU7g3QzKuCkl5EP4uYnOe/eFpjvjUN6/OoEbSXkhfUDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r76XcmUTZJzXV34DV2Z0f/sAoPVqvguW4RwjiLVj0M=;
 b=nzbyMIFVnupk9kXA/8rwm8RVW6SeLoN5nhTN+TpSj1JKgl12DOAUkCV8wqzg4cc2SjXvkcO8riC/0kO93DBXh4etPX9UpKBs2bXe5Z8VMDhz7fUa8bsdId2KHRpbsbnkGPOid5cC/wUwG3CTtxn2GYic3SkP4xsEvmNQKN6cEVTkaaKKIAOeTRR6SimM5VdIFz85zH+POKN/JPWMMUjXqpNt5BH9lOFrG3eOQXkgas9XtltIQa+WfPNJXDbW+6la1mVtCMyeRWJXLsk0RQjG/R2QFY0VnBzYWxIT3NuWGoV7OwfmF7PA2paoJNKgT7JbyL5pcIJgQlPLPOCrl1rNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r76XcmUTZJzXV34DV2Z0f/sAoPVqvguW4RwjiLVj0M=;
 b=VOIs6m0IgL6a0Cw4j8BgIhPN8jUAU3gXewXmKUlBgI/X8HjdPfAmeLQzttkUwRx3r+dnOcsNEWkOn/7OwDqhZUK34Zj6TB/d4ePY88pQqjzpGPWkHK5sgtIgbr3axSpn+Nk6KlsXqEyikeOZ10YbwnM0I39FIP51Fn1bb9+gAOk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 14:45:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:45:23 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>, Sam James <sam@gentoo.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v10 4/4] module: add install target for modules.builtin.ranges
Date: Fri,  6 Sep 2024 10:45:05 -0400
Message-ID: <20240906144506.1151789-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c63a858-cdff-480e-b0d2-08dcce8289d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GVQXZiRPwzi8+rli38z9ZgMjjhNOdSeE7Sx9YaeUceUCvLkHkYpFca7qx4Wi?=
 =?us-ascii?Q?UuQQEe/rYtOB5eb+eJWh/UdK7HGijv4f2PIx3pg4SfLeWEaA4E2A1Z0aMJo7?=
 =?us-ascii?Q?fjKCDYcoOS8H6JMLF7gmRm5zf9DkFSIssuRZ10eYpahETOC3pyiiU65lRnlT?=
 =?us-ascii?Q?S24Z4rkPFHDNYPFWrFE2iJr3YCdCZcawD/PjrwEmSzRQAPjbpHBMIShmfWH8?=
 =?us-ascii?Q?HgCshfpRjp3Wg9ES15KXIyIDgIqzLMtuBfj/JLFJnL3SA3MOnloVEtBzByi+?=
 =?us-ascii?Q?kMuHKeSeQXmNVeCbNrdtDxMQyzyYcT7hGsQ6HeLRX4NMn1801pYk6mU3bPia?=
 =?us-ascii?Q?PWzuGrZCrMLdAkRnVhgKnUNJ+IHkOKE/Ehe+E1+s8E98/Vo8VphIGzEpkWYu?=
 =?us-ascii?Q?Z6KpDI/rdSSzfLTMC6FCuUfh6fU55yow32z9U9axOeGkDEbtrtbl3Z7+Sqfk?=
 =?us-ascii?Q?6ELY57Z/o6QpVCPVTCzJC6kBVAzPOoBWiFIDbo0X5CaRqEqmDB+ulbsVjT4j?=
 =?us-ascii?Q?+CWxiM9njus46nQy2E7ANhaOmz4PCA2A5C/IDXSvayEiX9Bp8qn/8hGNnrAa?=
 =?us-ascii?Q?OoViaq/obCWuU66utSpBUdU3/dNjKC8wFIHpLQlgD3iplxci1DdqhmbtBLrH?=
 =?us-ascii?Q?fq4Dvb9FcP39F6ex5kpyScXanEc+CzPuPOZN0+nUf1owXh/SO68DvRhp3IDT?=
 =?us-ascii?Q?GG68/Y41KGqXYm23wgFnKtlsOXA6wjBwCRSfeyHEBVoSraYID/njYZxd9EYG?=
 =?us-ascii?Q?Zp8DDD/L31gbWCCHCfsmO53WlCIxzPkgJTb3txhdL5tDot/45HwSCBlQczAi?=
 =?us-ascii?Q?UXZNCQfBCx965bgbVSzsoPj7YomCMAsOGGBSeaGFb6sFcZ6mH46dUvEdxdWV?=
 =?us-ascii?Q?X0M3zEo23ciInIJdlhka0sTYvjQII4ZUaeesdb5zEabVuXJi3yxL8OqKDNFK?=
 =?us-ascii?Q?ieqwunlBu0WXGwdNx+IwcXS2JHaJ/WkooRKmiG4gA882BTTW0LgWa2iYgbl7?=
 =?us-ascii?Q?C12E5vl8ql9xyAmB4rnokMipj32C9W40FJ20LYM4ioUD2UgLvuGo9N4TsCoP?=
 =?us-ascii?Q?EbOTHWjP4bmOKBU+59vyN9rBH4C7pDeTjxboG0gkCOtIKSrRPOTta6Rsg5MC?=
 =?us-ascii?Q?G99FExc8g5u2ya1Y/CVjRetQVX3wQ3JTQSGPk7fmZ2dG6ahfZE9po4eCV4hU?=
 =?us-ascii?Q?8XZv+XHRTy24nkZaxx3AH9X5R6/23wVpQgf3UjtipjtxGq8O9A8O9EjIGkd0?=
 =?us-ascii?Q?89eAmP3kk4+7Yty13RO0eJfJZvXb+rWoiar3y33RppBibpyXtY6ZSxVRNyxt?=
 =?us-ascii?Q?x5s6XIIsuhD1XhjmXXQv5MpFYlrQJHw9hMyu5VkdTgYBfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wz6IbL6jJbzcSQf7OpiDtvdIJaNanAs8eMOD48wjYyy5Q7nT+V3nhvPk7c6x?=
 =?us-ascii?Q?WZb8/JHQNBya05xqYm5cB1Kh4YevQbemXBNjDDWfgUdgOTIIhq5zg92OMGeJ?=
 =?us-ascii?Q?Qwo6D1UTeLcm4udXPkDWjWo8T55XYd5WtZ0bdJ+epYFyTqapeefEBQvTf9wU?=
 =?us-ascii?Q?3ULZOznm/J8r7yC5P9oZmkMKBybdSjngDbX+V+wWKmY8Vbda9FVCpzfqj0s0?=
 =?us-ascii?Q?UZC4E6Ku8OWlov/Us9CYXmc19Rvh5yHwBrXbP8xb/6asSra4pZ9F9TOnSq+w?=
 =?us-ascii?Q?0WLQogNB9CTjyI2x6A7JyT8sg9MEbnD0IpmnSKGnX9i1n/MR+oEZt4x8Vaxh?=
 =?us-ascii?Q?QgPhkGOLkmnOEDRUJfwbe/x+lyO3YBOwAjWcWMS75WphaksltIgjxs75bAlk?=
 =?us-ascii?Q?KroqJPn8Yfn2eCZg/RKmMETXB2dh6yRwK8NAnX3YDA8Ss6TbUxQKSNAYEtDM?=
 =?us-ascii?Q?EQbD8xk190kDqAQ/p+v5ste52PRzq2yCMtp0uwjJ+dTOl2ts+zwurZunbIFO?=
 =?us-ascii?Q?OCD6m3cAcVg377B3K9aeOGeC22dMK6Y1Fui66Ios2QjLN+LULvVBnCs8wFcw?=
 =?us-ascii?Q?rbTkXkMbMJ5XZRnw33TkAcoBnJCuCUJS1QEa+VMMOLdUtoqAUdNTdq7ml/EA?=
 =?us-ascii?Q?UVAAkUZgkEpXNU3ykp1atCnNmE8/mr8jzVqTh8YtCb1tVYsTvXSNop7m1NR1?=
 =?us-ascii?Q?aFAb6Yy+3FcQ55dbFkgfjT58hzHd5PEAouNK/3jImiHMTiFUaUfBjEqQoNGC?=
 =?us-ascii?Q?SDvpyMtuoZo3OdmBWqYzKIlQ33jjHe4rZr6cywR6ex0QoV8+ZVx56Zn56IKo?=
 =?us-ascii?Q?M2vTrpr12jF17SzAzFjO/K7JDMof3X2Ahc2KuG++pqiYo3CejY46TjNrXunI?=
 =?us-ascii?Q?Yr9sfq7H7An5Wz7BssxLaLhhflhvYngJXH3FrYYGiSpO20ZejxgMgqG25eGh?=
 =?us-ascii?Q?kBEpkx+B9aCyrNBoCew4b0MBN7NQXKHUvu6HuVCniHWFEOQf8LqqsmycrtPu?=
 =?us-ascii?Q?eYX/8YRvVjsnFRiJSlOqSNFnbGLKtYbYaEI5qxs2NTJ4FiovgIwnQa8tl4Je?=
 =?us-ascii?Q?UhVA1brBZZXi6kgdU0wRq4tkH0WJObFlAQ7YtDNJAUSdCNN4eKIme4Bogxew?=
 =?us-ascii?Q?1mas79oTCqQ+LzsuYIip5wFkFSfX3Ier0BGOxCBPxUMv5UIJcWdL//hJJ+sr?=
 =?us-ascii?Q?kcQ386PR+6VG62LXuTVNW/YMKzrprMNkK7kXE1hUF09/7+CM5sknnpFprKLK?=
 =?us-ascii?Q?uWoY2nqz1JSAyPe8UDY5al3G0jLWMejpEKqqAluRgUXm5EGOoWqHcFzUSjML?=
 =?us-ascii?Q?WYHpp4uXIfsHHG7tK801j2zZKbU+suwdj5vndOqMWbTqD4GwHUAWYWEB3Fwu?=
 =?us-ascii?Q?zLfFEZfLyXdZCv8mz2TlgQirOPprHralGI82MJpPw9tJGDGXIJzcZMP+zZji?=
 =?us-ascii?Q?tQ380QjSWmDchcXXhymwBQErSbpcj6HANjWe/7shg1brG/74rDKpiu9PdTH+?=
 =?us-ascii?Q?PVG70ww134ZM8Zot1f971xfvf/RtM7k1M3agUfawuO3JgbrxC2vnxR/QbWNw?=
 =?us-ascii?Q?j60L/8hu1dHoFJiGCZW+iT1moOVNz7q0RNR/WTJYGVCp0yK9xgUK/zlYW92S?=
 =?us-ascii?Q?jrCNAPOJODEQ/PmS3YKABnA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HC+aE7W6D2xUZAYPD7lfKATggoHbBdI6l17MNZEhM7rPXyjVPzH0ApUDFKG/VgoYiW5fyprUrNljDWQWtd3lnYSJXZxzE7PEGlLBAMRXT+SQQf7MOEcjrfygnG0Fyi2LmplcdvaClnuA/pXusYCvnJ3KY7kBRidaav4Ll/aIbkAmrmsGptgLUa7UsGzdTwH6f0vTMX5td2rs7BLHZ78+ZBy4UJCef2jMNp1IJJWK7ZgEKOH3zi/dGaToayy2LSj96LuTODDEqcyqbchVLhCp1jNw3Tb/7yGABzF1XYxGTdP1c0Mslmu+NDty8Yrfi/uWiA0MLGnVZ1ewCbXBbbwf1ZwgH5zcVHH8duLnbnG3sIFJ/FD1E2aToO/7H2gBRVYuOSu0Rm53lljd5V40PUAbseiGF+dUJdujjIYHWaHenWmKyx0F+iqx8oiXrBwzzyc9nmaRhiCIRNJG49SYjppwGdpBAx0Z3L7aIZaWjmUqFQWYj9hDyme/anASvAfKu13Ee+97PzC7F1oK5u+AVh8YHVUjdAOtmZO1fbcvII0mXn5SC5MBycXiAo5wICCmsJ+vLVIdRHBnvqnfdJHAUBQeoY/yzxxZbVnEARyCZcFtBDI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c63a858-cdff-480e-b0d2-08dcce8289d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:45:23.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ/ErWttCwRwPw8m9QR3DFMcenNmFBMWjELaKdqSFRfYI6Fl8mMSSnf0MxVYbHMs3D0Wgxvf56ER3Czt6OWQZteDRCUQPX3hk2KxsBUIL6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409060108
X-Proofpoint-ORIG-GUID: 55iITMZRwXF_Q_UzWp3Nnr7z-j5mvFIR
X-Proofpoint-GUID: 55iITMZRwXF_Q_UzWp3Nnr7z-j5mvFIR

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Tested-by: Sam James <sam@gentoo.org>
---

Notes:
    Changes since v3:
     - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

 scripts/Makefile.modinst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..c38bf63a33be 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,12 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
+# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
 install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
+
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
-- 
2.45.2


