Return-Path: <linux-kbuild+bounces-8722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C91B44410
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 19:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D557ADB23
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 17:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8D1309DDF;
	Thu,  4 Sep 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XzHsUc93";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VP2QhPN4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922453093C7;
	Thu,  4 Sep 2025 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005848; cv=fail; b=rDRav6Shu0LD7cuq0UrI+jDW80CHfgilAfYPXeyrUTGdWVp7ngiEpHFisqgjF42H8yNsOcjhH2hqHONQmgW/48uBJhvU3EfCkewzdDMwpOGGoxy7T15DwV5rtw/+684tUZgkvlHYM3nZZOGU+fMtSW07Le7YyY+/X+YiAt8v0aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005848; c=relaxed/simple;
	bh=D4T7K+js0ZSEiZ7ZGB7KWKZdunwlSVi9Ghz9q2jVzAY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=unvnHUbJR66wNow85g7CQk5w2SCif3Ojjh0tN1+Z78O8tL1hZonGhQVx9/HB074LlHmRWBGAy3bR8NmwXuUUrTJbNY2vqqzr+8j3AOOMVGd+j+LJ/hx90dAxJjhqzaEWenMD8q1n15nE6t1zoyae2NWj1wyCZzffngA6IhgThTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XzHsUc93; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VP2QhPN4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GTrfa029157;
	Thu, 4 Sep 2025 17:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FYiMDsaYWv7oDYbxbHktZTz5a5lPDmstc4qDpKaVYLo=; b=
	XzHsUc9311vpKg9Jh0/FLtZARDrfm5V1/tk4DzZiTL/CPzmwR/Iku55eDTB8mpBR
	51x2QivZ/jP1hgebRqh77OrkMnKZBYU97KFvL7yiO/A8k+dBwwcDhieim6ySuTRn
	w8fQ4iSmLAT9tTJFrtndaocpAyscjLqjQ+TJ36elOupPQLWYgORABAzZkkxvAKCi
	PM0ekLQL9ICjccp9HoZTN7IvXadAnENxy5JMmhPxqc9qlYT+9VMoEn/Qs5BRcrh/
	WUvcGbdd8i4ClmztWtObN4JeIaGs9yiqToWkxvPLvUBm0G85q9c1tw+O3xKEjmIC
	CjTiD+tsZ6pi99cpyePgRQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yeb6g34u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:10:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584GmQ2G032618;
	Thu, 4 Sep 2025 17:10:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrj582c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uvo5IOv+wjsZBV9E9lAFDyoClCtoC5Uz2wFz2siB1s5Np8P5ej38POJB2j7u+R1XPsUSiY+fUbWaSz7BNvgsjxNOv/mSVdPp5L/GoS7A/RkUFcSkZSJdJ6akEvpwjDte/jp3pfe+vC+KMjEpGQsH6xc6YYEsTE3ENts7WY/EaCuzl04HU3/74SbsZpn8BQwnJyqRBSMU/YuvuS6/uLO/QVebpUMskCg5F5qCuSYdsRQmZ6713PPjUtas17ubHpMdO24wlM4pkjkpA1ZcXd3E1Bs6kgy68tmyObisYS3TwfsYmv99Poz4V4tsM6KSxuJcyrD3qAr3vPkD0+GSFLhMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYiMDsaYWv7oDYbxbHktZTz5a5lPDmstc4qDpKaVYLo=;
 b=l1b9KjY981MgKekU09vOaPjGkG5nPV1rZ7RPNXs1SpHoCelsrFq7DEWc8KrTET1iJQoaxKq8fshrsdJf1Xa3I6Rfy1SvGUyofT35BP0DipbTCkih8vSHDWCp9AEApzfzyXCz7yindU9KSMiaPtxYKRGbMRuAEoJrj3UM0h0WzuIKaXoWHJcnWOeziZ7R7jnq62d/HakrDHFPsmIpm0FYWFvSH8r1NiKD9PGg38qV4mls4ahAHPVfDnG1QHiVTMST0HMmFraooi7ZCShqKoyenPci9GtsxBuYArKuJQhythVqhn5tHdlnySn2iZ8QFs/rvHfVJODARf8g3btX0w4LoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYiMDsaYWv7oDYbxbHktZTz5a5lPDmstc4qDpKaVYLo=;
 b=VP2QhPN43bHV40lE83lb+AKJjSY7hl5aArp2NhDuUa4SW/+CTEcJT92an1C6HivrIuqG4VbqAOexhV1hR5wfgEtp4NqwMzs5W17u84ldkFYw12pHSoNwV1ez4YGxmK4t5Q6voTL1XzzNcv99DHeKnYSEbuo4jS+Mqm/G4n3los8=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB7099.namprd10.prod.outlook.com (2603:10b6:510:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 17:10:22 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 17:10:22 +0000
Message-ID: <18c2c59e-edae-4281-ac7c-8524d9cde1c5@oracle.com>
Date: Thu, 4 Sep 2025 19:10:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
 <202509031949.375138FB13@keescook>
 <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
Content-Language: en-US
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH0PR10MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: f71fd758-5dc2-41f0-d5de-08ddebd5eead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnFCMlhVdzhQajBhNHVBTzlDUk5lVW9ocDhhbDhxUGZnV3JGVytvMzFXeThh?=
 =?utf-8?B?aUZCL0dmTW41amIrWjZCZW9VNmJObHRFY2QrVnVzclNCMUVJcHp3SzRIWDZx?=
 =?utf-8?B?b3FrVEtORjJmdkpPZzI2TDBqVnRNeU5HVHFMWXE5WFFiQkUvSkp1UE5IUVFi?=
 =?utf-8?B?Q28yOVQ0TnhBMWlQMXZJUXBqZUdXdTZsVTFBclpsd2xRZW9GRitKMkNaY3ly?=
 =?utf-8?B?em84aVlmZ3pYNUNTSXNqOFZZRThwUGtMcldvOWNrMHdLdkJ6NjM0VVpWRjFG?=
 =?utf-8?B?TXk0cDFqZEpkdHlPeDBkakZza0xEU3czc0xDc0ZEMFZaVkRVaGNtTnpTYWMv?=
 =?utf-8?B?MlVSb2tLcUtyZDZHSEpXS2hKek1hZ0xzRzBHVWg3WDR1L3dXSXVsK1EwSGNv?=
 =?utf-8?B?dGpWYXdIN0JjQzgyY2FpMGRkM0hxQU5KcnNsM0Z5OUVjeWFINElCanM0ZURY?=
 =?utf-8?B?WUVPNzRuS3JxRzV1MGdDWFRmRzlWei9HSTJTd2wyalJhek9JSll5VnVNZmE4?=
 =?utf-8?B?VGlOcXhacWJZZWtIZkVoUlpPV0l3QW5tZXE1WGZQdEZsbENmVUpOZ1k0K3Mx?=
 =?utf-8?B?VXhva3hRMEhOaHY2bERKS3ROam9YY1BBcFpaY1RhV0IxQzRJWnZtMiswMlFR?=
 =?utf-8?B?c2xISk9QV044WElWTFdieXEwUFZxeE1lbXhjNEk3ellraWR5bEpkd1RvUjRl?=
 =?utf-8?B?M2VuZGJWZFl5dTlXREc5cUU4TnRYZmhiRlFWb3czZ3pPMGo4R1NhZ2w4VjZB?=
 =?utf-8?B?ZThQSUY2dk9jWXZ4TmM3QzBJMHluOGsyT0t1eGlxYmhTK1VJTllqWDNVK3RF?=
 =?utf-8?B?N1MwZEUweEExS2NwOWh2aFBUZnZhRzRUOFlOZ0dFOW1QQ3NaTTBnSnVWK0g5?=
 =?utf-8?B?MzZ6OVl5bzZHeG5GNkE4Q3BXZGhyWnJCZmhWWVhaUkpDTjBqVjJWZFk2SEJo?=
 =?utf-8?B?SXBOaWtiYmxyUWZXSzZnelRGSm1tS25GM1c5OVpFSm9zelNSRkRrYUowdk1k?=
 =?utf-8?B?MUV3WFcxdW8xaldQaGhXaG9yY0dZQ3NSNWNXcDFGSHlIK0kzY1N4ZlNNNW5L?=
 =?utf-8?B?MTJoOVYrMklGZXBzcWVSaEdUQkcyTjdOSytTZkx0aElDV3J3S1U5WEpmY2NK?=
 =?utf-8?B?K2hBd2tiRE5oRU1ISERHZjgzT0QzT0JZUEFmOTZXeHdPWitLNmNLYmNUVm9t?=
 =?utf-8?B?MEYySHhua296aFRic2hBcmF5MENWUXJoWjA3QjVLVWJQUE4wREFKN2N6dFZ4?=
 =?utf-8?B?VEU2WmlodzRxK3dYajBPSVN3VmdLVzV3L3BEbmNLc1AvaU5YVUY5OE01dDkr?=
 =?utf-8?B?UWtGTExNYzlSejArUk1EN2kxRktCSzl2amVic1NKVWpwbTVybVZSemcxUzN6?=
 =?utf-8?B?Wm02YXJNcjFCWmxVUGY4R2IzNXRzcit6RzkvU3ByOWx1NWlrNlNjV3E0VXQ4?=
 =?utf-8?B?UFVKeE9vaWFWZTdIeHFZRFZvN2V5ZloxcmpyckdNZUhhQm9Nb2JmWk9rWDZQ?=
 =?utf-8?B?TDdGemkrUkREd21KeU5pdWsxRmp3RVlxOEV0ZGVXTTA4VUN2T3JnVWtzTHlU?=
 =?utf-8?B?N3V1RlkwbTAvYmZOc1VzTVNTZCtFcDkzVm5FdnozQzg5NnVVNUtyNGVEeUds?=
 =?utf-8?B?RUpPZ0tidnB5Rk1oMmlmSTlUVW5VbUt0Rm0wdlRwVXh0VStmMkJ6L0lFRHFS?=
 =?utf-8?B?RDlNc0FScCs0SndDbU9ET2l3VTJrZFVzREw1a3BhL25Gc0tqd2dWY3ZKKzFk?=
 =?utf-8?B?bE1uZUs5VWpnVy9PR005V053SVlPcHVQT1pYTFlRVmxNY3E5S3c1NURPNzlK?=
 =?utf-8?B?Ni82UzVPWVloTFNSM0FjVEEzREZnT2pqb3Y2eVhGOWp1NWJUa0FPdkJMK3Jx?=
 =?utf-8?B?NnVqNWpNd0FMQlRFUFB3T0p1ZW5wS3BJZjJSdlFUdjJHZFN6ekhuR25GOXFt?=
 =?utf-8?Q?BB73/IxoXGk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlBpRkJWc3FsaDhnSnQ4Ymt5TU52bjZaRlV3K0lxYUJDbnpkOExDeFNqWExI?=
 =?utf-8?B?Szdma1cySFQxSncvbi83ajVicS9abFJCSm5Ebys2K282Yzlmak1ZeVpLRTU2?=
 =?utf-8?B?SC9WZEV4b2hTeElrSUEzWnZqNGdNOExlbStVM1FSTHR4U2R0bXFFR28wNXlw?=
 =?utf-8?B?OUhybHNHeXVjQm5hUzE2Nzc4TmVsZ0QzWlBYa01sMDlNSmFVMnN3dVFMMjlJ?=
 =?utf-8?B?RXhDRkdsb3BkWmgrMWlZcXlIZ0JTZmZQbjNuQXVjSW9ZaWZuUVhiVGNta3pS?=
 =?utf-8?B?bnlCYTY3Qnp2RDk1NWFYK2xQUmxjakJaWnc1QU4rN2p4UXhUazUwbm1zaXU1?=
 =?utf-8?B?d2lsMU8vRnV6dWZUR21MNm5nbXMzYTVkQ0JqNDBLUXZUMmtMMk00N1I4cmt3?=
 =?utf-8?B?Q3hBVnNzajlBS05ab2lmRzE2eDRqMHgwbnl6bjc3cUM2Z3NSVGRyanVNNHZa?=
 =?utf-8?B?RUt0VXZiVkhpYy9kT2QxRXVqU3k0U28va25VamJkWXcrbC9lVmJVNGFEdFp6?=
 =?utf-8?B?OTlvREVTTmtTaVJJZklUMzdxcDFVOE8wcUoxSEdWa0ZJYlYwWW5UR1B4S2pp?=
 =?utf-8?B?MVVnT2dhSDVjVE4vNnN4dm1tMHlUMnVHRXp2MFZHVGVobTVYc0RlOE03QlJS?=
 =?utf-8?B?SnQ1OEVLd2pOM3Z2QXRka055Tm5uWWg0V3NoWnRYVGt0KzRkTVJZQ0cxbTYz?=
 =?utf-8?B?Lzc0K1RpSWUxNDBXZmZ1WXNKSllaWHZJaVljRysyTG01VFV3bUZZZHFQOGk4?=
 =?utf-8?B?UVYydjZEK0N5czZXQjV3ODhxWStSYVVGMXZYL2VRcHgycGlQV0JhZWE1ODVZ?=
 =?utf-8?B?YW4yM0l0OWRWc0xZTU9rZTgwOUlGRldCRDkzZDVDRUcwZWR1ZzVYSjQrTDVs?=
 =?utf-8?B?Lys3c0N3Yytkc2pKcFNwdFk3Lzl4UGNLQ3BGYXAzSHpqb0N6WitQM29vcW9O?=
 =?utf-8?B?Sk9YY21SbWhvZlR3eXZQR2FCU2JXcTZuTjhWYXBZWWVQSmFpZTBSQmZycldO?=
 =?utf-8?B?Nmtvc20vck9jNEViYWhwais0cmxmd2Z1OUdOckNYRGhxMFE0NHVUR2g2SnE5?=
 =?utf-8?B?Y0dVWGs5SkhWMjhQcXF5ZlhmakNoazVvT3JGV2F6NmZwOG8rY0VtaUNKWjky?=
 =?utf-8?B?NS84WTUxd3pVNlVEUkljZitqWXhhK1ZBSG1Wd0FuNzE1MUlkRUZmV0ZzSncr?=
 =?utf-8?B?RktUL2ZVQjRXT1hORmNsU2p4cGYva2FzMDhRcFFzN0Y5YStjR2xqZFBoaTJx?=
 =?utf-8?B?a3d3ek1ISXYyT2cvVW9qS2I1bThmR3BFRUdwTk5RWVFVTmJlbEhKRUF3NGsy?=
 =?utf-8?B?dmloVzlHTUhuZVVCMzRCODNrZGdSd2loV0NWWkNSaHp1VktwVzg1amRrOEwr?=
 =?utf-8?B?ZWJQQ1lyb3F1TzFuWklkbG92R3hqdUxGd2dEYTArdEFqK1k3c2hFdTVDU2pR?=
 =?utf-8?B?djlvY1dsdkdWREtveXVDOFFZdTY5dGt4a2lUYThXNmVHbVZDMGhZU1E2VmN5?=
 =?utf-8?B?MDcweTRuYWZVNWRHZUpjRTlpeHM4aTBWNFNtSW1acSszVUtTNFZIZEpOY2hC?=
 =?utf-8?B?bVp5ajJQMHIya0Y2ZVJITDRyVm1iVkRuRXNIZTBYT2g3azBMVUkyR1FpaFdV?=
 =?utf-8?B?TWovQnowVmU4dUNhekhlQ3FVdTZFRUtpM1RTQ2F5bncwVnlETzlXZjFudDdO?=
 =?utf-8?B?Q3RHR1FMQkxHSmUrYmZUSFpRSGdGaDA2RXc2d1hWaWIxbjErRjQxUjlZQmIz?=
 =?utf-8?B?RUtuYWtxYjBGOU4vZFlJeXJkU0FoZXBOcUZyWXBodUV4bmUyYyt6K0lQZkJH?=
 =?utf-8?B?L0l5S1hubGpUU2luRittWHlUa2lpQ3g2RW40N3RLd1N5cUlZZXVQczh3bHFy?=
 =?utf-8?B?NmZhZWovRGV0Y0dsNDF6ajRXOG52RkdXVDJlWGFoODg5OGFFREU4M3VzYWVX?=
 =?utf-8?B?RmpibVNXcUE5QVFiYUxYdkE4RHgycmpVQTdUaWE3ejVtTUtzMW9HaTFBUWVo?=
 =?utf-8?B?clo3NTJHS2Yvb2tLbHNlMnBrZ2dpbmh1aENkL0VucGZ6WDFvYnhqRHB2dE51?=
 =?utf-8?B?Wk5WcUxSczJlVHdLalJxbkowQjFQRGtMSFNZaWpqY1NQaFVIYnFFanNqWHRC?=
 =?utf-8?B?enB2alNzS2Roak1kQWQvcndOaERHQWpTVmFtd2dsem1zR0RDOE8wNDc0bXlM?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RtYxcYiDcJLdlwLpZLsYKLwjBK/ZI7+XhDPrk3bhO0pLsqweivb235kJt2CnURUxFryb3hmm23GPAfiNvYvGpfKNW8V9qFhdxvO3q26TFy2Mvsb9KCU1WxIwEI2sByfOCYrcQ3NVOJ2svmd4IkR+itNym5gJbzBYtalxD2biGawIPEc8HXq1ijr2F2SbNC+qex8v37TKCm+cjaA3Qerq6bria4LPJ7P7u3NLynNoIuJEZU8oBvIg9F5QWnRYTOV9/Fjp2mqVMLcwrFb3anpWVj2/YF1bDIacp0I/gKQ6sgGUDDhxbkMvsc/6HwXeqlSnPLWjDyPRlSoExxqas8oY9b4PLaPGBjrq6IgpHcXu3WeMi8JCQeE1WTPRPODt75+dXfcPPfJT2uAMqpBA+NcEwzGq2z77ZbWCqcc6T4GPVdT6VqgtoKD4dMubh4S+Z6pzmAmr4i8vMi5pLcgEsYHxjwhwv49FKm8hgZ90swhfhSjmchRNzD+Qp3DtMmWj5DdDpGXuJZygYLAkZ/avJwiqPsoDhhBrSQMh4FSr2plJFp1X9QNSbwcIwHvN+VQ6PFpvoE/qxJG05WLuQhxEF71ujk+0cJ4u8oDK89BHA+g3W30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71fd758-5dc2-41f0-d5de-08ddebd5eead
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:10:22.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk0VbnTnkAWfQg5cqEzFDTFSbCH/a2TOLOeXVaMYnzK+xZYHjXWyWzYeDrLibUEG/tkZNWb2uBXfBv0yvjnCENqgyYOth3tUHdETHMkU95g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509040169
X-Proofpoint-GUID: lulYCRXvXE_ilBx8vEIWwwlkErAQZYts
X-Proofpoint-ORIG-GUID: lulYCRXvXE_ilBx8vEIWwwlkErAQZYts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MiBTYWx0ZWRfX8K8MEnY0csNO
 oLXScDEytKrIkiUPEW8Xb1hDVeDmi1YFQ0252IFPol5WbySsYfwJwPmfcJGtbpGaVukRNGfz4/B
 lnUcHySgkrEqA/Y9beCIwJf+NE0339N2ryAIFNs4vrVKwo19snewjoyRTWL+b+3YGxTrm8VxC9h
 uG7yWGFbAyF0TzHZBp5MCM/oI/2Le3xba+1zBE8qK11t8TycpWJ4772rDKce7ZiJZHYEQoXB7+r
 UyulV9w7CSVZqBuhHywYTTCENgoEzI8KGzjHgro62t08lUl4E37qmJK4I1sv08QAXN6KCiF/xaG
 39Gep/hR4mISsKGGbMWCvmtOhuJwGcVnP5Uo2KkG8Z4ITGyYZEuBxYIuVVUyzbDUuB9zGoZBpoS
 Qfsvj3CNs3zRelNLV2bt0sGDI7VV5w==
X-Authority-Analysis: v=2.4 cv=QbNmvtbv c=1 sm=1 tr=0 ts=68b9c802 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=0HEKc8Y9IH3iSPKTVO0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069


On 04/09/2025 19:03, Vegard Nossum wrote:
> @@ -214,6 +214,11 @@ static void sym_calc_visibility(struct symbol *sym)
>          struct property *prop;
>          tristate tri;
> 
> +       if (sym->flags & SYMBOL_HIDDEN) {
> +               sym->visible = yes;

...I just saw the irony here after having already pressed "Send".

Let me explain:

SYMBOL_HIDDEN is your new flag that indicates that somebody used
"transitional" on the config entry.

sym->visible is tristate value that gives you the condition for whether
a symbol can take on a value -- y/m means the option is visible to the
user (hence the name) and thus eligible to have a value assigned to it.
In this case you've explicitly hidden the symbol from the user but you
_want_ it to be able to take on a value from the .config that was read in.

If we want to be perfectly clear, we'd rename SYMBOL_HIDDEN to
SYMBOL_TRANSITIONAL and rename sym->visible to sym->assignable or
something like that. Then the logic would be:

if (sym->flags & SYMBOL_TRANSITIONAL)
     sym->assignable = yes;

which is much more intuitive.


Vegard

