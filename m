Return-Path: <linux-kbuild+bounces-12454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEzAB3NBzGm+RgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12454-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:49:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 744343722BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6E4300DDF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF2A3ACA72;
	Tue, 31 Mar 2026 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OxRM67bx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020103.outbound.protection.outlook.com [52.101.196.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF4199D8;
	Tue, 31 Mar 2026 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993413; cv=fail; b=B26I4HMXTGVCtvpJvBpj8G+5OELzC8aAYJ24nexp7FJTVpqOQAHhVye6k+DoKh6vVfkpBHDQJYg3d6dSqfZuEAOFQ71z9lI+Q3e0UAu/2evHC0QoeyispNb3YNqa/ZAs1NXzWtQU6h1xJF+/nSgo2JdirDMrwSfgFdYIcEyos50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993413; c=relaxed/simple;
	bh=57NyT85keEhZ5s7rf0g2AOYrupB7GbgfhsUn2FpQuZg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=cUQuc/EaO0pQ2qkJ5RZDBSabDiq3RH+oG9qESBvj6RNL6ttiwoOUQBtUK9+rgEJ4/KDVw99lh9TO9/nDYpthNCU0rIuqZUQGkXApbGdhS2pq4Dj4VK3/VNbVdD1Q6R4MIiOHhLlApRWJ/W9vzQ4YACTwUqUvhtTBiMD6DJpV8N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OxRM67bx; arc=fail smtp.client-ip=52.101.196.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY+fbFPSuP6RxOJjhNEO6/bflPQ9Kr7xVdVgSItWZGB+f7OwW+KKGyVlDlbXLA0F4enz6qQ+7Vg+MnvWyHXLtImURGyXMo6CXgJMwsYEqpusOT225nteSkhWsB4IPrJfhlM+hd3wNb2GCaq/1EvOe9eFppzv0vTP0FQSevrkiGRw7gZlIDdBSgWrEjvX6UqZ94gyH0kBYhqmzT34e0LeURFyNf4PKECmacMZYV2uM7rjQCwcIkxr0Ntw+6zqojGX78wO78ME5z6s//hZeEtd80TP4Gj56c9QBGsm8+RoPSQCTWu4L8WmVd0R7aI0GLfBjXWIxnXRLGqN201e+t8teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57NyT85keEhZ5s7rf0g2AOYrupB7GbgfhsUn2FpQuZg=;
 b=p8Aytf5aBFXq3RekFVbMlylcOEvglkW1YyX7o5tTfPszeEdJkvlQwmIVgG5wXPvM64idrAwV+GPxtfrF8bpUE8KvW4LRQ/mZq62v5KiWSJtb4LH4Z2WFdKPMvOFahGwt3LSgel1EpoaU1ek23wXI4UbLpsr3SQbaxuACXzPj2SEKrdTOxbw5RAv/x8+wSXkZf2NbBJBOsLbZYFEOArhV8JFSAGatjyWeN1wE693GrZzAhoCQ+VP4zOwgCjti5AgGKJROUcp0pVzZtIsPjyMzNTIrzGCkayIpJeax+HM50VOQOsI9XRjJBvOTR7Lnc6UUuNnwFs7qcguLeS2dpg1RMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57NyT85keEhZ5s7rf0g2AOYrupB7GbgfhsUn2FpQuZg=;
 b=OxRM67bxdtugpPigd+9A3K+iNccpe1JFqqaswz8mOJGJrUN6u2CPbBLVQKDa5tIwpedzJcDk+fPKx3aXNGzFT+VsuS9kGiO5tryuy2vdIJcJ8fZZIxLGG5wPaCnXrUEUaavvnZAyX8/QXrrIjiTAY4jjsn3cfCSOCr7EcKVF5k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7712.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:205::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 21:43:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:43:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 22:43:27 +0100
Message-Id: <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Aaron Tomlin" <atomlin@atomlin.com>,
 <linux-modules@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
X-Mailer: aerc 0.21.0
References: <20260331205849.498295-1-ojeda@kernel.org>
 <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
 <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com>
In-Reply-To: <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f200d0b-2759-4138-afe1-08de8f6e8b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dHy1Kz5Dnx+RD00yvUm4fkQ21IDPzCxiNReqgE9Iu+aVNoRFystt/BLd245g7rRT6LjoNgKUMmK7HwNktQhS7LH2oYoGwBYo9TPyzstO8NoULo3ZC2RSThIxiZPbj1v6EG+Ymd56FZqxSlESPuJ0+3AaRp5vgmwiPblNsY3q5C3Ji3KoDrhfjM31SeR1bLaGvbq0xsFcQ8kaVVD625FqkHr0bJ3w+UiJaKsd9DqsUvTCXTs/oJYGTwDAoNsRbzMdqycXQfnphB+utD2uitkq29UWPwshhf7k4o2F5f0saqXetwnq7VmCrtIB56XpGQTpvTt8q378rMywaxlGNOrkM4ifP1Um3fnzWzNW846NhJ7xHQ8Fl7CmZ36Dxnwr22xu503E4ALZj4yPZiVql31CSZj4u/jYMZCZBd9S8emga6LwVbuwfKySIEtfn4zNPgKRvM/zbRKGGaTQPxVstIDeqAOR81gxKhbJDgz5kEgMSFA7VSfIBXwJBFv473FXazWHut2P3JPDzbU/HT6V2+BrI0Y9PxNRH1uj6iiy49FDc0nGBZgiX19W6ZRVh9ynwp0H7ehOfMHfVcd6wsjQuYJcYPMVM+vtIwGLr1348hXTBH8iAHsck6vKNzk/Q7dN89VeZ9nJnoclDE9mijQpLKwmT5rHcFDwkdxDSikzG80KqD7Dyogn5pPfrDiRBfPYR6cds6+IPg4XtMQ8r9VzJTDD7ff49bDckZmvpMbaWngr/qE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THVRYjNOMWlJRHczcWcvR0F3Z0ROUWlOOGxWZkZYNWtIWm5qUFZvUllWK1No?=
 =?utf-8?B?VTVValFLTlBxcFF6THA3aU5kdXN0R1pDekw4WWFNc2Q0Mk50TmhhWUx4MGNR?=
 =?utf-8?B?TVZvV1JUcTEwTHlFanBzOTg4cndHOUp2SVVzdFdPSy9aU0ZsT2gzL1hxUVcr?=
 =?utf-8?B?VVU4a0hMUDZmSlNRVytIMSs1RnZuUXlrYUNOMVZzUzFlWFZ4dkxaemhVOFFa?=
 =?utf-8?B?cUUrY2VwOStOZHlCMDJEUTc4c294a3BZZVlBY1FqSGJGcGlJZEZsWmJnanB4?=
 =?utf-8?B?WlJPWTc4YVg0OXhRN045YnFVRTE4bjdIaHZ1dmJHOFdMcjIzNWs1K2k5SkNI?=
 =?utf-8?B?WktsVjJFbXc2b0l3Y3IvajlMU3BvYUpTdDl5Qk1RWDEzWDAvYTNXYWZMUnFT?=
 =?utf-8?B?Qm0wNnpIa3JjSFVRem9WcnYwa1RpKytyTFBuNmxkY3pPWTF0SDJlUDhDd0tl?=
 =?utf-8?B?VHkwSURFL2o1KzhmRUVXWE9NTWR0MlJuTkpGSUxJV3gwQ2FCOWRvemZOSUM2?=
 =?utf-8?B?U3d1VGpZdU1PNkJrbjRmeWsya25vMDltTzFtUmNjQzA2MkFEN0lDN3V5b3Yx?=
 =?utf-8?B?cVZQeUZRYUg4MWI3ZlY2TG9xWnd3QjBtWXpKQlhSOXpGNkVYOEtDd3JsOTFS?=
 =?utf-8?B?ZHV3YlNsUmhRTlRKWWdZaTFybDNZNG5FRlRyckkxSXhhMDVnT0l5bGlaT3FD?=
 =?utf-8?B?bll4VHI0UG1uYUZ1MHM4M2h3QUQzWnZsWGRxSENkWmk1aDVsY3ZzU2pzZFdw?=
 =?utf-8?B?SVYyZGxGa0N2R0l2OHlvKzFITitVejZSdmNDelNscGwrMGZqdGtVS3IrVzdh?=
 =?utf-8?B?dnh5TjQ1RG9SVW9IRjhmZ0ErTnJzVVoxQWc1aGtMTkVsL0JiUFkrOWRKRzNj?=
 =?utf-8?B?ZnVsTTl2ZEUxRTQ2dkZxZWgrd3JBOWIzWk1nV25vRFZPeFY2ZlArRzdCaHQ4?=
 =?utf-8?B?RTUrRVNnZC8zWE9CcFZDREtPQ3VHdnhBRDk0Y0w4OWJXS3VxWWZTcTQyaGZK?=
 =?utf-8?B?Z3MyS0U4OGhyUU9FMldMQXZqWit6OEpEY25kWnhqN054aWphUVRTWVA2WFdQ?=
 =?utf-8?B?b2hEQ2hKWTY0QmFVZVFlUWdqSTdXc3lpejdHNElSZEhYMUxuT2hwUTBJOWVy?=
 =?utf-8?B?Vk1McjFac0VQQVREZGltLzVVNXF1K2h3dUl0OHNJV2hNbHJXTDFNZ0g1TUYz?=
 =?utf-8?B?Ui9jNzRaZGYyb0dldHp4YmYrTnpmUEpiZllNSExLVmxhUThMS3NmVUtabmJQ?=
 =?utf-8?B?SlhIZ3JFL0NyZ2V6T0toUjJzQzNvcDZHQUoxWU9GQ2ltbHAzeFJtd3UwUkZ3?=
 =?utf-8?B?R2xwMlFHc0NjMkVMUWhVY2J3bjFiYjVNbVkxdTg2YVZXWHpCL0RVNE1zZytV?=
 =?utf-8?B?VlJiY0J4YkowbEJyUVJvUTRZWlNoTEVlQzZVWnZRSm9WdU1zbytRanBVSWFZ?=
 =?utf-8?B?WXB3cFc5M0hZMENLV1JlRUJiaURPVVZ1YnB6RjV1UndNTmNNNlJ5QTRZWXBH?=
 =?utf-8?B?NjA5S1RZdCsyeVBtbmxYOVd1ek1ta1gwd25JOGtkcDhvazFkczJHTEl6b3lo?=
 =?utf-8?B?cWpuYkVEcGw0dUlOOTJGY2k0YmRSTWdGbW1lS2NHUjNEUG9uRHNCNEJuc1Fl?=
 =?utf-8?B?UWZlU1RJM1NmTEpBMC9wcHUzMXRXMmNza0ZKN3RLamttZVlBbFNpalhJamJ4?=
 =?utf-8?B?R2xOU21RODludUhhV1ZUNmV6d0gyNlA3K1FYYllLY0lvRW1URnJJd3ZOd1FX?=
 =?utf-8?B?VENOQnExYlZlYWtUejA1TzF3SU9nczlRZEQ1RGUreTlZamhqVldnYmJwUm1q?=
 =?utf-8?B?VWI4Uk43dnl0NzBoTmRCemw1dUxVd2doMVA0RXdKYk1GNGlIOW9wcDJJSTlH?=
 =?utf-8?B?UEFzRnZtd3UvdG0rWThiQ1BGYnIyajNRcDFEbG9QUVFPQUFGTUJPOGZYam9W?=
 =?utf-8?B?NkR1ZFk1RnhzRFY3enlZQVhaWmJpSmw1L0NKSXFraHJrQkZLRWkrN0dRNGYz?=
 =?utf-8?B?N29sMUNUN2FEOVhvOHhFZkpHZnZueHhCVjBhcXhQNEZIZlBFNWhDdVdTMmVz?=
 =?utf-8?B?Mk5uWGVnSWI2amdvQ08wa1IxOFhjVUxPMmQ1VlVzblF2VSttQjROMDNJcUhE?=
 =?utf-8?B?c1o5bUhxOFp5anJvOGIzNkluTlRXcHZNQTFkTlNHWDAyMGtMVHlBRk5GOTJH?=
 =?utf-8?B?dnVrenF3QWpMbGdQbzRNZE1VT3R4dnJ3WUxkTHloN3lGMjJvbG1kRTVEV0tW?=
 =?utf-8?B?dkNhcVhqUzB6cGNiOW5LaDhFUXErYW5lRjFySFhJVmpFdWJiMDhPNHRUbUwv?=
 =?utf-8?B?SGZYSVZJTENXemdacUFJYkg0UmF6Rmd3YXhOd3FyQkV3UDNnV0QwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f200d0b-2759-4138-afe1-08de8f6e8b99
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:43:28.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gVt/8V8ALy58PMwejrd215AVvRRCwUNdgUwhpu4Z/AkqsANMKz/cG9Gphwj40sqz6A5M/RGZftCUFAi9hHloA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7712
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12454-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 744343722BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 10:14 PM BST, Miguel Ojeda wrote:
> On Tue, Mar 31, 2026 at 11:07=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>
>> Does it produce a false positive, or it's a false negative? If it's the =
latter,
>> I think we don't need to disable the lint.
>
> If you mean for custom macros, then I think it is just that it doesn't
> take those into account at all. So I guess you could say false
> negative if you consider that it should.
>
> In any case, originally I just cleaned it, because it wasn't a big
> deal either way, but then I thought it would be best to keep the
> behavior the same. So either we disable or enable everywhere.
>
> Cheers,
> Miguel

I mean the lint is kinda useful, and I don't want to disable it just becaus=
e
it doesn't exist in older versions of rustc.

Best,
Gary


