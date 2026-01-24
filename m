Return-Path: <linux-kbuild+bounces-10857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB89GHAZdWlVAwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10857-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 20:11:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F457E973
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 20:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8EF3013696
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 19:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B992737E3;
	Sat, 24 Jan 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o3pOzAnw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xhxHEaur"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7B221FAC;
	Sat, 24 Jan 2026 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769281885; cv=fail; b=Y0OkzJlq405fmWJSSWc8I1Vd2Fh/+R3Yp8RIPRJaNh4LlkSf33PoKxob8rBiETlMCXkjRZrIMG+BqGvlBSz/dwAn3jrTdSCkRwt+tm1gbEC8fIO3p+8HpU6DeWDwqej7udoA+kiWnErZehaQJqfKOG6ZNtvtGrYkJS27e1Gb8x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769281885; c=relaxed/simple;
	bh=RY7jM1y+VLjmOjp8XXX58vsfx/Gy1Yp7ObgaagqD1pw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R4e2vg/bgSFlOzfGQMorP4KReFkrQfbIJPPqZScjYLlaNvq9p2MVMVWMjQlkjvOICQtJ1Rtv6/PnNV7CKGt0Jcw/mhZ1XSR/RP2RMwcG+T772tovS322Nb3gAMui7aZKGLRpZLgS2nXrfUX6lP1yWLqs97rCoBTLw+0qeLcGp+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o3pOzAnw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xhxHEaur; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OISrwf1274826;
	Sat, 24 Jan 2026 19:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NQoj3rEST3nRFscNQVLThXAEQ84s4iSG092zKIupoMM=; b=
	o3pOzAnwcSp2AGZBYOxn4utIvLgVZZm3WxVDOySSaEG6kfrNZT7GvvrhIlF4k955
	k0mUMeYUIhvPUiKj919kzRxusPH/Je6YwWhGFUKSIvbMQmEPdS1Y5Ar8JVDK+KZ/
	3gfF9j+6/M1iFjbmObv2JZaur8BvaikU0fV89dKt5dJpVi/X9ar8ab3vLE/eHlcX
	b5lUfjyQGjTTyxvSGNfO/63PoLjuuLlVG1gl69GbbUCrEVLsjQ4EtEqkhClplTYR
	moG4V6jCJKbYJXe65Wrek/tcVnmsQYRr5FlZKLwtbKOz/Jr0yaOCjJs7jN/2YsJ7
	CVSrFSa2nxAp5K6ptshNyA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmny0chy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 19:09:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60OIvQ3m035147;
	Sat, 24 Jan 2026 19:09:14 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh6k9h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Jan 2026 19:09:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBS+kasS8bL9Zp0XPVy5vhtkjD28J55Tf1zIMls0+0gg4+SJAGBhzwt7rj9d3J0w0CFFIB2pQjC5EtKAIq/OX1XFKWiX1Uz6CPw9g9yBX6CNOGkUqL+4afasyA1vQiEGJM4+iHxj1p6l1B7MBLeDZV0412eUfiqaagTbqebGB5TftdSqbVJIYa9IdC5vS2spGWxm3tKaVc5twePORFZjY67AsV6bcb/Flz6wHJ3RrAZeeL+QDy+AZxgTg8S+2dP29yLPemz5ndOoAPiUD58NstFiLnrepviWwm0UOBGh4KmoUpbjFEBGbwZ/+qGKz+GufuF1zr6VILLBTfu1McDB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQoj3rEST3nRFscNQVLThXAEQ84s4iSG092zKIupoMM=;
 b=Zy2PmiX//VgPMPS4+l2rhP7zQ3Ofm+5k0ifI2lCaub9qswt4ybWEUio9J06uJJ0XfWLIYoUFqbEu31ORmG8Jj4pUvEgbJQwStnQphxTTh5+IA4kwsNYpztnrphHbVJBvkYE3FCKqswzyieNUBX6YuqyebDM5TnffauSYzzSb5VOScLapoI31oNjSynm271go+w5cheU0DJH7/PCC1jVMlZLw9w+YtNLb7uAQJxH/yClIKsw6eEtgaVEeDTXk/H3q5Vj5P/7Bwk8Qf0NN6QxyR1nS1R36l0Qjjm0ZHUv2UCkF3uGhSgRf2Pa8f4/WveymHROd3CwTLd/goc2flKF1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQoj3rEST3nRFscNQVLThXAEQ84s4iSG092zKIupoMM=;
 b=xhxHEauru0/Td3MtvGwcntQ+oOIJaWgtwaQcSsLXQpUcTY/c0MTg9sX2miIZQ4OxYVFn4DJabIkD/INub8s44qeguSJhlj4o2jeQhMk8FNTI9ey2hDhgpCMfC8lHPgsPtZm6ePXkvAk5Y4rRpEZxzoEI8JqvNCjEMmvFMX7IzlQ=
Received: from SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12)
 by CY8PR10MB7241.namprd10.prod.outlook.com (2603:10b6:930:72::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 19:09:11 +0000
Received: from SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1]) by SA1PR10MB6365.namprd10.prod.outlook.com
 ([fe80::e842:361f:d030:1ec1%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 19:09:11 +0000
Message-ID: <4f62add4-85af-46c2-ac33-d68368c5bdb6@oracle.com>
Date: Sat, 24 Jan 2026 11:08:59 -0800
User-Agent: Mozilla Thunderbird
From: Indu <indu.bhagat@oracle.com>
Subject: Re: [RFC] Don't create sframes during build
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
Content-Language: en-US
In-Reply-To: <87343vdxnb.fsf@turtle.gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To SA1PR10MB6365.namprd10.prod.outlook.com
 (2603:10b6:806:255::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6365:EE_|CY8PR10MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a55c345-e98d-4b51-cdd2-08de5b7c0eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUNTWTdzNmVjNDdhTG9HOWZ3MEl6d241bCtGMFB1UjVZVEVwdTVOV0RLQ1Jh?=
 =?utf-8?B?a0RmSVkxUm91Ry9rYTdvbE1oMC9TampONHV1d040aTlNSUl3RWMvV210NUNP?=
 =?utf-8?B?cW1EWEFlVE9JOWx5TWV6azFQRndRTkJxaDl6QlV0MDkrWjM5TTdZeXdKUU9K?=
 =?utf-8?B?UE85MDVzVytwN0l2SnhyVGFsZVFtV0hTVkFEVUhGN3dkMnhSMkIyZmg5QkZu?=
 =?utf-8?B?NHR6Q2RTMFNKSVM1ZzM3eGM1K3E0VEZjNFkwOXZTSk9wcmwwbXBTRkJYK1Fl?=
 =?utf-8?B?M3ROMXhMckxyTXNpUC8zemQyaHBwT1lnYTRUaldqMUkvMTNRRXJIbUJTUUVx?=
 =?utf-8?B?ZmppRHcwK3ZXZ2szRm1qYStmamFBR1BtSG9OekErTXBvWHNxNjBvZWpJUlBT?=
 =?utf-8?B?Z0NMWVB2VEdSem9Dd0t0aGIyWUo3VnBlWUN1R3JkUXRQUnYreUxQWE9QbXM3?=
 =?utf-8?B?WkdPNzFQUm51RHlraDF4eFhxZTgvT2xTRjFjbUJRK3VaK3RXNEdFei93QnR4?=
 =?utf-8?B?WE9RSWdSNXFMWXZmbzI0TFMzRThqQnJ5TE5hazhwb01HTkphbEVNQ2dEWEl5?=
 =?utf-8?B?NXEwWGZ5ekZTUy9mVVduWFphQW1UY05xeGJleHVPM2dSQWRBWUFzZnJ2MFlD?=
 =?utf-8?B?bUxSd0hmK2RUOHJDVzVod1REaCtRRExrL1hrd1ZHZVgxTjYrTmJRd0dRcFU4?=
 =?utf-8?B?YmpxZEtVWVQ5YmNQSmRPcGtPUDBkWWRwamEzdzJqQ1lEaStyRjlYMEV2aS9z?=
 =?utf-8?B?d3gvMExjWnBGRCtOajYzYVR3U3BrTnhueFF2Qzh1TzlMVG02bEZ4UjRTL0J0?=
 =?utf-8?B?RnFRY0ZzUUNseHgwTWN3NXdkTG13Tmx4dmZOTkZGSXBiTmdnZVUwMG8vMlZE?=
 =?utf-8?B?NUxDK05haElOa210ZS9PNFFCQ3FiR0l5OEg2VUp3ZmhRbDdMMUhKeHlIR3Bm?=
 =?utf-8?B?Um9kNEw4a0dBY0tybU9nc3dHcWZkZGRzV29qU2hzOUlqQW5td3MwNFUyb1JD?=
 =?utf-8?B?WEFuRE12WlRTZElWS3VKWkMwVUVQOXd4OHBFV1pSK2VPaHNRTG1pZ01KUXFR?=
 =?utf-8?B?bWRwQjBtdTdlMTQzeXBnaWdqMmJsRXVmSkUxdDlqc3VMcm0zUXNNREJSL3pO?=
 =?utf-8?B?ODBtUHBwSW1uOE5VSmY3WnRSOW14SmhkRDhGMHlwbFVqSDh3RFUxc3FYbTFY?=
 =?utf-8?B?aFdYaUpGTFFiOHFBeXdoeTlIRzhWSG1xaXMvV1ZUbEdPczFvRmE4Zzg2VTQx?=
 =?utf-8?B?dm5WUmdhY0tiNkpEd3V2Z3JtdjhqRE5ZK3lPcmhXVlBOdHJ0VTI2dk9vS09X?=
 =?utf-8?B?OStMTkRZTE5WaUR2VTlKZmN2Q1YvQzNMYnMyQmNXKzdBUTgzejg1RTVpK0ta?=
 =?utf-8?B?NzNNVnNhUGJ1N1A1eEVFaTRNSDNHdmtrTzVqRVpwWEJ2NDVPVUFLTmgydmJ1?=
 =?utf-8?B?RjI1Yys1OGdtRzIybDlJOG9qSXgxQzZkYWxqaTAvVUZjVm1IRjNtSENoYng0?=
 =?utf-8?B?TW02N2lsbXBnMXliWXUwKzFVbTVHcExtTnpXUHYxYjdicHVTWi9zanNHTHIz?=
 =?utf-8?B?MjU0eEdSU0dlcmdQVU5Fb1J5RHlPbnBBZUZDN1JDVlFNYXI1em4wWUhscTd4?=
 =?utf-8?B?eDNqY29YRmVOeC9xc3dQSVVNNHNnQmlpelE1TEVTV0dVcE9QRHFuOFowd2dD?=
 =?utf-8?B?UkF3UnJjeFJpK0FPRS9XSHhBc21CbzZFRnJGY2s1SzNsWUtHWVZPQ0tSZ3NB?=
 =?utf-8?B?NExVRlVKdU9Yc0FnQjlqZmd2Zkg0WG1ySXJjRWxXY2hOSlN6RGdIai9JMkRK?=
 =?utf-8?B?T2JmL2JwSHhDTStMZDNsK2g1TmM1d0NhTThqdmdkRzNiTmhCQ2RBNnI5MGRT?=
 =?utf-8?B?YXpRZVFoeEZjNzkwaXdnZWFjT2dNclNHZXYyMGZiNmVwbE1QNllPYTRpZnBr?=
 =?utf-8?B?a1pvOXpCcFpNUVlwSzc0MlVzS0M2RVd6YkJsUTZGNXJ2TlhSK3hranlFaDVu?=
 =?utf-8?B?WDJNSFY3YkdObDJLdzMwbE5aVmZmOGJoYmRwNy8rVnlPL2RacktXMnZQSktY?=
 =?utf-8?B?MkRuMUw2djFlcFJ1ekNNZWcvekc2SlVkemx5cVJkSkZXNFovVElKdVV1emFu?=
 =?utf-8?Q?86VcZK/GC/mGQ882wCRh76LE6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm9pV3BNakRaRElFS1ZpMmQrcGVxTVQwZmF0R0xiK0dFUGVUT0pmb0pXbkhs?=
 =?utf-8?B?cDgxYk1mbzhGN2xPZEhuaWdaZlJLWGxpci9kbW5kRHhJWFRwNjZiMWFNTm54?=
 =?utf-8?B?aE1nOHV6R2FpNjZOTnVTVi9RTVJ1bDAvZnJ4UGdDeHlHN282Mys5bE5Sa01H?=
 =?utf-8?B?Rk1SM0pkWkJjZ1B2aFE5aWc2OVBWODN0bjVsVGpJZGF6SzMrMDhLREtqbzJX?=
 =?utf-8?B?SzFHZWR3Z0p1VEt6Sng0N0p3WjNPaUhpUFlYTnBMa3BTSDN6WVg2QWFvNmtt?=
 =?utf-8?B?OXd0Rnd3MDR0VUVRVSthY3B3K3RHb1EvOHR6NWE2dUhyeWRuVmRuWTJrYzNm?=
 =?utf-8?B?VW1PRXI3czNqVS81UXB6ZCtCN3pJekVoaVpPb0hpUWxwTEFhUERNZkZ6Wnp1?=
 =?utf-8?B?bC9rN29kZEFpRTI3WldlZWNuczdUYTdsdm5RRytZbnp1eWcxV3FQZjFCTEJj?=
 =?utf-8?B?dHZab1FGenlLUm43TFNydFBtbFBsV2I0YTF4RnhvUXlRZjlvN3phTWFvb1FU?=
 =?utf-8?B?dVBOeWMyNHNqQ1UzNHRXb2RoY0Q4ZVVZdHdaUkV2N0FCdEZsTHlqaXNZY3ZR?=
 =?utf-8?B?cUMyQU5DNTBubDhjWDhxWkpWak9tdnpxeWxvcEtUMHp3Ti9qSHdFM1VkVnZn?=
 =?utf-8?B?OTdJbCswTG40Z1g0VDM3cHFuOFZlNjZpV05rbFhlS2JiRGpsNlV2V0VuQ0tN?=
 =?utf-8?B?d0NYQitHd09xTkp0OXV6V082ZmVOVFlYaTlMa2grWTl0YnhpN3kwMW85LzNs?=
 =?utf-8?B?SFRURkVocWRDZzlQS2NwaXBkZTdBakw4NkxKWis5N3cwaDNxaVVwR0RQVW1Y?=
 =?utf-8?B?OXZudE9FblRjNUJTN2s0bXNlKzFaUDhLa09nQ0NCMEcvM3AxZU51YW1jaXdB?=
 =?utf-8?B?NnU0eC9zRGFWckNVMFZRYmM0TWd3ZUNqTm9Jc2Uxc1ZNUFN3S2lDRVZNc0Qx?=
 =?utf-8?B?bCtvaUFqanNJQyt5aGhCNFpta2RWVXhvaHhuZnJJNkI4Y1B5c0lpQ2h1eDhD?=
 =?utf-8?B?V2tEQWRBSCtqbm1VeEp5UnFic3JVQzBHNGljRHpGa3QzZ0VMLy9lSXV4UkJ0?=
 =?utf-8?B?aUJNUUpqbWJ6ajI4Rk1wVWhRN0ZGOFhkYmE3dXdVRFpsVlg0Q3lOd0oxcVBG?=
 =?utf-8?B?Y3Noa2o1cEdId1l0OWdjU0Z6RmZpMWhXZi9ybnBlRHhyT1VQREROTjYvaUZD?=
 =?utf-8?B?SEpVSnYrdFJkYWxoYWlsUzVIelNHTStnbGJXVElGcXB4ZGU2dndGaXdaSmxI?=
 =?utf-8?B?OW9ocUVzS0FmWDRoM0pBSmZEa0NtRDNsaHRrM0dpS3pYWFdDeFFHeGlRdGVw?=
 =?utf-8?B?N0tkNituMlVxSmkyNXYxcjBMd2pXVWUxTHZKd2pxa3ByT3g0T2JpVmJoSnBx?=
 =?utf-8?B?WEVuRjZnd2ZYTUJlZXNhVEUwd2JSaEJDVmc2ZC8zY055L2h6S3luTWUvTHla?=
 =?utf-8?B?SDM3MHFRSGNmdU9QbmF2ZVQwdTUyOCtFb2pNMy9KS2lBMFpwamFLTUZFSW1a?=
 =?utf-8?B?L0ZrMGRqK2Vaay9jVCt3c1M0aVNNUW0vRzRneXQzWlNNUS9iSHVxWEpZZDFG?=
 =?utf-8?B?NThXVXJSL29VejlzNnIyTExTelVWNWJGRUhsNzN1Q01BOXpxNkRZbVhwdjQ5?=
 =?utf-8?B?RGRCblZlZnhnNmZyaXhGd0E0RDRLNUV0NmNMSXVWWjR5NUhMTHArNUwxcEEv?=
 =?utf-8?B?eTRBQUhrTjVDcmJJQllkc3hlUXRucmhFamlGYUVRREYwUit5QmdIMVRPdk5D?=
 =?utf-8?B?cnpXQzlDSGtBR2d5QVBWY0VBMG10U0NxeTUrWkJuVGdMQWhoT2pHUnVwVGla?=
 =?utf-8?B?NFZYdVRkT2dpVmh0VGQ4UGJWM3ZWd2xOK0pQUVFOYVpCTVZBMjQzb0MrM2dG?=
 =?utf-8?B?S1BQKzRTZ21KVWtzZDNtbFhUYit5QVAzT1VuWnV4Um5aSmtHeDJleE4rNXpJ?=
 =?utf-8?B?LzVRUDhRdHIzNHJDTVNHZklSZUNOTlYyY1FGdHoycWJBQVE4bjFKSTcwTlVp?=
 =?utf-8?B?R09GRS9ZeThwUmFQQjNmaVIzWEJqMUp2N0tTWm1pbUJhWXRuRk9JRG9OMEZS?=
 =?utf-8?B?K0ZlNzI5Y0VyMmloZTZqS3V5WHZSUzEweHE5QkdsRVVwOGh4RzhpQzdJWDN6?=
 =?utf-8?B?U0VweDdzR3FGaGRvQzFMd2lXNGdhN1lPVkJUbUt1dDlKY3k3bGRkbHdWZ3RT?=
 =?utf-8?B?TWVVWkQraCtwaDJvU3ZtTjdENkdVMW9BQ0d2UDlVY2RpeGVYS1gvV1pCczhQ?=
 =?utf-8?B?cVdsdHp5cGYva3NhUnpSejV1azdMOVJVWi9iQ1VadkUyK25SMTVvOXdib1h6?=
 =?utf-8?B?eUhORDc3c0cxaGIxbmsvTXpwaUtZQlViMUVXSkIweWZGSlZ4Qk5iOVhUMndw?=
 =?utf-8?Q?ddlmvDPEmD0TY/iwma72iNZvjOp3bjOf3/+nl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CDFOJLrOEQjRhLueXCZk7JwKfD/N9dnHuC0AdsEriWxV1/sN1pwiOmG9p8WaQsqhoHaWfQmxwacyRMFo2GCehrtbcLQH9gGm+zSvW2GyOfYgPCG0XZS8wXb0h0xJPrVuCRdUpWhfzi3PhKSKzqAZT+cMeoGOjTriDSFBv/Xso6G4+gMF0d9+8+zX3t6A97SFlhBuGLdKxHG+05FoEcMXIdraxZnV7Eoqv7611P8aWGW7aRI5pdWn1GTwqqXF67HsbVDeUwbBCL6BFvMOFMSbUZ1fSvZFSB9Ku7/XHCBE7y2wyxPKC2/HS1DGHXVzuDOvx7UX2Y7cV9I9LcFbEM5sZuImdF3Vht9i+fQ6BKztaNgYzrIGEf/F/OfkKo+zVLaqQnlP4uflqV8febU4MeyBVweqxnAZsAPHOC7B7mo6cLjwyGBr99LLo0gCSUnJTzjhItxJWhDjoKsT7svfFfECaFdjsg/xEpF+hYiLqEkdXZ5AI7X85/31+YlNLJmxld7G0NoCG4PDxbx0BnGeuof47SWYnAF0hlwTxDQMDTVP6S30Ah3Nd//m6vla/vMvr3dHwlfEM4OCQscDawxHav+QBd2GGs4jYSmUyTyk+f1jUqY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a55c345-e98d-4b51-cdd2-08de5b7c0eb4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 19:09:11.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyRIHHg9nsQXQkgnPzvMKrhBVnJ/GswkU6m1MnPmzmWuIjZf/QQBg138KwBr9A6aqq5uWgQVKv3wyKOYTyrqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7241
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601240155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE1NSBTYWx0ZWRfXzeNuvFPQMEEm
 lfdG2OcaLUXRzI1udnb13FB6j4e5liTgBnFf+8RxP7/IXqOxBTF++CPgzBntcJ+j+Dz2chDyKtD
 vTZ8XO1ke9OLdlj91OXxAY9pTpHYxDfG8Czm/uktrl0PdQMv0kU1TZ8apmS+lUhvdmktXbDwHdy
 rtKsHqyxa8SdzRJnCgbxHIz62tzKIBvvf6rxCPVPTqXPpXO31xJ+a+oYNgoI2aJrynD6v3Gzl29
 Fvpso6ZJKogS4tEwCs0sqkoX9hxO5nLqQhTDeugZhO5W57THr2LEip+dZm/PIYyyIrEsmM2uHwt
 2Z5FVo5ijKbHuSaPqu7L1/48hpw+hqY0riEp0ClVopQIn3pTfB0BXj/5eXaI5iHtfhXS+mm6Tv3
 DMkLQe/HJLtBJS/dghiVG+nO5YumJ+F5ZLu1FUoSJ4htEMhfNvHCYohVjtCq2/7R986AxDy0odf
 iahcu07d8QgM9/LIesQ==
X-Proofpoint-GUID: mSWjlFLmZQJjhmMb7U4voIMHVTK9GKeE
X-Authority-Analysis: v=2.4 cv=cZrfb3DM c=1 sm=1 tr=0 ts=697518db b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=WtIS7l30hXfG0V4ENkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Ii-NqtrWvMUA:10 a=EBa_rOYxF3VBboPlVeQ_:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: mSWjlFLmZQJjhmMb7U4voIMHVTK9GKeE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-10857-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:mid,oracle.com:dkim,oracle.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[indu.bhagat@oracle.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B8F457E973
X-Rspamd-Action: no action

On 2026-01-24 4:04 a.m., Sven Joachim wrote:
> On 2025-09-04 10:14 -0700, Josh Poimboeuf wrote:
> 
>> On Thu, Sep 04, 2025 at 06:34:04PM +0200, Sebastian Andrzej Siewior wrote:
>>> On 2025-09-04 16:02:42 [+0200], Matthias Klose wrote:
>>>> [ CCing binutils@sourceware.org ]
>>>>
>>>> On 9/4/25 15:18, Sebastian Andrzej Siewior wrote:
>>>>> Hi,
>>>>>
>>>>> gcc in Debian, starting with 15.2.0-2, 14.3.0-6 enables sframe
>>>>> generation. Unless options like -ffreestanding are passed. Since this
>>>>> isn't done, there are a few warnings during compile
>>>>
>>>> If there are other options when sframe shouldn't be enabled, please tell.
>>>
>>> No, I think this is okay.
>>>
>>> …
>>>>> We could drop the sframe during the final link but this does not get rid
>>>>> of the objtool warnings so we would have to ignore them. But we don't
>>>>> need it. So what about the following:
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -886,6 +886,8 @@ ifdef CONFIG_CC_IS_GCC
>>>>>    KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
>>>>>    KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
>>>>>    endif
>>>>> +# No sframe generation for kernel if enabled by default
>>>>> +KBUILD_CFLAGS	+= $(call cc-option,-Xassembler --gsframe=no)
>>>>>    ifdef CONFIG_READABLE_ASM
>>>>>    # Disable optimizations that make assembler listings hard to read.
>>>> This is what I chose for package builds that need disablement of sframe.
>>>
>>> I think this would work for now. Longterm we would have to allow sframe
>>> creation and keep section if an architecture decides to use it for its
>>> backtracing. While orc seems fine on x86, there are arm64 patches to use
>>> for as a stack unwinder.
>>
>> This is probably fine, but... how does this interact with other kernel
>> makefiles enabling sframe?  For example, x86 will soon have a patch to
>> enable sframe generation for vdso.  And as you mentioned, arm64 will
>> enable it kernel-wide.
>>
>> Removing the objtool !ENDBR warnings would be trivial (and is a good
>> thing to do regardless).
> 
> What is the status of sframe support in the kernel?  With current
> binutils (version 2.45.50.20260119-1) from Debian I could not build
> Linux 6.18.7:
> 
> ,----
> | # LD      arch/x86/boot/compressed/vmlinux
> |   ld -m elf_x86_64 --no-ld-generated-unwind-info  -pie  --no-dynamic-linker --orphan-handling=error -z noexecstack --no-warn-rwx-segments -T arch/x86/boot/compressed/vmlinux.lds arch/x86/boot/compressed/kernel_info.o arch/x86/boot/compressed/head_64.o arch/x86/boot/compressed/misc.o arch/x86/boot/compressed/string.o arch/x86/boot/compressed/cmdline.o arch/x86/boot/compressed/error.o arch/x86/boot/compressed/piggy.o arch/x86/boot/compressed/cpuflags.o arch/x86/boot/compressed/early_serial_console.o arch/x86/boot/compressed/kaslr.o arch/x86/boot/compressed/ident_map_64.o arch/x86/boot/compressed/idt_64.o arch/x86/boot/compressed/idt_handlers_64.o arch/x86/boot/compressed/pgtable_64.o arch/x86/boot/compressed/acpi.o arch/x86/boot/startup/lib.a -o arch/x86/boot/compressed/vmlinux
> | /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe' from `arch/x86/boot/compressed/kernel_info.o'
> | /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe' from `arch/x86/boot/compressed/kernel_info.o'
> | make[6]: *** [arch/x86/boot/compressed/Makefile:116: arch/x86/boot/compressed/vmlinux] Error 1
> | make[5]: *** [arch/x86/boot/Makefile:96: arch/x86/boot/compressed/vmlinux] Error 2
> `----
> 

Sorry for the breakage.

There is a patch that needs to make it upstream
https://sourceware.org/pipermail/binutils/2026-January/147664.html
(Its a part of a series under review..)

I will work on getting this patch committed.

For immediate relief, please use the new ld option --discard-sframe 
meanwhile.

> Did not test mainline yet, but "git log --grep=sframe master" does not
> show anything interesting.
> 
> Cheers,
>         Sven



