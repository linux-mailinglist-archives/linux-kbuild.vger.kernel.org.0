Return-Path: <linux-kbuild+bounces-2549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91F931F26
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 05:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84641F22186
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 03:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6361B94F;
	Tue, 16 Jul 2024 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PESAVuZT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ncgLVspZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BF18029;
	Tue, 16 Jul 2024 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099473; cv=fail; b=FboGStyjSkUuOMK7hP0tjtS+2XAwXiEx29fArfQozo457cqtDBL/0MOCTndW1LDPiJ2+jVJQrOsUBPpt4Dk3BjVAwA4ed5w0ZjtWbm6Iae3tPAHTy2g8NtXHp5VUjrftvkEWEacEhqSMS3STxoCdK3iu1/yQe+mSz6QGVObdwO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099473; c=relaxed/simple;
	bh=IQaX5T07SvvyNwdaagYSFt6/586ofPpfmuoordftns0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZtxxZOmZLsdYN/EEQcPQh39L/V14SNi6QHm8SQ1yxq7YOb0z8MOxruxyAheR9eq7goFDooRfsIDQyOyGP9FcPAIHoVoPynR5zyqXOei/GgT7CixnYHgKRp5VjGK3c0zgqfzgw3LbbH3QC6fOi+Ffv7rn18EP67ptkMxC6x63vHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PESAVuZT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ncgLVspZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G2tT3v025514;
	Tue, 16 Jul 2024 03:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=3y6c8LRWZWDp6cvaoaQn8VT4VHWNMLAB156joR6nbZI=; b=
	PESAVuZTHAEuaaDLLMS/cceeu83pGu2FjINX/sbpo9LM1RmD1KaN8wGBERC4G6eo
	VXH5JooT6yEncJ9Qyv6LJrU+OlCXxi4Arc6yDFdgPktbge8LSBrFlOj15/TWbpez
	4qtEXagK64cIA/22R2x7JKqhWtPoxK7RZk5iJHwbanAm9TD0OfWMRCVXNprK+6iy
	/kSifmoDggZM77oqI1mr1r+1eBvB3tRGnndq5VRrxVDhryDiU+i8+x0a6NDZ/WnW
	sjxfblp/vDheyqB16d1MJlosz7zOKEc2e9hWlbV9rbKZDUH+jmvnBB69RvUV2UAZ
	VpHwzWw073lM1rCrA1UkEQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bhmcmgbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46G1cK9m023534;
	Tue, 16 Jul 2024 03:11:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40bg1eyv3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hi8PPxsgEEykPcTV1hnRUyuoJSdd/Y9GAxti4yFvepQxEM2UiYURJcIiC8l7DVu24HyjEHNr0zImwDB5++MLGXEYcIeHQdGp+2NwC0gWt44vo5Wj1YgTRNZjUQVu5T8OogRJhhSHdfRB8OrWaAoxL+ecc9OknKZ3UtbNTuDN95GZrQSgyQl3UdCarA2KemWzN6BfRyfwSD6PLDqk+zpMLinNYX3eNScqTaUEor/qPrLa5usWi549cVYtOQrAORYPb1Aa5SuubP1g29JPUnEfdT6JkYuHI5jDJPG5DcYcvVYIiokaQdR/0LBCcqXtVKS2CdNq19XtWoaK3vc8abjUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y6c8LRWZWDp6cvaoaQn8VT4VHWNMLAB156joR6nbZI=;
 b=FdGvCtpdieEpdO+ut/jgPe6WKWapBZV4AFKMrD7OFtlqF2lWtItfpjNDdQTdpe4oGeCKwO6pVK9Uw9bpeQgicLL+BdWrbhxRcqgLfdmkphF4ZQ1DeWjZvCrQfGVU5iDC/Oo6LpfrL1SRUV+0Rl8JUt5n7feifKFXaV8TGQ4SBxZ6XgyBfiPpCwTND/Y4acNkKlrCCGGswfmx+JMPI3xuuzu/ys4dYxQ0+GoFXb2i3NpmOdXhBJ0SkGnDo3RTjV26VgCRwLMNQKJ6CZhd73NG1MsJHAXiTK9EkB7+xsGGVOc2r9EkARpDPrRdbt/iLJtHic1F8bX36UFLXYZsjlQEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6c8LRWZWDp6cvaoaQn8VT4VHWNMLAB156joR6nbZI=;
 b=ncgLVspZ8hfeEoKUVdyBZnuzeZt+NwTPxtOCbAlvFMNV3i3ay2/cQV+c+hEEAIycVWy7eAtR+2gV/vJ5KeDI0XvVG2lI7gO4nDqmyFCT8LhvsifUrYRDQGRaduYhhG68ENMrnIYtDZnc7vXDWXPXQRehj6e1+2HZTp6tc7sjQKY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:11:02 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 03:11:02 +0000
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
Subject: [PATCH v5 4/4] module: add install target for modules.builtin.ranges
Date: Mon, 15 Jul 2024 23:10:45 -0400
Message-ID: <20240716031045.1781332-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240716031045.1781332-1-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::13) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c7618e-0895-4fee-d100-08dca544eca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qZ2CtwgSvRMgcnjLUiWYvgyLKZUm2tVxRVXiA/oxV1yLHp6juiclqsbDbkTQ?=
 =?us-ascii?Q?49RgLdlzCMjWtrWeEOdBpHkix9S037er3Jl+Ch4pKh8m2IsSJO0FBWxx/Pu1?=
 =?us-ascii?Q?sSFeHwp1L5iASURbyazsb7pUGavw4CGypqhXFsYaK/ET35CklOSLvrjWDfFB?=
 =?us-ascii?Q?p1scgOMP+JXh/9ANd4fCxdpncGsXF9vM1cAISn7Cy1jQUNcoAtuTxYDmupyQ?=
 =?us-ascii?Q?L5idbjJmDxV2+RQo/fkp/xBPalNfLt42w43TWcSMI9aP380ykuWHVlYAFi5n?=
 =?us-ascii?Q?+zS7Hg8CHTSvglDF627r1P0p/y1itcBILZEePEyZD2rUlerVhLncuK1BRW4t?=
 =?us-ascii?Q?PHFJK+C+7Nqjw5y9+DcXutk241BDtZAKTs74IgOsjvYxRn5NFgm/HNNg5SOG?=
 =?us-ascii?Q?Ohu2iCu2QSi+9T6iTS8TseBGOvfYoMxDPopcEsNHMx+4ePEoz6etfOO5HkUM?=
 =?us-ascii?Q?GKlt4m/Xc4sG9LjoIGxVygJLuBu/VnV/g/n2upKH8I+YJ8OQLIUj/x0DTjoe?=
 =?us-ascii?Q?GB/DKvzi0bbejcKrBilECYaCcmYh2SRg5KKcbnu5dN1iEjhGxsnkl3L7dhzP?=
 =?us-ascii?Q?T9iFqVysjghLAUb5Fzs58P2hgA5MMv1/rqcWsKLsykx9l5Lexbi6Jz9UKJKb?=
 =?us-ascii?Q?IQpvmBuZjv7BvVcY0r4EwlXL41zMcT9ecVqmUARTg+39XpYkR3cRp2AGqt7Z?=
 =?us-ascii?Q?HzKPlbl1n/uaUVWyPHCk5nN090USkDctbMA7eAoov4QGYrqc4AC2f4ZLv9wT?=
 =?us-ascii?Q?0ueAvekuVfdDU8MlY0mXUvKn26LyCcsOfnR3no4H2N4Bm2sZAH9D95fEdXM4?=
 =?us-ascii?Q?isR2eFKm75fYVrqlcVLM3Aj/NRFMsT49dL52h4fNnHAA6Ts8OJyKKEnlz/Zb?=
 =?us-ascii?Q?zWrtKhiC50HlvLLABTrwOEgmpoCvDYlwpfCEQXu6k7FxpDbzoGUrADYT5mvE?=
 =?us-ascii?Q?/Bse2yoQieOuJu19Hp+i6WUAxeQKS3U5vp3Z+jPROE1fJDej5dJ/6UcSzcRT?=
 =?us-ascii?Q?4zshOnQfEoPjjm9Hy9kBaJ3OaAo9WYYEuxpsP/0w4gUO33grC2kTCneCZXl8?=
 =?us-ascii?Q?IxNu2mXN42bkAHB1dwhIIr2HCsV2HXfcTutM73vaVRxOXaSK/kr/bTNNLswc?=
 =?us-ascii?Q?4YihnixxtT75clRm9Gc7QHDH8T+MTCU1f0mrsuNx3Edq5gbU0LHnQmi4A/bk?=
 =?us-ascii?Q?nDkqzUKIvm+ZWs7a0R5ckt+Dh5xEjkGLu9aT85raYADmCGq5QfRVx071BehA?=
 =?us-ascii?Q?j5ubWAhE5poyS5Flh8l31HcQj+U7gLWmenurTVNEqFeV38ff4yiMineZlySi?=
 =?us-ascii?Q?/p2GMPSABqiAsQPjEAsq/U6panjrC8OMooOmbxujiPoqKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5rUOXFCIOPQcyyB270ZcyKCTsC/E+VC8qlND0PSivpweVz9/98dvAdfHPUKm?=
 =?us-ascii?Q?YD3x1wYVSBx2VAe67+mrFKtwdbQp55HYinff/J0fbKcUss+ytUit3Cuxwfue?=
 =?us-ascii?Q?GrFWbS9Bk9fueG3eHEnin96e8QoqDWo7z0PzP1Wvwbh60yRYo0qkIPd72OwK?=
 =?us-ascii?Q?6iCJbJHvqmEOIfP/pa+PRayxxclOXXFUMylgZu7rJ1PZ7U/h6l4Rv9r2cDR6?=
 =?us-ascii?Q?ZRXFBGtX9K9nUSTbcRUTeps928tpwomcnSbIN9bgjTg/EDINEGtupCiV9uxz?=
 =?us-ascii?Q?2Be+CfRjzC9XXaLb6ZZ+ZPtrEfDmkGnN2JW+YOqMxwJd/wc+hYivIFIOpQyt?=
 =?us-ascii?Q?AJnfUbanx+hj/oYUqHYNfHuQ54WGd/EQfPDkTZuE48eJd+uodizAFjShNSKl?=
 =?us-ascii?Q?y+onE326HrtIeHSRJoK/Jo+1GbeJgwKAKwQT/Fx4+K36DPvsxC49HvcXDFtW?=
 =?us-ascii?Q?bdG9p23hDavp1d+Qdmrtj/ewmecVXNNJlzTNdEScUEq1THjZcIO6kUIv7QvC?=
 =?us-ascii?Q?wdx5AzseEOivzrkPoG4uGqDF9uOlt6mSsHfdAJ+3DOLhnT9ORJ/FVKJLHWY+?=
 =?us-ascii?Q?wvS0YQOUJ0LPlXUoHzvVbzKHhRC/8ANFcFp7/C9FwH5sqowT+LDVTDPN1oew?=
 =?us-ascii?Q?PUK1aeyhA3wRUivEy2IcsLoMpvz+QEKZioVYFr61jq7zpITmU9ylIl0GgVe/?=
 =?us-ascii?Q?Fs4xbRsluAIm5UzxHaHPut21Y7k3fzMZZUF0wKHDkxXMUHnwrZ+TOyeUZz2K?=
 =?us-ascii?Q?8RgXSf1Gj0UwJ+Pe3JKZRam2k13qLNOjYDePtAvIsJhrv6yzRxaJ1kePOymg?=
 =?us-ascii?Q?I/ilabn0m8gjAtlrJhhgS0aE4icT+SYihb5kdJxN3A7My+7XBIVVchx1yQ7q?=
 =?us-ascii?Q?GvlMn124Wv7xZZBqvl5wgwF3S1vcwr8z6VsLPs5q3eJ3diR1I4jB0k5VO8sh?=
 =?us-ascii?Q?6Vr+j4yEidEG6Xnm9uDs2qcaFO044i2bASCQJSi8m+Vq+wdDH/VwDu8grMiA?=
 =?us-ascii?Q?3oALkJgwVMpCjsPtEfbAmocb+HjnDUw4EyDBvAaw7sHp3iRJ98DrEPH+vks+?=
 =?us-ascii?Q?nHCBlzNoDjzNKvG38VG4RXrtWBUiS2R/UBEMNFQMu0KHAM/FAZyPUecNRSIO?=
 =?us-ascii?Q?dZ5+sUbj77MyK8rj3bJxMTGYlDvLn+p2tp3G9E+kbmnHzSNdzxtgysyzXBsF?=
 =?us-ascii?Q?oSs5B6kYdJsuyOOiDPg5vf72ln42ldcqOGurKRXvldzKCcKfPNipgIR3D+Nt?=
 =?us-ascii?Q?Apk/X5WCv0fUUfY76saxJZxM5l3bAMz37Qjv22xlhiC6ZZrJ02g/CB/jzIS2?=
 =?us-ascii?Q?CFznrVMHThEXKgrVED/NynKJDLmf65vIFaZTL06b1fgWk7e49+9CbL/jtOi+?=
 =?us-ascii?Q?oREvOyRob4N4D/vic/QQyf8rZId8o13V5AnQAUg4ebqZEeemG/9QKbUx2XoB?=
 =?us-ascii?Q?OHaVc+Wt0J010McsxOXQ8fTbxZbFCWLdefAcWGdgt1h6aO9dD56sbtcSuHQn?=
 =?us-ascii?Q?WIbrn7WFEgDHm3N473GC8c/0QrtQY2h2MwYnnS9U6ptSNC5JU6trj2iFSnjw?=
 =?us-ascii?Q?demWiDETKOismPpJPsVCJ/7nRIhRoA6z01Qd0xv3TDJ+Mn6JoU4ybp44cL+O?=
 =?us-ascii?Q?RKqi9fSlphUWItlWUobuLcg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	L8BvaVPx0vcv2FkqColvG8xYgqYwDolqJj6/pWRsnKhJjwBHNg2goTl/Jtdu4leFLGcF/s8ZT2a9HhMRK1njJlIimnB8e05GmpQl2y+0BLZjl9snAokbcGANohY+BxBN8UHu5OnKXZ0QiKdQ7I48JRN0xykdqz05Ki4PMnNLY1sGzfB8KQwmtiWFREAnkrrBanMW+EOVywlPRvbrlbgpzQYFUvPWlQ89nocWbrfQz0yAHmknYdN/EWNmcE2bYab8n6FE9BSwrep5Mq7YoiJIHCkXZYBeWKVobRJuvzShjD/Z50Hzwut3EONkLGz1aN1VSKx8l+caZTLE6TeepUFf7my9RubiPE9fUA1NHPCO6E1rVWtd+HWUoksnbxje+TXtm3uTrFoYzYTKJIWGJiI2OPkxGHr9ZfOI4mw5f6/ubiDQ9jotc9nFdsMGrpOLvb4SR6QC0tuRc3DnMpMh4XASDO34kbq1Qi05KJoebVQAVt8V/IXsgmAlro0Y/modM1df/lv8yBSUrScNAzoULuUrAZnptpfstlEFBNwqnNxznVss8U+fghucWRoRqP4qP8hRXqD2Kx/NU1NafH3QB6g2++D8gTAslyy8idSmrSJN+YI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c7618e-0895-4fee-d100-08dca544eca6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 03:11:02.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2Dmg0YjFN6TRjQNX/h3rYj8a2gxfx3Re1tz0hqAV5iToLwPzVS6vOLfTvvaqKV1VYIS+aw7RlJST1Hhc3H9EoTZb6FTF+zJloffx9jfxQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407160023
X-Proofpoint-GUID: KMw2ghDvGdpTslXD3v5vggBNWsC1I-Am
X-Proofpoint-ORIG-GUID: KMw2ghDvGdpTslXD3v5vggBNWsC1I-Am

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
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
2.45.1


