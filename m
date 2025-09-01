Return-Path: <linux-kbuild+bounces-8673-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA00B3DC91
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 10:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9BBC17D319
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959D82FB604;
	Mon,  1 Sep 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ja9AnXfg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wNcVbBbe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161522FAC0E;
	Mon,  1 Sep 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715712; cv=fail; b=WKpPqdGEDvWJp1Kn+RcyZIfEmfKvIGRYxUU5dZhjYAZiMNNaX11CIbKZYzuIjleNY641ROhlqaz303rMxGjPwqBge4Z1erp+zxMsC75qrFJcODdsxYyg5qZQdx9GbjM1T8XUyeXKRo3I6bjLbgVo5YECbo1tvAQD2T2RmupcLxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715712; c=relaxed/simple;
	bh=kYNPVywO8cpBylVwzdCcKCytLD1xusPNj6yo4sH1ngc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=trkeNNRJg6ACGdps+aJ9nANVuSiqzLNw5Rxj7WjzUj0pGao1wdCsYjtWtBSDVaJcbSJdJZtZFgCrYz5Zw7MdQyOtnx+G7NBG42vqBsMN9LGUDioZrnXBYLsbHYSc63dE8HaDEz7u4upobb1kSOH/Yi73IS+qxlbEv9kHe1df03E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ja9AnXfg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wNcVbBbe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5815fmJk004759;
	Mon, 1 Sep 2025 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Xif3c+pyNtB3HMaRb/hNpwFkSKJt69dg/mEzo4e4wuc=; b=
	Ja9AnXfgivKfio+ArjQLdc8aXdA8Cq7NDXsYyMkr+ZZ6+ucOfqVCDs6O6rYJ4HNV
	NxXvxfcK2ukEMxGQz9TtcXSXEcD4+C9pI6Sjk+ZpAXp00xZTmlgC5/HyTdk2Gnkw
	zPf3AA+MD+j00ilIYtkdfv1FMLgKSz/S0piX2i2hqf1FlBWYq8O879DuaBX629Ad
	LwrH1FjdLtXGj4qSrR7geshi6QKChWm+lkzQSjxFkDqHjCYWyQq7cp3L4LqZPssg
	MCArUTkILNrIc/F0gZM3H5Nl6RZGrC4kjk4aiTmaQ0VtfYetvDKjzwmlP9bl0/qf
	m+Lg/JM2V9CgZ+HEfy3G1g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmna09j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 08:34:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5818Dp2l024849;
	Mon, 1 Sep 2025 08:34:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr7n2k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 08:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbRPj54qAnfUiptlryAEy8xtZezpmJG41APXGzYkowCiDyLSyloatnbgzHL1qd2Co1MyGYa1GUPk25FUr6C7YboGwEB3EMyAlmm8fthe29AlW0EPW+Z23aMGk0oxSMyp6UblqZJwXaCbrWaZv9wVTK9Bpygq3NE6M0uwwsJrUNAgxNif2rGaT8fRp2quNa3aDewOZsl1mp2gmNZkqZiytCod9L6XMteIXDoCIuwYAjJtuzg0bNU70uA3acf5WPm317YCjTOV03k3+nHYtb8HZkQHxuM2T6Vx/3GY+xedCTwzN/YJz/PSJX9B/r8comeXb6Yx6rKQ+ekSUaERH/u4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xif3c+pyNtB3HMaRb/hNpwFkSKJt69dg/mEzo4e4wuc=;
 b=g1SEZdQtImO3NvhhVG8Miz2T1XunPOvF3/SGvpYOJNAu2Vwlji/t6Cx4wiQYTHYEIR1RJTgc35P0V5sfYT2294MYaA86aHFoDRZZ4xge7eepO86kwEaLKjPrJNbbOIshuGhQksAcA4q8Rfags5Y7xp1pdFaw4JwXxY2MYddG/LeJu0Wh355Msa5V94JF2D9vodoju0CxcYa8Dt5XyTfCd7AfYESJEt1q6X8r2D6eclRbj7BaH/WkzRCsuEQxRWHYAPgBTzw35brI8gYaJWVLPG069nh9iVDIgH/vcxin1Fnwm1gDDHT+ty7tUryjhd6OHbDKCnOCYknekdP5IlA1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xif3c+pyNtB3HMaRb/hNpwFkSKJt69dg/mEzo4e4wuc=;
 b=wNcVbBbeVuHCoX8MjY/kzz6yk+TNwH38LIJrijcq6e7vFl9BS4WSBmOJdmZN0BDXdOmDVWtLfGxtuOAzeAPu10JfxeGzjdYmxCm9S75D7qqu8EM0ACptjtTyvC8FsXV1dYZGIMRxwsPelqWlLgSfvYB5205LBgDJgiZvWpGROKw=
Received: from DM8PR10MB5430.namprd10.prod.outlook.com (2603:10b6:8:24::10) by
 IA3PR10MB8759.namprd10.prod.outlook.com (2603:10b6:208:574::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 08:34:24 +0000
Received: from DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc]) by DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc%4]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 08:34:24 +0000
Message-ID: <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
Date: Mon, 1 Sep 2025 10:34:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
To: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250830020109.it.598-kees@kernel.org>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <20250830020109.it.598-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAYP264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::21) To DM8PR10MB5430.namprd10.prod.outlook.com
 (2603:10b6:8:24::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR10MB5430:EE_|IA3PR10MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a87c4b-5384-4c42-a9d0-08dde9325aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU0wT0Ywa3ZsY3hPVy9qUTZJcUVWbTJMSjZGbi9KLyswS295MDNlSEp1SlRS?=
 =?utf-8?B?WlVSQ3FvUGp2dmZwSUl3V2RjdlRBV1BOZDRiQlRLY3JpMllhTXByUVBCeThy?=
 =?utf-8?B?ZHlBb216VDltekM2OUg3bGFKRHorbjk0eWU1czdPMENnc3FOVEhmZVh0cnRl?=
 =?utf-8?B?bW90RjFMUHpSbUhPL0lPRC9lWElVYmN2OStyNjNYc3hwV2NQdVJmc2hkRmlO?=
 =?utf-8?B?eElONTV4bmJxWE5CRzd1TGxlaTZiaGUxOHg1VGpQWEFnTk5Vd0htem9jT1o4?=
 =?utf-8?B?L3dGL2I1N1lrSjcwUmlBUFdocTBQa1BYcmJyODhDcWs0Ulc4ZXNDOUd5ZzJz?=
 =?utf-8?B?ZXhwTWxoTmxxMW5mYTd0akNYZzdUc2JYNFpJa3lYR1R4S20za2JpYUtkODE4?=
 =?utf-8?B?cXluOXlVYW04NUdneDg5dk5xSUNuNGM4Nktwd0FGOWVURUx6Y2xodncvUUc4?=
 =?utf-8?B?UTN0VEdwVzBCdk1oRHYwNGlYYmpOZjN5VThrYTVDTHhaYmpqOHlPckI1aVBP?=
 =?utf-8?B?d2krcDFENldmTnI5UGZvN3RXZ25PSlVQSzRKMnphUkd6aW5LWVBYZDJYaVV0?=
 =?utf-8?B?UmVZRFNKK3lCS0xOc3hVZG9PeVk3V2VqeFBIWWI4c1NuQmkzUXBHY3VGOEFX?=
 =?utf-8?B?Tk9BZjR6MnFiRG91dnBtQjJkZFU2TjI3MmI3a0t1WkY5VEVRdXRFejVpcXNm?=
 =?utf-8?B?VnRRUHJzZW82a01ZT2JvMEZlUnE3Qi9jZFAreU9oOVlVYm5Ldjdoc0cvdW9j?=
 =?utf-8?B?enpwT3RFeEZIa1k5S01PMVpQcWh1MVh3WUF2c096cXFteTZZZmpkbW15d3Iw?=
 =?utf-8?B?a3hURlc5aWZXTUJvK2tEdDBobDdIbUNIMDBIZnRwdzY4U2dtaEJzUFVtMHda?=
 =?utf-8?B?eWM0cmFsUGR5dmppcmQ4b3UrcURsbTJYZytzZlJaWHlvUy9qVVlTdlFkK2E1?=
 =?utf-8?B?bWtwRHdpRk8xa0FKZFJoVWl4TUs1MnlIa3dwUHpJbDdBOE9UdUJ3a1FsNVJs?=
 =?utf-8?B?VHZjN1ptcVp2dFNVYU5xWmQ2eTNCdjBKclhrK1VoOE5VT2RFbkVnVmlNV01r?=
 =?utf-8?B?TjNpNDhsUGlOUldIbUFTZDlhVUE2UmZhTWNMMGpYcitZU1RxRCtKUExmandF?=
 =?utf-8?B?bThFN0xuMTJmMDlldExnRE85d2kzNmJCYk1SclNTZlJxYmtoNE5SeXQxSXRu?=
 =?utf-8?B?MUpmYU9tZkR4ampnRGhCSTAwUGlvRkR4Z01PRHgvNjJaK1ZjbWVEQnZ0dk1J?=
 =?utf-8?B?MXd2QitHNWE0ZHVXQS90bS9jTEtja0dWS3VFMWcwajJTbElrTDduYzNPSjdO?=
 =?utf-8?B?NjE1d01wRUtnR0dqN0VsdjlrcnRvTE9uUURVYmhJRG0ySk5XYi90UTZqUEpy?=
 =?utf-8?B?VWdlOTZrZ0o3TkJoQkQ4cnZ3YWJoSnJOWUtEOWVoUE5KQWQwd1gwckNyYkRh?=
 =?utf-8?B?ZC9FOEJMRjFsR2NIcm1GcEt0NjVwc0lpUXVpZkZPMUNmMUp2cjg0bm4yZzJ6?=
 =?utf-8?B?SHA0VTlKMnJmamE2eGJkVm4yVEFSVEs1Y3ptcFhMTjNieml3NmdZTHFDVW9D?=
 =?utf-8?B?aWd5UFJRMzdrQWVqTXJpUmxZOGp0ZFEvUGVWYURqRytySEdvTzhKcnlySU1q?=
 =?utf-8?B?NDE1UC8zTG8yY2xINDVtbWVYajRsK0JCYW9iRUUxU2Y2R0YrdTNUTzg4cVFz?=
 =?utf-8?B?SU1MSzdESVVTWURXNFlrYVpRQ0FUREFGU05OT1Z0YmZENGVTQkdoVDFhWWht?=
 =?utf-8?B?RkRnT0xFaS81eUx6VGtsUFdMSUVLWnc0RlVrUjNkVzE0YTl6RzBCMFRyNi9Q?=
 =?utf-8?B?S1JmRGh6clVwMXo3R3c2V2I3RDd0dlkyUFZnNU05R3E3RE1yWFNGaTF1Nloy?=
 =?utf-8?B?cFV3WEViRUxSbUtrNmc1dks1VDlFQ2tCY0hSS3NFbFl4T1cvVDRPMjhYWjVZ?=
 =?utf-8?Q?LkI1jkh/ADs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR10MB5430.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xWSEZjQTVnQjJQd0hDMDdUM1p0eGRzYm1yNmJ3WEFMWDdFcDB1TUhGOGZH?=
 =?utf-8?B?MzYzUWpjWWJpWUI3TWE4enkwa21NQmpsQ2E4TjdtcTZBQ3FUOUFqUEprVS9y?=
 =?utf-8?B?eWFQYU5ENnVWZUtMTll2UDMyTXhsRG4wMFZNcmtYNVhmaDVuVXBDaG5oM1d2?=
 =?utf-8?B?Yjd5Zm1SR09UbTNKZUVYMFRqT0s2NTlleFhvQUJGdmE3cG96MG81cllPckFR?=
 =?utf-8?B?ZUJIbk5rSnlLMkJ6Z3BldVdXU05LVGIzMzRPN1FpTk5CQURoOGZValVId3hK?=
 =?utf-8?B?TkVmbWdObEdFU1JDUndoY0FNMWcybzlMK3B0ZTRyeHM2WVg5ckloSW16OHE3?=
 =?utf-8?B?LzEwNFpRUFZhaGdPeWlKMU1LelhMZ29idTIyQUtadGE2b0NnQkhjZHFNREZM?=
 =?utf-8?B?NXBhUXg4SnE0NGpIUWV2RXdPdm0yTmVrWGpDekt0Um9na2lBZ1IxOVlkNHVr?=
 =?utf-8?B?a0U1NFFjVndYQmN2bXBscVV5ZERjeDdFd2lUaXlScnpmZTRUdDRHWEdkNnll?=
 =?utf-8?B?VWw1V2FUZ3kyYW4rUUdiUy9mTXM5QSsrOXVTRFdxTk40RFNDc2RidVRvb0Z0?=
 =?utf-8?B?Q3Vja0c1SFU4OTZ6UktsMlYwVVVHSFVld3ZUeFFFdXIrcitxSXlRSlBqR3RQ?=
 =?utf-8?B?WjNnTlluQ1RQUGtFRm1JMlNtS25jWWxORUo1TlhwbnVhbEE1VkwrOUxWV2dj?=
 =?utf-8?B?enExbmdSZDZLU3JNbkxtcmdpaGh2RmM4SHZDdWkrVE90M25IdjAzYmt2Uk5a?=
 =?utf-8?B?ZDk4b3Z4Y3dlY21MTlA4MzRjTWhkM0hvd2hGZEszc1IycDEreWdrNmZ3VWc4?=
 =?utf-8?B?cFVQYkVET3c4Vkh3N21ENWZxZnRIMHQ0ZnJGMHpvS3RQNWhrakMzRkgzaENF?=
 =?utf-8?B?VVo4R2M1VEM3cEN2M2trSlRqREZ0T1V1Vy9oR3pKSm1BYW0wcGpaeTNLc2gv?=
 =?utf-8?B?azlkU2cyOFY4UlhrNXJPVnE2akZCYkhhK2xkNGI0T1lhSEgzYmFURWI2aXQv?=
 =?utf-8?B?OEoyTVNlalFZTVJsOWVibnZBRFhxL2NseFlXTG9ndlZQL1FrbG1UZHhTaGV2?=
 =?utf-8?B?eklqYlJVbUNZTWlOR2s5V28zdnliektiUXJPclVKbkhkL01LZGFwMC8rOHQx?=
 =?utf-8?B?a2VNL0syMkMyT2FyK3B5Zi80djNLdUlNWjRicjUvei92aEpJSEtzbWVvL3hZ?=
 =?utf-8?B?TEZxVmJCdURIejBMVkp6eTU1cWVOaU5EUnBGcVl6cS9xUC9vY3ZkOGhjNTha?=
 =?utf-8?B?QkwvRDcrcFNuSGZsV3VWS3lzSG5CRGZqWHpPRnU5VVV1NmFsalRnc01PU1hU?=
 =?utf-8?B?Y0Y5ckRLdEw5b0pOVWhwTVkzbkhuWkc2L3d5elh0VUtkSzJpQTdtbWU2MGJL?=
 =?utf-8?B?am5haFY2SzVjZDZLczNGNnNjUWllT0QrMlUyZ2cvMnR1VUlUNHkzdTRCZjdX?=
 =?utf-8?B?L0lYQjErSzI4NldqTkIrOEVLajgyU1hSTHVwR1creGJDYVAyZmszTmlDeVBo?=
 =?utf-8?B?YmlPWkJJTzJIYTR4YTNJNjZ1eHNUSkhjcExxYU91K2lHdjJWOWk3SjZOTE1C?=
 =?utf-8?B?cEFIU01FSklmU1Jydk1XQS9pSklmOW9pTVFBQllYNEE5M1pqcGJZdlJKbUYz?=
 =?utf-8?B?d0FQclg0MzhpOHFnRi9Jbk1jRW94WFpRWHE2Vk94aTcvN1p4VTFTM1hqdVdy?=
 =?utf-8?B?MWVBSHR5ZXYzNksydTNXOXBPb3lzdlV2WDQwdjRlaW5vcUx1RjYwemdjcnF2?=
 =?utf-8?B?NVl0bHIraE0xT3dOTW04TkxyRVJTYURBemx2cVplQy9VRWhRSEYxR2x6b05a?=
 =?utf-8?B?VXEyODEzOW5lNlRReUlHeFR0YmZQenltc3pkT2g2QThJK1NJTDMwWW4reUpi?=
 =?utf-8?B?eDhLTTllaW04ZlRaTlpDc0VCYktlblZtV05RS1luWTNqUEJIVXhvZFdkSkxt?=
 =?utf-8?B?c3FZRnQrOFVVZGR5bGpLZ3EwazRJdEVjQThRdTlHdHR6RkYrUC9ZUGdSSVc0?=
 =?utf-8?B?NjZ3VVE1Yno2OWlWbE1PYXdiak9UckxIRUVHOUxjeUpKM24yczRjK1NOVUN2?=
 =?utf-8?B?YjZsODhwQWRoTVI3NHN4TEJOTDZiRjUzSlR6MjVoMWN1bm9Obkh2ZXZkazdR?=
 =?utf-8?B?WmJuS1RTZ2trWXVSMnJGNXErMktDc0ZJRytwYlVPaFNvK2V4b2tkN2J3SWhh?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fZg4WOVKM4vZQfqsn+T4i9x/wKipAFf+bCrx2HnRgcfJ5u1Tmo2bWcwLhuu+yXpDewZhivnAL9Bj3VhWSFlX++4ao5NawtnpB/A6mApAM+OMraFKHkU7rEvCf2Ls6Msxjo5mIN7fXT8t1uu9mr6axRR7IHEg0rKn3SoOBECE4o/baFwEPd9FSXDGgZx7b91PSr/UTK9CI0yba8LSwn74P4wGM5s7SabWLtOXxSYN4uDVct7WW7HwzTojyQZ9CWjXhMAE+Gip0m9cQg5ihwUU2/xqBlpVDLs9qCxXSKbisSvRddheVYk3fpElejpiTMPS1PZw5YGNDaBReRFerFopl1SYs/szftqSL+4pLGCqd2LTYk8xsW0NwyHLflJWPION3xJZWhLEeBpH1qZ/mnvBZU9ycix9l9uesvUd8W5+yDJSy9RgmeS8HIcg7H22HhMwtjOpiMmjNpWo+LafYA0bpvqEA6CK9TshFWwyb11K7nc8pVo506BdodR7nC91VoykXhHhIcveebCFkx7BHcFY2jIAU5cicyhmyus3Bu2bEm4c8CEaamoHv/SsbUK8fkpaokLNvFwKEx97Qfo7LadKSl2S6geKRY25ov4NvC03cGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a87c4b-5384-4c42-a9d0-08dde9325aeb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5430.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 08:34:24.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9UjMSg/zG/86dGKugvcsuRFLBhW24YvGllZ+o2y6nrB6I30BFkyr820Je8ohf7iLZtsy7LNeHMPwb8I2Z2eqtD90Fk1rT7lN2Ec91fP+p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8759
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509010091
X-Authority-Analysis: v=2.4 cv=D8xHKuRj c=1 sm=1 tr=0 ts=68b55a94 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=07d9gI8wAAAA:8
 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8 a=JrngjnOGpXwUXzc0-GAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SFsjkb-OdT_2m2qqdsnMhePo0VxsrMrV
X-Proofpoint-ORIG-GUID: SFsjkb-OdT_2m2qqdsnMhePo0VxsrMrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX83TbwuaEQy6x
 JyimQ2FbePc2jpblvlXMjRXD6cz1B10cFlmHKngLc8hV5dkziuJpCVrI82wNcmItUEzQEWhZXhS
 NDyLNFTtMvOpuvpOf+BnTbZeZYwYSxr0n45HXHUQMYLK1t653CHUUP+rT7lWknHTgSF2U8byUbn
 s1elKQpNW+3iSw7sH4ZKP9g92B3nN+iZJonn7tWdOACdnHZCj2NcP9wc4xxi0341FT+9yrv+tTH
 YDk7Uy+FhC8vCFjtS00NTLn1DbBKZk0hk9liTtqrBCEBLj/wnU5FEkquwhTXakr9b4DpxRzpipT
 y9aVumqxDAtTCiV+MybpjDgc2/Q6zWiJ6nr01UQIFgoJPRfz9psVOxoBzXU0EUueI5a5m1DRLxY
 gQkAtAJy


Hi,

Drive-by review... consider it more as "here's some stuff that could be
worth looking at" rather than blocking in any way.

On 30/08/2025 04:01, Kees Cook wrote:
> During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
> existing .config files need to maintain backward compatibility while
> preventing deprecated options from appearing in newly generated
> configurations. This is challenging with existing Kconfig mechanisms
> because:
> 
> 1. Simply removing old options breaks existing .config files.
> 2. Manually listing an option as "deprecated" leaves it needlessly
>     visible and still writes them to new .config files.
> 3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
>     etc) prevents the option from being processed at all.
> 
> Add a "transitional" attribute that creates symbols which are:
> - Processed during configuration (can influence other symbols' defaults)
> - Hidden from user menus (no prompts appear)
> - Omitted from newly written .config files (gets migrated)
> - Restricted to only having help sections (no defaults, selects, etc)
>    making it truly just a "prior value pass-through" option.
> 
> The transitional syntax requires a type argument and prevents type
> redefinition:
> 
>      config OLD_OPTION
>          transitional bool
>          help
>            Transitional config for OLD_OPTION migration.
> 
>      config NEW_OPTION
>          bool "New option"
>          default OLD_OPTION

Can you add this to scripts/kconfig/tests/ + both positive and negative
tests? Tests are run with 'make testconfig' but (AFAICT) doesn't
actually recompile config/mconf/etc. before running the tests, so small
gotcha there.

> This allows seamless migration: olddefconfig processes existing
> CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
> CONFIG_OLD_OPTION is omitted from newly generated .config files.
> 
> Implementation details:
> - Parser validates transitional symbols can only have help sections
> - Symbol visibility logic updated: usable = (visible != no || transitional)
> - Transitional symbols preserve user values during configuration
> - Type safety enforced to prevent redefinition after transitional declaration
> - Used distinct struct members instead of new flags for readability
> - Documentation added to show the usage
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> With help from Claude Code to show me how to navigate the kconfig parser.
> 
>   v2: fixed human-introduced errors
>   v1: https://lore.kernel.org/all/20250830014438.work.682-kees@kernel.org/
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: <linux-kbuild@vger.kernel.org>
> Cc: <linux-doc@vger.kernel.org>
> ---
>   scripts/kconfig/expr.h                    | 15 +++++++
>   scripts/kconfig/lexer.l                   |  1 +
>   scripts/kconfig/parser.y                  | 51 +++++++++++++++++++++++
>   scripts/kconfig/symbol.c                  | 11 +++--
>   Documentation/kbuild/kconfig-language.rst | 31 ++++++++++++++
>   5 files changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index fe2231e0e6a4..be51574d6c77 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -127,6 +127,21 @@ struct symbol {
>   	/* SYMBOL_* flags */
>   	int flags;
>   
> +	/*
> +	 * Transitional symbol - processed during configuration but hidden from
> +	 * user in menus and omitted from newly written .config files. Used for
> +	 * backward compatibility during config option migrations (e.g.,
> +	 * CFI_CLANG → CFI). Transitional symbols can still influence default
> +	 * expressions of other symbols.
> +	 */
> +	bool transitional:1;
> +
> +	/*
> +	 * Symbol usability - calculated as (visible != no || transitional).
> +	 * Determines if symbol can be used in expressions.
> +	 */
> +	bool usable:1;
> +

It's a bit of a "red flag" to see bitfield bools just after an "int
flags;" member... should these be SYMBOL_ flags?

Speaking of SYMBOL_ flags, there's apparently one that controls whether
a given symbol should be written out to .config:

scripts/kconfig/expr.h:#define SYMBOL_WRITE      0x0200  /* write symbol 
to file (KCONFIG_CONFIG) */

This seems like something you'd like to use somehow -- maybe simply
clear it in sym_calc_value() if it's transitional? Similar to how it's
done for choice values:

         if (sym_is_choice(sym))
                 sym->flags &= ~SYMBOL_WRITE;

>   	/* List of properties. See prop_type. */
>   	struct property *prop;
>   
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 9c2cdfc33c6f..6d2c92c6095d 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -126,6 +126,7 @@ n	[A-Za-z0-9_-]
>   "select"		return T_SELECT;
>   "source"		return T_SOURCE;
>   "string"		return T_STRING;
> +"transitional"		return T_TRANSITIONAL;
>   "tristate"		return T_TRISTATE;
>   "visible"		return T_VISIBLE;
>   "||"			return T_OR;
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index e9c3c664e925..01d2d0f720ce 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -75,6 +75,7 @@ struct menu *current_menu, *current_entry, *current_choice;
>   %token T_SELECT
>   %token T_SOURCE
>   %token T_STRING
> +%token T_TRANSITIONAL
>   %token T_TRISTATE
>   %token T_VISIBLE
>   %token T_EOL
> @@ -205,6 +206,16 @@ config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
>   	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
>   };
>   
> +config_option: T_TRANSITIONAL type T_EOL
> +{
> +	if (current_entry->sym->type != S_UNKNOWN)
> +		yyerror("transitional type cannot be set after symbol type is already defined");
> +	menu_set_type($2);
> +	current_entry->sym->transitional = true;
> +	printd(DEBUG_PARSE, "%s:%d:transitional(%u)\n", cur_filename, cur_lineno,
> +		$2);
> +};

You could also consider making this an attribute similar to the
"modules" flags and simplify:

config_option: T_TRANSITIONAL T_EOL
{
        current_entry->sym->transitional = true;
        printd(DEBUG_PARSE, "%s:%d:transitional\n", cur_filename, 
cur_lineno);
};

...it would mean the config options look this way:

config OLD_OPTION
     bool
     transitional

(If not, menu_set_type() does already contain a check for whether the
type has already been set.)

> +
>   config_option: default expr if_expr T_EOL
>   {
>   	menu_add_expr(P_DEFAULT, $2, $3);
> @@ -482,6 +493,43 @@ assign_val:
>   
>   %%
>   
> +/**
> + * transitional_check_sanity - check transitional symbols have no other
> + *			       properties
> + *
> + * @menu: menu of the potentially transitional symbol
> + *
> + * Return: -1 if an error is found, 0 otherwise.
> + */
> +static int transitional_check_sanity(const struct menu *menu)
> +{
> +	struct property *prop;
> +
> +	if (!menu->sym || !menu->sym->transitional)
> +		return 0;
> +
> +	/* Check for depends and visible conditions. */
> +	if ((menu->dep && !expr_is_yes(menu->dep)) ||
> +	    (menu->visibility && !expr_is_yes(menu->visibility))) {
> +		fprintf(stderr, "%s:%d: error: %s",
> +			menu->filename, menu->lineno,
> +			"transitional symbols can only have help sections\n");
> +		return -1;
> +	}
> +
> +	/* Check for any property other than "help". */
> +	for (prop = menu->sym->prop; prop; prop = prop->next) {
> +		if (prop->type != P_COMMENT) {
> +			fprintf(stderr, "%s:%d: error: %s",
> +				prop->filename, prop->lineno,
> +				"transitional symbols can only have help sections\n");
> +			return -1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * choice_check_sanity - check sanity of a choice member
>    *
> @@ -558,6 +606,9 @@ void conf_parse(const char *name)
>   		if (menu->sym && sym_check_deps(menu->sym))
>   			yynerrs++;
>   
> +		if (transitional_check_sanity(menu))
> +			yynerrs++;
> +
>   		if (menu->sym && sym_is_choice(menu->sym)) {
>   			menu_for_each_sub_entry(child, menu)
>   				if (child->sym && choice_check_sanity(child))
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 26ab10c0fd76..b822c0c897e5 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -447,6 +447,9 @@ void sym_calc_value(struct symbol *sym)
>   	if (sym->visible != no)
>   		sym->flags |= SYMBOL_WRITE;
>   
> +	/* Calculate usable flag */
> +	sym->usable = (sym->visible != no || sym->transitional);
> +

Is this actually ever used outside of this function? (IOW could this
just be a local variable instead of a sym-> flag/member?) Or do we need
to set it here because sym_calc_value() calls itself recursively? To me
it looks like we only ever access sym->usable for the "sym" that was
passed as an argument to the function.

>   	/* set default if recursively called */
>   	sym->curr = newval;
>   
> @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
>   			sym_calc_choice(choice_menu);
>   			newval.tri = sym->curr.tri;
>   		} else {
> -			if (sym->visible != no) {
> +			if (sym->usable) {
>   				/* if the symbol is visible use the user value
>   				 * if available, otherwise try the default value
>   				 */
>   				if (sym_has_value(sym)) {
> +					tristate value = sym->transitional ?
> +						sym->def[S_DEF_USER].tri : sym->visible;
>   					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
> -							      sym->visible);
> +							      value);

This looks a bit odd to me. Just thinking out loud: your new logic is
there to be able to use a value even though it's not visible. In the
case where it's transitional you use the .config value instead of the
condition that makes it visible.

Could you simply change sym_calc_visibility() instead to always return
'yes' when the symbol is transitional? Wouldn't that simplify everything
in sym_calc_value()?

>   					goto calc_newval;
>   				}
>   			}
> @@ -497,7 +502,7 @@ void sym_calc_value(struct symbol *sym)
>   	case S_STRING:
>   	case S_HEX:
>   	case S_INT:
> -		if (sym->visible != no && sym_has_value(sym)) {
> +		if (sym->usable && sym_has_value(sym)) {
>   			newval.val = sym->def[S_DEF_USER].val;
>   			break;
>   		}

Ok.

> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index a91abb8f6840..345c334ce680 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -232,6 +232,37 @@ applicable everywhere (see syntax).
>     enables the third modular state for all config symbols.
>     At most one symbol may have the "modules" option set.
>   
> +- transitional attribute: "transitional"
> +  This declares the symbol as transitional, meaning it should be processed
> +  during configuration but omitted from newly written .config files.
> +  Transitional symbols are useful for backward compatibility during config
> +  option migrations - they allow olddefconfig to process existing .config
> +  files while ensuring the old option doesn't appear in new configurations.
> +
> +  A transitional symbol:
> +  - Has no prompt (is not visible to users in menus)
> +  - Is processed normally during configuration (values are read and used)
> +  - Can be referenced in default expressions of other symbols
> +  - Is not written to new .config files
> +  - Cannot have any other properties (it is a pass-through option)
> +
> +  Example migration from OLD_NAME to NEW_NAME::
> +
> +    config NEW_NAME
> +	bool "New option name"
> +	default OLD_NAME
> +	help
> +	  This replaces the old CONFIG_OLD_NAME option.
> +
> +    config OLD_NAME
> +	transitional bool
> +	help
> +	  Transitional config for OLD_NAME to NEW_NAME migration.
> +
> +  With this setup, existing .config files with "CONFIG_OLD_NAME=y" will
> +  result in "CONFIG_NEW_NAME=y" being set, while CONFIG_OLD_NAME will be
> +  omitted from newly written .config files.
> +
>   Menu dependencies
>   -----------------
>   


Vegard

