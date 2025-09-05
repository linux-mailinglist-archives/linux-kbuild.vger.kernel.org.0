Return-Path: <linux-kbuild+bounces-8738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA0B4539B
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 11:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6D011C26F52
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 09:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338DE2877EA;
	Fri,  5 Sep 2025 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OJJi6pA8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RacL5zv/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BF27AC3D;
	Fri,  5 Sep 2025 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065311; cv=fail; b=gzW4kLlBCXZNnCrxbrSZ6S4T/+giAv7uA0ZaJvtI341thCWj8GBUaf2uxUQgObPBtIcPjNc0uOFJJ2o42U7BgA5mkTDjAuANeDZnY7QriTV4dACWlpyI03kiMN+nJIyMFCLXASVHW5zvEpMLioog6k6JD8zLvBQT2+dJbkFdujQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065311; c=relaxed/simple;
	bh=Vv5fUf/Mn7zid6VXxKWszkl0cu1qhn3ZqTOtL2ZiQ9Q=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NTF5BkkBZGuvJNWNVQ6pEYyw844ED1lbb1WIGUhucBQzanAgCZljF7fKWdmDff+VehrAJhIdl6sFaBZjK0gm7sQVuM2u9+g8UqdmjVmaAoaVGeQk3y5PtmdBTfxlYr3gKkOPnWaxP2btV0wtmSKw/2Sp4TKdsRCQBxUOk6MBPtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OJJi6pA8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RacL5zv/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58584UgC014429;
	Fri, 5 Sep 2025 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=n7WavrV2VJl/K7DMn5B4RtrPxMLo2d5Izl/bNCJVqAY=; b=
	OJJi6pA8Mn/3hIrhvCfDvQSiGsbKpnvCWpgzaKCEgMwnxScJr800h3n0fPMmUW3A
	8cd5Mi/1R/734K9/HfbeP59cywn3/9y+N7EohzXTNIyNzWmzXNhxq1VYbmms1b7D
	WhetKrb38btneVR/TbI+kjE9C4fizWj30S9inTf8PTrJqJM8FaBXEO1nZhpeDpRE
	iNbY4xEK88Aq1qjnX1zNQ+wW4xRZVIsRlmiY1SRq9uiNsvNF924RtV8HLqdwz9p+
	g/9rGp6OoM4+QCfOQUA2Kpde3zZ3rHVqx79Mvkq3OXv8s5UxhM+tUrxpUgVrkuFV
	l3GCc2fGcFTk8w53reF6kw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yv1f05en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 09:41:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5859Jbwi039557;
	Fri, 5 Sep 2025 09:41:26 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrjs1c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 09:41:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYX78AG3X94xZlPYU6r43xfdzDSR8t4aPO4r0M6/nO3c+70VjA/CYdP3urTChZ4flIVSDpC4q4xGKt42AAQgGJwRNnp9uKoPfMWkeYwcZemMZzu5EgRRopF5oNXnvyzw4fG0X+o9F0G3TBVaKXTLj3DaGnJz4zvMaZjF/n9oNoIgMvBLz8z52kiM4fGEIIYaez+impYJs5oiojIN0nDX7CNHjYwgBkimHE3jVCJJy1DIPNNp61DGfYXlMcb2/VupDjaOQLlMDjq30fNFiwVjE15tqwwsuRqdNOpLuS+Wjb9nPr6C8GIFdXZDD8HNTtgsSAnfkxbg0FEyTZaPL0dckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7WavrV2VJl/K7DMn5B4RtrPxMLo2d5Izl/bNCJVqAY=;
 b=L0XFcMbj/BN8bLLYPb+zmazvH1LHPweePvlduLEWb+Vl5ad41FHVTFQJCtpkurfBynpw9ILDMBqk8NJiluFcwGUTHKRX3LckDzmsHKJjQdX0ZhtrDkWkGv5E89etOx9SG/mi/ryVMFNiTWezMc9T1AbGXmQOIyp/DRKApjDm2eaHxRAywFDQjxouWpVk5SkQaMRXMrW7R0zS0wwpUy8voeJjtCuBLBbPEfNR52STg2UHzNKQZ1mMGy0P4dOwesUvmxD/c5Yc4N8iMmP10ZlQzSSOK6SB3uY+3LnOCxNotjSuVH9+rXDCsRm0JZsdebBFXDaDPY6NYXPJ8xHJyyaaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7WavrV2VJl/K7DMn5B4RtrPxMLo2d5Izl/bNCJVqAY=;
 b=RacL5zv/Ue9DlB18EKINBj8bxkWmWvTZQLaEJUc3q4QDsd7ld67S3X9SWUSMTrVf1dwkMEW6Gfio+wrogyPjs3GCA/SrTJKqbpDBXCuibwMANazqLrcPYfIiOHiPHgM8bCvB4gkl0uhZf/5hhhkAuA0RgsBg0AnDADKcyreRLVs=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DS0PR10MB7272.namprd10.prod.outlook.com (2603:10b6:8:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.16; Fri, 5 Sep 2025 09:41:23 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 09:41:23 +0000
Message-ID: <2bf12be7-7fd5-41e2-a0a2-da82903d0ccd@oracle.com>
Date: Fri, 5 Sep 2025 11:41:18 +0200
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
 <18c2c59e-edae-4281-ac7c-8524d9cde1c5@oracle.com>
Content-Language: en-US
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <18c2c59e-edae-4281-ac7c-8524d9cde1c5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DS0PR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8e5bd6-d966-4b66-767d-08ddec606049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFFPL2ZieUgvVElxOWlWYURyVi9veGdMcXhxS1hYTTIybVZBenBFQ2kvdVB2?=
 =?utf-8?B?OEtJY245L3dOdjV4eXh1eGoxYmt1b0dGdURWZWtOVzQ0ZmE3VnVYZmhOeks3?=
 =?utf-8?B?elZMMktkNU96UzVXOUFnNVBSWExSYUNpbm9wRk1jdXE2b2ZhZ1pwTmVmdDN6?=
 =?utf-8?B?cHlDK1hvSElRNzB5bDRvdkoyeFBRb0xKMW9KSFV5YjlPMVB6VmZ3Z0pkVTBK?=
 =?utf-8?B?bjkydmROV0tJMEV1cUpJU0h4dWo0Rkt3cHFKMFFiYWFSU3Y0bU5KMkVmRGRX?=
 =?utf-8?B?Y3NJNGZqQURhUUlMK0dHKzlPc0dOWFdXa3RDa214cFZEbkttQ0lnSXE0TzIr?=
 =?utf-8?B?YTlsZjlnQ3NvVDU0ZUJURkRjVkNBR0QvOFl4ZFJZajQwS2ZuV3dmYTNpMDUz?=
 =?utf-8?B?RTZSY1ozSkxjSEpWbHpaa0EzMVVFYkxsRUM4Q3dOMTZiVHY5Y0tXVXFuVFdV?=
 =?utf-8?B?MVFYL3ZUdzJDdjZYZEFUUW5wMngvL3hKaUpiQXdyZCtyVXVKYVdyRlg2TnRk?=
 =?utf-8?B?Y0J3WktQRi9XU1BxVVArZnNtSm05RTRDaFZqWDYzZEs1NkZUd0ozUDE3a3l2?=
 =?utf-8?B?K2xvOFhWK0ZBdk9RSTBwWHZkVGQ2NjZzd3dzMVM5TWRJb1N4RGhMSld4djNz?=
 =?utf-8?B?bTB4czBUZDVnM3hSZ1RTclBLN05kR3NUQklCN3FEOXZtZXRDbXBKSFhzNmZT?=
 =?utf-8?B?VkM1eHRGUTdBWWkvU0RrRlhGYVY5THAzL0FaQmtVK0JCQ1RlR0srU1E0ODZw?=
 =?utf-8?B?M1ZTS2t0bVJVVlowRFhpZy93eEdheWI3SmFUVm0yMkFJOTRlam1aYmpYVnJR?=
 =?utf-8?B?OGZPV0swbmwvZCtiN3hsMWNxay8rQUpCNWZDZldqUU84aGdjLzU3T0MrV2t5?=
 =?utf-8?B?VVp6cjU0ZkpaaFhSeTNqeS9QaEthOVVNSG1Vay9xYmZWM3FwQWcrRXBTVlZn?=
 =?utf-8?B?Y0QwbWV2Yk1aYnU0UlZLMXROZCtzRFltUG5GZVRycEJvcmhRQVdkdTVrRHVN?=
 =?utf-8?B?M3Q5REczYS9PN3MrMXFhUnBITkdDR2V5Wml4L0NWeXl0ZkdOT3NXZVdGUjBD?=
 =?utf-8?B?M1czUjRza1BIRWdwWFNXR05wNEpRSERlb0VlNjNvSVQ0aWRwaFFqZ2hUQlpV?=
 =?utf-8?B?UXNDOUJlUWIvaW1XaHZIUjA5RzA1WE81Q1FXc0tTNzNLeDBQUGp5ZEZkb0FQ?=
 =?utf-8?B?MmRSdnEvMElUeHdsbXpXcC9GdnJwTm03TEZoTTVubEs3WjVFenh5dXdSRW4v?=
 =?utf-8?B?Ry9zSGNteFQyTGNHdkpmSWRTUkFvUjNuVkM5Vk1yWEREam5SRFRINUZlMU9Q?=
 =?utf-8?B?K0JFU3U1RWRwdExVZUtDS3NORXFIWVE4K09hYVpCVHBaOTM1b292THVKRDN1?=
 =?utf-8?B?aTNhZU9VWTBXM3gza01vK2RWSS8zR0hjOUJCTzV2TFpxYjNEUFBWa00wc2hD?=
 =?utf-8?B?SXA3eEtOSVBhcy8yWnZTR29OMGZVZnJtQnUwNzBCM3VzMXM2cS9qMHVrSito?=
 =?utf-8?B?NnlSTGhPT0dNQ25reEVWUTRUY1RROC93c2paT2hVdnpoSngrWSs2eFJ4M3Ri?=
 =?utf-8?B?WHNvMVFjNDVUQXlld1UxUE1saEtEMEEyTXBFT2lRN1FYY3Y1WGRwNVlwemJR?=
 =?utf-8?B?NzhxeEtrRkJrVjl5RVNPVVJwRXhQQ2hQN3JCd2Q0RW0zVVg3U0JraThLLzZr?=
 =?utf-8?B?VHN1MGJHMEFDU3BoNWhaRVd3dlI0QXNDMDVMM1UyWTVocUkxY1pmSExsbTIz?=
 =?utf-8?B?MVdFVDBGN2lmSkRQNTVYWjlSVmxWNEo0djhyak8xMzVqOUUyZ1VPZGdaRUZF?=
 =?utf-8?B?RDE1S3pYTEpWMjIrTUF4OTdyaEZ6Q3o0L1hpLytFMUJpd0R5Y3Q3ekY5ZWpt?=
 =?utf-8?B?WlU5NHpkeWdqVkZKcXU2Z05OZmhKeVhoMnVmL0Y0bFNCcnBJZG4wYVllSDdp?=
 =?utf-8?Q?LPN3wTMQx7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnRVSWJNSTVoY2pZODdZMkR6eGJjZnlIRHpTRXN3S0w1dEo1SmxpTmtqUStY?=
 =?utf-8?B?NVZzYVJOWE5HeThxVFpZckVVZFM0Y1lteGZxdXdxTHZZN084Nlk1dER5c0wr?=
 =?utf-8?B?QUVyZ1ZPQUc0cTNITE52ZHo0YWhhRFNhYnR5M1hIeGZkZVk5OUNtMlRZbmh5?=
 =?utf-8?B?WTV4UlcrdysvYlVaU1VYNjlJUGJ3TmFpUE5YdEJLeVZ1aWJkNjNTWWE4c2Zp?=
 =?utf-8?B?RmV5WVJuUWRLNTkrTm82ODlESlVzclR3c1VMSU55RjMxVVpHcFlraCttUzBV?=
 =?utf-8?B?UjhnRCtvcVR5ZmZwRlREM2g0SFNHTlgvUktCV0phclRGZm1WblBneVBpUTNY?=
 =?utf-8?B?OTlqSDFOSGRjYzdHaDBGdnd5Sm55ODNLTjF1TTVkOGxqajhGMU1mdU44Y3h1?=
 =?utf-8?B?QThDSzNiVkE5QXFydGFMZS8zV2wvU3VTTmlMU2FINWdaQWlONDAwT0tHazNs?=
 =?utf-8?B?eGpuOGhucmROSXNQeUJDUmJkeDJEbDdsSldtYzRjM29YVFltdzZWempBaGVX?=
 =?utf-8?B?TGI4RDVIV3Y4UWViSmdNVVlvaHMwMzVYbDIzV1JNT1JoT1lpOHhNZHhWcE52?=
 =?utf-8?B?VW4wNE1xMy9VZkFPNW1PRlNnL3o5WWxaVkVRMVRNMkcrNXlLUURqa3pzRUls?=
 =?utf-8?B?Z3B4eG1Ubis1cHErL3BTYllGQ3FBVHkvcXpuOEV2Q1FKamJmaXlZckZ2M21P?=
 =?utf-8?B?SGFBM0ViTmVMY1pRNjd5Q0NjQmFMMFRmNnZvd05pWWo5Q2tibXFrR2xYT3pm?=
 =?utf-8?B?L3FBaTVFclEzZjBkWlowOGd3WDlEeS9JdXNaYmZET0hsb25yOWVyL1gvSklF?=
 =?utf-8?B?ZU93Z29ib1ZxRFdHbWdDckpZckZnU250S3llN3NwMDd6R3UzbExXODJSaHJm?=
 =?utf-8?B?NnR2WDRDYzZleUJRMmdIMWRyWGFTeEQ2Ri9NdjEyNENsZVV1dGFOMWdiVHJU?=
 =?utf-8?B?aG9LSFVhK2ZaUVk1c0VqRFUwbGxaOFEwNmxtNWl5Smd1bEVwMnFPdUk0dm1n?=
 =?utf-8?B?Y0ZoM0hDaFRjTWpZQ3FyUUhlRFlrZnVJTzFJMjlTVW8yb3VscWozNkZOeDRK?=
 =?utf-8?B?NDVtcktHOU9adk9OZEsybFBHQjRwaTJxSi9WMWtPNHFNMmIzSDI1cVBqZ3RT?=
 =?utf-8?B?S1E5TVpJOTVGTWVaNmJBaGlpV2U2U3E3cWZ2N1RCVGJMNWgvQVRsVFRQZ2Yw?=
 =?utf-8?B?MlhXU2lwQVBYcU5aZHlmNlBZbDlSOVFxRm5sSFErSWNnNGR6RlFRa0YwU1VQ?=
 =?utf-8?B?ZkQ2andCZ0Z0dGgzbSs4MVVUeGE2SHM3QUZMV1IwNVJsNXhtOHErUDZGSlpE?=
 =?utf-8?B?RDk2TmN2R2plZk5aWjJKTk51UWVoL1dDZE8yV0wySUNZdHI2eEE0RFQxZ09D?=
 =?utf-8?B?cmgwTzFzRFJRdXZqM2dxak5GclpvdXkzYTVtRXdjN1JKV01TYitiZEo0bk4w?=
 =?utf-8?B?UjlvVkRWZ3pHMlVKL2xwelVPOERZb2FGQi9LMEludkdydkI0WUNPU3JwaXpU?=
 =?utf-8?B?S1d2TDFIeTh4dGJONTRQWCtzWVJEYjZnM1I3TVRJbHd1M2MySFlGbCtBbmVR?=
 =?utf-8?B?LzNUbWZPdzBwem96MzloV0ltckwvbS9GU1N2NWF4T0g3aXdyUWpLamdYV0Z0?=
 =?utf-8?B?UitsUmJjNVd3OHVoemlFNlVsdmtPV241RU15TmJJMWozMlh0ZUJ1ZEtibHNh?=
 =?utf-8?B?S3lCTGp6dkJNcFFyeXl3MWRBRFlHQzRpVU1KNDcyZXB3TFVRZ1JzSzdUTXI2?=
 =?utf-8?B?Nks5NzJtSFpzY0Rycmh0Q1U0dDR6M1BReHlieTQ4eTJrc24rS1ZBQ2lqdmFm?=
 =?utf-8?B?SXN2S1M0ZXErb2ViUG1IQThMZFlhajFicmpCUzNVdUxtU1loOGZZR1NJZmJ4?=
 =?utf-8?B?NFlGdzhSQ0RsOUpnRVFzeGdRczBVdUpBcDJQdEo1SGVLVFdvcDJJZ1FWbzkx?=
 =?utf-8?B?ODNMak4zUHZWT0pkYUIwNzlFS0R0SHpxdDl4cm9jblhQWEhhNUJrQjFyYXFY?=
 =?utf-8?B?ZjhaNVNFZWxsdm5TUWU4YU81L1Z1UUFlbGlONUtEQ005d3RUNGxZYit2UGFF?=
 =?utf-8?B?RW9jSUR4ckxRYzRXSjBRZTlqMHJsbG5QQTVQY0hTZkF6OWRBN2VVa1dCRVlk?=
 =?utf-8?Q?22l3re/AkyVs+v0EBL4tuRmaj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4veddOvPQvkL9zkFHUYNVoFCUslCGlVn5Jg9pK9iPE4tbB89YT09IDQB9uAJDW5iYSsQONBWo6dlueqXAsi4bg77yoS+/1GxV+RYeGD/oNV4rFprPqrlWz1tAV+0gOliy+SdPt4Y0PApQB7S00kjNVd6/xek6InsllS+5BUL+IFym3ggNcKsmq2sMtI750lgOrq8Q/RTkYRaibtcxJkKdByL0dpQMYQBf5p6cusQJ+0c2jHdra5+bG/siscdyFtfGSrxPeUX0E6fI8kQT14m50f7n03t3lMb1CXSowar/TH/HsQ7Qth1wzATirX2udr5dzUKlG2Tg47kt5avHC2ARxHPA0SQyNrqKflhT7WDn8A1v3URJ6EaVip5g2UpbUatzgIbO7Xvxcoc8CqGT5L089TPKFal6Z0qHDxU7V3XGq1QNNnInqLfIt30aIVOUslxaQvhewU4dlreGkqnah1lonOwGkvyDxtKmQpzYrQ8k3puOdaqD5UOTi0urHUAVbftLb6ub6gstZKDmiqxjm6+V+MBjhbM2XKc5O3NwwfPHhb19kZ8ZiNdG8PEE6UeWmTNXDf+K6Pyvp2PoHlUt8rFNGWAHgg1r8t5k+mGrDklsSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8e5bd6-d966-4b66-767d-08ddec606049
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:41:23.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGrMkULX+KooQ6+16ekmgd3MP1CLQPjTjtjikl3iEoxGqorjue/ctceD2SolZDPQNnUPpEIx7gyNHLs41wZ8+RN5QY0Ll4NiCarGUbA2azE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509050093
X-Proofpoint-ORIG-GUID: vcUa9I11c6bZb9MDH-K7pKBBqh-xkTBM
X-Proofpoint-GUID: vcUa9I11c6bZb9MDH-K7pKBBqh-xkTBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA3OCBTYWx0ZWRfX4/MTVihnFgdD
 JQdLL7F3R6XCfn2lZ2WOY9XXx60bxJ1fFh9+9s3hXihNn1EIGCKjADYZQHY5ODExBgQnfngEeZ/
 h1c44LPFiTeSjE0gPHfmYvq3IumRjvnhKjq3lEiT0iXQiuxjljEbLmQKWnNGGN//zI0rwIW923D
 Eyosvtu65Imrq1YYjHJ8kd38pL4AAI6DlFMkdCJbsSwjj3WckU2Yyo4h2n7lCDwKs8Zgar2pcic
 6aQf0klOF9ilu/xdMCqc0Z1q1Mlglf+dcB66RLOOFfoqP3xDDFVjw6Ebi6LoJoaJLMjfS/36/mp
 SDDhRiB3eF79CTPayzWk8aAhgO1SMYXVoQfjxUsNRtJ6DY0So4u1jfZxIWWDI32HnVkrk93Vco1
 /otHSgrpWGZKE9zAtw6B7CiR8QvfyQ==
X-Authority-Analysis: v=2.4 cv=C7/pyRP+ c=1 sm=1 tr=0 ts=68bab047 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=_kHF1yU3zlKfq-h4VY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068


On 04/09/2025 19:10, Vegard Nossum wrote:
> On 04/09/2025 19:03, Vegard Nossum wrote:
>> @@ -214,6 +214,11 @@ static void sym_calc_visibility(struct symbol *sym)
>>          struct property *prop;
>>          tristate tri;
>>
>> +       if (sym->flags & SYMBOL_HIDDEN) {
>> +               sym->visible = yes;
> 
> ...I just saw the irony here after having already pressed "Send".
> 
> Let me explain:
> 
> SYMBOL_HIDDEN is your new flag that indicates that somebody used
> "transitional" on the config entry.
> 
> sym->visible is tristate value that gives you the condition for whether
> a symbol can take on a value -- y/m means the option is visible to the
> user (hence the name) and thus eligible to have a value assigned to it.

Another small clarification: Replace "is visible to the user" by "can be
set by .config".

Actual user visibility is controlled by menu_is_visible(), not
sym->visible, so my patch still doesn't show transitional symbols to the
user in menuconfig. AFAICT, menu_is_visible() is completely independent
of sym->visible.

I tested menuconfig/mconf and oldconfig/conf --oldconfig with scripts/
kconfig/tests/transitional/Kconfig and my patch and it looks correct
(only the new options are displayed).


Vegard

