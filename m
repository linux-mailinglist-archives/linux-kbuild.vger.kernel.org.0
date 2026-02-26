Return-Path: <linux-kbuild+bounces-11447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMGHHJscoGmzfgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11447-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 11:12:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416E1A414D
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 11:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96D143019C98
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42663A4F30;
	Thu, 26 Feb 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UGj4zlOq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC43A63F9;
	Thu, 26 Feb 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100754; cv=fail; b=euDdgS7clXqWwrLWaDo9TwFRBxjHYUEodkYckVusG2LDN3ba5RvjJiIwQE41sgQ/kwJ7PoFsHP/J4sytkVKHU76qvskR1k/ros+Uxeqm830i0IM9sU9i0OJkCZdhTEL9Rp99wLdHOzy3ajP4S3mEj8wbEQ7cbh1qyySSD91QHP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100754; c=relaxed/simple;
	bh=UIhskOSN5yHzv47rhyDWsb2yczPXxV72RpPUBDw5h9c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Y9tSchnUfUiZJJHK9SpVHg1ZGhlWwAp6qwx2zpLWqrWalTyjsYTYDyXCfs3DvEuPQpKiUGs/cejUTqaLzPoDPzSk1AdW4ydl0MLPn8o8eWFFxIdX1rDaGyYnnScdLU/KFix1idu7AzFMe2UsczDCiDfbzpzyOekikWctFiEBXlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UGj4zlOq; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKV6RSlf0D1JIAgBdmSgkNwUFHPi9ZZvbaIBtb+rR6sWJx8vEb1VoZlDa9cQYvGhbpHykRkjKzudZBbOymuZl+0mQnml5xMbLwD4crWcyCzErj3u0MC0QDghGGnX9QJJitC0PWKRlmHD4udkVwNrEQImVBMZuCJ6cyBqYxTnkZ9NQJH3DxfX+T2sdQ4JM+TZy5fUUPORgzIfXrdIQd6Gvo+PDh0ubExsA3eybqcMoNxPT742ZmfwMON8oDXOOkoXdwM8DbICxlnn4k0z4Mevic4yDjE+IrDWBAP8Lb55XvcdpOSV+euGIvQ7gB6A+9rlrBhmCjz4zhRQjphRdGfTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYGvTSYX/Mu44IEN427AQ/w9RzNwerEM7Uh0E+mBSDc=;
 b=jZbyCvFIqbqsv0zQJiDH4XlxcqnyCb5aC17s8qOGTwwwymD/rAXjmP3gqXDaG2BX6MKmLZ4VN/iIBUh8wcvPZEVORB2qUtmcK/hrIlDNlEeOEkRLHd4NV2EOsiH10vcHxfQQNyJPow13sj2ZTb0nZK/oaDWxvQVkr8Gl6ue6NcnTeEYM8tjpvwvWof5+HHUz996jzDtiOxv3ToVxwhrrVxWA9kg3lYVh0cd3StKFaLmI7mroYMOlIjRdCqqZ6pDgI5scO62q+FoGCZ1W4xkhoxm8HEXwmJAInKoGkyyLV/Of6NME0cYo8aNSUXYFaJdmO1ss4WZs+OljRKwgkXkfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYGvTSYX/Mu44IEN427AQ/w9RzNwerEM7Uh0E+mBSDc=;
 b=UGj4zlOq+9VwMlucQ5sqYRVUJdeOaX+GJPFo7ZSfd4yVe9StK2aDPDMAtq007vnkeHjq9oAoqbIXbd5U31AUmNHtarsUXq0Q6AhcIvY3EMzfJ8Rja5JDGzPDIWkbqPRGO3mrWWve1S4K8Z+z5h4ox7ST+tOp+b78XF2xBiedpJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5883.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:12:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 10:12:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 10:12:27 +0000
Message-Id: <DGOTACILQVSU.1NJCL0KR7O1ET@garyguo.net>
Cc: <linux-kbuild@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: host: use single executable for rustc -C linker
From: "Gary Guo" <gary@garyguo.net>
To: "Mohamad Alsadhan" <mo@sdhn.cc>, <nathan@kernel.org>, <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260225102819.16553-1-mo@sdhn.cc>
In-Reply-To: <20260225102819.16553-1-mo@sdhn.cc>
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2010e9-ba3a-4697-84c9-08de751f8b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	9qHcyIv2gL5bgNIQ9oC8r/onIKuQQu2W1Zx8jfdVgQRYgsKabdUzfhyc/OWxRliklmLoCTK/8ZcpGhUxBGuwpXsn+pjrJ1cf1JH+43MUboyY5fNJZ7xEKVasXJjvvyd/n3nUmsG/xX3zHBt5tkP/DjZ1D353AB6/bC+YJQcvsXpaIN8EDm81NmvG4E2me1ElzXtvr/YtkI55v801ZH1mw0Qj5DH1iorYUw2EAP/uxwJ7JMk05TdntGcksDsEVbUKSr03BQTRtrBj5aahyPDbzfy8zty19j4Aa793wWbrmkWu2NQ72fAQdlZnecUN1w3J6by+PqzRocEqPHzyv4nDogRw1Rx0uw/4waskJoHrLJgXUJVEgwwNq/NEphY23KbyU6RsKZt+nSCMMq6rK/OyBNJOyMlFiykcqOEwCIPkK1UUzCrLgEl1tIMJ6L7CFdgAnYR1Gr9g3+xZN5/1LCLWm82YQFnAtsMUglI5k+JdOIZL+TI788gqnO//1DhCqrbV7BISjcy/WLEqi3K4GsHGNB/Xlr9NkkhZ1kjPsULOL4qhrtgDPJ9nvOOShiHjzqZB+v49B0UmvpJlD8TCC0jGQIHTArJcqLoeiuLT4zu8pYi36p2IX0m2z/+YcLZgTO7GPIiVx5vC7iDl6LSDCvcFdCiBEFvYwPXiXp1bPtvD5D0fFqEnUM8agg5rY6FlI9z6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TThHZTZJWmhoWXVUMWxneTloNlBlVzdMdVpDdzFONnBnVEtqREdESXRoSDRB?=
 =?utf-8?B?UWpseGdBT1pQcVV3c3dPNFMvc3BoTUV0QUx3R1F1cStlaGR4dFFwU2UwdzRR?=
 =?utf-8?B?RUpESHkzOURac2VlSDlBd0pRU1dBeW5KRjg0UllqNHpCQVA4OThESEZrRDgy?=
 =?utf-8?B?dCsxY1BNQTBFdU52ZGtSYmN6aElPV0ZoalNlL1dGcFlWK0w4WG9qMnlheXBt?=
 =?utf-8?B?Z1N4N1NycStESHJGWGNxaWQzRWpwM243dDZza1BCZkxIUERZVFFWeWFmOG4v?=
 =?utf-8?B?OUxZdTlFTThIN1ZFZFVxZm55Z3VjTnFTTHA2eExWdTNIb1NjeTlTcmlJb0pM?=
 =?utf-8?B?cUpXalpZWEVPTUQ2eFhqZmV5REtsRng3aEk1S0hnYmFrRUxnREdjLzdoK3lN?=
 =?utf-8?B?YnVIcEpCbFpSclFlN1pZckQrYi9Db1VJeWVpUktsQkNkZ1k2YnAzWlNUNkFW?=
 =?utf-8?B?VWdZSGU5RXNUbFY1RUgyQ2ZOaXB6cG9COEVPallFMmhkdjRQZjMrZ0Z1QXhE?=
 =?utf-8?B?Wmd3Ykw5ZDEvQ0wwV2NBMGlkSEZjWEczU2J6YjlXRDZ0MElwYjBGVDAyY3Z4?=
 =?utf-8?B?VEFEVHJJU3A3UndwRGh4RVRrWEgyUzlOMFBQWjJ1bE5uYXJtUnRKdE9nY1NW?=
 =?utf-8?B?Um1uSFVLT1BNSXhwWVIrWUhpTkgyclU5Y2Q1N1BsaURyVmpIUlBrWUlDcXFt?=
 =?utf-8?B?MUNaWXVsT3pQQTlOTGdpblpNb1dOejhtK0N3dTlwYkxlMG85d3EyMngvekp6?=
 =?utf-8?B?Z0FHeVpKQW11SXAzc012YWNxVUd0UjRTNEx4bjZheEFWbS9TVW1OV3BHWDhR?=
 =?utf-8?B?WE8wT3pUMXJuanNmTlNubGs2aENMMFprU21vVlRKbEZXMUVmTXcyLzVCQ0pH?=
 =?utf-8?B?ai9SQ3QyMjBIT3IzOHlKb3ZTMDkyZHVidTRraDhWV0VMb2tMVHVtOXNiVG80?=
 =?utf-8?B?bGtOdG9aS1ZKVktCNk9hckJ5R25oUWdlM3ZnN3cvRkhuWVZqWWJBejJuM0p4?=
 =?utf-8?B?VDM4dlVnYkRpcEdJdDkzdmhrTWxrbDJaNlVJTlVkUFNEUXZNV2JrcXljUjli?=
 =?utf-8?B?UmlwSFVPRnZtZDVGa2NVYWFVeW0rM3I4bUJlM0JzeGc3K2JCR2p5Y0szRnVo?=
 =?utf-8?B?Q3c4VFZoVlc0WFB6ajRXc3RCWHI3Q3FsNS9pVTRURy9qR2gxdytVZnFyb3Rh?=
 =?utf-8?B?aHRoMXhFSFJkbm5kd3l6cGJWUTQwOTlQRWhtVG1yd1YrNDZGa29Ib0hpUXNh?=
 =?utf-8?B?NzY5d3FYWE92WENJdWI3d24rTkNnd0JzdDdidjFaZG1yenlnODZrekFtYUFv?=
 =?utf-8?B?RmJ4Q2FhZDlZejNnUVNZMXZMQkpoUW9Jakd2cXN2SXF6YUUxVXg5RlQzN3o1?=
 =?utf-8?B?TXYyeUFxWTRRQnJXWW0rM04zT0hQYThoRGlYdUc2aGRhNW9mT3cxbkxKZEp6?=
 =?utf-8?B?bitGdVhBNHEyZkpSU0tvNDU2bHp4TCtEbnR5Zjk5MTl0Q0FqVU1jSHRBenlz?=
 =?utf-8?B?bnB0V204NVhMSFFwSXdOT0V6OVhOd25oWkxWYjVIbm53dktPOUY1QUgwMWQ2?=
 =?utf-8?B?TVhSZi80UmRDdFpoRlgvY1RXa1REckZna251ay9kSVhyRWRHMWYzQWxrRG00?=
 =?utf-8?B?K3A0WmRNdXVWcWQwWnZjc3F0dG94dXFsYjIydTZQbzJ6WHJ4SGJYM3pLRWNU?=
 =?utf-8?B?aUdNWmF0bHFCMFdIcmprc0p0SFRPNVdXQ3FTMi9seVg4c1ptMXh5R3l5MFB0?=
 =?utf-8?B?a2JVY1hlaVhZSFI3bWRvRGJSOE9RYkJ6U29PdGg0WEZKWTdxenQ2YjVuM3lj?=
 =?utf-8?B?YmhmdWhUOXpvYnhVbUJIeVAwYm04UGY0a1lYWDQ1NU5JT2o4bHdUS1NoWkhU?=
 =?utf-8?B?eVNUR1NrWmZLUml1REJ4cTgwcCtjT2J4SmV2bkMxZWZtbWsxbUhOTis0NjBz?=
 =?utf-8?B?dzdWaVlxN3RIZE1SNGU3bndKNmY3UlJlbUprS2dxbTZQVVM5OHgyWXlxZDBT?=
 =?utf-8?B?aTF3YkEzRVB6K1RQb2dhbmc0eDdtZnIvaC96OCtCZFhlWUt2UkRBa1N4YzYr?=
 =?utf-8?B?WW1nYnFLOTFUalRiMWY5OURxVzJIdHI2MXNCaXdsQWpBWmQraXQ5ZmpMQzJm?=
 =?utf-8?B?VU05Z0grMnhUN2poS0dobVBicnhGT1NtNXN6bklaOTV5K1FIeG5kRTdHTExp?=
 =?utf-8?B?QUgzRjRlakYvbHZwYnZqdDBMeXVaWEd1UVJDQUxZRkMyWks4aU1mdlE3YWV6?=
 =?utf-8?B?MVc1Z0RnVHNOQythSk9nYWg4RVVIcTY2Z3R6OWxtc0ZNUmRDZEljTUdBR1pl?=
 =?utf-8?B?UUVyYWFhZFdUWXI1MHJ3M2lHM0NJQmdLUzNNK1F5TFpYZ1ZWVGRzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2010e9-ba3a-4697-84c9-08de751f8b4e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:12:27.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inVhQmpnjrIbiJkRShCq8R8NzGYE7o0qba3OR3x/mCN8PDezqypdzLEJDOPeALuPZZpU6RGSbZJrQ43Wk7NSGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5883
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11447-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sdhn.cc:email,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 3416E1A414D
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 10:28 AM GMT, Mohamad Alsadhan wrote:
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> -Clinker=3D$(HOSTCC) results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
>
>   error: multiple input filenames provided ...
>
> Use the last word of HOSTCC as the linker executable for host
> Rust tools. This preserves wrapper usage for C host tools while
> ensuring rustc receives a single executable path.

I don't think this is the right fix. Using only the last word is

(1) not what people asks for when they override HOSTCC. When a user ssays "=
call
ccache gcc", they don't want "gcc" to be invoked instead.
(2) not general enough. If instead of a wrapper, it's something with subcom=
mand,
then this just breaks.
(3) going to cause surprises to people and be hard to troubleshoot when thi=
ngs
do not work.

I think the proper fix should be invoking a helper script with the multi-wo=
rd
command be passed as environment variable which is then expanded by shell.

Best,
Gary

>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1224
>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> ---
>  scripts/Makefile.host | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..22eab2734 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,18 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
> =20
> +# rustc's `-C linker=3D` expects a single executable path, not a command=
 line.
> +# HOSTCC may be a multi-word command when wrapped (e.g. "ccache gcc"),
> +# which would otherwise be split by the shell and mis-parsed by rustc.
> +#
> +# Use a dedicated variable for the linker program used by host Rust tool=
s.
> +HOSTRUSTC_LINKER ?=3D $(lastword $(HOSTCC))
> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> -		 -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		 -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTRUSTC_LINKER) \
>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))


