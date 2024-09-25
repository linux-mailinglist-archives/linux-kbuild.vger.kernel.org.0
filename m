Return-Path: <linux-kbuild+bounces-3731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829C4985650
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 11:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59711C20B27
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 09:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711A915B145;
	Wed, 25 Sep 2024 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IoEi/7tE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OZVLiS58"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CC820E6;
	Wed, 25 Sep 2024 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727256488; cv=fail; b=lXCC1RNRFT0LtXvDHSETvkZVWuYXTbh5+VZzA/Xy4ZS5+4blbNQ1J9glXrieQnCgQQPzYgrzxWNKLPb4LaElFogegDvbv+5+XI+0Vj4C1atSPy7VN9qwU7wpbevnHqKvtTGgh+w+zws3LakIj4JUP8gLsNrZoQ0GJPAvk1uRGJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727256488; c=relaxed/simple;
	bh=WKsv0/j0nY2URSwNTZAIXzsXGX+DSbslYaBUAuHV8OQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I1Qm/b8nZ7uxmWAKYK+bQM0crkonO3RJB8dmnHMrzJGcsz4H8Q+eFkHq/8D7DdtV0jGpgWL5JkXxWHz13LtCDuBY+fctFlDJdEP5hxN4v5ocmxtzcXhXLomcHtdLlRgo/iH8HxaRW+i8l5KS68Bw1AJPx51yrFqY9uFehdJLyC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IoEi/7tE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OZVLiS58; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P1tWl6010697;
	Wed, 25 Sep 2024 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=GJgleMmB9R4Bs/vEYDUJY9M4xA93AffQQPKbY5zjc/U=; b=
	IoEi/7tEqjhr7d4+4B8cdwRTwGgdBEs7TRefGdHusnaBpIAGr/Z3nV87IR2yVnj4
	GAvqCoAfXq9M86hi6/zjj5sjWGAYWXzaIf7m5Uhyw7wr3GfGObEJAxdanytNkyoN
	2fhcVKV7morCm6gjriKjmm1cdUp7v72n1NXbNHY46strbTCpPYrvVYF4f6J1xh9N
	5zlqntPR7OKuOTrSZ7v5pR7LXPcd+oRATuYkoWN4Ocm7kcuILtwXSNcYT5SAWlK2
	JB/zH6SlWeuSCVAz1rORbnwEMFv7LMOWonFUY97jw80FbBHu03Z1E/t9yxa3oUvT
	AoTrTm7Qd4eXpSUyc51nWA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41smx37cj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Sep 2024 09:27:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48P7WwlZ032726;
	Wed, 25 Sep 2024 09:27:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41smkgqf82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Sep 2024 09:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMdB/jmH9iZACimkbJBeQsDDFkRCHQLk7CB9v1Ugxe7ycICzN4e58wz6B4DRTmbhzDk+7kLZde+GYXKrmIsypfFjKtmMeVW5LyHBJXygr8YWkDbjXfcy99xcdne90murlPJc+Oz/UqwYOBufyGYSW12II2lc7HJBZmT0EqUUO6fW7MSzxslfhD6XMAPMyVTzlEeGcgU35wbkaRhH/6pWHp30d9+U2siAofDbVtNKJs4S9Ih/6EP/2dI9HcQKymyyuGNab24UHdVCXr5szDEh7rRu3lTGXOOLplHQAeH86oCVVfQgrClBix5qkjdu5qL3tX2TiZZ4g11qLaZu2bNZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJgleMmB9R4Bs/vEYDUJY9M4xA93AffQQPKbY5zjc/U=;
 b=lr0T8YDA2NAbpW5G+EwUg3E8WpL2ET5cRYNEf0QZ4fmezTRR/tM8aqGQi+oDyskdi8G8XX/LBe8aQka6+pJcQcxCGWtwx+NCqMqB4QDatnRg/gZ56+oaBv5jQypq72AN4+JZUgGGKIdpgBULYwbFjm2MJA0Jttgt6D+Ks8fM9GhdGL7nxjymndXbOO5Ej/chRkMk7rgCLb2RSqIi9J/PPcD2pnDg76f3vWGODghlGn9GAziO6hbruykuJnwJQAoPfomHIh9l6smbF07OGnXDsinVr8tVYAfup2TUD3+v3LVQQivc+w29xTBM2SDa8ssutAmE/pMVRKseng+tY+4M1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJgleMmB9R4Bs/vEYDUJY9M4xA93AffQQPKbY5zjc/U=;
 b=OZVLiS58uRLa64HHmqRfu2RZtahUfHpTQMpLGAJlLHfe/fSHtif1eTXK7ylAon6IZ1ink5ohD9ioaSmuZWsdcWZbRQX63lx2jXQLZGnmzgsWJXStLpxv2VuejK+vsUlfHmTKgCcGVZNeMSQ3ZDdTrGBbybnfnxtOIcBjPwK3WPs=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SA2PR10MB4444.namprd10.prod.outlook.com (2603:10b6:806:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.10; Wed, 25 Sep
 2024 09:27:37 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.8005.010; Wed, 25 Sep 2024
 09:27:37 +0000
Message-ID: <a7f66294-9f80-4986-96b2-7125820165ce@oracle.com>
Date: Wed, 25 Sep 2024 11:27:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] output a valid shell script when running 'make
 -n'
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0086.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::31) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SA2PR10MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd379d8-8a3a-43c0-f066-08dcdd444b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUVzckRxQXoxbStPV0JoL2NTZGJrQWJLd055c3NmOHZNQUp4NDdXWm1nNXNq?=
 =?utf-8?B?Nlk1VVNLVFg4T3JCZXFsa29XZWRxc01DUnNwNlNvaGJWMzFBWmtMV2JMR2Ew?=
 =?utf-8?B?Z1R4d012ajc2TUprbFJGTDlVbDJod0lUaStxTmwvYTVkNE9VcVNHVTVDM05x?=
 =?utf-8?B?bC9BYjMrTEthVy9xZHgwd0l6UjZnUEI5WVoxbkVwZkVqTWtBUHZRSmhyVWlI?=
 =?utf-8?B?enNQTEpMR0gyQjVhSFpxa012aWFyTUNxcllZcDB6ZXd4SjdZWEsvN0NUajhE?=
 =?utf-8?B?NFF2VURoVVp0cWFvb0JhWUVBanlvbUVhSDJ0d0JYbGcyQ1RRcUJ0bmFwVVow?=
 =?utf-8?B?UUZycXZaelMyTjZyNUFVZHlyYVNYaERVRDVHOFYreFFjZTdRazd3VkJhQ3Ew?=
 =?utf-8?B?YnhWUVd3OUlBZTRZMld4Ulh2bkFOL1FHL1Vkd0F1QW1GbGVvQTBpVW5aTWtM?=
 =?utf-8?B?SFpFakVoOVBycjJxTU5pTG5NNFZWZzVJOEJiQ1ZDM3NMSjU2RVcyY0RpQzhz?=
 =?utf-8?B?eG85eGVHYWdKZ1FiUzArc2lzVlVickd3ODU2bDZ1NE1LK2VONXpXVUUyQ0hx?=
 =?utf-8?B?RVQxWDAyNEZuWEpLNlE3eExKbDlkN2FYdXFBNktnTjlSUVlzMUJWYXRQMjRt?=
 =?utf-8?B?WGRBdXpUQkR5aWVEODhDMVJkaGE4amhsRHRJaWxYV3NJMHZVZTRBTGFiV3VD?=
 =?utf-8?B?cG44VGpOTGViVUlScjl1MDl1Y0tyUjl6cHNiZ3RiaXBocms0SEw5b2NPRFRS?=
 =?utf-8?B?eUs2d1pHdkxadHk3elJTSitNNFFzYWRCZTRhMXFSaW5WaVozMVZHS1d5eGJr?=
 =?utf-8?B?bng5UGNZQnFaOEY1bFYzcTNHSC9MbURJZ1EzVnowdWt6VzNtd1FxQ1pLanVK?=
 =?utf-8?B?dFl0NjM5N2QyNlo2bnNGL0xJV1FkUEF2SzU3S0lvU1RFcGxvQkM3dFJoQ3FZ?=
 =?utf-8?B?SW80LzJzcmdZaTN3TXcxVk9NRmZ6bHk5a0IwZ1UvbjB4NTA2ajBWbVVjR3JR?=
 =?utf-8?B?ZVR5Z3VWOEY2dkREODhwcjdScEVOcEdXS1hMOWg0ZTd4Z3BXVG5yYmNXdHdx?=
 =?utf-8?B?RGNxc3NhcnM4bHVaU2ZmY0NVekFRZjFBMnJaR0k1M3B1bUdKbVowOENkSm9w?=
 =?utf-8?B?dUxiQzI2WUs5YzcrK3k4bi9RaGJaK1hMWWxuMndmdGRrM0xzak9aZFlSMENR?=
 =?utf-8?B?amNsbEtFNmtqcU9rSVJraVh6SUx4dTRwN2QxbVQ5c1dPUFpZR05nbE9Cb0Nz?=
 =?utf-8?B?K3g0bzN5K3kwZStXQkV2MHYzVW1xUG9oN2RMeG0ySm4wT2ZjcFAyNlZYb01G?=
 =?utf-8?B?TUhZTEx0R2ljdHRocytnYVh1ZGsycjhqMVBVdG8yUDQ1UlNzVm40Ym1GdFZE?=
 =?utf-8?B?aDRsWGlmWGpVQU9ILy9IQXJKeWp5WWM5TzNoR1hqWXhOemVaSUZ5azlHT3lH?=
 =?utf-8?B?K2hPRDE0V2lnZU5VclJkdi9sSDdsU2VSZGZwSk5KSHZPTEwxdjJtSDRSajRo?=
 =?utf-8?B?MmoxL1NrYUtVRGdBUG5BYW9kaHNJSjJCRGZ2YXdabFFjcitVTjJtS1ZVYU80?=
 =?utf-8?B?WHp2a0swdUpwOFpTQ2wxWnFTRlZ6d1dOeVFKN1UwdlplVGo2V0xqOExVWHlk?=
 =?utf-8?B?TDE5RmxWVkFhenpXSE10U2dNRUtYalRNS1F3NlQrcHduRFNJNnNGTUJUWUV2?=
 =?utf-8?B?SG5PaXZHWVY5UXNVTDVSd1F4dC9raFl5cDFVaFA5cUJiU25TRlAzK2tBUmVC?=
 =?utf-8?B?Q0M4R1VNelFSRThNa1pBOUNIVzZyYU4xdWZnWTg2R1U2dG8vQ1hwQy9qRGZS?=
 =?utf-8?B?d1hqQ0VwNU52NlIyT3hWUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THRESWJWbnlCd3VCOU1RNTM5R3dPd0Jzd2pTS0s0NGlsZDZaR2FHYWtTZGNa?=
 =?utf-8?B?Q0V1cHlDY1pwYkdacHVHMVlRWTc4Z3o4MW9TSDMxcS9aNXk3MHRucUUvUUw3?=
 =?utf-8?B?TjRrL2dZVllxaEJsS1NQZUl3R25STXRHVXZTR0Y0WmhRUHV5ckFsc0hXQ3Qv?=
 =?utf-8?B?akV4aXllOG95cXVzbWNlVHI1a205elZCcjhzZ3B3UmxHMkZVZ0R6VUZSRUdG?=
 =?utf-8?B?Tzk5ZkVtWjAvWGovL1ZXazI2c0t1L2lWT0dXTjJ0MVVmTEd0a0pqc3drQ2Jx?=
 =?utf-8?B?VDZhS0dVVTk2OEczWG9NTGdwS1Y2cGhTSERmWHhZdllqb1FRNVJtOEpVSEoz?=
 =?utf-8?B?YXd5RU14YnRUYzNFTHBiQWhRVUQvWWh6SFh4SExaMzdyUFdhNVhTT1UreUs5?=
 =?utf-8?B?MXVXZFNsNzZjN21lRjI0ekEvNVpQc1pDb05ZWVhVdFFTa0dmY2UvSmZZVStB?=
 =?utf-8?B?Skp6THp0eFhPZWlrbDhoRXJrRzZkTDV0MnB5d2w5YkJtRHhVVm53aDB2YlNp?=
 =?utf-8?B?ZldQT3lHVlNWWk5aODFQTmlmY3VaVmFPV0ZUT0xRb09iSktJRWhFR2NPSysv?=
 =?utf-8?B?S0l0WGhGck1VNGJiMDk2OUJGdjFRZFd5OVVxWWRyaXgxTmZuYXhrUmVXOVFH?=
 =?utf-8?B?bWVid3hjcHFvYmNXUHRCRVhqekR2RXl4RjcwYXdENGtFb1dyMkNHSEpLcW5Z?=
 =?utf-8?B?akZ0OGRjb1RtK3hwOGtQSmdYT0xkSkd5NklnQmdGaDlxNXVQVFZmUmtoYStS?=
 =?utf-8?B?YklDb1RlWXFodDZQa09Zdmhwbm96akR6dHk1cUl0RGkzWmk4VDRFYnQ1WG9j?=
 =?utf-8?B?RVVwTEtMZTFsQ21iTE4zUk9PZVI5WkJyWnc1OXVwUFptbFpEWGo4b3NvK3Aw?=
 =?utf-8?B?N3BGTzRlTWNvdGdocnI4TlRRSHFIVlpEQjc2bjlGb2podmFLK1pnZHQ5Nm1y?=
 =?utf-8?B?eW44TVNyeCt5V3Q1Zmx3WE1pUWpVclJTN3FaTzR0Z3BuOW5XQmNNdTdnWnp5?=
 =?utf-8?B?Q1Y0NWpCSzFkR3Nwc09OODgwUnZPYjhOVUhycTFkQVk0ZjVZQm56ZHFPNm5x?=
 =?utf-8?B?Ti8wdEZ4YmtFRHZ1aWlNRWJxRzB2ekJqZEJTOUpSNXZFTTZhQ2QreGRpbmQ0?=
 =?utf-8?B?dkVoeiswNkc1L2w0NnJPc21oL21ZWHZXQWVBdG5yWlNxMnBuczNPcThHTGhS?=
 =?utf-8?B?ZzFCMzF6OUFGZnJXb0F1YjBJTXVKeGFhYWNiaXJpUWNaSkpwck9uaWcva2xk?=
 =?utf-8?B?RmNmdE0vZ25RNU5udVFtbmV6djQwU294dWJoWjdyQ29wUXB0dXBxakdIRTFm?=
 =?utf-8?B?YVo0OFNVRzVVSTJZT1BiZURUZmdzb0luRGZ0b0wxQndXNldMeGNIb2RtTFpu?=
 =?utf-8?B?TWxmRGsyOXlpL3BlTXUxV01LYzFMVVh1OVN3QnpYN3dudWd1bkkwOU1FNkFr?=
 =?utf-8?B?TE13S25sbTBkaldaVFJWL2lNWFdFb2dsMWVMNzBackVuTGVSNWxnT3Uxa1FG?=
 =?utf-8?B?ZE1VejFLM3RLbS9pdllCYkVRZncvR25pQ2xRQkNZeXJ3WjBtaDFQSGNJdVN6?=
 =?utf-8?B?K1VzNExtU1g5N3RCcHp5eHYvOWhHUTMvN1VxR0hzUHh0MGhPb01wSkpHd2t1?=
 =?utf-8?B?cWYvdjNId29lTXFQbnQ3ekNiVmRzL3liVWhyejlnbE5CYW1FU2krUytvT0hq?=
 =?utf-8?B?U0VNTlNMODVjaGc4OEp4OUtTaElSUmsyYzhudHA1VFFRSENQODZNK0R2UXZj?=
 =?utf-8?B?Y3l1MVJ5L1VPL1F5L1o1ak9KOWhrNmcxamtoVURzWUxGTy9RWUtZOFhOYk5n?=
 =?utf-8?B?c1R3eGVkY1gzWEVYMysvQ1dtYzJLZ3hBMkZxcnl2QXFUS3YzUERuOTRiZnE0?=
 =?utf-8?B?NVpnYzlZMFdQajJleWJib0ZJV0dacnVXR3RsSFNoanRnSEJ6Y1NJaXVveE9N?=
 =?utf-8?B?Zmdvc2lmNTJFVmoyL2R6NXkycXFXaHUxQUh6MEViY3prNC9aOGltQVg5Zm80?=
 =?utf-8?B?T1RGTUR1NG9MNjBIV1dGcVhJYlMrSWE1VDh5UHdRY3BoRGVwZFowL29lRnRn?=
 =?utf-8?B?dk1oNWoycDl4aml1aFJnV1Bob3A5czB6dll6NUQ1bXBNV05pZHYxMzhtN0ox?=
 =?utf-8?B?MTMyNE12RUJ4QjdKNnZvZmFhaTNmbEhsNnlnTFByYjF1OE05bEZTQ2J0YXE2?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A5icoH/iZ8mJbWpaqhLYcqD7G9WsvidYyruT6woF4zNWxm0wRAui3aaYZW+X6/uVVWQisuUwevIhdbIG3i5T+6qHoEe0fDqsmQk1sKvOjRTMbVqsiF+QvisMX1HHNDR2pu0Iwl2mgXfaJ+ZaJz43NHYmFwofpVJaa3wuYh50wSph9BO8StyPvdjyYrwsT5lPkpm5S+z7dE08uY9sqsz9Uw4alRr9dmUAC51oLXkRAGpv5xzD+RHn+2bvNE6droVlTjVyfzrCE0wl2nNgpoDr7YQtPP+6Jg4E+yG+qp0T024iHRvnGc5xvm60lZiR5HrsnW+6mL/lrcWwqauR9iyKkGfrOHR1RiUmex7N0KIoM6TcCmS+lpMtNQE2rcc6np7mknStZzCXJQ66wHZez+p+ToSveu9Y4Fde+7vSaUseTqIAvzYJDidkNJZ+6d8yJGglE8ydA9HctGD8JjydDCt5ztvCkS9ujhIxkTOsKniqjDX9T0dK23TXJgRuZwkNTWCu5iTOy9COK/MHAkMW+k+3G7HjNegwhLgE+6uejl4kFdB5AIRIBFgCV9dujs3ygTbWUewAS7ISDOWYE/dZCjrUxq6Bgapj/MjfGep9/AIXE6I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd379d8-8a3a-43c0-f066-08dcdd444b26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 09:27:37.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1xJdyoBBx6OXFGkJXbJIPLXT8phKRShnHD27T035mSBrIwGO4AI5lXbI24Zvf8MvhhsImvU2MpZHSnM1IxIPtdJ8TIfadzYLsO6bOCs4Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4444
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-25_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409250065
X-Proofpoint-ORIG-GUID: O5-J0x7c5Kyn6c97w6YMhILPf-q06BLV
X-Proofpoint-GUID: O5-J0x7c5Kyn6c97w6YMhILPf-q06BLV


Hi,

I didn't receive a single comment on this patch series since I submitted
it a month ago, but I understand it's been busy with conferences and the
merge window.

I've rebased it on latest mainline (including the kbuild-6.12 merge) and
there's just one tiny trivial conflict. Can/should I wait for -rc1 and
resubmit it for inclusion then?

Thanks,


Vegard

On 19/08/2024 18:02, Vegard Nossum wrote:
> This patch series lets 'make -n' output a shell script that can be
> used to build the kernel without any further use of make. For example:
> 
>      make defconfig
> 
>      # ensure some build prerequisites are built
>      make prepare
> 
>      # generate build script
>      make -n | tee build.sh
> 
>      # excecute build script
>      bash -eux build.sh
> 
> The purpose of this is to take a step towards defeating the insertion of
> backdoors at build time (see [1]). Some of the benefits of separating the
> build script from the build system are:
> 
>   - we can invoke make in a restricted environment (e.g. mostly read-only
>     kernel tree),
> 
>   - we have an audit log of the exact commands that run during the build
>     process; although it's true that the build script wouldn't be useful
>     for either production or development builds (as it doesn't support
>     incremental rebuilds or parallel builds), it would allow you to
>     rebuild an existing kernel and compare the resulting binary for
>     discrepancies to the original build,
> 
>   - the audit log can be stored (e.g. in git) and changes to it over time
>     can themselves be audited (e.g. by looking at diffs),
> 
>   - there's a lot fewer places to hide malicious code in a straight-line
>     shell script that makes minimal use of variables and helper functions.
>     You also cannot inject fragments of Makefile code through environment
>     variables (again, see [1]).
> 
> Alternative ways to achieve some of the same things would be:
> 
>   - the existing compile_commands.json infrastructure; unfortunately this
>     does not include most of the steps performed during a build (such as
>     linking vmlinux) and does not really allow you to reproduce/verify the
>     full build,
> 
>   - simply running something like strace -f -e trace=execve make; however,
>     this also does not result in something that can be easily played back;
>     at the very least it would need to be heavily filtered and processed
>     to account for data passed in environment variables and things like
>     temporary files used by the compiler.
> 
> This implementation works as follows:
> 
>   - 'make -n' (AKA --dry-run) by default prints out the commands that make
>     runs; this output is modified to be usable as a shell script,
> 
>   - we output 'make() { :; }' at the start of the script in order to make
>     all 'make' invocations in the resulting build script no-ops (GNU Make
>     will actually execute -- and print -- all recipe lines that include
>     $(MAKE), even when invoked with -n).
> 
>   - we simplify the makefile rules in some cases to make the shell script
>     more readable; for example, we don't need the logic that extracts
>     dependencies from .c files (since that is only used by 'make' itself
>     when determining what to rebuild) or the logic that generates .cmd
>     files,
> 
> This patch is WIP and may not produce a working shell script in all
> circumstances. For example, while plain 'make -n' works for me, other
> make targets (e.g. 'make -n htmldocs') are not at all guaranteed to
> produce meaningful output; certain kernel configs may also not work,
> especially those that rely on external tools like e.g. Rust.
> 
> [1]: https://www.openwall.com/lists/oss-security/2024/04/17/3
> [2]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags
> 
> 
> Vegard
> 
> ---
> 
> Vegard Nossum (11):
>    kbuild: ignore .config rule for make --always-make
>    kbuild: document some prerequisites
>    kbuild: pass KERNELVERSION and LOCALVERSION explicitly to
>      setlocalversion
>    kbuild: don't execute .ko recipe in --dry-run mode
>    kbuild: execute modules.order recipe in --dry-run mode
>    kbuild: set $dry_run when running in --dry-run mode
>    kbuild: define 'make' as a no-op in --dry-run mode
>    kbuild: make link-vmlinux.sh respect $dry_run
>    kbuild: simplify commands in --dry-run mode
>    kbuild: don't test for file presence in --dry-run mode
>    kbuild: suppress echoing of commands in --dry-run mode
> 
>   Makefile                          | 28 +++++++++++++++++---
>   arch/x86/boot/compressed/Makefile |  6 +++++
>   scripts/Kbuild.include            | 27 +++++++++++++++++++
>   scripts/Makefile.build            |  2 +-
>   scripts/Makefile.modfinal         |  9 +++++--
>   scripts/Makefile.modpost          |  8 ++++--
>   scripts/Makefile.vmlinux          | 22 ++++++++++++++--
>   scripts/Makefile.vmlinux_o        |  3 +++
>   scripts/link-vmlinux.sh           | 44 ++++++++++++++++++++-----------
>   9 files changed, 123 insertions(+), 26 deletions(-)
> 

