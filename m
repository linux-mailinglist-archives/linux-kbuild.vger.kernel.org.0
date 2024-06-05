Return-Path: <linux-kbuild+bounces-2005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E38FD2C4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 18:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9591F26687
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 16:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ECF19147F;
	Wed,  5 Jun 2024 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NOnOFRxe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21B19D899;
	Wed,  5 Jun 2024 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717604356; cv=fail; b=uTEnYABSDVm9hSkoMRCJeuNU6XEUStQan55+3ZN0gABznz1xVEgmfB+9z8PGO02zMm1Q//h9YQbnXXnGoO4aPjExENP0jwVDTcSZ+DszWJaHlhX5+sUn52X+dCEJT6yimJ5ReQaILyvRaMaHCmDWIm2ZLnHjsUpuPHVpEZ12zHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717604356; c=relaxed/simple;
	bh=f5xdEFFnkyr3hifoudl5eWydbMbawiawy8LKIiBJqwA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IMWiemX3F0dHKpn/DR1DiG4cOFIPIJo1EEw1mqGhTtvYG8vH4fmZra3XXbo9wYpCWk7CPWIOlS+PV327VXxKC3lb0WRuG7RpuivrdLo3ZAfetIZ1PSkm6wFoPco4u5c5S+ZGhhAW2Nx1113ofABrONsJ+TTfCeacE+Tg1kEYY5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NOnOFRxe; arc=fail smtp.client-ip=40.107.243.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6Hm77xtV/LOkGBGr2L4pcgSVrdkbYqs2oPUMiBe0fLptyvlTpOMM4ggU5dJqpIsA48rC5xRmyu0+3YZx6/mwGiHHBP9haYCf4tpDDbBJ1Xbq3youIpviz+pKbb8glg9uYkjs8XmfHMjbHlnM97swQRsQjkJ210U1MQpr8qFWphqa579npcBhvPvkyEeq+85bIPsekTh/DVcMXb1ham592BiHLAV+kI+PpvsV/p50xszALTa4VvUaSYKyQWoyMKUqLGmekNXK+7jHeBf6ImJxoMn+lydQLGz5cuywmzK4JyOQFbc5gc60vF+Uufs7AnpZ9y1waxZSm4yZzF/7EFIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPrjzDNC7yPz0YAsw9DYDjKmV1R7B6N6Es2wJ9JrebI=;
 b=QP9eAS3Kbst57P42B4rThu9tQEBtIfvp3QNxhXFuBwC+bK3djS0j+5sddft3jYaCrThP1JuMmx+EYeOVJIjc1AEE+NuMICdVMELbLzxkR3YGZag0UIM5feWRnO2zHDCd0QvCO3XcEhXEEwXhnEooMjQqnNvGpt3myBPSWXaDLesm919JGF2zP+Mc/OL1SkaBn2CuQVMRn82ZpDPrE9TtdzXHh7yuDhLLagsIDmFMnFApawaXybhjWjuQlyWaHZ1m8/zafz3NWf+v/72aIIV9JIF2sSbMNCHmCwZ8z+uxjYZEzfZlpeHE3KUAKurnx0Emj47Zp5I2VP8e2uRVDE7SmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPrjzDNC7yPz0YAsw9DYDjKmV1R7B6N6Es2wJ9JrebI=;
 b=NOnOFRxebjtbAiOoeGoiOovs1fEgIaOFdlkhoirokC6wVwJT2GwVStuslWha0YQBk3BW+4twVFYHE8SShdqjg7y858how5++FoK1Sy29RuaMtny2bKwNK3EqbKYjNVytz1BaP//3wr+GqBzT2DpN66h+aQiziKXfNXFrdz18pEWDI6wEUa+en2yAksf+cBsAmKeY4N3Ydu/tqlaMxPUoUvLSydPAh9o791c2oq98Km7oar/yz1zh+qDpYqc3BC6RWHtgnNhMEgQcEtrumzcZS+QMRY3mppM5qRvbdk2RYVwc+ppBky2Oxh1XrrgSieFq5g4LBNr+f2N0TqxnBXjAAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Wed, 5 Jun
 2024 16:19:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 16:19:08 +0000
Message-ID: <365d7243-812c-4d65-b91b-a9843f038319@nvidia.com>
Date: Wed, 5 Jun 2024 17:14:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: kbuild: mksysmap: Build regression for next-20240604
To: Masahiro Yamada <masahiroy@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-kbuild@vger.kernel.org
References: <21cdf8ef-e2fe-4247-9390-4b3d975f80a3@nvidia.com>
 <2b6llsqhqvsc3qrtsqlv2b6353kvuldwrp3xs5v6jistuskzeh@hnlhxbzpvwzh>
 <CAK7LNAR5fYTzJLtRDSob2TuL0Lt0bxCayY8sx0_1+UEuu1Hz9A@mail.gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAK7LNAR5fYTzJLtRDSob2TuL0Lt0bxCayY8sx0_1+UEuu1Hz9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::18) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9ab0dc-f02e-496c-eb8c-08dc857b3a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHVOSXc5cThKUE9qNVFJaXNsWUZpRThyRDNYTzVkNlEvUWo1ZWQ4b0g0VGps?=
 =?utf-8?B?VTNVVktJekJnWlpwbmVIVWxCcGFSdnBXdmJzZ0VSaXFkQXBwZ3dXcjNOeXpJ?=
 =?utf-8?B?Q2cwaVpFSTRoQ0wwZmZQaFA3aHdWdFhDTWJYNnU2ZjNrK0pvZWlTVEsxR1pv?=
 =?utf-8?B?emRXNU5GRG85R3JabjhJZG9YU3MxVnVweEVXR241RWExb0N0eExOcFVhZS9J?=
 =?utf-8?B?YXVBa2thQ3hoYUtvVmNwMVRaVi85VGdxWkd3MHZQcnl4enRHeTdwQndtTTYw?=
 =?utf-8?B?NDhORE0zajZ1ek05blJNaHVyV1ZFdmhoczkvQU4rT2poV2tjVjFSNU5DTFJI?=
 =?utf-8?B?TDJqUG9mMTlKWWpzbTdZWWozVDFFU1VneWRHSHNIYjdYQ0I0U2xQZHhzdWQy?=
 =?utf-8?B?cDBTcHk0ODllc3lYcDl5bEFPeCtqbHRoWk1ib0tGc1ZIM1ZOR1JJeit0WXM1?=
 =?utf-8?B?cjNady84WjR2MlprYlhxMzRzUHozOVlIRWU5NHI1c0ZRK0FoS083Z0lydk1B?=
 =?utf-8?B?Nit0dTlwTEdCeWUrYUVhZ0lNSXdIN0JvbmxKUTJ0V2NvVlRDM1BIZEJXalVp?=
 =?utf-8?B?R29YVmRtN3JQNmlMTTBUUnd5MmZReGpVZklxRVpEWDQ3NjU5TytGbmtwNlIy?=
 =?utf-8?B?T0dYY3ZtQU9BZ0diMVRyR3JjdHkzWnNodHlDS2RjbFBkbWhvMDVLYUMraXBK?=
 =?utf-8?B?OHoxYTJZM2t4SXFDUVFDVHdhYW5uZnpUMjg1RGhqWDh5THoyWmtad2hKdVo2?=
 =?utf-8?B?cFBmL2drOEhJU0dCS2ZZL3NSb3dOTnBseU14eXBqdE1jQ2YwL2RVWkViVmll?=
 =?utf-8?B?SUM5TnF4UnJIWnNGdjJ0em1hTEhGNVBRaTdvbWZ4TEp3UWMzTkJNRWZIQ1hW?=
 =?utf-8?B?RUdQcTJSRUkyUnBzN2Q1ZW5oSnV0SmVucTlBSCs4SWE2TnpKaUJXeU0wZS9w?=
 =?utf-8?B?a0FzSHloTUljZGphSmhSdlJRTzRLaUtVSWxkanlGRzhEMDVDWk8rQ2I4Tm96?=
 =?utf-8?B?TXRsS2RNWkRldGdhSmdTV0Nna3lwUE9XbnhMU3QwY2hFMVIvTkNrZWNnMjJ3?=
 =?utf-8?B?dWFNa0dKWUZEQ01EUzlJUnRvK3NvYXlNaUtvNUJEb21TbVRtczdvYTU0cjd3?=
 =?utf-8?B?TzcvTTdIRkVNNEp5Mk5HQUg3a1dwUjIxNi9yckZicGJkSndIU1dFVmpxMFh3?=
 =?utf-8?B?YVQwbkFMY0V5RCtVQ1JlRURaeHVNRGgrRG9kbE1yVlh2SGFvMXFRS1RlbDll?=
 =?utf-8?B?eWpXMCtoR2VGTWZ4TzVlY0lJUUduZjBGcFF0TnpRaExUYitZU0U5MWJESDBG?=
 =?utf-8?B?U2w0Szc1RTl2WWFDNitFaHpYK29tSWZYS3FCcVB2S1ZpYUYrSDhVb0lmU2tn?=
 =?utf-8?B?WDFJMDNMV21kemp1bGRQNVJIV2dYRWlMT0pwTnVWczdsa3dlWW14d3BES2hw?=
 =?utf-8?B?Z3dwQ04zT0pCTmhlVkNHdDQ3NGhMcFJaUENPUE9WMmQranY0UUtmbWYzajJi?=
 =?utf-8?B?WWNXT3dDNVVDZDZQejlIcnBlcTJ5L0U0ZGEwa01TT1IrOHpqMlJoQ0h4RDl1?=
 =?utf-8?B?UW9mRGpQZmNPWmZNN2FWY3NuN0hIUEw5NXltb0k4MjZlQ1BzKzhoNTFITjRR?=
 =?utf-8?B?VGNDVFRnbklFajJWSlJsWHBpZk1UbEJMZnAwcUUxMVdsTUdaNU11M1RPK1U4?=
 =?utf-8?B?bWxkMzY4L3hWOW11V3RWdTl5YzZMOTF3a1JqdzZFTmpqTlNFdVUrK3JqWXRY?=
 =?utf-8?Q?9BJDufRlxnc1uBtre5xn6a9GIiDlckBf3HkbpNu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXpUaW5FdjA2VHJuaFExSEhrdE5VSzZqU3hNOUJLVlA5OTRSS1BYSjJ2Q3Av?=
 =?utf-8?B?RHlLMmxSdURzQUswbjI3RTZITGh3Z2RmRTNwOXpZK2FlNlNYMTBwWkpCSVdZ?=
 =?utf-8?B?NUtVSnpKa29NSVM3c21naVB3cHNmcUJiWjBYNUZQZldqQ2doWWgxRkNHMmxD?=
 =?utf-8?B?M3haZ2lTUjlNVWxvU2x5emJZbUJKZCtwK0QyRDVJZG04aHRzOCswbWNaYXAv?=
 =?utf-8?B?QkQ2T0ltaTh6VGZEdWRFQ25GYzJ5Tks5Q1QvL0x1MzZjcmpkYnVlNDk3aDFK?=
 =?utf-8?B?TlI3VDVUeHlsdWg3UENuZVNRL21OdVpONnd5R080Ykt3Sm9Bb2psaDVTNEdX?=
 =?utf-8?B?VzdnREtmOWp2QVFQaWZQUEswc0x0aHg0ekJ2WmNNeG13bkwzQkM0ZVd3alk5?=
 =?utf-8?B?MzgvZjVPaTd6K1RCZnR3cFAvUUhjQnVpbXAyWjJpOWlPYjdnak9EbUsxVy9W?=
 =?utf-8?B?NVhZaUdqQVZOblpSNVRWa0JVN28xdzB6RUY0cEdBaXhvMExSYkhwK1JVT2hz?=
 =?utf-8?B?ZktRcW5SdEpnWTcwVUxNVFV0NXZPSTlXZi9DYmxqRld3d25MQkhBb3hKLy9u?=
 =?utf-8?B?NFppRWVEQ1BDMEFPZjZqRTBtTSswR1Fpdm5KVE5aSXZmQ2pPdmdkRlFDZ2tH?=
 =?utf-8?B?S2lwMEErWmpvNTZSRXlSN1d5WHpTaXpWVFdqbEVERmJGUVZHS1hEUGRFeVpR?=
 =?utf-8?B?amlSYjY5Vk9EZHZ3RjNOdXlCUVZHeEdadmk1aGNRU2VmRVV5QXMzYnpyWUxP?=
 =?utf-8?B?RUMyYjFrcTBndHJjaTBsdi9zcDlSOTBCbUV5cDZzYVBpakcxQ3Rib0VmY1p6?=
 =?utf-8?B?NEJLK2M0MDVCTFIrOGFZNERGVHRFRmR0cGpwWmx2NDRZUTJlNmluQXh6WHdQ?=
 =?utf-8?B?T1pFdVRkeGNTL3g3WXBtaU01RFAxNjVKTVZPRTFGbjFsMEMyZHJTdHdybXNw?=
 =?utf-8?B?YXI2Mnpkcms2d2Fhd1dYNEFHWGt3QWpzWmpocVJsSUJCbVhuVHA2bExndXBr?=
 =?utf-8?B?U2VWZmhMcDJ6WHo3c3padUZReDF0cmtzdjdVWE84VGdWa3BVMHp2Wk0yYVBS?=
 =?utf-8?B?aTV5MklJSVRRQUY2Mmg3TFpqU1YrZVc0UjNjcEUyOWVMK1Vnd0k2OGJDQjNB?=
 =?utf-8?B?TjFFRkI0MndEbHU4UDJhM3lGNjlhNTM1V2R2ZFlsalVxK25PSkx1OWZLdmxy?=
 =?utf-8?B?RmJ0T0lkeCtGaWRia1ZmQzE2bmpFRGZaVnBUVE5HZHZPaGRidWxmZGZPUmxq?=
 =?utf-8?B?YnZGVlJPaE82RXVRZjFpOWpIdit2Vnk3OGlNZ1l6ek94WUhteEZaalRLY1NB?=
 =?utf-8?B?NFBWTEtPZVZVOUQxaUEveldidEp5MXMwcnJDRm0vZGR2djhRdnNCU1hYL0tv?=
 =?utf-8?B?TnNQR2t2UDhsSUdwYU40UTJ5d2pPK2VlNGsweWlrOVc3U3ZWaVVuN2t1Yi85?=
 =?utf-8?B?Vk54OXhURTdUZ2lQdnphekhFSHI3S3dacXM0YVlEYlllZHEwUUJDRFhqSURU?=
 =?utf-8?B?MkhzTnpKRmdza1ZZcVV4SnBlMWxxRG84ZnZjWmluNUczUVFGeWFEaDJxaTBO?=
 =?utf-8?B?RDZYVkVyYnU5UXN1V2wxRkxFVlp4UDR0TmwwMFMzM29yem04T0FWWTNydVNW?=
 =?utf-8?B?V1AwVDRRaDBvaGczd2FaRVNZL090OWlIa0hrM1ExWHgwOUJ3d2I3RE50bFVD?=
 =?utf-8?B?R2NaR25yenVZSFhNTGY5YlFuMm9vZlV2aHFmc0tiNnh4eVFLYVY5REI3cEZs?=
 =?utf-8?B?cWNCUVVReGJxYVczMy9POWhET1BPYTBJNGpKVE80UmZFQjNuOFpqSzZvR3BF?=
 =?utf-8?B?NzRPSDYxckgyYWg1YWt0TkszaTVzTW9KNmtDTTlKY2tSMWgreEtBNEhJMnR5?=
 =?utf-8?B?U0JkZVc3QlRXZ1QzMmt4dmgzOWkyODZLdXRmdUwwcFV3amlmblJuVFNyVHAw?=
 =?utf-8?B?aEFiZlFVaWgvNzg3T09oaHNBNy9ST2s4cWhUdTcwVCsyMGsrV2xVLzVTOElx?=
 =?utf-8?B?a0lRNHNJcDFINXpGdHQ3MWxYQzhoVzJFeThTZ2t3WlI5dTlsT2VJdEZyc3Jp?=
 =?utf-8?B?SFNZMlArQmtiSS93S0hUa0V3S2NtczJoaEVPa2NGc3VTRW9ETGUxcEJCbVAv?=
 =?utf-8?Q?E/qHsFmAsO7Uucj2KrSITtGFH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9ab0dc-f02e-496c-eb8c-08dc857b3a0a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:19:08.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnehJIA0t2ywYsmmVx1I96i1k5ApCEYQgh1WKCuttVLpu+cvokEhFfdPJniZ0/dfNNBONym5vd0Vx9V/0GggIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311


On 05/06/2024 14:02, Masahiro Yamada wrote:
> On Wed, Jun 5, 2024 at 9:56 PM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
>>
>> On Wed, Jun 05, 2024 at 09:14:23AM +0100, Jon Hunter wrote:
>>> Hi Kent,
>>>
>>> Since next-20240604 I noticed a build regression in our farm builders
>>> and I am seeing the following error ...
>>>
>>> /usr/bin/env: invalid option -- 'S'
>>> Try '/usr/bin/env --help' for more information.
>>>
>>> These builders have an older version of 'env' that do not support the
>>> '-S' argument and so your change [0] is breaking the for these
>>> machines. I did not see your patch on any list and found it on your
>>> bcachefs tree [1]. So not clear if this has been reviewed and if this
>>> is trying to fix some related to Masahiro change [2]?
>>>
>>> It is also not clear what the minimum version of 'env' is supported
>>> for building the linux kernel, but these builders have been building
>>> the kernel fine for years.
>>>
>>> Thanks
>>> Jon
>>>
>>> [0] https://evilpiepirate.org/git/bcachefs.git/commit/?h=for-next&id=973eca8db5570dd0c3f2b3190867138cc446eb3b
>>> [1] https://evilpiepirate.org/git/bcachefs.git/log/?h=for-next
>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=b18b047002b7d3b19d9fb905c1bd2a214016c153
>>
>> I'll drop it, but we need a real fix then, my CI builders are broken
>> without it...

Proper fixes are always good so that everyone's CI builders work :-)

> I will apply Richard's patch instead and send a pull request for -rc3.
> 
> https://lore.kernel.org/linux-kbuild/CAK7LNASx_iSWZ14W5dpTOM87kB8A-Paq8fM_3nKH5tdfJQ7+ZQ@mail.gmail.com/T/#mfa8b89c64a6a14a764338e9398d40be9bc48cdf1

Works for me!

Thanks
Jon

-- 
nvpublic

