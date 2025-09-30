Return-Path: <linux-kbuild+bounces-8987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00337BABA91
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 08:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A22B166EB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 06:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621CE27F01D;
	Tue, 30 Sep 2025 06:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mKH2xl/C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W6kA6LYo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79C2581;
	Tue, 30 Sep 2025 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759213572; cv=fail; b=FlSfplTAYWGwKw+Lxra37sWWR1In0pK/GFHNow6nvQw8gvvbSp9O9R8cpxkPm33zOhCnZ2roSIrvz0YHVNgP05GPaKCudEjhw6VC3arH8/rapZSjdo24QifbCbVxVRv9BYdCh/RxVpx8nweOgqy+weyNgF+kiqqOHaxHA+Jhk9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759213572; c=relaxed/simple;
	bh=vcXFZeZlIvLs/daMsMjdSx752Os0Cv0Y7eJ6xMGwNfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WqPLY7aY7IOT1dVn0zWM4COp4077PuDO6ZRKy+B9UAVYM4aS8f79WPKGiqiZxUky5c1m63BJZS/yMKGY0IGANxGCNtdd8XJbMNTU6HKgw0doWrx0rqpoiQa51Maxfb9MNlVKCqyNF8gjfS7RDw7gGZAIXt2Q7/PfL3tD4J12m2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mKH2xl/C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W6kA6LYo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U5JTsG031718;
	Tue, 30 Sep 2025 06:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dIlBg8LbiMYXYmHv0Bs0TgStRgdnLUnHgwibPTevrDo=; b=
	mKH2xl/CkanL/ZxUbs0nc4TMTZKO4DkiimRiJdiU11IvUUiJ5xUM8daFd36oGNDS
	j+04ggfCk5vTfo7OmexGvrGhmtw5wbaNhwaVqa4kS1TLWvDuX9mXt8mPzn50cWTz
	UU1Y4VFKDChy55YYf3NYS9q0XJd7Fxhux/JVfKz0kjb3MFGqNSYrq2d98tBy5c7u
	MZgd1te5KcA9e4/Q6Q80LW2ewh1YP7haUqmaU8nDjb4nMircbq4c6Ch0F+jS5D+f
	lpNa20ckwaXEc/64yrKtbW0sa9l1qzr7p1qA0bGK8zR1i6oDYrrEDRdWd64NFH/R
	qGPzcG2vfJOok7fm4VwHhw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49g8y302hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Sep 2025 06:25:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4SNrH001926;
	Tue, 30 Sep 2025 06:25:14 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6cdwc1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Sep 2025 06:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoBLqnZS50Mg3KtZNKdQ+pNvfRTkAP9AKsz2iOzxETaizST2GPIxlguIc8k7Pel61CSmMi0CHld0dy4qCdv73h0QXsCSTp+caKfCeZeQMJi2Sn0Ie4erwunJKCjAtM/y4IQOy7jpFQO1nYumPKjBNpvvnTAYolNyCsacww8GgrE6g221DtOqcXBNpl6p2HjhKqGgW+kHGEJMX8hgh19mOUmpT3QLGaAoHlAu6smR3+ezGI+7a2PyBscldBV5dRa8QbxUFy3VPhj3rV7YHZCZXdZ9QAPWxdAINH+AoqWwbKWN8tDTGu1u7/CWgkRLocxQM8QXuM8T5WZR3zSc0damIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIlBg8LbiMYXYmHv0Bs0TgStRgdnLUnHgwibPTevrDo=;
 b=U3EuaFR3vYulTiq/Fd7zcpoUpVna0M/zbCoepLoWsM5OW1fe9WR93L0y77NEV5Trl9d8f3y7zbJduBumv2fzwUkXlpAYCqWTSJzRuIiPvqGZTP4WcyNpU1WOull66Jb06C80OSj5SmI1TqSdtWFBE6cOY1HQiRAXv+kcX2bYPkUmqVGQdmgKxrpfW6Vv0XRqeOVDp6RB4a/nL48p7kshKnun+U/zlfCXuXMbc68DYnQ4M321YGKOz3IXbkh4SuOJbOqnpwvavEvu+PlQHlXP2TosLorh4er+dGBXGT9uNCPhXPKiUqEKeXcgo/3+5/ASCG9sCFRf4/HDy8jeu1EcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIlBg8LbiMYXYmHv0Bs0TgStRgdnLUnHgwibPTevrDo=;
 b=W6kA6LYo9Gxhai1oIM4OtrQe90nMk2HmvReT42s23BoU88bBtkU2kQEieAMlaXNt8eayDfV21WzRcWjlbxh+WP57AfjMdUQVJ/lKMZskF6l3x7lVNDWSnzbcEuSCm2Bs1k+DI3cxrVVbQQT/ghKHo3uH2DLjP0MfrP7qKqQrgmM=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CY8PR10MB6876.namprd10.prod.outlook.com (2603:10b6:930:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:25:11 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 06:25:11 +0000
Message-ID: <f2556f4c-9036-4b79-a4b0-4e4c82a93abc@oracle.com>
Date: Tue, 30 Sep 2025 08:25:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: Avoid prompting for transitional symbols
To: Kees Cook <kees@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Petr Vorel <pvorel@suse.cz>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250930045300.work.375-kees@kernel.org>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 xsFNBE4DTU8BEADTtNncvO6rZdvTSILZHHhUnJr9Vd7N/MSx8U9z0UkAtrcgP6HPsVdsvHeU
 C6IW7L629z7CSffCXNeF8xBYnGFhCh9L9fyX/nZ2gVw/0cVDCVMwVgeXo3m8AR1iSFYvO9vC
 Rcd1fN2y+vGsJaD4JoxhKBygUtPWqUKks88NYvqyIMKgIVNQ964Qh7M+qDGY+e/BaId1OK2Z
 92jfTNE7EaIhJfHX8hW1yJKXWS54qBMqBstgLHPx8rv8AmRunsehso5nKxjtlYa/Zw5J1Uyw
 tSl+e3g/8bmCj+9+7Gj2swFlmZQwBVpVVrAR38jjEnjbKe9dQZ7c8mHHSFDflcAJlqRB2RT1
 2JA3iX/XZ0AmcOvrk62S7B4I00+kOiY6fAERPptrA19n452Non7PD5VTe2iKsOIARIkf7LvD
 q2bjzB3r41A8twtB7DUEH8Db5tbiztwy2TGLD9ga+aJJwGdy9kR5kRORNLWvqMM6Bfe9+qbw
 cJ1NXTM1RFsgCgq7U6BMEXZNcsSg9Hbs6fqDPbbZXXxn7iA4TmOhyAqgY5KCa0wm68GxMhyG
 5Q5dWfwX42/U/Zx5foyiORvEFxDBWNWc6iP1h+w8wDiiEO/UM7eH06bxRaxoMEYmcYNeEjk6
 U6qnvjUiK8A35zDOoK67t9QD35aWlNBNQ2becGk9i8fuNJKqNQARAQABzShWZWdhcmQgTm9z
 c3VtIDx2ZWdhcmQubm9zc3VtQG9yYWNsZS5jb20+wsF4BBMBAgAiBQJX+8E+AhsDBgsJCAcD
 AgYVCAIJCgsEFgIDAQIeAQIXgAAKCRALzvTY/pi6WOTDD/46kJZT/yJsYVT44e+MWvWXnzi9
 G7Tcqo1yNS5guN0d49B8ei9VvRzYpRsziaj1nAQJ8bgGJeXjNsMLMOZgx4b5OTsn8t2zIm2h
 midgIE8b3nS73uNs+9E1ktJPnHClGtTECEIIwQibpdCPYCS3lpmoAagezfcnkOqtTdgSvBg9
 FxrxKpAclgoQFTKpUoI121tvYBHmaW9K5mBM3Ty16t7IPghnndgxab+liUUZQY0TZqDG8PPW
 SuRpiVJ9buszWQvm1MUJB/MNtj1rWHivsc1Xu559PYShvJiqJF1+NCNVUx3hfXEm3evTZ9Fm
 TQJBNaeROqCToGJHjdbOdtxeSdMhaiExuSnxghqcWN+76JNXAQLlVvYhHjQwzr4me4Efo1AN
 jinz1STmmeeAMYBfHPmBNjbyNMmYBH4ETbK9XKmtkLlEPuwTXu++7zKECgsgJJJ+kvAM1OOP
 VSOKCFouq1NiuJTDwIXQf/zc1ZB8ILoY/WljE+TO/ZNmRCZl8uj03FTUzLYhR7iWdyfG5gJ/
 UfNDs/LBk596rEAtlwn0qlFUmj01B1MVeevV8JJ711S1jiRrPCXg90P3wmUUQzO0apfk1Np6
 jZVlvsnbdK/1QZaYo1kdDPEVG+TQKOgdj4wbLMBV0rh82SYM1nc6YinoXWS3EuEfRLYTf8ad
 hbkmGzrwcc7BTQROA01PARAA5+ySdsvX2RzUF6aBwtohoGYV6m2P77wn4u9uNDMD9vfcqZxj
 y9QBMKGVADLY/zoL3TJx8CYS71YNz2AsFysTdfJjNgruZW7+j2ODTrHVTNWNSpMt5yRVW426
 vN12gYjqK95c5uKNWGreP9W99T7Tj8yJe2CcoXYb6kO8hGvAHFlSYpJe+Plph5oD9llnYWpO
 XOzzuICFi4jfm0I0lvneQGd2aPK47JGHWewHn1Xk9/IwZW2InPYZat0kLlSDdiQmy/1Kv1UL
 PfzSjc9lkZqUJEXunpE0Mdp8LqowlL3rmgdoi1u4MNXurqWwPTXf1MSH537exgjqMp6tddfw
 cLAIcReIrKnN9g1+rdHfAUiHJYhEVbJACQSy9a4Z+CzUgb4RcwOQznGuzDXxnuTSuwMRxvyz
 XpDvuZazsAqB4e4p/m+42hAjE5lKBfE/p/WWewNzRRxRKvscoLcWCLg1qZ6N1pNJAh7BQdDK
 pvLaUv6zQkrlsvK2bicGXqzPVhjwX+rTghSuG3Sbsn2XdzABROgHd7ImsqzV6QQGw7eIlTD2
 MT2b9gf0f76TaTgi0kZlLpQiAGVgjNhU2Aq3xIqOFTuiGnIQN0LV9/g6KqklzOGMBYf80Pgs
 kiObHTTzSvPIT+JcdIjPcKj2+HCbgbhmrYLtGJW8Bqp/I8w2aj2nVBa7l7UAEQEAAcLBXwQY
 AQIACQUCTgNNTwIbDAAKCRALzvTY/pi6WEWzD/4rWDeWc3P0DfOv23vWgx1qboMuFLxetair
 Utae7i60PQFIVj44xG997aMjohdxxzO9oBCTxUekn31aXzTBpUbRhStq78d1hQA5Rk7nJRS6
 Nl6UtIcuLTE6Zznrq3QdQHtqwQCm1OM2F5w0ezOxbhHgt9WTrjJHact4AsN/8Aa2jmxJYrup
 aKmHqPxCVwxrrSTnx8ljisPaZWdzLQF5qmgmAqIRvX57xAuCu8O15XyZ054u73dIEYb2MBBl
 aUYwDv/4So2e2MEUymx7BF8rKDJ1LvwxKYT+X1gSdeiSambCzuEZ3SQWsVv3gn5TTCn3fHDt
 KTUL3zejji3s2V/gBXoHX7NnTNx6ZDP7It259tvWXKlUDd+spxUCF4i5fbkoQ9A0PNCwe01i
 N71y5pRS0WlFS06cvPs9lZbkAj4lDFgnOVQwmg6Smqi8gjD8rjP0GWKY24tDqd6sptX5cTDH
 pcH+LjiY61m43d8Rx+tqiUGJNUfXE/sEB+nkpL1PFWzdI1XZp4tlG6R7T9VLLf01SfeA2wgo
 9BLDRko6MK5UxPwoYDHpYiyzzAdO24dlfTphNxNcDfspLCgOW1IQ3kGoTghU7CwDtV44x4rA
 jtz7znL1XTlXp6YJQ/FWWIJfsyFvr01kTmv+/QpnAG5/iLJ+0upU1blkWmVwaEo82BU6MrS2 8A==
In-Reply-To: <20250930045300.work.375-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0103.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::11) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|CY8PR10MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 211a8723-c7cf-4c91-558a-08ddffea1b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckhlTXBCNGNSazVMWmtPaDEyVGNNWm1IZVdPMlk0MmJTUmRMdGQ0R1VQUENC?=
 =?utf-8?B?YU1CSmx5OS9JMTdGS2ZQR2V4QldBUVRYbjRSU29XZzhUMG45MmdocjJFUzlW?=
 =?utf-8?B?N2p4dFlqalhVY0lxWTU1aWlZeC82d0V6MVZNdkc3enNJa3JVbHRyK09lbS9G?=
 =?utf-8?B?STl0UjZHSzdmRGVnUEdQVVIzc2hNK0xEMTFLelZKY2F5RVc3L3JUQ0QyU204?=
 =?utf-8?B?WGU1MUlJQVhmOXJ3WDh6Z1Q2TFdoRkowaDJLN3dLdTBLY3ExRU5QbFdESmhF?=
 =?utf-8?B?RHdUcE9tdTZvL1NOQTF4V0JOS1lJQ2RjbGk5Zk5uS0xBUUhUeUVibHdqQlFk?=
 =?utf-8?B?K0YzRHR0cFZQWGJEZkxtNHZ4aGNSaDdhL05RWXpPY1NtMzZHT0NINUdhU01V?=
 =?utf-8?B?Z3ZHV2E5MTB1aXhvY1pkdGl3Q21hd1AwUzBIRVNIQXJGdkNBdVJUSk1WZVlO?=
 =?utf-8?B?RkR4ZDcrdDUzZ09DRGpHZDVPa0RzaWJEdmRXM21xWXYyVXNROEFRazZMQTBx?=
 =?utf-8?B?dEdOT1J1UEQrNytPUk84ek02NCtoekxPYXQrWU1iWXdlVWR5Ky92QlZvVW1C?=
 =?utf-8?B?bWpQemdzSFB6ME1kcUV6ZWNBbzRHaFRuak1TTGlqZ2ZRR0ZYK0tMUzVHMHBJ?=
 =?utf-8?B?ZzZpOTlRUk41THZGeGpjQllrMnhESlJIaFBwU3JGZzQ4S1ZFY0xQT2wrWG9v?=
 =?utf-8?B?OXhPUDZldzBiVllhVVFtcUh2MHpUMDh0RUNtVDdob3oya3U3YXlxcmpFdjhZ?=
 =?utf-8?B?WUlCQVNPSFZ4am5pYTNiR3lsdHFRWDJUZEtGbW04UzN4VmRvTzFsYmQzZURo?=
 =?utf-8?B?S3o3amk5Z0JXbno5R3BlRDR5R1l5K29UYU9CZjNmcGEwb0g2b2VXTmE5alZ4?=
 =?utf-8?B?M0pJOUd3MGY5YnFaakVBRDIwbEJDeDByVUQ2OVBmSGhTTllMOEZlL29pL0Zu?=
 =?utf-8?B?M0x3d0huL2pJY1pXL25nSzJjcGhLbXV1SGF1cGFBNHQxQkFVUDhaNE9jNGNF?=
 =?utf-8?B?Q3E1ZEVjQkhiVlJvNVFPK2VRZ1VHUFF6c0YvTHVBNkdxVHFKUFZuaEZObG9N?=
 =?utf-8?B?Ukh2YUdGbVNNRWhJTzlPdFV6TldveWx2NHhuMWlLZkZBVURGdUpqdWZNSnd2?=
 =?utf-8?B?b2FTSUhqM3kxZTd0ejk4R0ExWHpjdDB2d1RKUFBYeGtBMXBMbGUyMjB4Vk1F?=
 =?utf-8?B?aWxLMVFMOUVsTmVSZTJCWVg5ekQvaGlXUnZpWXhqaGtGRUlEaTNLL0FkT1pF?=
 =?utf-8?B?eFdOV2hwVHE1QnQwaDYrbm0rV0ovcjZSN1I3UUhnZVloZUU0VldLRzZFWkU5?=
 =?utf-8?B?Ry9PS3lmMlNsbHRMcUtGN252cHpUR083MFl4R1A0SldUQXpDTDJhQlVvVHFJ?=
 =?utf-8?B?VGx5VFVmWFVlRjg5dXVIOURDUzFCZDN0RHJWS2lQVVBBa2VFMDZDbTdxYkdC?=
 =?utf-8?B?YUdoY1FSa1MrVndhUlViVXdFZlBRdFdlS3VRZ2MwSUpsbjcvWFFvQ3RVTVZj?=
 =?utf-8?B?ZHdrd21WR3VyMklQa0tkTGtZV2wrc05OZy9KMzU5a09KYVFlcUMyUGV0Rldn?=
 =?utf-8?B?aDNWbVErRGlWdm1abFNlWjJoa3R2Wml0Vm1TVHBMSTUrRHRTTmlrd1BCZXZR?=
 =?utf-8?B?L3MwTUVCVHFhRnAyTE4vYk94L1BmeURRdXpxUFo1TG41dlF5T3NvMitqTlVG?=
 =?utf-8?B?eEFsTDZjOG9ncDFYbGs5SmhHZFlPVHcxTW5VWUhZSjVnWS92bDJ1b05BMFpo?=
 =?utf-8?B?NjkvSnc0ZW9lRmtraU9uZ01WN0lNYUkzc1ZBdXNiQXZyVm1pNG05MEg4VDh2?=
 =?utf-8?B?K3dUR1FoWGQwb21pdjBTVXpmUHQyMGQrS0w2QWZ5bWM5YUhLWUVCWGNLRC83?=
 =?utf-8?B?aWFrd3RlU0QwTjJPZWI4WUpSNFpHM01KYW01TlJLVm5obVQzOXFQR053MjVt?=
 =?utf-8?Q?q6Dn2PJ2RFHPgMx3nyukwOlEyRc6THec?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHpXdlpsMmtKa3QwMmRNU0l0NTZkUW1OVlYrUkNvL0ZYVVlGemZpcFZaRW9Y?=
 =?utf-8?B?TDEyVytSc3FQcTVjam1YZXpPd21yMUFIVzVFcG1UUWZHY3VrL01MclFkTnZI?=
 =?utf-8?B?cjQyUFQzd2d0RHR3S1RaelBwNllpN0hjVG9saW15clFUVFY5Q3hncTlqSVpl?=
 =?utf-8?B?NHhzZDJLTnBhMVRoRFFhYWxOSk1OUkswbFpHd0xxUlpzNDBoSGx1c3c5b1Yv?=
 =?utf-8?B?MTVUdEdEeWgwMFdabXJsdkZSUDhxVzJDWkFvVEF1WlZFc1c4NDhHVU8vZitU?=
 =?utf-8?B?RE1nR1ljejJyNzV2VFk5SVIvNFFkcmhZRGN2V0x2akZxNlpRcE1CWk5uWm1Z?=
 =?utf-8?B?N0g3aGMzaTgyVTFsaTh5YjhTTk5ueituSHFYdjc2dk5yZG5HS3pLUUw3Yzg3?=
 =?utf-8?B?YTBuWUM1RDdYRDRGNDhOL3pGZ3ZEVWE5K1N1QnkydUZXZnJYZ1UxMHNueUNx?=
 =?utf-8?B?bUY4c3FuNnpiaDZ5WFNCUkxUWEN0L1RzREI4V043M0JSeHRzZnJhaTNDdzZN?=
 =?utf-8?B?bndWRTU1T2dMcE5NK2h5UXROdmVaMmtSeEJVNXdRY0ZKNVl3TWtiTCs2Tmho?=
 =?utf-8?B?V2FNT1NQb05qNmg0NkM3b0hXUmJiMjlLTGNFNWpEeGZ2VzBkNWVpeWhnK2o2?=
 =?utf-8?B?R3NKUTU3eWFvK3V1cnBPaWpZM1RPZzFBTnN2WFExYUNrVmhpQ1NUdVlUc2Rk?=
 =?utf-8?B?b3k1U2hRSlNiU3ZVRGtWWGt3eUhkdVhkMUNMM1h2WXRXbG5ObnQyTTNvZDc5?=
 =?utf-8?B?djhBY1NZUWxyRmNNS281OFRwRDBaajdZd2xOcm9kTHl4ZDExaFRjWVpFaldK?=
 =?utf-8?B?MXhCVVpUbjlaTnQrUVZvVlh1ZEFseXBUTTh4dVR4MTExZmJQdjZLUkdKci91?=
 =?utf-8?B?QXNkajc5ODMrOVdzRFhsY3J1dlVQVXYwNms0UVRwdXMzamYyd1ZrRUhCZ2hr?=
 =?utf-8?B?Q1BJaHRnQklGa2loR1FJUExERStKdXY3TWNBeDh0eEpLRWl3cWtHbkt5U2Nh?=
 =?utf-8?B?czdBaXlGTGVZMHlNVnRubmZBWmx1QUJBWmlpSXRPRFh4Q2NJdDY5YlRIeVBy?=
 =?utf-8?B?N2J3TDFReXRuYktDYXZmSWJDSmx1c0JHSGF5VzZNSUdlbkQ3ZTF0WERFU2Vk?=
 =?utf-8?B?azV4MGp2U08vWVV6d2hGVXphaWdCS0JqTS90bGdZZ0ZCdEF5b3EvSnRybFF4?=
 =?utf-8?B?TlBHbnNRdW4zaEpVeFIwOXRTcHQzaTl5SVFqRk9NcXFvOXd0ZldmcEFyMEsr?=
 =?utf-8?B?alVJdk0rSStlOGd0MG1EYjJPb3U2RU5rQWFHOUhTaGNiSlB2d2x1Ky9aeVJL?=
 =?utf-8?B?T2tTZlRyeW5ucldwcGg0T0VDdFJLT2FtOWl5UE5FbklPRk5GbmllajAreXZx?=
 =?utf-8?B?M3phSk04TWRMT0VlUlF4cExjRFV2K09pWHNSQ2Zuc0lUZEI3M3lkMDM2Sk1T?=
 =?utf-8?B?WkQzaHRjZXZFQUhUbysrWUp0Nzd0b0xVRUE3ZjVOS0ViTlhDSFJzeHJ5Z09i?=
 =?utf-8?B?ZkVJTkw2aVBwaHdVaCtBQlJGSHF1cnJDcFFEcWpUMndXbm1FVWV5TjRBczB6?=
 =?utf-8?B?anhoQTVjYkc1TWluZGdnaTM2TW1DM0FKSVduY1paZUQzMld1Ky9sbE5HTUcr?=
 =?utf-8?B?SnBrOXM5V2FrQmRIN0NyamdpWEZiOCtYZHUxR1BpY3ArOGRSNWliTVZpdmo0?=
 =?utf-8?B?Q2s1Y2JxMll4cTkzb1g0bGdXVnVqSkxMY2Y0V3RzS0RNOHIwa3MxdTgxanhl?=
 =?utf-8?B?aldXcmVKZEtzZ3R4akJpM2hLU2xueFJKT0NaaHNLVWFIN2ZVa3g4YS94Z2RS?=
 =?utf-8?B?aHdkRnBoM1E5M0VwKzdIZlNpT1N5bFc4MDlDdE5ZSjdteU5qSWlGVWNPeEw4?=
 =?utf-8?B?UDF4ZDY3WTZtcEptZTNkdlN4dkxqZldhN2srTFh3QTBvcGNaL1A0bVNpeU9z?=
 =?utf-8?B?Q0dqODFSWGdIN3RzMG5UcWRJZC9jWUg0dHBYSjN3SjZTckVycXdYeThrWlk0?=
 =?utf-8?B?NzdCR1FyVFQ2ZzB0ZTgrYTB3elF6dm1BaGRnRmZub3owbG1FM3B0aHN2M3NE?=
 =?utf-8?B?cmEyM0ovZDRvNjdMVnF5bEVFMXQydDNTNnFTYXRoWXhCUG9Ydm5NbWpnMUVh?=
 =?utf-8?B?bnU3N1VvTnBnRjNiSFplN3YzcVZQYTZmRUhyTThGSUc2c3dDc0VrM2tuV2NL?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B/HsdQs9BaVBJFCElNTVDRNDYto2+msegUr6aOmCDQqTBCZAfiE+Vs6NysmS0AHEjqCQ/82C8yqzt2BVs2NxE8P7tTVunI4HUB2zWeN9kdUzKMdLqFYjBVMwrea8KzElhUTLAZ/nsdQ6VHbO88vlpvkPnvcL3d9p+fc+Kx+F32orIGKORdNWyt9f85Pt1Hg8w/17mSMpF+yzyjiwQFdD6oYCLS8nhIVqc8ho7irWqKu0oGLXony6zBL7+b3ISsS3jTkg+2330ciXDHYMnsbzGJEpycP2eSVUwhNqlUqZtG6ObO5F2WYSVLdXODFvYd1hHDsh7tZ0lEj1nVH/i0JkAnkn/sa0F9rX7zXasDvtoaqxI4kw9xK5nVjiPz8jJL3EQ0HdrAahO3O2jtHt50+y/if7toMOEwKxgUGBYbOb3OBEFyDnJh1/YgryGMImeawOYrJ9m6pblAA9fhyZPbV22Mxyk8C0/ygKffVM5pN99MSnB5LFQY0yupDKtwy9grrqy8GQhlv5Z6lnL9UIb7zwOXObva5Cd86ZBVTNGQUlEgFbLaA9tgkF31tq1A9koqlr0seR+gpiSWPqQxj14e7/tvu2UlfQtzjTfOUqeUUKMG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211a8723-c7cf-4c91-558a-08ddffea1b74
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:25:10.9049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x127rPle1W+8P/X5weD8uZzwild1UpvCE0ctO3Onb04bOL7vJFdyqf7NsOScy2UBsDYDPszsbsWePmGBIA2csoFCTM0TOdqcxjN0Ma16OII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509300056
X-Authority-Analysis: v=2.4 cv=GtpPO01C c=1 sm=1 tr=0 ts=68db77ca b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=EnWi2pPLuXY8Sv39prwA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12089
X-Proofpoint-GUID: 22dvWeGA0JYzhQobDoz_mkwH2MGysefc
X-Proofpoint-ORIG-GUID: 22dvWeGA0JYzhQobDoz_mkwH2MGysefc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA0NyBTYWx0ZWRfX02T/R/DRJSsx
 OUUD16FYkA8HjZfdrF4OXrlN7svjeXwrhwwDN/ciFGRCNWhxHo+hyiFAYzGLw0Ooh56r4j7Wlj7
 3NxK60Vxw8F3pYa8yIbx4rsk/JYo2rRAKNxHlShxI/+I1OFO/K1w5VX2y1rnLiw90/id4TPjyY6
 IvQbgeFlMHTg1DF5Z79yOpiMXSdpQ9cO+gxYcHnSm58kUQBSow/8d5WaV3foLk7+fNlhIHw9jqt
 GUBW4AQSuS+lp9+dltJsmYJYfSlCpUJLlUflyJDjWDazQhz2hNmWCrdSL4nH+s9aBXkZhxo8LwL
 m6ejbiensbiIsdMYXhQwJ0QybMiupKsE1CMMj6/SSPmc1EKQnOYj3+QsuOLb43eRyIllSng6Gsc
 bmNDiIWz8Kzj/WUJXaROvq/ZgV+cqMdvYmOQPblzQQHY2UEGnGo=


On 30/09/2025 06:53, Kees Cook wrote:
> The "transitional" symbol keyword, while working with the "olddefconfig"
> target, was prompting during "oldconfig". This occurred because these
> symbols were not being marked as user-defined when they received values
> from transitional symbols that had user values. The "olddefconfig" target
> explicitly doesn't prompt for anything, so this deficiency wasn't noticed.
> 
> The issue manifested when a symbol's value came from a transitional
> symbol's user value but the receiving symbol wasn't marked with
> SYMBOL_DEF_USER. Thus the "oldconfig" logic would then prompt for these
> symbols unnecessarily.
> 
> Check after value calculation whether a symbol without a user value
> gets its value from a single transitional symbol that does have a user
> value. In such cases, mark the receiving symbol as user-defined to
> prevent prompting.

Sorry for not catching this issue.

> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 760cac998381..9cc2fd5bc016 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -411,7 +411,7 @@ bool sym_dep_errors(void)
>   void sym_calc_value(struct symbol *sym)
>   {
>   	struct symbol_value newval, oldval;
> -	struct property *prop;
> +	struct property *prop = NULL;
>   	struct menu *choice_menu;
>   
>   	if (!sym)
> @@ -520,6 +520,22 @@ void sym_calc_value(struct symbol *sym)
>   		;
>   	}
>   
> +	/*
> +	 * If the symbol lacks a user value but its value comes from a
> +	 * single transitional symbol with an existing user value, mark
> +	 * this symbol as having a user value to avoid prompting.
> +	 */
> +	if (prop && !sym_has_value(sym)) {
> +		struct symbol *ds = prop_get_symbol(prop);
> +		if (ds && (ds->flags & SYMBOL_TRANS) && sym_has_value(ds)) {
> +			if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE)
> +				sym->def[S_DEF_USER].tri = newval.tri;
> +			else
> +				sym->def[S_DEF_USER].val = newval.val;

sym->def[S_DEF_USER] and newval are both 'struct symbol_value', can we
just unconditionally do this instead?

     sym->def[S_DEF_USER] = newval;

> +			sym->flags |= SYMBOL_DEF_USER;
> +		}
> +	}
> +
>   	sym->curr = newval;
>   	sym_validate_range(sym);

I have to run, will take a closer look later. Thanks,


Vegard

