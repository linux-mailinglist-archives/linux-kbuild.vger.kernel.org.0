Return-Path: <linux-kbuild+bounces-12859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL/YOQo96WmEWQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12859-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 23:26:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31844AE79
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 23:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D56A9307940A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 21:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7462D8DDF;
	Wed, 22 Apr 2026 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="VvIyvXTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022126.outbound.protection.outlook.com [52.101.66.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7211223DFF;
	Wed, 22 Apr 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776893191; cv=fail; b=H2ebWYTmUaNUpcAmhbTiBKUHw1GErC+ry1zQFH6ylqN5jrvJqZECuAGAdhC0HJVksHSZ7i2Qf0jLM3V7ShtqoklAfXf3ibQFH7wIa7Jb0lTYRocyRiUnpUR/zRSwVezNWPoxagVdpn4OttxOs7V5m5gViXQGEQwAupN4bdMhCEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776893191; c=relaxed/simple;
	bh=FVmRJSjxJnO7S1Plm5QEiCHocfrYrG1XcznoZ/T3VRY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hx9mPOG5rbeUb9CgDRIGk0eH6I7jsyY0G3zCiEpQmUVoqd4N4xpxs5lHWDqPVDJjr78WK87kh4VFe+rfCq7myzP095dZ7C2gnXJe+Tjg265SmrYHaEY9/Qi4jEf6DDfkbfQkmkzvKgdsfDmzmp0M/RFhokx6ZadKGAQ2Aj5xhFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=VvIyvXTl; arc=fail smtp.client-ip=52.101.66.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LV8rC1o6LM7UY/88Y7p98xTrMzUrr/FQQBRQyooix0aRtrz47UpK9rE1iJRUx+9qh+lCOcLguje/QOUN5X4Lg9oLt23t8TatUAaNKVy3N+98SruwEL/6e541aG792HPQHxecqezbRjujufXZ0ns7ZX6ErZzgn8tnATvBNlN9kYS41P7V9/tDAuszUBkO68gukIMSBNkMZ1kBE5YxjCrZIxQGx8iGm5nEYZKNnnWLRYXfk96aBVK/Ijrt3gYtxp/kkSU+Pu9xpoUbcxGVFMDxfTOUP0EtwBo8IJKQUc1Cemt6WJJVEprH0TPVrSiguNx7GPD42XOAxWpbA/CgvSX2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/x+Gh9Pw5ebV/FTqcgdXIB6mfhejpQS68ICnZFNn+Q=;
 b=Exyi2k97WnP4Kc2yZFuoqUL4LPk20B+qzBszdhqdnjbBeYuxTFCcJNiFRz5+dDoq3yslcGQo86UaiptaiJ+xTPY/UatKt3TuqPLvOqvzUqmz6KThc1NkmpEHPos1XT7LsukIDvmGbAbelF9j4dS0u7mjOYoKo5si+IsWXXGSu16zxigSQpFuYYNadlQ9hQev6BtKwizBS1JlggWmNvku8qaiy4WShFRUTLq9vH4Du7ubw3vZAxjd2qJOxvW73ea7aXbOvWHXslBgSiV4S1ELdh+3PL2dG/axGszRqdRMG4PEcqUWmiihqqpjGQ0FTAWqgtZr6RORGZ2tEjoLOQ8Pwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/x+Gh9Pw5ebV/FTqcgdXIB6mfhejpQS68ICnZFNn+Q=;
 b=VvIyvXTljnOb1dvuCTR1OKEw5hYxHJZMmmXq+xMVyfeTgl11EClN17yNCKzjw2dsYrsOTwAj0NcQPNCb5WtVr8s+pqjEdKCJltG+Y1D7Cjs36mtfOVw+FshL7XhtXajxOvgM7HXmyCtHfCtGtxf1+GgrvyCoj6FKmo9xyDT2iUacYfMN8bPEYccBgfm4Ns/qQICu6FeBZLBt6WRprMebRSHKCAhhCOXNpNyEVIpouu1YbAI7TD4u3fCsi87DAvxabKBYbyH/3khc9DONVJLgAhA7Vh8thF9KdOVOtTkuCBKAMWvI3H2CG3WzPke9x4sFIQfGiXyy+x89CL621w/VPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from GV1PR08MB10717.eurprd08.prod.outlook.com
 (2603:10a6:150:170::16) by AS8PR08MB6023.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 21:26:24 +0000
Received: from GV1PR08MB10717.eurprd08.prod.outlook.com
 ([fe80::858c:102:e64b:eeca]) by GV1PR08MB10717.eurprd08.prod.outlook.com
 ([fe80::858c:102:e64b:eeca%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 21:26:23 +0000
Message-ID: <f181b798-eedd-493e-bb0f-7434198c4f3a@virtuozzo.com>
Date: Wed, 22 Apr 2026 23:26:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
To: Peter Oberparleiter <oberpar@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
Content-Language: en-US, ru, sr
From: Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20260422125112.3583649-2-khorenko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To GV1PR08MB10717.eurprd08.prod.outlook.com
 (2603:10a6:150:170::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10717:EE_|AS8PR08MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af7eada-d332-4fd3-fb2a-08dea0b5cdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	g55ixj56RK9tqtFz164eUhzTi0VvsXHYk27zPamLTANS+XVP6uuPeN7wOC0kiedVkCisOKrqV1edEsQbUb3wgVDZNTJOZ2o2KKoUhTJ3XJSSZm4sMH42lA8mIErh3Zja3L0VwGOuhLs4I5gvuj8gJitzpSNo6i2dh5CDsKsgUoP7SIF6xk0B42Dnki8II4nprZn40GHdwLU8wJOd4gbCdGq9LpItYCcUv+OkcHknkbsZoFVDyQvjL80MWcqdh3/EBPUoDIhkU0+j6N8K+/YeTUVmF6WeI+8VB0V7DAC3LDUnxbwWBiSnHV3s9Nh3Yo2YaUzmDKeNC2kjYXc3kXVnX3xcavdJ9PvWAjHb4w85YCRQbzkHuS3BvNLyD1H0UWO7GEdkEJ1UrGAMHLy1VCKzo+qd0/JsBpCTgTjrDimrHcmxjn0HqIR3pMQ6r7E9V+X+qRGkoVRLMeCTu/Dd4ySrbVXCQztAAWzDC+OeDHoTcTfgRZlEF+8EKIHOTXtAQvisyFWL3Af5153KvT8NIp52xuPVrkJvE/oq6tMK7upqa/KdfghL3lBmStTw3w6YD8cnV3bPdFBsqV7pnwSr+gf8BRS2QObQoaoSYCtlQ6d/6b5zDLmUxDs4oiBRmQeuF3/FCXlZO3n3KfR9WesXh5oSGacRUaZl5Y7ECBL9iR/OCDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10717.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWFWblF2T3hIbFZPQ09yRFY3c1g2aWFrTy9rYmYzUDdzakU1ZEd4eUpLTFJw?=
 =?utf-8?B?RmlZVUUvNmFOMHRETDFLVHRNZzVySVlSTFowTlZubzhNYVQ0TEVWYmdxaEYx?=
 =?utf-8?B?K3NteGVNZXMrTFQxTHo0WWlpaDFNcE5oTTI2NXcwelNPeFZOdTUrQWZDdHdk?=
 =?utf-8?B?OHhUOWVraFJMVDhhRUdWNkptVmJ2WEIyS3p4VEIvM3o0RWVJRWhremRuM3VZ?=
 =?utf-8?B?bFBhL1N1Q2RxM0VLTkE4NW5HRWRIci83aUJJT2JoZm9pUCtrbm81VFdocGFL?=
 =?utf-8?B?V2VRSHdjdGRjbVBGcXZTMm5BUHhHblZKTFVTeUJtQTZON25OSFIvSjN5cWpY?=
 =?utf-8?B?bnVkVWRUcjBRSEhKUVptbEdsbFV5a05NdjRZc3MvWUdUMU5SN002WlVNQk9v?=
 =?utf-8?B?UWluRUNCY0NVK2cxQUlXcHl6NW5WN1NhVVJpUXVEZFhzeUU2MzYzeForMjBz?=
 =?utf-8?B?eDg2WEtQMVpKTGJkYVVHOS9QWDhzVXlVdlZUeTdVWGFSckJZM0xNTng0V0FS?=
 =?utf-8?B?dk1HQUF5RHI1K0Y2MTYzYjFHck1ZL21kb0tCZVM5YVA1YjMxZGZtamhqY0Jj?=
 =?utf-8?B?Z2k2bDJrZGZ3VUVYeDdMdW0zVTZ5bHNJNW1YejFTVlEycldtdUtFYTR3VEtY?=
 =?utf-8?B?QnJ5Y1h1T3hqWHdiYlZ1aWw2VWk2WTgvSEZJbS9Yb2hJd2ZBWG1nMngxYUwx?=
 =?utf-8?B?RWhGQWovd2pBMUZENVZjYVR4SG4zRERTMlJHQkZnNXF3bWVGQWdNSDJHQ2F3?=
 =?utf-8?B?TmFkcVF5elNxdTRhYnBNNTd0TmxYYWVIcVVTZVd4eU5PYi9weXJBbjZOcUM5?=
 =?utf-8?B?ZWpKU3p0OGxvdVhpS0VrYWVvelBib3NEak90NFYxNVlaVEx1NGZqZHlibEF1?=
 =?utf-8?B?NFlmTmp5OXlaSmFsZGc4cTRoVklnWUZBY0xMVWo0L0t6RFEveUloem9VQUkw?=
 =?utf-8?B?TVp1dkp4Tkl5WElOZzdkclNMTDBET0x0WE5KTHpRb0JBNVFxOUkvRk9tVnkv?=
 =?utf-8?B?enZVTHVUVXYzZFZrWUR1SmhPV3F5RHZQRE9ReDhkamduSUlOUmZ6ZVI1K0xI?=
 =?utf-8?B?dXFuUE1mRWpJOGVpZWN3QVdsVkRFZU5aZ2Q5YnB3SXpvY1lPSXRKdk9YbStO?=
 =?utf-8?B?OWMvaVorZ0R1WlJXaFMrZ2lWc3E0dzVMT0tzSTgzOWxHcWtIRUJ2RmRaUnFM?=
 =?utf-8?B?L2FJYXRkUXZxLzRSNTVlVmxLN255akpDNFJraGdIZDhlN2hTRUZDVVJVNHNC?=
 =?utf-8?B?aVNBcDRoa0FqTnJ1Znk5bEVEdmNHY08wSlJPN2dyWVp2aGtqVkViK0NKaStx?=
 =?utf-8?B?QVZDOXhxdEVqVDBWY2I4ZytCQnZlYTI1L09mbG1kN0RUdU9TSkZOM3p1bnVm?=
 =?utf-8?B?ZlpDYmRxaGtHTUpYb09Ja3piVEIxZko1Z0t6YUYvZEQrYmYvc0JhajYzQjFh?=
 =?utf-8?B?czQyZ1I0OTN3aGQ4R1BzaElqMjRzNndRbWo3bnBZdXdqcVlTcW8yZU9HREVw?=
 =?utf-8?B?azRyWVJnT25IVDgwRTRwbzJTWWlRUEo0NW1QSHFoMFE1K0dFRk1WTDh4SVln?=
 =?utf-8?B?OEZrNnk3ak9udEs2bzlJSGdsZ0V6Nk5YMFVxbWxBbGFoMkVQZWNrNm1XTjZ5?=
 =?utf-8?B?RnNmaG1vZnZJK1dla1IvOFdjTWllU2ZxOWs5ancrOUJXMk9OOUJ6ZVU0U2N6?=
 =?utf-8?B?ZXRwZm92bFFmL1QvcUNXZGVvUy93UkVvMGs3amhaVHdYWm1CYWdYQnhjSHJ3?=
 =?utf-8?B?dGwzUnFoaVpEditGZURYZXFpV3doOGtrY2Y4Y0Z2NFZ6WExURStnbzRwZThn?=
 =?utf-8?B?VmN4MEkvVkhMUHh2eG90TjRGdVhOREp4cWNJOGEyU3NZTVlCRUlhM0hXd2JV?=
 =?utf-8?B?YWxJVDdUQldzSjh2enRYR0ZpR284a00yQzlob0hRSUN5NkUzZGNmYkE5b1Vt?=
 =?utf-8?B?R2o3bWYzQXNVZSs0Vm0rWEIvNkpKWXJoekZTOXRUT0hOdjcvU04yUnlJK2Vh?=
 =?utf-8?B?SjdodkJ0SFByeS9QYWRpb1FlSUI3dDYycEFWN0dLNTF5WmVUU0JORHB6Qlcy?=
 =?utf-8?B?MzJqNSt3UmE2aEFhM2FxM0F0NXNvZEY2eDlFdHVsZU9XZVdSNmdzY3R1Tm1p?=
 =?utf-8?B?K0FyTnkvUEhTR3dOQVdiSytNVUJoc3B6Ylc1RnJTV3hrWnBEYzQvbWNidlI3?=
 =?utf-8?B?UFRhWGRXZ20rSE9Ob2RlM3ZNKzJXQytya0pzZGRyaERwUk5USVRmUWJsd2Y1?=
 =?utf-8?B?cmlKYnFaTTJzL2RaZS8zL3JFTFhaejRXQUQxUExHM2QxYmJERUp0SXBhTFg2?=
 =?utf-8?B?aS9DdmlSSmlqd1oySkhsU3RkVTJDREloMzJKNVRKaXBVL0ZPay9Cdz09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af7eada-d332-4fd3-fb2a-08dea0b5cdd2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10717.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 21:26:23.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvFi+PaQnJJEAwRNgWy6XB3RjDqgkFWc9UaqbAjuiJYwyUvsEQsETBcPgfBPHLHXsuWFjMmxdk/vGv8wBS9uaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-12859-lists,linux-kbuild=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[virtuozzo.com:+]
X-Rspamd-Queue-Id: 2A31844AE79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://sashiko.dev/#/patchset/20260422125112.3583649-1-khorenko%40virtuozzo.com

 > The kernel supports gcc versions down to 8.1.0, but the -fprofile-update=prefer-atomic compiler 
flag was introduced in gcc 11.


-fprofile-update=prefer-atomic has been available since GCC 7.1.0 (May 2017).

https://github.com/gcc-mirror/gcc/blob/releases/gcc-7.1.0/gcc/common.opt#L1981-L1995
<<<<<<<<<<<<<<<<<
         EnumValue
         Enum(profile_update) String(prefer-atomic) Value(PROFILE_UPDATE_PREFER_ATOMIC)
 >>>>>>>>>>>>>>>>>

So any GCC that can build the current kernel accepts -fprofile-update=prefer-atomic.

--
Best regards,

Konstantin Khorenko,
Virtuozzo Linux Kernel Team


