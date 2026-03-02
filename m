Return-Path: <linux-kbuild+bounces-11522-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAPVNw7wpWlLHwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11522-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 21:16:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E31DF370
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 21:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F121301051F
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 20:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF61385527;
	Mon,  2 Mar 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eYDKJMXJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022114.outbound.protection.outlook.com [52.101.101.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC593321A2;
	Mon,  2 Mar 2026 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482494; cv=fail; b=TPLZNF+sZDg8CLTDEwHcii6kv9bUdqcnJB4tzg4nPKLpfqHdfm0k3cs1aKY5Zi5eGsz1J/Av6hSs+vNQPqDJs786Je20w67LnmNWOumXz7xbXTihOR84zlubofVBhhUPsC0iE4NhDsatdtyPY8bsv9OrbqAzueCVv6qipUHv+UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482494; c=relaxed/simple;
	bh=v9Dm2YvzHeL+zpEypnpmEEvw6GJw/gihCuaT7vhxxHA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KRUcC0U5cQQPhG2dn3dU+b9D30wwymEMES6LH/4kobMe7i/1cqCYekgIJDu6TEa1OluhpViyjFc0qUzYf25La8TBDQThzR0vmzwwx/XodjQTsOVsmWlE0XCwz9QOKMLLxFxyJbkfFvFnfPI2FVrm1h7+JWHW0Qxtg0DZ0kv1QAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eYDKJMXJ; arc=fail smtp.client-ip=52.101.101.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3dJ/KTLBHxOaZFczWfW18zB61Z3IDH+vc/UexbPkWY2yyuBhxoNjI8Fnj7imix38nqZ/upwUfNcB3fSwVTub9MfaOZrbgiKUO+sA1UsqVPCbLtLQWL/p6dtB7M64jDIlQFLaJvA4sKuE7qrl14MP9TalnIM4GNG8YqOM9w4kDHmAAvNBNzDD3W1cYlhOqooSwwrjSsheJxq+l4erABeNlSONc/2/qPdtRzhyUfrmC71dxbT8O2ej0kD6dDwamQyUg/F2D/b5du/9WiweDHjvK/SRNY1nd2osdETWqZOwRT4USpn+Q7MQP0uFH44j4f7Dkebt4n0PSuyHDGHP9stSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTjMY5MgDvkqiSUbAJWtcHlN8YWDcDQT3SX3fXrAjEo=;
 b=prQA6kghAKJ+4KGirjkH/VL2f69drowr1jFMMpY4LTHNWz/qjVB0k0zYvWkR0yQTN2VC+k/bjhca6jXOXs6WX5stCs671+4ts+0gFTXzs1/PS38WEUR7f3mF5/5RbjpxzO0pZj1/8eakathhNbUWnKtCxbKIobxp4YrxoNn1K161c4leYeo4RczAIEig3rNdY+YntEsh77dWNVxMF7gfI6YXt/+ZYfnoSXeKCRmklVvn8GD1PB2mEfQqIT57A1mWRvKo/Alax9Y0Wyj6kXwRDV/GTSx5DuvMVEhq2dBKs2IgunCKMN0m/t2WQiDdAKKVA9QKF6iykuTsNEg714R09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTjMY5MgDvkqiSUbAJWtcHlN8YWDcDQT3SX3fXrAjEo=;
 b=eYDKJMXJ308WYDBhI2Z7FDrw3FzeQfnEbhHefIpfpeNYzVU49GLhoHb0EI0Kl1IoeGCgreU3sG1grLHsnCqCAw1/bi5qTBOparY+ETy1WIuhTeJO5Rrku8Oe/nlNY4rj9GRz8G9nBPWeOnbWb70D1Mp1WA/x58Ndu4VaLfRxLro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3366.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:14:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:14:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 20:14:48 +0000
Message-Id: <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
In-Reply-To: <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3366:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2093ca-d3f9-4840-2f88-08de78985b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	eG/KZIq3DXt9N07t3K2uTQNXpXOTBeayy8jqhkLamPRCtq0mrHYy+VUsj1U7UfYPTcaU3Bd6Ld9MiRWJmP/fnS1jo1ELD+sKN57Y1UX3NzcccjYq4sLgYp0k4qzpeEscjEMLffUuiXwvNukkZT4rFCva6U8HnYqx5hJmr4DTc7j+WfbnfiJAfBW8ROaLOlH9Cx3bkLTSHh9DkAiBM5Fa2w+tXEDUgHgvpk1lS0VxJMloD0rLOzK6Lf6Tkw36kjBlslqQ4oXp+0jrgxzJ4SI1FLzA+M7QRShamKeLYi8jDa1szG7iFsclrYthIiEHqVVqDhiPaHUjbU5NngFhcaBDZL0Lwn4YCw+e8EXj+ip/2Wz8xJK3V5mZ8yPfmpFB7RTOiqnKRPSpJz2yom5mZ+NzW5KUNbEGNzfdJMr5dRf+So41MT+uBUxQw6+YdnqjWmzSJ1ojZcANqwmSulQNzBSZMdYPplRjQHAtiDffed3RwdgZntyeDWfL7M01X2+LG+fzV4azvUxBqkA2AJBOMx0LmGjiyrh4bNr6asL90BFbIV8MHBTglNmXumZu5KSel72NMGeMatc3yFjNpdsWgiFpDy5SrDTbJTzmk4olD2PLO2o82q2SxNZc46QBj/ADha+CNOl0JvfVmEyfC3EAb0LkKsddCFvfWCvBCmKwhffU57bRhji0G/4tQb43ng1ZeU+dxrPeV/Z8MwESgSPcAjJ0Eso/vmbaSO2hEZPLZori5V8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVFucUd5N2RnVFU1RzNYeVE3Q01ZVDdBak5rYytlSE1UNkw2V2c0NGZQZWRS?=
 =?utf-8?B?Y0w2NkhiMWcvS3A2N0JOWUE4RlZuK25Xb2Qya1JXK2x2dmRjNE5RaDE4WU5G?=
 =?utf-8?B?RkI0Y1lKK2J3NDNsTE1haCtmZ1Q4RjlOc0M4OXJHUldoVjNWd3Q3Mm54T1Ey?=
 =?utf-8?B?VFhORFJTVXorM2NsZ2JGbmZCUXVFRXR0WlZRNUg0dUpPYnJCMVVOaWVjd1Rp?=
 =?utf-8?B?WThreFZlZlM1U0tiOHdabjAxeEFNaGhUS2d3VWRoM1JNUTYwd1ZKOW5HVUxC?=
 =?utf-8?B?bWJKVUNWTHBUOU1Tc2dBNXJzUm5UT1JWQ2pQTDV6S2prK2xOMTI1UUlNZ0V3?=
 =?utf-8?B?M0duOU5ZOUphNVU0WlRwWHJuZG9xRWYyNFlvVXdoUDJwZnJsWDFiUHhNOElZ?=
 =?utf-8?B?YlRhaGNueHRtNUNlbGlYcnBvWWJjTDV1b0M5YXpLYWtHYnhZc1IxeHJhL2FC?=
 =?utf-8?B?QXdSaERrWWJYNlpHY21TazVvVHp3V2pUdWthZGRGeTRVRmhQNXAvVzA3ZFFl?=
 =?utf-8?B?V3JYRGwrcDF6RHJXOStPajdmTVgxUXJNdW1reFZneVlWRjcvVGRWM3BRWm5y?=
 =?utf-8?B?K0loajVsNEt3U1A2L1JjQ1loNmNkNVNJYnVWTFJRdlBWMXdKWXBqMENkZDJi?=
 =?utf-8?B?bmxORTRHWHkrdUVFZW9WOHNxU3dzZER0b1VMeStBb0FtcDNBMlhnZHVnZng2?=
 =?utf-8?B?bEZSSnNuSmhFZk81aERmdFNrZ3ZFUDdkKzRhMlF1V2dvc3h3d1QvbXR4VTgw?=
 =?utf-8?B?b3RIZkR6alRqb21YZjB5a3RmTkg4cU1VVFQxUXBJNHVmMFBYZUNnSUZRcDYx?=
 =?utf-8?B?OUxaMUhXc2lrdWQyMERETjVGU0FsY3ZoTXhZVG9CZ2JwMndja2dHUW1VbFlE?=
 =?utf-8?B?V25jZjdDemY5VC9vVXNZbjljdVpuWlZQNHk3SE82N1ZPc0dUTm1IdHkxVTAx?=
 =?utf-8?B?MGM3T3BmUmVSeFd6elAvYU53UzdaQS8vQ2V0dkdOQmFUV2lYRW4xUTJWeWtS?=
 =?utf-8?B?Z2xQVDJyUEtmc0JKeHR4MXd2OUhtODhlK21PMjZMK0c2Q0U3STByY3hvM2lS?=
 =?utf-8?B?dmRWM3Vwdy8yeTdCMHE3dG1qMEtGVFlYelcvV3A0TjNtbzQySXF4U3FoTytk?=
 =?utf-8?B?eGhIOFNOMGpQUU1QOVkyaGwvMENSdmw4aVJlOTlrVWlzSGxGSHYrT3lWcE1h?=
 =?utf-8?B?MmNqLzB6cXlQQVRzUWU2V0xPRXVSVTR2bmx6RWI3RzNReFk1ZDg1REZCTlBS?=
 =?utf-8?B?ZlZzSTNjV2pFZ01HUTlRcW94SjFuN1VCK0RCY2hSUGE0NWtKVHRxbmJHMDhw?=
 =?utf-8?B?YWhJd3g3NjBpNVhubEhjS25nY0lrT2hmTFB1cytMYldXUDNQbFN1UEIva2sx?=
 =?utf-8?B?R0trYWpiaVRTd0tvRmw0a0hCNHdncy9qUG5YQ1JVNnlRZHVGZVhseHlLQWh2?=
 =?utf-8?B?TWtmanZTQ015UUJOYit2cEpWaWkxb2hnZlljOFNDaVl0eUx5VXZTemZweTFD?=
 =?utf-8?B?ZXlRVUhhbGpLd3kzZkI3UXZlWXBRL2Z2QjllRG5GK2hvdUxzOVpuaTNtY1B0?=
 =?utf-8?B?UG1lQ21iSTBSUmwyb0xGNXdlQmFtb0VtbjdhRko4enFNS3dIenRkUTBmd1hj?=
 =?utf-8?B?YnRuOWJnY2F0YytkbGNiQ2xLWjZ5Rm5hcExHeHgxM3gvejhScGlMVlBDT2hV?=
 =?utf-8?B?U25XU0ZiZWVmWVl6OG56eXRSYllZT2dYc0J1c2lRVldhTEhzRHk3Y0luUHd4?=
 =?utf-8?B?d01Fd01yalE4c2V2RzhFQjRFZS9lN0FXcGdwTTlYUzlTbFVOSDFGZWh1ckNs?=
 =?utf-8?B?TUQxMVRlYk9yVkFNKzRTM1U3ajZCZjA0REc3OGhGVVh0Ly9VOTBha09YSzRJ?=
 =?utf-8?B?NVM4NjkyaWRpam5FSWlZdVU0Ull0RXZvdjR0WUxZVmZIM3g4aGZLaGM0Ukd0?=
 =?utf-8?B?djdDVHlIY2Y0UnNvdDBCVFl4bXBJQVhwVG9EamtBdlJqbC9HOURrVTd3d1Bq?=
 =?utf-8?B?MEpYKzRmNGMrWSszTWQ5anlINTZJK08rRWJRQjAxa1BCVlFTRVY5YXJRZWpx?=
 =?utf-8?B?a01hbitMYnNSNEtXeW1paUNBbVFNQWcxRHpMSzYzL1JNdjB4THVVY1FucTJT?=
 =?utf-8?B?N2N1SW1tSW8vdzRwVWJXVUpMZG1waFFoREVTa2czYmpzN1JrMTFFRCt2aWph?=
 =?utf-8?B?SThlb3FOL0l3ejlIQThCcWt5ZFR2UE94Q0U5T3F4d3NnOTlCaVE2ZGl6TUdi?=
 =?utf-8?B?UEpYRWJjd3REc3VRQ2RTUFlPN2R5bWkzRGc4aDJlZ0tJaWF4ZCs0NkQramFN?=
 =?utf-8?B?dmNPbVR6WHA0RytaeGhqKy9odThMS2xseXF5dzVzenJaTW1jUWhEdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2093ca-d3f9-4840-2f88-08de78985b36
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:14:49.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYcXspxQKcKDV9r7tMUZwd2h6yHgsZE6dQsVaNZpXXopE2UYKevPMuc5xHssyxYmpI2IaUVDyt5R2FYjFUwstA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3366
X-Rspamd-Queue-Id: 492E31DF370
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11522-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid,rust-lang.org:url]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 6:49 PM GMT, Benno Lossin wrote:
> On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>>> +/// A helper trait to perform index projection.
>>>> +///
>>>> +/// This is similar to `core::slice::SliceIndex`, but operate on raw =
pointers safely and fallibly.
>>>> +///
>>>> +/// # Safety
>>>> +///
>>>> +/// `get` must return a pointer in bounds of the provided pointer.
>>>
>>> This only makes sense when the provided pointer already points at an
>>> allocation. But since the functions of this trait aren't `unsafe`, it
>>> must be sound to pass `ptr::null` to them.
>>
>> The "in bounds" here is the conceptual bounds of the pointer. So, for a =
pointer
>> with size `x`, the address of the returned pointer lies between `ptr .. =
ptr +
>> x`.
>
> Okay, I haven't really seen that as a concept. Also, what is the size of
> an invalid pointer?

It's `size_of::<T>()` for sized types, and `size_of::<T>() * slice.len()` f=
or a
raw slice pointer.

The projection semantics is same regardless whether it's valid or not. The =
I/O
projection work will rely on this, as many I/O impls will act on pointers t=
hat
are not "valid" in Rust sense because they refer to a different address spa=
ce.
But they're still legit pointers with proper meaning.

>
>>> I first thought that we might be able to just use `mem::size_of_val_raw=
`
>>> [1] to give an upper and lower bound on the address of the returned
>>> pointer, but that is unsafe and cannot be called with an arbitrary
>>> pointer. Interestingly, `ptr::metadata` [2] can be called safely & with
>>> any pointer; I would expect them to be very similar (except of course
>>> for extern types).
>>>
>>> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
>>> [2]: https://doc.rust-lang.org/std/ptr/fn.metadata.html
>>
>> I have a `KnownSize` trait for this in my I/O projection series that is
>> implemented for `T: Sized` and `[T]`, and it returns the size when given=
 a raw
>> pointer.
>>
>>>
>>> A pretty expensive solution would be to add a sealed trait `Indexable`
>>> that we implement for all things that `T` is allowed to be; and then we
>>> provide a safe function in that trait to query the maximum offset the
>>> `get` function is allowed to make.
>>>
>>> Alternatively, we could use something like this:
>>>
>>>     The implementation of `get` must:
>>>     - return a pointer obtained by offsetting the input pointer.
>>>     - ensure that when the input pointer points at a valid value of typ=
e
>>>       `T`, the offset must not be greater than [`mem::size_of_val_raw`]
>>>       of the input pointer.
>>
>> Given that I'm not introducing `KnownSize` trait in this patch, this is =
why I
>> haven't used this kind of wording. Perhaps I can just bring `KnownSize` =
in early
>> and use it first for documentation purpose only?
>
> That sounds great.
>
>>> Or something simpler that says "if the input pointer is valid, then
>>> `get` must return a valid output pointer"?
>>
>> Hmm, wouldn't this give impression that "you can do whatever you want if=
 the
>> input pointer is not valid"?
>
> Yes that's true, but why is that a problem?

A impl that returns an arbitrary pointer when given a null pointer is not v=
alid.

I/O projection will use the ability to project on null pointers, too. An ex=
ample
is PCI config space code, which will project using null pointer as starting
pointer.

The "bounds" projected pointer must still be with in `0..KnownSize::size(pt=
r)`.

>
>>>> +#[diagnostic::on_unimplemented(message =3D "`{Self}` cannot be used t=
o index `{T}`")]
>>>> +#[doc(hidden)]
>>>> +pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
>>>> +    type Output: ?Sized;
>>>> +
>>>> +    /// Returns an index-projected pointer, if in bounds.
>>>> +    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
>>>
>>> How about we name this `try_index` instead of the general `get`?
>>
>> I'm following the name on `SliceIndex`:
>> https://doc.rust-lang.org/stable/std/slice/trait.SliceIndex.html.
>
> Hmm, the methods in that trait are marked as unstable under
> `slice_index_methods`, which doesn't have a tracking issue, so are
> perma-unstable? I'll suggest the rename upstream as well.

I mean, they're named after the `slice::get` method [1] and `Index::index`
method [2], so I don't really see the naming issue here.

[1]: https://doc.rust-lang.org/stable/std/primitive.slice.html#method.get
[2]: https://doc.rust-lang.org/stable/std/primitive.slice.html#method.index=
-24

Best,
Gary

>
> Cheers,
> Benno


