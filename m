Return-Path: <linux-kbuild+bounces-13089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ATcG58f/2ky2gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13089-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 13:50:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A624FF80F
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 13:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C92D300B10D
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 11:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3892836A6;
	Sat,  9 May 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="KpjEiaMG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020118.outbound.protection.outlook.com [52.101.84.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75826B74A;
	Sat,  9 May 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778327452; cv=fail; b=DVaM3U8upCgRSOE2pwFDJ61dyH93/orf/J9XdRGqhjYnHMEXfAjkFK5iDSj5b1hauv5GN9YHOwgMhBSTbuFOHQwQu8Q62DMiObHkNcCisUE69r8fC+8T3DnKalMAwniW98iAha/2tDJXsIsujP0XEqjPLsIFaUddbF1S5vgCJMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778327452; c=relaxed/simple;
	bh=bI2mxGfSVY2DQRokADmcisoph2HsEliMX5rEzwsfkhU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NNYzCDKw5zuB19kqBZgwdOBvlKx3eodz3eWU4KQqT2yD51Xz4b5PVqW+c4ueiCzsCMqVCsiVk8sIyaXn2Ad0BrotEozcgS+LzEa1WzpSRBd7/N5bToiV8j7FvPTukcfkTcdMAPwDLEoaCwJCYioLljqu2rBzHAAaIZdsWapclO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=KpjEiaMG; arc=fail smtp.client-ip=52.101.84.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9q00etV4XyuxyTJOB0MaN4MF6pPt4sFL5w/7TiIN+0Z58T6wdY5OTCsfij+7cgFoo+3XoKgEiMiFMTEy1A73XxADBaDUPB3Ut0Gi6xYO/niIi7KMIDHzmeJptV+ZPGHZJOTlLpm0ST+AFo2GKLCk3KmNrAJgGn8J02uhqUpGJeAo7JlhqNAE+eBn/iz8KQSOiHaqDLbHaVYsJBsxZjmOHfcHBztMCRlB3dhbo4vL5l373pX6aklx45FUScfoSZWjBaA/fGVOL48yhEDLuyJUT8p2lfpd1eSJOso821OG1lWtlLLsJ+o1SFdNTFiwGVYMkGsvO41btpW9nmetLy5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scu2efPSq7NE/uZeyLpnEZ79c9CU4DtgEs/f/yBW/lg=;
 b=M0OYujL77ImpICCr+ePHhclDuoVh1AVcJGgM4aSwpWdwi2zPByDw3HpgBvCi7US9zG4VrDK6F93LBe7cucFRx1Cnv/ExCVwelO/ceghq+Gr8h3H3ruIKgRFhiaAmNM3AGcAT6BGqBcyWbG0gzRPEJ0OsQOVBoFVludkBaaw+APY9d4guEXYOZOevnYxZeAr3tKKAWkCsYBLvW5U+uJMPMobik40V6/4zP1ESe9MfvZzYqUBX4VolvMbbISuNH0PDS//PNNTUAZPYDjsetI0OIwrFSUUHtMta11eDvrynK9u67/fXdvudX0zlm5JAVQpzVJFikhO4KUVWOnwMlmDVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Scu2efPSq7NE/uZeyLpnEZ79c9CU4DtgEs/f/yBW/lg=;
 b=KpjEiaMG8jH9i+wx/7qumm4mkLYLH8e5ZsQbaenoXqOoQMZwaU4pPskfqLIFunUBu54OZFTOGGLQnsw3k9FHnPxlldCQr4HBiaNpSNGO95kyPzDcGgPFfw1eTshTWUO/kAiFjalf/3enxkMC/2JcmCkb+iC+qVLglOZR5UGLjX61EOMlfSLY+jz6BD8c+nCjaRcI6dFw3jdVMZ6jTH1ll540DcwiDI6FxZvn/AaqqgyQRG7+iRjyOcP/IuQCzaL2AKFEAaTQJ2Xe9YgmZJ2Gstc5KWXTMJcL/fhi0tpQ4OX1huEytOzWExmu305GCBth2vejq3PQ5CDMicJx6L8+UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20) by GV1PR08MB9914.eurprd08.prod.outlook.com
 (2603:10a6:150:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 11:50:45 +0000
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a]) by PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a%6]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 11:50:44 +0000
Message-ID: <dca5a1ce-feb3-420a-b452-52707373dd61@virtuozzo.com>
Date: Sat, 9 May 2026 13:50:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
To: Peter Oberparleiter <oberpar@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
 <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
 <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
Content-Language: en-US, ru, sr
From: Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0001.eurprd03.prod.outlook.com
 (2603:10a6:205:2::14) To PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR08MB10708:EE_|GV1PR08MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: f86c1437-e1f1-4c4f-d866-08deadc133f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gR1Eul03uXYLf4wQWBUj/AfBgBWYilMTUTAfn10ZkfrmTIbNs1mGAGOifExgN7dndsRgvrsfFxwfBroxwufVZ4FDougI751eTM5BmDli3SUtKqE/woTdaAo7U2DWUtXfZ+s9FNT78CecmuddUmlpvtoSHMb9iqTkMjoCVIfBhj/tILDv12DuFmZREsClDyMSfSLPBrfeokR6OScvvQdJtqwYlDdBA9AYJsoWboJzhUDsdau4PwvEQNf/VszuMVRYqj7DetOZWXoTzFjq7MmcOlAxdx/f1pdBkxqzfNzLPVadsc3gRDJ+5qwZIsMWbm66CoDVUe2mwpv7tH1tw0pWPLIpvDwpDi9u/siydktJOHmp4ewle9cT2UtkRmG3eHlxeIk0foUpSDzWuZW495qp1YXum43fUg2devWbU3QAJKsGuEDAZr+gJka7sgF2+TMCqAQtT4x53S0TWXBnOjkFk1o91ViU6enw7L3KtNQ5QhmSuQWYcE5BqxiqJCqLuomhnq2HWQiXxjArH2qwND5EOcSFtSVEOwTCj8MrUl39yDigrHil2p2ewd7bcOmjuu+IrluF2Iy0TFuktRXx+w05zU4q1tfRO5JnrJRPMnEjbwhtRflFa6ats7kPfFGG5d6i4mveJufStIXpBLobnAPYnDs2EIYZHWIzmeHzlhJAI57laqlGMScNzZfPRXC4cZL2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10708.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXlFd0dEWUplM215RGk3VDFSUnpTK1Vwa09maFYreVlJKzAwTTgvdDZIQTFo?=
 =?utf-8?B?cURxdy9vZ3NGYnRHYnBDaSt1bkY3QXF4eS9FekdreEkreHFzL0xmSzA2bGo1?=
 =?utf-8?B?ZWQxRzNra3JqdFlQZWM1M2djVnhhMzlydUdaWk00TFhOR0dOcHlKaG0vUTAz?=
 =?utf-8?B?MiszL1F6RnhtN1BlbFF1WXdvd1ZXWW1SaEtoaE9MWG4xd2VoZDBpdElBTytz?=
 =?utf-8?B?RkVyenpHVWZCbVRUQnlkTTR4eGZVZmVzcVZwV2ZRUVQwOEQ5Q2V3RlczSTFF?=
 =?utf-8?B?MFJkeEQxSTVoeUdGOE9KZVJDd0YvY3JPcGJpbUVQeWpoTE1aVEd4T1RUWndJ?=
 =?utf-8?B?aFlZcXZGMG93RHc4b2liYXdoSXpVU1UxU2I5UzNpYU04dlVUZmYyQjVONXdU?=
 =?utf-8?B?Q0dnMXIramxQa3MyRTdYM2tBeUZnQmd0M2lMWFhuNmZiKzE0cHJHd0tsQ0VZ?=
 =?utf-8?B?VktMYWw2UzMvalFpY0k3ZE9abVNFRVpZYVB1bWRJdmNkeFlreGhPclF3RXhF?=
 =?utf-8?B?NlEyNVZhQnBhdUVDU3NBR2dwN1p3cFZYNCs0SGY1cmE5YU9Ed2J5eTdhOWI4?=
 =?utf-8?B?UjlZdGhGVnZPd3dadVlXYTR6K1R5TFJ2ZEgxNVdSRWp5ZVJ4bE16K0pLRlNL?=
 =?utf-8?B?eldYZWx6OTNOL0QvbWFUWDJpbmt3dGpTMlM5d0Z2K0JtQThZT3JxRUNIR254?=
 =?utf-8?B?c2MweFdKeUhzM3NvbFc3a2dFZTdQSzNJSjBldUhoZ1MwV1k1ellDamxSREwy?=
 =?utf-8?B?ek5JWm1iMkJoMG5hZ2pidDhhUEg1NHVWOVhGV2h6TlBnWElmZ3FmMU9UaHVz?=
 =?utf-8?B?Y20wQ3AvaG92UG5qUmJ5MGp3OERtaUtyb3o4UjMvT21DNWdDNkZOVW5ibStj?=
 =?utf-8?B?R1oxRFA4SVVsalhGUGw4Y2FZYVhWRjJlYVpsZjNoUGdia1NvNjhBVUhmTWhZ?=
 =?utf-8?B?TzQ4OHBkV3VZdXp5NTA3UCtzOHA0ZHJrZXJDMW9MenlRMXJQMTJibHNKY1FQ?=
 =?utf-8?B?aWF5WklFdGZRR0dyeGVkc05FbzZqRTdxZERMSVdWV2ZmUkVRY0NDQVZRd3NM?=
 =?utf-8?B?elZGaUc2ZStLT3lKYmpyZ0JFa3BmMVdzOTl3cy9VRm0ySnRXOVNvd2pkWVRq?=
 =?utf-8?B?UklacERGbFZ6M1B0TUJkUnM0U2plNnVPazNpU0JvU3FHelJyT1ZYckdnd1d1?=
 =?utf-8?B?RFArV3FVTGVrY05kS3M4UUlRODhkUmt5Mjc1VlpIbFJUSEdtRHd4V1RRU2sr?=
 =?utf-8?B?eXliKy9UNWRxS0RpWkZaZVUxVnhncEtqZXoxbG5mYkM4T0JvbkpRMXdxZ3NM?=
 =?utf-8?B?bFl6ZUlaU3lBa25KZERGd0JhNW1QZ3RHVGlWbDJlOU0yNElxWU1pV2N0b3Vk?=
 =?utf-8?B?cVh4L1k2UERwUFZzZHQ3R0RONXZjVUdGMFJuanVjV1A2R3Z4bnpYM2tWczRO?=
 =?utf-8?B?eTNVek5qUngrdXo1WDNpOVhaQVdNVFlWemhmWHZGZnIrbHdDQWtrSWZEdWU4?=
 =?utf-8?B?YzlOS2xXTEdsT21Pc3dhblRmcHM1dXNvRUQyUCtTYjhNdFltaUpZTGFSaitX?=
 =?utf-8?B?VlNVU0lSZ3l5SkptSnl2R3RYNjhva1JxeWZnRjNUUmxUME5XK2dPd1hkRFdG?=
 =?utf-8?B?R0Z5UDB1aTdXZFZYR2JuTUJ4MGZEdXJXWnZQMHljMTV1bHFydmM2YmFuMmpF?=
 =?utf-8?B?NWo0WTRXRk42b0NUYSs4aHh3dWtyczMwbDNZS2hUd1ozY0k1L3FtSkh1RFJ6?=
 =?utf-8?B?bzNRSXlSWTZOZzBQbkJIUkk1SnFjSTVSWG9Nbzd4VXpnMGUxby9DOWc1S2li?=
 =?utf-8?B?WUhwNmppeFR3eGxEakJ5aWloVWJMOUpYYlZ6TlFscUVPOTQwYnlXOVVmcGRn?=
 =?utf-8?B?d3dlTExLdnF2bW13TEVMbkRIZXhIRWg2S01RTytVeDB5eWR2NU5oN2hSbEg1?=
 =?utf-8?B?SWxiN2Zka1M0YWMrMzNWSXRodWVJR3B5WFRDdW1QZ1JUVUFJWkR6S3o1SEFs?=
 =?utf-8?B?aXBDWjVEdjVYdHBpWVczdlEzNXlZeW8zRFZ0U1ptNS8yVFhTMmZZVkE2QlpN?=
 =?utf-8?B?bTR2RXR0c3hLSGhHY3FYUFk4UkFHT3VZWmI3M2ZhRTBJTmdJTGFpNWlOWU0v?=
 =?utf-8?B?T0JCU1k1WkhuYm1lUlR3dEsyT0cwWGNkaE9NUUFiNmdIQXB6WFg0QlhQcVl0?=
 =?utf-8?B?U29TNHhOV2FZQjYrZjRRVGUxWnhPVld3ZFBTVGNiemJWQ2MyZ1R1bjhkWnJY?=
 =?utf-8?B?dnhnVjlWVnVBcGNObVVKcTEvUkRyT05mVW4yeTZKVlhKRkM4MzdySjZyWHVO?=
 =?utf-8?B?aUVSSW5sbGM2QjUzK2lVRGZnWjIyNzc0N1RUdVl1ZGhmRmg0SERXdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86c1437-e1f1-4c4f-d866-08deadc133f5
X-MS-Exchange-CrossTenant-AuthSource: PA6PR08MB10708.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 11:50:44.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Omus2T0Zhv/JRylVAm8aXf94S9x0KESFFLRbjUKTzmxp3Tr5hEnW66i4gD5GBsyEstACcla0PEHc3Z7Rbg6XJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9914
X-Rspamd-Queue-Id: B9A624FF80F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13089-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,virtuozzo.com:mid,virtuozzo.com:dkim]
X-Rspamd-Action: no action

On 5/7/26 15:31, Peter Oberparleiter wrote:
> On 28.04.2026 22:56, Arnd Bergmann wrote:
...
> 
> I can see multiple approaches to address this issue:
> 
> 1. Drop the patch
>     => not preferred - crash would still remain, and the consistency
>     improvements would be lost
> 2. Make -fprofile-update dependent on !COMPILE_TEST
>     => would enable randconfig compiles with COMPILE_TEST=y
> 3. Make -fprofile-update dependent on the result of a test-compile of a
>     user space test program (not sure if there is an easier way to
>     determine whether built-in atomic ops are available for the gcov
>     type)
>     => would enable fix + improvements for all environments, where
>     they are supported, but requires slightly more complex changes in
>     linux/Makefile
> 4. Provide wrappers for GCC libatomic => kernel atomic functions
>     => would enable fix + improvements for GCOV users on all systems
>     But: bigger change + linker errors mentioned above suggest that
>     GCC libatomic function names may be arch specific which makes this
>     approach more complex
> 
> I tend towards option 3 or 2, but I'm also open for other ideas.
> 
> @Konstantin Khorenko: would you be willing to work on this as the author
> of the original fix?


Peter, Arnd,

Thank you very much for taking a look here.

I'll work on option 3 (compile-time check).

If i understand this correctly the idea is to verify at build time
whether the compiler actually inlines 64-bit atomic increments or
emits calls to libatomic helpers, and only add
-fprofile-update=prefer-atomic when it's safe.

I did a quick test: with GCC 14.2.1 in -m32 mode (i386 target), 64-bit
atomics are fully inlined via lock cmpxchg8b - no __atomic_fetch_add_8
call is generated.

So this might actually be a GCC-16 regression in codegen rather than
an inherent architecture limitation.

I'm currently rebuilding GCC trunk to verify.

Arnd,
could you please share the two .config files that triggered the link
failures (the x86_64 one with __atomic_fetch_add_8 and the aarch64 one
with __aarch64_ldadd8_relax)?
That could make my life a bit easier. :)


Thank you,
Konstantin



