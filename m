Return-Path: <linux-kbuild+bounces-13090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHQ3H5VG/2mo4AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13090-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 16:37:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ACB500175
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 16:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C539C300B636
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 14:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543021A2392;
	Sat,  9 May 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="i/fC+J4g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020112.outbound.protection.outlook.com [52.101.69.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837801E9B37;
	Sat,  9 May 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337426; cv=fail; b=merWvE7Vkd9O2Rf4068v8Z//vOKQ15o9hmIX38tHl0nHUutEopgyfnMT255VC1nYOsV0Vu1RaLMP+uxTRudGFDMXG5QhEdl6nwUF140rYO43FxAqCBbVYXD5jhxbhfrhX/O3RtyxrbBGqqY6hA04rMI3ylm6VfQ1Coyr3/Sthdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337426; c=relaxed/simple;
	bh=u1Stzp1Mk0D0lekMPvyXLPwhdm9AxjZOn6/HpfrPAIg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YEfhdg5992H1O+H8cjmys9yne8np5VgD+DkiOEz4Lt/4mJnQ2Om1kFfkKGQp9Jq02T2/iCINDffaYRcWhZ3hhFoYwsxrKBM7dE10nwz3pa/DazGyjOoksA2VjaqbRGMbMkD9rhdRDItBu18QgPhl89VJDKmr/XvjdfmeauMUpeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=i/fC+J4g; arc=fail smtp.client-ip=52.101.69.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGR5Ub+CVceahgi2zR5x0Ie7hhY2OIn0RCsjDeUA+yrBXaruBJWd7oflJ9lgO5t3WmrXQUA33AmhsHbIvZ8cSlGf4Yb2d10wXH4AXcRmkJLPj5sv1tGDGkfnO7/zWMcfg8yywoulWevvlbG7fE7kQGG4AkdIEpfaUSdcHDwgfQLaYwmsxwgqF0h8rPYecPOxYz4WRZv6Y4Rzivqycc4x9+EoMrnnLztwU5kjfXNrEB6J8+qb9mGGjvM3zo6P/TtYCZ0E6MVXbe7X/YdTd1ptTQSI6eHA1pTd4OlHfJ25BO8KQXHj3Yol/rP9j8+hGxdS0bXztkddJPyb7+p9/cCWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzYTBa1k6yTZDC19sdpODrk/INxLmSLIikM8PBdRqtQ=;
 b=k2uxVtvYSTi8KuJXzlxwrC0XyTejY2tmZ3EWB+v1zZIDdA0LpOAsIi3PQU65hJChNN1Npr1yPwSVdqykaR1zDTNfng7iciQIqjwdAT0nFGU5kmwLlyczi5U9WSGAARifpXQ8QOfZu03sMYeJyMUs7QIls1Kq0UtU0vOrzac9jlLUfcbuEiv0CuAMmU19WyddRPT2KhH9ZOlbji3PeZtXIrOeH1lBQ2ZOJnp2Q/a5So2nVjfi31zUebxlgLDqTmHVsWqjpjqZurAIydJ7Ma5gReg9zVGnQlb0T1fBCmibDC29RppnEk6tNH4fGHbmAeu2WWiU9axMOncYPlC/OvX4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzYTBa1k6yTZDC19sdpODrk/INxLmSLIikM8PBdRqtQ=;
 b=i/fC+J4gLQryv2/RZc4caRHCRPzZEwZrdRrsktmSYkkwHpnYiUeguy5coHv2ncGqN8sCiRoIu4d/+MbzPFdcwaWnHqnNKbO4V82Ik0JuLgqqUQePAsZjvFbX8XxGOP+7UJ0LczvcNG1K1erPpCQLYEZJMlB2NlfG3KIEfWA7cCH6FusZ0IHFwI1o+htKfXhfvL3Aegcw3kkS6ZMFGD26F+OtLMvnJ1ue0T5kPp2zyz2DOwC2mAoINUXpWMhMCWHXPJI0GyK3wC1aaBV6EHb5dZphdQWIZM9ca/l+PcyttY8j2ozh1YR7wjORi7yOcTertNOOt/DAWs0O1NrqeSdyPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20) by GV2PR08MB8145.eurprd08.prod.outlook.com
 (2603:10a6:150:78::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 14:36:59 +0000
Received: from PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a]) by PA6PR08MB10708.eurprd08.prod.outlook.com
 ([fe80::1999:c6db:dc55:494a%6]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 14:36:59 +0000
Message-ID: <7e14b9a0-6166-4d2e-9b99-c707d1eb829b@virtuozzo.com>
Date: Sat, 9 May 2026 16:36:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
From: Konstantin Khorenko <khorenko@virtuozzo.com>
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
 <dca5a1ce-feb3-420a-b452-52707373dd61@virtuozzo.com>
Content-Language: en-US, ru, sr
In-Reply-To: <dca5a1ce-feb3-420a-b452-52707373dd61@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0049.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::22) To PA6PR08MB10708.eurprd08.prod.outlook.com
 (2603:10a6:102:3c7::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR08MB10708:EE_|GV2PR08MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 34dc768d-2d02-4a9e-1d2d-08deadd86d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UvHA8TzwD9T+HFehI3Q57kmXo+XbOXWKhGvf3qvfXcA+tr3Lx1EurCc1EU0X2fos7rxReQC7EomwpwvFtWdrh/dfWOB3QW7MJWcx1xUaQi8xWVJao4rLzgCgDPks6pLAzLv4cuhB3MfYpm02CMY3LzNa/KNW3fmvGYXCwQ8b/gJqBBEhKcH8HoWjbinxYl46mf3R/WvUCs9IKZ+NjuZLjdl7l4eVDQERddnxyYZ8ZwZRdcCd237lBCAnXOMNT87qUuEVVHcPaRLuXU8U1YS3Cs2kIMwR6+WnYm0C143wouqx1lZpK398G2f7rSC8kt6fi5QCKQsTnLWafCsrTkQ5Ot1G0hHl9AOoWDJoyAoWqIE296mnibWz/1+6ljY7VzADp3ksFKV0nLORTrT/HbPMRsAVV0Ae04VSIm72smZlCb3geQqcuCyJAkbIB4riYHbmoEpaifLeCgbWHvTLhyDzUin85PhLP4TekYEVh1W/34L41ft+/+uC7tvmb4/JU+kVolv93hxg7MSegl3+Bq/PW+6mUe5MMmaEdWRYqSvTB7ykXJ+VNpspudPlhgDRcSsJRHRr+w3+IPlv2tHhoKDjkBgrhy44YjfSbN+U80iLbpp4OzEQt0MJHIn7i5xvvnqbMFnm1vJqcDLxvbzhUUi8e0Us3rqRcWxyOVxfNEHhRqp1pLCzrTgWgYwtY040s37U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10708.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alFHZ2gyMzhjbUxDWC90amNMTEEvdmpYK1dDck1DdjBkTmJFNUJScHZaS1p3?=
 =?utf-8?B?ZFkvOUhiOEdHRkhWVkp0eG1UbFc2TWZnNXlPeEUzVE9idXFZazI3d1JpMnZq?=
 =?utf-8?B?YzFxMktXdjNINmxUd1lPekxYWlN3QWIzMjBkVDZZYzc1eXNoRG9wYjAxS05T?=
 =?utf-8?B?RTBQVnBPa09qUlFvM0VxMVpDNHlWVmpwc095TUdmb085eHFOc2xWUUMyUGN6?=
 =?utf-8?B?Q1E3L3IxbFpVMDNlRGR6U2NOcldtZE83N3BBNEVxaW1IdlBYZnpLRTZ0Q2wv?=
 =?utf-8?B?MTF4TFlCbjZqNVBSMDFzZ3hqcjRWbnplY2xpM28zdEQ3cVA2Y1gzNWJ1aXpZ?=
 =?utf-8?B?TXA0Vk1CRm5FVW5tQkJya2djQ3RzMitMeFVVSEo5VGhDUHFDUUdMcDFkOVE1?=
 =?utf-8?B?NWxmZGRzS25NQWt2b0w4N21POHRyOTl4ZXowWlFnWTVaTzh1Q09kNGxMSVB6?=
 =?utf-8?B?eDhsTkloc3BKU1ZPbTV5STg1U2NseFVxeDI2NS9xR3Z0UHNibzFmQjEyeDV6?=
 =?utf-8?B?eVVqeS82emNaVDUvQkRsYVZjUkFrK1I5RmpIWmJkQklFVVdNVW0rN0Z6d29n?=
 =?utf-8?B?aWpQTjFnekpJa3M0eElzb1pWbFNiYVppRTEwcTRmV1Q0Qk9XRUwzTUxyOFhu?=
 =?utf-8?B?MFNUQkx3VFlINnR0M1cyZHorcTQ2Mm5kYlVJWmd6bTVzODhVQ204Y0JjblIy?=
 =?utf-8?B?Y0EzTjNYcTFFNjluTTRmdXBjQWdGZlpQQVJRKzFhZ2JVRWF6Z1lIcUNzYnFt?=
 =?utf-8?B?TytlYWJCeEozSXlPMEFZUDhab2I0NC9JR2txZ2l5VVY5RDBTa3NCOXhLSnhs?=
 =?utf-8?B?bDFCL1N6UWs3eWd3TG5yZnNBSkJIYmMzWlE1anJEVjU5YURVWDAvM2lOdjZm?=
 =?utf-8?B?bFlvRWdNN2pzTnczZE51QXh5RDJFb09kRzBmQTZid0ZMT3hXTUxSUEZUYnhK?=
 =?utf-8?B?alBtUUEvcTFBdmdLaGJLSkZ0Ym1QTVZpWExBdDVBMXJsdUZyQWhJeHorRDJm?=
 =?utf-8?B?NmxUbVg0a0UzNStaQkNGZ1d5UGp1S2x4aFpjWHY3ZTVscXRQekEvOEg0OWJK?=
 =?utf-8?B?WXM5Yk5IMzhkMXRFUm5VRkxMdGVzazlEcjJPQ3Z2UkNYSUpmNHE3c2RKRml1?=
 =?utf-8?B?cWJXQzIxMFlJK0h5bTg4ZHhmU3VMRU11WHg3Ris3VS9HclN1SllxRis5a0NK?=
 =?utf-8?B?a3FJaURMeUdYM1lZSTZEVHNia3FFT1NnWmI0aDZaSWVqelIrQ3NRUHg0K3Ft?=
 =?utf-8?B?T3duWXU1K2xsUE1IcVJxUzJLVmpOa0srSXMyUk1weFJxKzg5N01hKzRKVFlC?=
 =?utf-8?B?S2t1OERDbTBpT0xtM0RXOFEvUXpMd0NlYStzQVNFZVNuVFg2RXJSTVR3dmNK?=
 =?utf-8?B?cmVrZiswS0FYK0d0TnhUUHk1UDltYzZ2OHhZUERtNXpXYkt2azYwSExYeXRq?=
 =?utf-8?B?WDBreEFXdVYvL2l6K25ldjNWK0E0Vm9Rb3EwS0RVRzFYTFBSYjQvVXhKSFZ1?=
 =?utf-8?B?S2lzdlMwMXEvQzVuMEEwLzhxYUw0TzBub25TNnYyeXJ3S0kyRHdWQUpvVUlZ?=
 =?utf-8?B?eUN6blloYWJlL041bG80aFBDcW9acjdnWmNUcWZpb0k2Vll2dFhmUnhWc1pY?=
 =?utf-8?B?MVJGZlZLS0pqdXhGeDNJK0JDSm9JVTRUWlY1KzhmeEpVN1NCNUk2a0prbjFn?=
 =?utf-8?B?blBvR0V0aloveVpBWDhYeDlLM1U2eEorbzhTWGNaZmlmUFArUFVyaFpGWE1Y?=
 =?utf-8?B?eGovZUFySmZGOXNoUG05b1pCTkppSHMzc2FKN3o1ZjdKMXR4Z05IT0dlUmVi?=
 =?utf-8?B?Umxjd2VnVFRBZW9ZUUJxV2hFVThENjF1Q2krK2FkcXBXNzlRYnlGWXV0WmNu?=
 =?utf-8?B?Yi8waDdyUEpkQ1JuZllnV0lPRkZBdzBUMzdpM082VlN5WmVDblhvTGxUNGtM?=
 =?utf-8?B?ek5RUWppc0ZjWm11RmJFSG9UYjJScTdwcUc5cXdKMjd6RVVza0ZOUkxGdW5G?=
 =?utf-8?B?Y2hxSXMyMXJ2NFB3M1RNbi9Cc3FaZUdZYXphTmM5ZVZFcUpPZnlVaHd2cEhY?=
 =?utf-8?B?NUhPOHhzSFR1Ni80TGluN3ZWK3NmaW9qRFJqa0dwSUp4cDBVYzE0elFHZWEr?=
 =?utf-8?B?TlZsZ0JxandrYjJmYWhVTHN3c3hULzVxcU5WOHJnSVFCNnJVZEQxUE1wdW16?=
 =?utf-8?B?Wi93L3JRdnVicGNVbjZvMjdBMXd3ajkxUGVNaGlVS3ZZRVcwVUZNbUJuV1Zh?=
 =?utf-8?B?aUg5R09COWJHTXh5eVBqcnB6dWF3MXhuM09FS3NnR0VmQ3FHbE1QR2FMNTV2?=
 =?utf-8?B?Wi8yMzk4TGdaM1ZqM3hvOEoxRTB0TGxWc0VKQ0dabE1ncXFPOHZKdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dc768d-2d02-4a9e-1d2d-08deadd86d90
X-MS-Exchange-CrossTenant-AuthSource: PA6PR08MB10708.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 14:36:59.7210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ht50NXsH19RzqV8lJ6jvSI/AqrK/Wog+Z6VmbpMZiiaDQ17yONJh9Ja8u/k4xyIe+Z2p0ICzsyDz0m7MePE4WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8145
X-Rspamd-Queue-Id: A8ACB500175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13090-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/9/26 13:50, Konstantin Khorenko wrote:
...
> 
> Arnd,
> could you please share the two .config files that triggered the link
> failures (the x86_64 one with __atomic_fetch_add_8 and the aarch64 one
> with __aarch64_ldadd8_relax)?
> That could make my life a bit easier. :)

Please, disregard my request, already found robot reports with links to configs.

Sent v3 with "option 3" implemented already.


Thank you,
Konstantin

