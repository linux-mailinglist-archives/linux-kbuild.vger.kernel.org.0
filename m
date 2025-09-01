Return-Path: <linux-kbuild+bounces-8689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0BB3EE0D
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 20:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D3A2C0A77
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3761A5BB1;
	Mon,  1 Sep 2025 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eEfGwKvJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QOQSM7+O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA60E555;
	Mon,  1 Sep 2025 18:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756752328; cv=fail; b=oUP1lppUvQurCnarmbMi3IF/PPSaZcBmlqAjDQikLmnHRF2Gwg72PLQ9Si+8A2gKxXG+Ku4vnfzNOpcAr0KFoSRRNKfYi9Mm9I1c39DiivXjKZ0M8W2ZUHP4Yv/mlvoOK6wjon5HRm3GgylcvOPVrAjyzdLz4cfVqKTfsph5wzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756752328; c=relaxed/simple;
	bh=r9fssCTr5XCyToWcTGP2UajAyfUfawAXKY88T4uXQ9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hMM7JpzjAe4ac9MbpazZl32ra9TYl5Nqn7bV1kkLBBAkudDDeksf/uPnH9wx+odjlUyrmsjApHpqjAY9nxoytVD7h3Bp0b11wlI089a9OzFxBQImQj+Znz81O6zQFy94XpW0HH63yjbUTQ+o24eI+iLkYfwl8m0JDjXv9RpW230=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eEfGwKvJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QOQSM7+O; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581FNPBl029487;
	Mon, 1 Sep 2025 18:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QuMCQI7sQUIvipSPFeQ7DdeELGU6EoCtnNr4S18YGeQ=; b=
	eEfGwKvJJd28hphvHHbUhglBF49/J/Iz5E4IUHOV3Gr76l0C/IWxC/vLc5kl/XIT
	lXh6wBLNfAkP90rMBlfgUWrtQFb4pAAdEw7Gy7KZANLpjB1rbHuD6bWiWUPHuKA3
	HkTV/0wH2zk9LYWhxbX5TmBG3AVnMmpNcvlXGtTQNPrvTLVhceraOujeBIBYmai5
	J4LAE9Gj4vOuEQfG6YDh5qBKa5ocp4W7g2wfykRz8YgKWdqGL/PQtHslTe2tu/dm
	6cjYZ3oaOWKCB5py/WiQQZ7kSuppgNO0fHsk0TIRcVUfA1bc64Cen9ePaQUivGv7
	X0rhNbPEQz401AQpbL7LgQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmbassb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 18:45:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 581I08MG028695;
	Mon, 1 Sep 2025 18:45:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr8cj12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 18:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzyUCykN+ahPf9B1FuTAXHj0rJ9t7lj6JsKXf6l0ZC/l8c3+NzHV7NSkWh+GG4gATyDk4v3lwa7Ba3+vChdHNhbyxH4e4gDsgkxJPLL28kHPHlyOYLHUcgS2kKsHXlHneShYXi5S4a+2A6oaipRSZPtpJa8NnLUJgOlXYXkzHOc1RfcXnJmvU6NF/kglLfOs8CBnYRMQrnD4qNm1/jzHN0hjdpP7WQShsZViUwXLOUKJUaznssovXlJfLRKVVvUNqayoEusVPvRc/M1fxD5e1qQ2vzAcQq6tYdghUGtNMz+wv0EBuN2tCjbqUV8vpsantFFfsSP8EXIk16kKkcSqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuMCQI7sQUIvipSPFeQ7DdeELGU6EoCtnNr4S18YGeQ=;
 b=o6SwiO1AVy+OdmoWU6nqSWNFQiUUbu0WVcOFDl0BxrgPH2zURde3HYWy2PHdCzLOogaJvbIP69DzHqvO00EHE7/5zujkE6z+5u/igWzNrG5OWXLlpPddoq/F/lhrEBU19GOchhS4ndpMsRE2+Di0PHVAdnblPADWnNpJphHsm/WXm7bBasuriPdVYchKLtCYulcNV9/y/Pl8UQDpbydy+9GGexuC+9PHtFnzhU1NABTsJWWfFpI8dtsSwjxhmtCdlnuKWht9YW20iw4Ab5wi1e9yxF4OaDr2l/2Dd/FYXcYTif8BelEktb8Wputyd3WxjudXWhXIBxwgzd53QOWJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuMCQI7sQUIvipSPFeQ7DdeELGU6EoCtnNr4S18YGeQ=;
 b=QOQSM7+OKrkIg8Q4p5Vx4mOuktJJNLTo64wHu4RxF30QmHnXpNIuVfLp3AFljj3YKaxJIjQV+1rUzl9IeB+v86qFyNmIXF5dFJ4R+ysN2rZu0IE2B/PWc2Nzi8983o7kGsAbzmcTkax0jfl/ATdxxmHtTpP7/KiBoxepIr9p5/w=
Received: from DM8PR10MB5430.namprd10.prod.outlook.com (2603:10b6:8:24::10) by
 DS0PR10MB7293.namprd10.prod.outlook.com (2603:10b6:8:f4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Mon, 1 Sep 2025 18:45:03 +0000
Received: from DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc]) by DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc%4]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 18:45:03 +0000
Message-ID: <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
Date: Mon, 1 Sep 2025 20:44:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
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
In-Reply-To: <202509011125.5879901C@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DM8PR10MB5430.namprd10.prod.outlook.com
 (2603:10b6:8:24::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR10MB5430:EE_|DS0PR10MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 455f4c3f-4694-4d8c-66ce-08dde987a98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHJtM3lGODRyOHY3YjVibDVrN3hpMlhtbUZpWHY3RTVhaTlXTGJVMm1aM0ZC?=
 =?utf-8?B?T2VIbyt2SDJUN0ZzcEcwRk1FQXNMaXc5eDIwWXV3YlZRdHlvakxpWW5sMURR?=
 =?utf-8?B?Vmw0dmxpbTZpYkJSSjZieTJFS0Z6WUl0Z3QzN0dQN3ZoSUIralhLZTl1M0VY?=
 =?utf-8?B?ekcrcDdsWnZjRlgydkZLb0lyOFc3V0dZbnh4Tm9XRWF3YkdCbDVsVzlWSEg3?=
 =?utf-8?B?c1F0d012TWdEQXYwTGFEOVlLQVhNMWdHUjRZZmo4cXl3SCszYzhOZlpuMWpu?=
 =?utf-8?B?YzJGQ2pYcC90Y0RrMHpZMVYxV29LUEJkRmtvdk9WZGkzOFNkOW9EL2FlS2Ix?=
 =?utf-8?B?SHlOY2h5eVR4YWswUVMrcFdjZE5SQ1F4eng1TlhodUxxRDg1SE5hY1JNWVUw?=
 =?utf-8?B?bmk2Y281MnpMRWNvTEU3Z0g4NndDUHFtMHFab0pVQ2g2MmFXTVJEOTRLaTg3?=
 =?utf-8?B?ZXp4ektuN3dFd1VIQVdnMmU4YWg0L0NUSUs4d1RWbERsL0I0MjR4ejUzS1lu?=
 =?utf-8?B?Z2ozT1R0QW8zeVZEemtLRlZwWFQrc1ZRZUFOQVRNWDNmdmRIcVBQb2R5YW5v?=
 =?utf-8?B?d0VqOXNHdEJRYnZNMFJyWjBMc1ErZ3JZOVhPcTlLazBhbVpNRlZoajlMMEl6?=
 =?utf-8?B?QjlKREFDNHBOODEvQjYwRkhLbWsxZFBDcm93Yld4WXhsUk9rWkJZc29yb1cv?=
 =?utf-8?B?eVg1eVhjeGUxdVR2eUQwZmprV0l0WHduNmxCaWlaaCtmcXhhYnV6Rmx4eSt2?=
 =?utf-8?B?c2NtRE9RTXc5YThhK2dVYmhZWisxNGlpTzdXNmtnQ1FzQmxxUHQvTENMY1By?=
 =?utf-8?B?MXpJMG1CZ2JLc3o2RjBCdHVvbXJlUUt3RXpCMzBZeW1qcENTZEVIbTBSUVpy?=
 =?utf-8?B?S0wrZzJiMHNUQy9uNE0xWkFLOUFITGNwUEVCbUgrdmdZVnpKSW9YZHdNcHR6?=
 =?utf-8?B?c3J6OHFpT3ZTY3JlU0svRWs0QXFCOGdCRnhNUTZtVDVXREcydldHcitqMzJK?=
 =?utf-8?B?WmVFOG1YK0VxcnhIakNkek5DV2x5WnhFMTFEODB3S3E3NCtKY3piQkRqWnBz?=
 =?utf-8?B?bEZ4d2k2WEYzUW93V1AvdTdYamRySFB2QlFKTDlDTFZDTDgzZHQ5YzUrc0Rj?=
 =?utf-8?B?eXk4bktCMCsyeWtyMnFtSFVnbWZEblZoOGt3UkZBbjFRWWZhaHMwTi8xemxx?=
 =?utf-8?B?eG85UHdTNHlkck1FSjdKWHJLdlY4RnFqMGRDOXg0MytEVmJRK05xa1FYdkV1?=
 =?utf-8?B?Z0p0a1hlU0Y1bmtlQTVoekEybUxYWGZUYW5zeVhuYjB1eEhUbDliZlBQRVdj?=
 =?utf-8?B?VHk4M2tpd0NKY2ZMQTU4WWZKTkp0dUpnM3ZNd2JPS2pnbnFmcm40T20rVjIw?=
 =?utf-8?B?YlJSMHJtclA4RnhFL20zVTlGcG16R2I4cFNOOG9YSGRGeWJ0dDIxU2hZVkhy?=
 =?utf-8?B?dGkvRk1ZL2Ezc0tCaXBjdTNXeUdrbk03TVJiVUk4K2g5Y0p3ZEhyWnJJakZF?=
 =?utf-8?B?RTArd3RFZ2pTanQ1M1ZMeS9PYUZPZmp6S0Jna1JzK2FUSDRJZzVXMFF2WWUy?=
 =?utf-8?B?dDFqUmRjc2RnaG1uUVJ2TUVCTkVTUTlNRHBJQkhzenBEVy9uKy85SlBRZ2xq?=
 =?utf-8?B?aXg0a1NzWVBXR2J1L1RRR1FkNVUvdXQ0ZS9JYzBwMkRBeVJTMFRtblFtaUhX?=
 =?utf-8?B?YkRvek52NG0zWGQ1OEZZNHJzcFA4eDZIM3k3MVlROXRJK1BoMUdwS0JENTdh?=
 =?utf-8?B?Nm9UQ1FKdmZzSzFJVi9NVS80eFZVN2J1UDUrNlhSeGpoU3JtbzZXTU1vaEd6?=
 =?utf-8?B?Ry8xN3dtZzlZRlMzeEp5N1U4TmFlZ3NscnFQa28ycEhNcEhpQmxMT2t2ZVR1?=
 =?utf-8?B?Zk4xTTErM1htejgyUUpzS1ZPTG44TDJSN0J4WjhTWmQ0NGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR10MB5430.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NURuci9GeFNJbVRmUExUWU1YMU5SUjJYOWFPWm10RzU0RmxhQ0g2Qjg2QWps?=
 =?utf-8?B?OUhySlVJVjlnSnUyN3NIN2QxSDdTQ0M2N2w4TFQvRkVQWVBQb0ZBQ1JWV2Jp?=
 =?utf-8?B?Z2t6MTg3cHFjcjRqbjNad0xHcWM2NnpMNStwckdNWGtPL3VzSEh4ZXRJV2s5?=
 =?utf-8?B?UjI1MUdremZWQ2dvQkxZb3U3RTlIS2d4RkJIci9keVhTazFYS0VUdjVHQmgx?=
 =?utf-8?B?QUdRcXNkblB5TmxJTFZvYWJOMjNmUWVvMlJJajU3L3ZlVlpmbkgyQWI1NmYy?=
 =?utf-8?B?ZHNHcnVQNHFhQTVzbWFPUE4zKzRBM21TNU5rYTlRdVJQWVE4TmNldmFYK3JP?=
 =?utf-8?B?Yi9ONUtYclhVSWRGSHVBbmwzYkZ0STlibEU4Q2hRSVFqZGpxNldTVGZoU2tM?=
 =?utf-8?B?OGZPbkdaRDZzQVdpaU1QZ3VOTE1GVDJnYVdKak4vV09FL0F6ai92SWhSTmdp?=
 =?utf-8?B?TDhKUnFoUy9zV2lzdHNhMFlGbURhZGJvbU1NdTVWWk10RSt6L0YzYzlTTmNi?=
 =?utf-8?B?R1plSWFIcEdSbDZHUjhnOVZPa2EzRDVnKzByVTU0cXFybENkd0luczNhRnRk?=
 =?utf-8?B?SGQ3OExseldtTE1vZ3FRQ2ZJZXFwdlIzclhDZFlPNk9OLzJ6NFF5SzdrVyt0?=
 =?utf-8?B?ektvRlR6YU5hMTJVWFUyaW40a2E1bUFHMTFyU2tpbGxxYUsvaTlvTXB0TURu?=
 =?utf-8?B?YXFMamU1TWhUMU1tVTlVYlV2QStETTZPMVJ0dXY1OXpTV05HdDhzeVFvbG5P?=
 =?utf-8?B?Wkp6TitwOHExNkxacWpCTW5rYXF3L3FabEQxUUtaNGFlNk9EbGJra3VVWGVB?=
 =?utf-8?B?WmVKUmFQdHFyVWxPYkVpdmFseHZ3U1dKTTJGclVsdm9LR0dvZXM5MzhsOXNq?=
 =?utf-8?B?bUlnUFRRdCtYSy8wUmJsMkVmVnlDcWczVEZTY09GZWdmUzBkSnV0b1pndTBD?=
 =?utf-8?B?eUwzZmtoUWdXUXdlZXlmR29XblRtcHo2QngvTW8rSi9Ick5PQkpHSSt2V1dp?=
 =?utf-8?B?Q0ZoeTJTNUV0eFBUV3ZZMWxKZTR5WGZQV3FaMlFNYTVNWHpraEFWSUdTcDNx?=
 =?utf-8?B?QzF2NU5hckZjcm9VUmJRKzhZOTJoOUpiNklERHN2L0orR2cwVHRkV1JjanV3?=
 =?utf-8?B?OCtua2c1a0wzemNuNWl3V1JVUWtxMlV1OU5UdmhGOHRpQ01qK0JXZ3I0d3Jo?=
 =?utf-8?B?SXFncWsyQkRlcHVaTFNYand5OVFnV2EwRFQyZFlwSnFMSDYxRDEyaXJxaWRO?=
 =?utf-8?B?eFZHRFNCVTV0RnVkZHQ2dkppYWJYUjZTdFFOdFMwZXl3T3lqa3hoZjFtNW94?=
 =?utf-8?B?ekVubXZPY3NmdjBpQWVvQkFDZGthZGcvVm5LV2pKZklQNUxFWDZ4aHduNXdB?=
 =?utf-8?B?Wk9XWk9rQmpZbEtlZ3JURUp6dkx4UDAwcXJEWlE4eVdIbnhzZ3hYRVBhZk1T?=
 =?utf-8?B?SlRxUWYxbnNsWVdzd2g5ZXlJM2tCMFI0eTIxeGpsSyt0Mkx4YlRWU3IvMHRE?=
 =?utf-8?B?SkRRV2hlVnZpaE0rTEpDR1p0RnhLNzdHSTJZd1dDWnJIMG52RTFtWkdlYUJ0?=
 =?utf-8?B?RjBVV1cvN2tKb3g1Uy8vNm5tajdWalBzWVYrY29BL0hJekRFQTlxc2w4ZXlK?=
 =?utf-8?B?ZVFBNTAxVVJkM0cvZXZYMis2MW5aTFlIVWFyNnhNNUFCNWNMNDlyQ1NxYmlp?=
 =?utf-8?B?MnNINkxwdURSUVN6amJVTDFxOW5IODc4K2NZSWVYZE80UG9sSi9NZUNUWlBk?=
 =?utf-8?B?dDA1ZFJML3JrL1orYmN0bzMzK0dMdGFSbytRZTdFeGV2dDFqM1NybjFoUy94?=
 =?utf-8?B?VlRVY2hSRjNBdzFRTjlGbXlIN0dNWGhuTmFpM1VvUFBWc0ZYWjRjaTZMdHU5?=
 =?utf-8?B?dE1rb0Q5RnNUTWwvR2hXZ0ZkZjQrcmpOQnhiVjB4NjJ2S1ltb2pEQ1NmY3N6?=
 =?utf-8?B?dHhoQjZEb1dRYkpVT2dCcDczS2tRZUFyL0NVRkx1ZHE5YTdjejc1OXZsK0px?=
 =?utf-8?B?bW53b0R2NnF5NCsrelpxQ2JqcnJCMGZWR0paS3k4RjFpbEJhUW5nbUYxdXQr?=
 =?utf-8?B?RlRoTTJVdGtFSmFiTUhPejRObTNxWUcveFExejZ3SmZBR2l3aEdxemJEQVJ4?=
 =?utf-8?B?cUkyNnM1WWFwMXhrb2lGS0dFU0xJREY2b3RVTGJQWnJXUDQva3p2amF2S3lN?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GoemGKka772IXxfdFFniqmXKmLTrdneH1Cfv1tQhYcYv3KGbY6317AfoYaUJFbRGgyU0QKtX2ePhuyAjE4JVcHog+B27Kdfl0KzZEVpvE5VDYISjSsQmsD8V0T56fQbEZ2GtFCuz8qU+mYn3t+q5I0BP2ZO8M1tiJ5q1sU+qQfiGiFfaDRXe4vV79DdyQhQGi++dnBXb6nnqNSWdEsysWH+jkztuHGwb1n8uvQdN30W18gaQQsCGEiEjgA1nAn6IDJS1yckikVceMWlUx82eRrBjR6JJb35lxXuthJmFjl5NiRYRi0XztYvwwjhRK44dnP04/7Z21ii23r2R2z6U2Tyz3w+RFruyZn3QxNtSUxLr6+oXR6IHxKvU8t/asLCO5+l9ZkkKmfEbjJnu+JclKJu4E1eLknbE/5bEqL2n7WDtPALOJq6+7aCri0jBXACUqnNPPStpgPBolxoFkayVy71Tzvl3G6nt2v6akAW4jNvsUSn9AdfO6yxeymXM1N3Lx5BHuiwH49XmPybEzDY8u1xYJYgNapE8C0h9Ya05GtjOBPnfhR7zv5cRNSh3FRuUEyIIO7aG4fcdUSAMU7/BBF+/qFEapEc/J0WoP76ADWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455f4c3f-4694-4d8c-66ce-08dde987a98d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5430.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 18:45:03.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3jsCGWROA5+QA0nUonSbeKACB2QY7WkPRcH2KpIPxIBGFRwPAKM00Qkq20UiKLTRSgYuHzcAEUViin5bi3WvqfJOE2fbYrQXfF3aJH/vbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7293
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509010196
X-Proofpoint-ORIG-GUID: oD2soeEx-dA1CSuhQBfNIFDxVulXT6u_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX9jeJUH5Dh/xZ
 lOim9b7866ylCVsVcd271S9jbNRTCO0ift7GAf++n/5NrrDt26wbm7m2VahDX/yq/n6XOa3UNkM
 B/3f153H72BdjN886wxs645UUegQex6FmBkyCxelmtcjJY1thJ+AnGw9UlhgZqY9QsRKdobf/jE
 sd1xzsdS9/UrUvm+2C40zkuwDCgTzM3mLJkwS0G8RyWu2kFSWSNxfUH0frt5L8IxyAaPCGSUMch
 ZgtnHHC6OyeTzKH4rWH3Xm2f1m4WUjufA7bAFt6hdHIr/q2NzlorSCDNr9Kbt7A7pVs1T6zfovK
 6SojL6bgOL24tJMA+ssbH9WddO/ZbkG8DHqLLua5BUaaLAj6h5vAOb1JiAOj/75gixr1DhuQIgq
 f2qJLbDK1VrkFZOq7UpDVL8POFyIpg==
X-Authority-Analysis: v=2.4 cv=KORaDEFo c=1 sm=1 tr=0 ts=68b5e9b5 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=pUmForLZa3wb_cs2DeUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-GUID: oD2soeEx-dA1CSuhQBfNIFDxVulXT6u_



On 01/09/2025 20:31, Kees Cook wrote:
> On Mon, Sep 01, 2025 at 08:20:18PM +0200, Vegard Nossum wrote:
>>
>> On 01/09/2025 18:56, Kees Cook wrote:
>>>>> @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
>>>>>     			sym_calc_choice(choice_menu);
>>>>>     			newval.tri = sym->curr.tri;
>>>>>     		} else {
>>>>> -			if (sym->visible != no) {
>>>>> +			if (sym->usable) {
>>>>>     				/* if the symbol is visible use the user value
>>>>>     				 * if available, otherwise try the default value
>>>>>     				 */
>>>>>     				if (sym_has_value(sym)) {
>>>>> +					tristate value = sym->transitional ?
>>>>> +						sym->def[S_DEF_USER].tri : sym->visible;
>>>>>     					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
>>>>> -							      sym->visible);
>>>>> +							      value);
>>>> This looks a bit odd to me. Just thinking out loud: your new logic is
>>>> there to be able to use a value even though it's not visible. In the
>>>> case where it's transitional you use the .config value instead of the
>>>> condition that makes it visible.
>>>>
>>>> Could you simply change sym_calc_visibility() instead to always return
>>>> 'yes' when the symbol is transitional? Wouldn't that simplify everything
>>>> in sym_calc_value()?
>>> It's a tristate, so "m" is also possible besides "y". (sym->visible is
>>> also a tristate. 🙂
>>
>> That would be fine, right?
>>
>> We'd pass the if (sym->visible != no) check... we'd do the
>>
>> newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);
>>
>> EXPR_AND() is basically min() (with n=0, m=1, y=2), so effectively it
>> would end up doing
>>
>> newval.tri = min(sym->def[S_DEF_USER].tri, 2);
>>
>> which is the same as
>>
>> newval.tri = sym->def[S_DEF_USER].tri;
>>
>> That's what your code is currently doing too, but in a much more
>> roundabout way.
> 
> Right, it was this:
> 
>      newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);
> 
> But I made it effectively:
> 
>    if (sym->transitional)
>      newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->def[S_DEF_USER].tri);
>    else
>      newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);
> 
> That first "if" is kind of pointless. I just sent the v3 before I saw
> this email. :P
> 
> I was trying to avoid yet more indentation, but I could change it to:
> 
> 		if (sym->transitional)
> 			newval.tri = sym->def[S_DEF_USER].tri;
> 		else
> 			newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
> 					      sym->visible);
> 
> ?
> 

If you change sym_calc_visibility() to always return 'yes' for
transitional values then I don't think you need to touch
sym_calc_value() at all.


Vegard

