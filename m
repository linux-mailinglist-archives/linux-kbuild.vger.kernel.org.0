Return-Path: <linux-kbuild+bounces-10903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM93AZ8CeWkdugEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10903-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 19:23:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D898F4D
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 19:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D6F5303CD27
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F742F39A3;
	Tue, 27 Jan 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C3Q0SCYj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="khUmdGi/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7222D7B9;
	Tue, 27 Jan 2026 18:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538203; cv=fail; b=CW4imN2Ubl171Ev6WFErBTTR61VUss3NIzPzdWTtS4Bywub8GJyJCtoM3EfSEHf3b3U59wHoq3n33J0zXLQzAsjx8l7K7pOnTGUDGLJO7lLRb2ajo0NpyvTgsBurjWZKWtv5Zf1yOVrz/+7BwVdQ6d+BwJ9/32SrKF2S0gCtXNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538203; c=relaxed/simple;
	bh=6zcsabZn+WPQYiKpxdHi9nVQ8m3/M+us4SOzQ7v0zA8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hrRtbNPg+m/yuCY9/Vuz5C614AkDfXRbtogpXQ1Kg8+7qmiHpHtFvlzL5obuEiTFrARr/CkJBXWpRtGGu0lT1jsnnyAQnZ9YpuTxL8tfGLMkL37SUCfDO2XMuX6l1elLZ8jgMLVWK8WDuu9UvXABrLI84nOxX0MjFSCzS1HVM9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C3Q0SCYj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=khUmdGi/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBELc73713718;
	Tue, 27 Jan 2026 18:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kD151slLoxldC16k3D8ATQnf8fnVTGA0iYHXvCdbgvQ=; b=
	C3Q0SCYjP7KW0Vb5+jOJdCCP/5/kCcElir9vji9kx3uykKpAyf5xP6MdT0b+inXe
	U4zkelmnbUg0wXavkfS0SzT9c9TUqnzxlPPThzLAkcbvbyYrpjQO60vHbD7arNRE
	w6kT5M9XCApMouUXQgzMohsmqQly38Q/J0ssKOmtp8DaMFPwIGugKq6Kqvq2Y0Wd
	cqjmYg59fupU9aawldxDRr4CIdVoX9Pxqfg10nUiC+n9ESLbxdT5j/hz10YxYVf1
	N0+cs0XeXTe907yJ7p1424GVQwEjS5/S3zQwNyfmd2RWTrGjulA3DObwMSfgQArQ
	BIGvuI/xh59QK4Q7l1s0oQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6vhhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 18:22:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RHQ10i009958;
	Tue, 27 Jan 2026 18:22:36 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9tkkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 18:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drtJt+dVPIyo28c7GbYuUcIHukv7VQzVe+g8p/sOXPfPnSp+UO0fBDwsMPWaa3TJFFCgSuvDn0bp2UAfEeacKKNauMb/7kqTCCwD/vWn5I0WQ6lHlS/BzOvxulcYLT+UxxK9DJKKjaI7e3+VwbgRAW2qtth8L4UTtUXrX84k2Sl4DC7yuQg5KyfYyirkTQEP9VW7+QUwLdwpuiXcKFcd90n1VVD/w92wRSIJoQUl3B9ZrlmOkDjiuNh2/4nJTYhgUaee2Di9tW4hU6Dn/6rV07ce44O4xPq3ZFNdEh08RpPJLFH3vVGLC3iy2BM2Nc9SPHHIDrXvYakZse98NxpEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD151slLoxldC16k3D8ATQnf8fnVTGA0iYHXvCdbgvQ=;
 b=asxxSHkMsGhIf2kO1qiAbwtEKuWN9F14dMpQPiPu3AH2qYgAEownWCZA2WHsYaDu/qRPu7fXm7Nq/eA1aD+fWNRRI3OaG11Z9vHo6AX5D4G00RGT1DhkKNZmG2Z+5d5ioPfjGcsqyXfdyDHFx9ScxPcnk70a9BN0jz9BbH5ZD49MxiY6Tr83F2/cO2sk+FW6e9hBFctee7sW0Pm2Ve2vpFbJRLiGwo06We3V2kS3QUAIBQczonDYgB5mg6cPAG6PMEV7DFNYlaG3TxS+4gO3dzMCxvnQmzYqt93ZfTe/pWZoYyMQ4IbPfGBad8CmR4doOSLjG6vNCoJXlx66YDOINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD151slLoxldC16k3D8ATQnf8fnVTGA0iYHXvCdbgvQ=;
 b=khUmdGi/y+UHJbS/NDYbO/0vWNBCTE3cOUXRz4Ga9iJVJVbouyaagATlCelGIbNYYzI/N+w0sE4IxaHwZGmu7F/8lvWEyzkJS3qc/sUp+Mv5sj1aZZBUELdZrIaF5szji8OxOTBts5AbpeHvq0OMdQE6AMU17kWV0Nl4vC2eem0=
Received: from SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12)
 by SJ5PPFDE7085185.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 18:22:32 +0000
Received: from SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1]) by SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 18:22:32 +0000
Message-ID: <427ca212-c046-4d78-8111-2a19e7f2b700@oracle.com>
Date: Tue, 27 Jan 2026 10:22:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Don't create sframes during build
From: Indu Bhagat <indu.bhagat@oracle.com>
To: Sven Joachim <svenjoac@gmx.de>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Matthias Klose <doko@debian.org>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Binutils
 <binutils@sourceware.org>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20250904131835.sfcG19NV@linutronix.de>
 <b3db475e-e84d-4056-9420-bc0acc8b9fe5@debian.org>
 <20250904163404.QMU7nfbA@linutronix.de>
 <jdw2iyr2dd6fzasbiwbzsaqohbi46hwd7wb3ze6qhztje2b6ld@qnween3ajj5e>
 <87343vdxnb.fsf@turtle.gmx.de>
 <4f62add4-85af-46c2-ac33-d68368c5bdb6@oracle.com>
Content-Language: en-US
In-Reply-To: <4f62add4-85af-46c2-ac33-d68368c5bdb6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To SA1PR10MB6365.namprd10.prod.outlook.com
 (2603:10b6:806:255::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6365:EE_|SJ5PPFDE7085185:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b609e2a-78e3-47e1-ce07-08de5dd10982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3h4YkVKMUNxV2ZQN3JPaTN3VmJOd0szMDRJWWV5RCsvSi9RRnNMbTJ6OFZv?=
 =?utf-8?B?WEdxeG0waDQ1Q0hjcFhVUXlySXBtUnBLNnVodFJKT2FoOVVFNlpobXFZZUh1?=
 =?utf-8?B?QmJUNUF4aHhId2dQVnJyazMxT0RqSGt5RjZ5ZVd1VHAwQ05rVXFJVEFBbGZo?=
 =?utf-8?B?djZSTUQ2T1EvSHA1aHI5cUNGZWRXZlN3N0FVQUx0clNqcHRMem9DRmVIUkpW?=
 =?utf-8?B?MVBlR2xGdHl2RDZ2UVp3YXJKVzlmckxGS0w0R1ljdUhlVkVBOTl4bnRFSFh4?=
 =?utf-8?B?Z3BLbUlTS0dpcW9COHZOWC9BSlpZVDhRRFVPUmZMdlR4cVVrQlp2YVdjVW1U?=
 =?utf-8?B?UEhyUjVwZ2Y5elExQ2RyWmg4QnY2MFNiUVRlemlYZzVnQTdtRjhqWitUTVRq?=
 =?utf-8?B?NXJaRmJHaW9BVXFRRmRGc2liMStpYjk1N29xRFFIdzJwS01EQzkwRFMzMGFL?=
 =?utf-8?B?UjllZTN3MTZPQUFCTzJFM29PMW8xMGtXeXhIaDB4MzVOaTZKdVNLaHVKbE5o?=
 =?utf-8?B?WC9iTFR0NWg2SjdRMUNyWnAvVDJ1NGl2SWp3c0NYekhoVElON2U3ay90YUt5?=
 =?utf-8?B?M1ZaNGtNTDZKY2xSVWpWSHVobEdPRldhbDNKZ0N0QzhEeVRzMDBIc0tMTWxx?=
 =?utf-8?B?T21HeUcyTm1jSnMxa1E2T2JubS93WVk5TURFUEFDVFlnbGtaM0l2N0dHWUJ0?=
 =?utf-8?B?anNaRGlFMFd2OWE4UnBIVURUQTFaK1hTSXNBeWpTVG91UG5WaFQrMjVZaVlX?=
 =?utf-8?B?a1c3cTFNbTdmd3NtSnFSamxQSG1RMGZUSHBhdXJQQ3UrOWo3Rm5WMjNEVDM5?=
 =?utf-8?B?OEx1MGsvMWwrbSsvQ0ZRa080WlhCWERZVkw0QzFSdzZPNTdVUGN4ZXVLeUZ6?=
 =?utf-8?B?YmZZRkxTQkZPTXVwemZQcGxUOEFYVitnRGVKbW1SaUhJNGREWXNjSE5HU0dh?=
 =?utf-8?B?bGk5M2xaSjRMMDVPTGZKRUVQYmRWUWN3TVRvTGxtellpMzhhNWFPeXQwUkdh?=
 =?utf-8?B?aGJOSm1mRjJzdzNZbURoTWVXNlBQWTU3K2xMZW9nbW1yenZnczhWS3ZPWVdm?=
 =?utf-8?B?aFNJdXBoTE1MbG53Z0FZT3Y0dExlT1ZNTEVQbkVCRnFDTndFVmp1aEJhMEw4?=
 =?utf-8?B?Wk85bnlETVBTUEtDNUtDVGtGVVpHOVJ3cU9heE1JcWZPMnFxbDErOUM5N3Fs?=
 =?utf-8?B?c2NVTHZpczNvdVU4SEh5TWxoZE55MUo4Q0xpNFdMWlkwQ2Z2eGtMdUlHM05k?=
 =?utf-8?B?OGR3bjNqVm41NlRHbzM2c1N6blBld2djVmlUTkFTbmRPaTdGeFQ3NE4rQ0hh?=
 =?utf-8?B?MjJONWpUcjhjQUFoQTJPUXJDZTdkK1Ria25ldVI0bVVEQkdRQWI2cS9oVVlX?=
 =?utf-8?B?TXhsQmxDUTIrWm0zREp6ZXFhZkR3NnFsMy9UeVdsTHl4RzZZeVlNSUhiQ0dF?=
 =?utf-8?B?Um9sRFB5c0w2ZUJXVGFkMFhDenBRdm5DZ3l6Zmd6eGo2UEJ4S2NheUdaOUVK?=
 =?utf-8?B?ZG9DejZ3d3RaRjQwWGhUNVZ2NjBQUUM3N2hyTlVEOTNKVEQ0Wld0czluQmxk?=
 =?utf-8?B?dVNxc0ZpTU5RR3JkcFNpSlB1WTQ1bkxiTGljcHVQMGlqcTg4T3ZWUGt4Y0tM?=
 =?utf-8?B?SE4vQXhLSUxFc245aHRwTmdSVVNpMFBLUTQ2elV5REFNRW4wTjR3T0w4L0pO?=
 =?utf-8?B?Ym4vVGp0cTB2TTFiWmgvcU0zeitKV1h5ZzFoczJ5QkwwSU11ZUJmOVFHdWhz?=
 =?utf-8?B?eEg0TG9mUlJtbndUWkNpRmM1RlN5NVFHQlhjY2dEUFJkbXBrc1BySFBZeEZo?=
 =?utf-8?B?cEY5d0R5VHRQM0tqYXE3dVNjOEd0b0lSK1A3dW1EYTNtQ1drSlJ4WFVsUVlv?=
 =?utf-8?B?akw2NElUZlZGNTcybzRGQ0l3L0ZyeW56WjVZUHh0djI5aDJQTDhMeUVwSks2?=
 =?utf-8?B?cUVXTXNpS3RKMHd1RHN4aEJxdjNhaTRCYUYyNU4yVklsdURLNzNZK1hwa2Jw?=
 =?utf-8?B?U25JaHB1Qk5ldXhMcDZvU3lxWnNFT3IrTkN0QWdZUzBlL0lsNlo5anJyeUJR?=
 =?utf-8?B?ZWJZcFJkajhZRHhyZ3BWWVkzKzEvOC91bmF5Z1I0UFg3UVZtVjRYZ0NIVzhu?=
 =?utf-8?Q?Zdu5UjirqZe0rk7RsMm5Sst69?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZJVTZNc3ZkTzRoS0tkZW5Zc21JNVpPL2FHbzRyd0p5UkttS25maStHL1di?=
 =?utf-8?B?dHVIdUIvVGRYR1R5MzdIdGNFSlhoMW5CQTRCb1RmK3NxS2UvNC8yWkM4elhr?=
 =?utf-8?B?TTVMaFBIRkw2YXpSSlFhZmFHSXZPbktrZVhNS09tYnFUNXNwRVRtVlZabjlQ?=
 =?utf-8?B?NCtHek1HZDJieTNYdkthYzhmSy90ZTI1ZUdUc0JIaUs0UDMyZytLM3IybzFs?=
 =?utf-8?B?Sy90M21vVUViMUh0VlJ4VHJtdVc2clVSWVVzcyswTUQzc2xBNksyWVB2Ti9F?=
 =?utf-8?B?Nk5hUHBuNjh3aUlWdGlQUDJvRDhjbnFaeVFBN1krU2hhVkc4bHR6d1M1TmdB?=
 =?utf-8?B?aUtLOG5pQTVpZDZmUXFmMy9lQmxUTE5vS0FEeFZPaHdRZTdoeVoyaXB2T0lj?=
 =?utf-8?B?T2FobzVQQVZ1TkhuWEZKdFp1dVo0My9YQy9senBDU3BBRE1VdTlHZlIwcDJD?=
 =?utf-8?B?UzcyYzE1NjQrVkVSNmpaRzgvWFVrVGpwZnY0V1Ywb08yUVlBNm0wbTZmK2hU?=
 =?utf-8?B?bDJyWitaRXg4UkJMeDU0K3RqVXJWekZFaUhTekZIWUk3V01QYTZkeFpweFBk?=
 =?utf-8?B?QzM0VGZDckovendBdCtXQmdTUytXb1l3MHdWQkdDS1hFSTBFVzFNUVcrNGMw?=
 =?utf-8?B?ME0zTnlRQnRWbSt5YVp5WmxzNWR5NzdQVjE3SEJSMEZtZmlUdE5rcVNERnQx?=
 =?utf-8?B?ZDRIeFUzTmduMllOWVhNR3JlQU5sdnc3UGMzY3ZWQTgrU29CSkFKQVlEeURJ?=
 =?utf-8?B?ZWxzZUtOV1h0OTRBY3ZyTGxKQ1RBOFRMaW5ENCtLaUFRWjJJbE9XVTdOWHpH?=
 =?utf-8?B?ZisvSEhrcVAycStocUdoVzRVNkpGaG5vM1pIZmtldzZyckh6WHZCMi9FSzBR?=
 =?utf-8?B?NWdlYUZtSnI5d1JHTUdta2hMTjJmNWlObE1Zb1VlYnpZSXJiR3g2RzF4Rmo1?=
 =?utf-8?B?TEFReEJDVXgxbUNSbHZ4NHJtb0EvQ3NNQlkrdWVvZG83NEt4OFc1SlkxUnND?=
 =?utf-8?B?N3BDc2svN3krQ0c2Yit0WnhLRlBrZEJvZkRXUE90aVNIUjNaZ0FzTmVQVHRE?=
 =?utf-8?B?VHpCUXk2UEhNRU5LZGNBei9JWTlybjRLdWU5MDNTcVA3WkFVZU5yb3JYaHNt?=
 =?utf-8?B?N0ZjUzliWERuaEI3SFZmRzE3dGx6RVdnWHgxYThoZVA4NW9vL2FKN0dwTmw2?=
 =?utf-8?B?WlRsV1o3em15NHNMWmtsdkNUakR3bERCT1I3WEJTeXFVRDBuVU9sMmp3T1hL?=
 =?utf-8?B?NlNkMkk1UVZjQXZPUmlnT0tyeTZmVzFodWpsQ0dUM01XUEpGM0lEWkdDa0tv?=
 =?utf-8?B?NXpJa0tJaDRNc2xiRFFwRk0xWFBvYXRGOTZhZWh2d1dPMHR6dTM3WlBOZjdl?=
 =?utf-8?B?cld1R01aQ015YzRaM2VTL1VqWXF5SDhvOGhnWm9NYjRDdTlFRUdZdU9IWklk?=
 =?utf-8?B?QWxvS0lTUGk3dUVsSkNUYUxlTG5YMWs5bnJ1QW5WNlM4QUpsT1hsdUk4N2g0?=
 =?utf-8?B?bjdBNVlpZFhyajlXaklFOExvOGxFb056RDRqRjVBUTlNN09KaDZNRHBQVW5t?=
 =?utf-8?B?eHg0RHMzek1BRlVSZTFqNDNlNWZzdEh1emJibU5lK29raTI0cWdiV0hyM2ZM?=
 =?utf-8?B?cFI5dytKOHVFcHZSK2FYZXR6MHBObFlxOUdaMGRvMHVpbHVDL3ZTSWl4TGl0?=
 =?utf-8?B?bWF4bFAzMXhBVnpDTlVaMzlGczFkaU5ZU0RUcXNDc0l4N01sRDkwQVhCVDNQ?=
 =?utf-8?B?SXd4Z3MwVk11YUpFS0J0aG5ERFRFYWVqVzNuRTRNemduNXlraGxDMnNqVGgx?=
 =?utf-8?B?bkU1VkVvaEdPSEh0TkJpcTdsR2RWRDRYTWNmd0NwWkE2eWZtWlEwaUd2M1M4?=
 =?utf-8?B?Z2U5Sjl5TWRzaFJTV0dvVk9XeldSdzhpa3p1cUdQNzNQVTBTcmt1dFJvT0ZI?=
 =?utf-8?B?bU1ZUWNydkFMeFNmdlhWdmFMVk5kL05qR3VOMDh3dlhNSVhsejh0ckxWZ3VX?=
 =?utf-8?B?dXlLNGJQSHVoRXZGc1RFSGxRM2l1V0NIZ2JNYUpJMFVFRmFWM0hOZVdhNS9Y?=
 =?utf-8?B?aHpWWXUrMUlodkQzdE9qMzc0eGdjMGo4NFFOR3FZOHg2K0hOSDFiYWhIeHVh?=
 =?utf-8?B?Ty95UThjRittVEI0S2J4OEFqTFdMcWZxQU5OeTZwa1dPa09mcG56SGZ1OFpV?=
 =?utf-8?B?em5kRXNleW4yUGV0OTlrT3BqQ0tRUWplbi9PSXZyZ0JpMHpGT2ZDYzMzMnh2?=
 =?utf-8?B?dGdrbWpWVHhDWEFwQVNrN1lBZDJ5alkzOC9IamtzaHVrcWM3Zjk3SjZ1dktl?=
 =?utf-8?B?a0ZKWDFJcjREQ3RYUy8reTRrdFR0dUZmdHdZL1dFcW1sRlV3S2xoNjJEUnE2?=
 =?utf-8?Q?Fr5/YB4zbzKDw8ncMbOrIThXGqy8/Bio7/H6s?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tbOZI5akiQepvqzzSc8rne4cq+msukWIoF+H6L1o3RfZErGllX+a0utaRK6899Gekr4pF53bzhZ+BNXGzUCNdgpip0vNqH1p7knewfkqWEjDNqR5BKajke8F0I7Cj3F8DJsfZR9rm9jpqsrAuzG4Et9pNAIy572EBk3xlVzBZNLBRqpjwdmSPEwxkWvztyy1u28wX8jx1/dl0mbSiAXM8Clei8ordJ7fE7IKc+yFgGPHrcmJVpHTzhg4H7FfgmwfQcg7+E/VT1FBxQPhTwlaxhmC3qQjaCOdN5LMLp6MzFCxNanhdmiwmkqvxXYuWchkHpwMZpDC/8ZLgUGmGPR8r6ZGiw02OZ6t+SuEFocIFzOKs0sB+iEixgf97gEcSdMByoOpVgaeRwIuOeWnc4rcudlL87d7D7XHhNNK2zJ3XC3JkH3HVuH20q9vup4ujM0vZvu7T4yRvjsV5FMVMXtsbf519TmmovrmJIkx6/rSo2UXl2aN7Gywa5/IqQi0xtmYnK+SqTXU2GlPslUHvQYHj7KcKNckQ3ioHjyuUg0agq1Xk0xsWNAhD9Sij7obJhrLAHn9qh3NM3g7WiIF5I2m5LPoSrXpNEY+TfDae54/QKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b609e2a-78e3-47e1-ce07-08de5dd10982
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:22:32.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZGKVFo+YYJV7htnlot5Xl3ZUUAoeDfOgg/TqZOzlSVYqqiFr7mdLqJCsh2t6Y+dZnizQbaAB1Hi6H7e5k4YVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDE7085185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270149
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0OSBTYWx0ZWRfX2Snzj2+N/rCk
 3452eK2XssLXc3mwl/Ca6uA2RCSCNa7AeS+VvQkZbb+JwknRvuLflUeP3ctR4HEbpoilJqIqqFp
 mGYdvcBVWCWuHIq4WwhDgRwY68Y/Q4Y55qFjPYfI/+CxjLaNSRt9S2J8WYnBo9dPGblmfNRTsb4
 CQfRt2w9URlR+J1sEzfVM1IblMDmWalTzNvlWz0ruphyGZpIKvs48S8XvTTb8cPwYo3FA525L/6
 RSlPbmdKFuHHPzjst7sbWKYzBk9TxvZ6KUSM4g/p6E8SpQiGBaeSyXR/gyoPT2OouiTUvDjBt3a
 TS6HR6ZO1AdgwkxNGajCXyKhzObpIkro0/+llGh1hABZ0Ezg7yV4vYNDUicJHq15ciC/SgIxo92
 fT9KzWmYvFNtK/ndG0R62+fnlyqf9s61mBzzhWW1Sl+Qio4Q49f+yrF2JjWphn8R8ruEG88bxpJ
 rsp+i+yX1QbsGejwtwA==
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=6979026d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=1xVkdAxSaCYjHWcmkeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Ii-NqtrWvMUA:10 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: ZZ2fH_36vmXorDkH43mSTISLujrEHjW1
X-Proofpoint-ORIG-GUID: ZZ2fH_36vmXorDkH43mSTISLujrEHjW1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-10903-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:mid,oracle.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[indu.bhagat@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 595D898F4D
X-Rspamd-Action: no action

On 1/24/26 11:08 AM, Indu wrote:
> On 2026-01-24 4:04 a.m., Sven Joachim wrote:
>> On 2025-09-04 10:14 -0700, Josh Poimboeuf wrote:
>>
>>> On Thu, Sep 04, 2025 at 06:34:04PM +0200, Sebastian Andrzej Siewior 
>>> wrote:
>>>> On 2025-09-04 16:02:42 [+0200], Matthias Klose wrote:
>>>>> [ CCing binutils@sourceware.org ]
>>>>>
>>>>> On 9/4/25 15:18, Sebastian Andrzej Siewior wrote:
>>>>>> Hi,
>>>>>>
>>>>>> gcc in Debian, starting with 15.2.0-2, 14.3.0-6 enables sframe
>>>>>> generation. Unless options like -ffreestanding are passed. Since this
>>>>>> isn't done, there are a few warnings during compile
>>>>>
>>>>> If there are other options when sframe shouldn't be enabled, please 
>>>>> tell.
>>>>
>>>> No, I think this is okay.
>>>>
>>>> …
>>>>>> We could drop the sframe during the final link but this does not 
>>>>>> get rid
>>>>>> of the objtool warnings so we would have to ignore them. But we don't
>>>>>> need it. So what about the following:
>>>>>>
>>>>>> diff --git a/Makefile b/Makefile
>>>>>> --- a/Makefile
>>>>>> +++ b/Makefile
>>>>>> @@ -886,6 +886,8 @@ ifdef CONFIG_CC_IS_GCC
>>>>>>    KBUILD_CFLAGS    += $(call cc-option,--param=allow-store-data- 
>>>>>> races=0)
>>>>>>    KBUILD_CFLAGS    += $(call cc-option,-fno-allow-store-data-races)
>>>>>>    endif
>>>>>> +# No sframe generation for kernel if enabled by default
>>>>>> +KBUILD_CFLAGS    += $(call cc-option,-Xassembler --gsframe=no)
>>>>>>    ifdef CONFIG_READABLE_ASM
>>>>>>    # Disable optimizations that make assembler listings hard to read.
>>>>> This is what I chose for package builds that need disablement of 
>>>>> sframe.
>>>>
>>>> I think this would work for now. Longterm we would have to allow sframe
>>>> creation and keep section if an architecture decides to use it for its
>>>> backtracing. While orc seems fine on x86, there are arm64 patches to 
>>>> use
>>>> for as a stack unwinder.
>>>
>>> This is probably fine, but... how does this interact with other kernel
>>> makefiles enabling sframe?  For example, x86 will soon have a patch to
>>> enable sframe generation for vdso.  And as you mentioned, arm64 will
>>> enable it kernel-wide.
>>>
>>> Removing the objtool !ENDBR warnings would be trivial (and is a good
>>> thing to do regardless).
>>
>> What is the status of sframe support in the kernel?  With current
>> binutils (version 2.45.50.20260119-1) from Debian I could not build
>> Linux 6.18.7:
>>
>> ,----
>> | # LD      arch/x86/boot/compressed/vmlinux
>> |   ld -m elf_x86_64 --no-ld-generated-unwind-info  -pie  --no- 
>> dynamic-linker --orphan-handling=error -z noexecstack --no-warn-rwx- 
>> segments -T arch/x86/boot/compressed/vmlinux.lds arch/x86/boot/ 
>> compressed/kernel_info.o arch/x86/boot/compressed/head_64.o arch/x86/ 
>> boot/compressed/misc.o arch/x86/boot/compressed/string.o arch/x86/ 
>> boot/compressed/cmdline.o arch/x86/boot/compressed/error.o arch/x86/ 
>> boot/compressed/piggy.o arch/x86/boot/compressed/cpuflags.o arch/x86/ 
>> boot/compressed/early_serial_console.o arch/x86/boot/compressed/ 
>> kaslr.o arch/x86/boot/compressed/ident_map_64.o arch/x86/boot/ 
>> compressed/idt_64.o arch/x86/boot/compressed/idt_handlers_64.o arch/ 
>> x86/boot/compressed/pgtable_64.o arch/x86/boot/compressed/acpi.o arch/ 
>> x86/boot/startup/lib.a -o arch/x86/boot/compressed/vmlinux
>> | /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section 
>> `.sframe' from `arch/x86/boot/compressed/kernel_info.o'
>> | /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section 
>> `.sframe' from `arch/x86/boot/compressed/kernel_info.o'
>> | make[6]: *** [arch/x86/boot/compressed/Makefile:116: arch/x86/boot/ 
>> compressed/vmlinux] Error 1
>> | make[5]: *** [arch/x86/boot/Makefile:96: arch/x86/boot/compressed/ 
>> vmlinux] Error 2
>> `----
>>
> 
> Sorry for the breakage.
> 
> There is a patch that needs to make it upstream
> https://sourceware.org/pipermail/binutils/2026-January/147664.html
> (Its a part of a series under review..)
> 
> I will work on getting this patch committed.
> 
> For immediate relief, please use the new ld option --discard-sframe 
> meanwhile.
> 

This was being tracked via 
https://www.sourceware.org/bugzilla/show_bug.cgi?id=33830.

Should be fixed now on Binutils master and 2.46 branch.

Thanks

>> Did not test mainline yet, but "git log --grep=sframe master" does not
>> show anything interesting.
>>
>> Cheers,
>>         Sven
> 
> 


