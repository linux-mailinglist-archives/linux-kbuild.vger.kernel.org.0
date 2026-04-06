Return-Path: <linux-kbuild+bounces-12680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO1hJgr50mkXcwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12680-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:06:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880A3A0BFB
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA671300343D
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 00:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F9340DFA4;
	Mon,  6 Apr 2026 00:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xglSXtOG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021097.outbound.protection.outlook.com [52.101.100.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B374A07;
	Mon,  6 Apr 2026 00:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433992; cv=fail; b=K3hIPE1P3pXFIr66rLciNJHISj6GWvNfMJWXuE9jjM+UwEVseowRRHEbzmcTzUCyIOsfySl2uiX5Bu7mezUkpKH5vZyvfbMgWMSB/DlovcpFVFl3K+4oLwtu5w8TxCDOq9oMkrrjsbkn0FCWoo2UGxbTIAMxinwZk8J2iKQ1vnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433992; c=relaxed/simple;
	bh=hG+arfldw+87ogy+l5GHFKsV4qEoOrFb3oSCw7B0ok8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Ufw0TiVDPDkc5//MjPrg7Jm4wBPzz4S50EOLjmG4l5EuuD5xvvDof5sa/udNZrZ4hR/8PHT4ddJF9SQNZqLUaQi9sGcIwAmOdcVvQUgZdAQvig/9zKpqYnU142RN5EBiZmmjXceTeoiJGo2Bbf5fhkhlUzdbALDL0h/r6Tqvj/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xglSXtOG; arc=fail smtp.client-ip=52.101.100.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjU41YX1t8Hq26MBiJrxh6RTfb3mpTUWIb1V3FymMh3asalkIiHZ4hEmtpv8ry47xx9bp2B1MA71QYu1IKYdF2E+zpuVhpy/HxVOwSWh69AY2CnmIQCqV25JkPcy/A6E4waf7pRcU+Vazf+gfi3CQm5WPE9wOwzs8APii0rxLGsB91r2vvmqwI5BX8i0gllz/b1CojVr60/3pkkb7qQ6Ig6mZLbAo92EgaFNIjCQBunsFuzyxLHqR9vQd415CisaVnehUbMh3JY9CC9/puhzrn/7WVUF+dzHgJSKHM4was4GcvxM3CKLxjMkTs8Fg7HA/9nYUUTn1Qw2bp/NaMxhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG+arfldw+87ogy+l5GHFKsV4qEoOrFb3oSCw7B0ok8=;
 b=pua4MAOUeq1l29V61OANAi6B1cyXGaDFzmrBeah9NHlyfT5RXkQRDEcbaT21569IH79qfcazsc6BHW+3U4D3ZAisMHMLGrZyBaaDi3N3b0Ogxt7VO9+OeeqLFbPPTPGd9xE6EN98T8KE2QvxeEmlwIMF+BpgEEpl4Tpx4A+o+JVQHqONKPIXSVKkpcor+toZtoXGXBn17Iabh9CXADN3pWhSxxVhsd2jeAD+4UQPxFqKbHSaq8YhQvmsob2k/7PlnaFm9uAiF291UAfouQKeKfg0nsjUIqGL9KsjrYFH1ammVNJZX5MJjS9krl2Yvu1Dmca1k1TRYYa6YNFm3eiWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG+arfldw+87ogy+l5GHFKsV4qEoOrFb3oSCw7B0ok8=;
 b=xglSXtOGsxMRJIsyCLXImNOgWfuKXhXz3vx4vVGBTjflBHEiQsLNEvpTvpW+C0VJbBqktbIKHv9DT+56rF92YOb1fdq0eZvT4Ux7uxxVVY6q3l0P8wRZV7tIcizhd0pvbMVtDQa4JcXWh+EGEpFQlx+BwAoqHXX+DOpbgGQp2ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:06:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:06:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 01:06:25 +0100
Message-Id: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Tamir Duberstein"
 <tamird@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam
 R . Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Rae Moar" <raemoar63@gmail.com>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
 <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
In-Reply-To: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7376bf55-7c0b-44ac-adea-08de937058ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uytaZ9NA0/dRopRAnBztFo5VdI3QszPdMD273Dd06+5rhE1BY9uy1qZJyrseTQC8pg9ftHoZIwqx8k9yyTACtiWKqsYakAGQ1dzUHpq/gZizGAIdRM9z+uBLIxLzndr/1pegFJrzOijWeHjYRYjOs32snQS4Qnh3Ge0NEiAD4+aD5dKpiMmnyHiUHAU3aiuKoLgJ1Z77t7dLWdjbkT2xYxzitpWH4H6cqytstXp8jOJZkxKXv2rjkuVps1k3ebwPBAhtEfobeiMFDld0EhBRgmtrT7bxCbEdw+fjfhAcZluYQ3vt2LIShjTGyNXzArMDeQPxxZnk1aLgVqxikiMRjR++QuJgyOJBAiVl7m1YkYmYkEY8SSTHf810CGNUBmzhzTBD9AQYLabXg65m+daQF5Gz0VrVvXBojhjdgCmzgstkn5oVGxsk9BAUelovRtKj7Rere5fgWUs3jELNAAf/QnmdBkhc07yR36hnub9fdF2T+YhAMcitUVIknh8Tp3vkhP2/7ZxDwM0tok85BfZw9QQ+huQ3CMYTGZbbG3pdctrqfOrA6F9yiidBTAIhqACcmIprkN/W6+XRkBrnMmghElPeObLzLJZa0nllvoFoWU+jQ4RClMPiOVY2HUPxDKnTpHgp5NIS7BjhtpUw+1m4p5Z9m4SFIMDDUUGt1f4+Fkr9omoRNhsCp+o4UX3JTE41
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0Nxb3ZDYXhPSHgzWUJLWUN6Y1BWTmllNHl3aVEzZ1hiZTBENmJLWWw2SXpL?=
 =?utf-8?B?MCtvMVVXWllaME8zU0ZJNlRHM0h4QkZFc3FZaU1WRFdiQjNVQzEwYXk3RG90?=
 =?utf-8?B?bWRka2RMclpuc2RKVXN3RzNMcytzQTJsWWFLdldEdTU0Yjc4RHlKYUI5Y2tP?=
 =?utf-8?B?eWoyMG9OR2hpbjJEZVBSSEFJUWo4STB5eFJsTDVFR1lGT0FDNVNmS3ByaXRm?=
 =?utf-8?B?VFpzTE9yM3IzOU8xWXNhczlpQ3hnZ2dFK1pkMUhuQzVDK0MyUXJ2RkZ2YitH?=
 =?utf-8?B?NFp3OTNsMVhmaTdoYzVXT3ZZSkxHUy9icFVreGJIREs5elRjbE1vYXhxbXBa?=
 =?utf-8?B?SDJXTGZIMjMzRWQ5NS9BR21zWG5DcU56MzFOVUdkNENpcjVGU3loeGMxU0N5?=
 =?utf-8?B?L1kvT0M5ZUdubGIvbmoyWmtrYU1sZ0hoUmZaTGlOcS8vWmpYUTVGWXViL1dC?=
 =?utf-8?B?dEkrMDFRSi9uMC9Lem9KMlEwZjhlRDUvM3kzVjJHaEFadi9tMFNkSGVuNXl2?=
 =?utf-8?B?ZDhTdFB6WTdSVndIMVdpTk5QeFVPTzJpQTlLNGN4TU5rZUlKUzUyYkJjMHNR?=
 =?utf-8?B?elk2OVpBRGVzbGx1MkFRbmFRS2hLY1dJTDNmNzhXM252M3lKczd4Vk9oR05O?=
 =?utf-8?B?eGswcjBhcDBOWDBTOVNLOTdGNkFBYkZLckkvaEFjdTVlU0FSVFBZbUliWU00?=
 =?utf-8?B?NmJ4YkJZNE1mMXpZUkhOVHBJbXVTVll1Qks1bk5oZFBKZjZMdzJpY1c0bVQ0?=
 =?utf-8?B?a2QzbllpdUZMQk45TlBJMjYxZ2w5Vk5UcHJkN2s2MDl3dUdQd24vcmlKbmRq?=
 =?utf-8?B?RzQ5TGs2Z1ZJcUx0VWFaMUplUDVoQng4cXN0VEtTaUdUTWlZd0ZYKy8yUU5K?=
 =?utf-8?B?Qkl5dzIrdFJwbGRFdWJWRGF3NDg2LzZsSWNycFM5bkJEdk85cFBTL2YyYzlG?=
 =?utf-8?B?aUtaV3pXNGM4bDVKMkV0ZzQ3dkxraGE3Qk5OajdtV1JsNXg0aEQxRlR1Nlky?=
 =?utf-8?B?Z2xGTkpaLy91ZEU1Ym00QUdJZlNQWTU3dGdSaGhvdFVmN1VjRHd2SEZqd3Uz?=
 =?utf-8?B?SGNBS29iN0ZBQzRoN3dkYklZMkhUVnROcUpyRml4NjJoT1dIaXRTKzJ3OUNN?=
 =?utf-8?B?K2VxN0loQUF1aHR4b3loemx2Z0N5d3lLcnI1NnhxMkQzSmp5NndmbjU1Z01R?=
 =?utf-8?B?NGQ3NEJGUkE4SERRaWkxYkh5eDVBVENkV2tGbzZQbGdKNDA4THoyWlVCUzRR?=
 =?utf-8?B?Y0hFVitmdFZka0svZU1RVzZOY1lXSFB1N3BPcVQ1eGRBTjVOQzFtcGtHaVlx?=
 =?utf-8?B?blViRGdMcXNHQVo1aGdqbU51RWxmUEpBSll2SFVpMlNaQWsyZ2diYmMzeUFk?=
 =?utf-8?B?R1ZjWUhjT0FTTUlHeElhVmZjWkxzZmdSN0NkR0VDTmh2STJNUWJ3dHBDMjRs?=
 =?utf-8?B?b25JdzBodHV0dzFCNU1MYXlMblFRQzFwVXhFTXc0YTQ4RjNMTW5nVzZHU2hu?=
 =?utf-8?B?ejZGZXhPOWZDNDhVMzB2UEZYWEI4TmVkaW1IVWsxb2xIc3JpQVIxdHNqMFEz?=
 =?utf-8?B?STJaMnZJUEkzVndaTiszME5tb3dHajdJY1NjamhndW95bTlxaFAvdjlwdWJG?=
 =?utf-8?B?NFg4Ylc5bzFGU3oydmMwa2g2N3QzdDdLNk5Gbi9uOWxlbFhObmh0OS90Wll0?=
 =?utf-8?B?T25JZTNsK2JKWTluZ1FXYkhydndGQ2hlSjE3M2E3TGVmTVFPaUN6cVEwbmxF?=
 =?utf-8?B?c29CZWlzVlF6L2NoRFVPajhyK2pRU01FL2hzUnIwWXo2SGZRQ0IyNDlsa1pC?=
 =?utf-8?B?K0RlSVdISUhSQUFsTXF5ZjhidVpSdTdqeEZLSjFlcEEzU3h1M3VabjM4bUVB?=
 =?utf-8?B?RUZpQjdQaFRNbWFqVFpYUkIzeEpHbEVFOEhHU1h1NHRLeUkrVExhUXdnYTRL?=
 =?utf-8?B?N3FFeVRDZGllL0FxWFlEakI4b3o3NEo5NGRsL3R0em9IZFZKMGMyRnlXdVdQ?=
 =?utf-8?B?bC9zNWdPbGVwV3lkaDV2V29oaW83aGFrNG0vcGtlSXpWaDVuQS9qSzZObTF4?=
 =?utf-8?B?VjZjYkxFTlA4R0JSR25xOU1OQTRybU5xbG5GWmtFbVVRV2diaWFHM0x0UlJR?=
 =?utf-8?B?WlRIdDB5OVZ6MHNXbkh4bm5aRW5pR1E1QWpWR0RlYzRtamV0QVNkSDhTckxK?=
 =?utf-8?B?Z3BScWpYcXVocFVZcENJQWFUaGZxRmlwNGdmS3FKWERrM09xNTNsRHlhT0I3?=
 =?utf-8?B?Z25OUDFaQXgvK2RTcGd4UnpxbnhlbGVQRmJycit0T0g0VzdZRDJpQTl6S3VV?=
 =?utf-8?B?WGdJc3QydFJnUlhmaE9DS2lTOGhnOWVLV3h2aklwdmJHdUNCYXhuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7376bf55-7c0b-44ac-adea-08de937058ec
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:06:27.1667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzp+cXU80/RK2iPhUqWb0yQgbWHvQfE7ybguXBHR/p7JuMpN43g3X86uvtu9hbUnnUM0h6M8pQQI6JDufmqG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6978
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12680-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0880A3A0BFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Apr 5, 2026 at 8:35 PM BST, Miguel Ojeda wrote:
> On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>>
>> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
>> still needed there?
>
> Yeah, that would be nice to know.

It's still required. It's used here:
https://github.com/NixOS/nixpkgs/blob/acf7ae578589bb8bdd6f9273141d7053fed84=
bed/pkgs/os-specific/linux/kernel/generic.nix#L186

>
> I tried on my own, and it does seem still required (at least with
> those packages mentioned in the example). But perhaps a Nix user knows
> of a better way to do it, anyway.
>
> So I kept it.
>
> By the way, I think it would be nice to have a "standard",
> well-maintained `shell.nix` (or a flake or whatever is best nowadays)
> in the kernel tree somewhere, i.e. one that is known to work, that
> covers most tooling used in the kernel, etc.
>
> Cheers,
> Miguel

I have my dev shell here in case it helps:
https://github.com/nbdd0121/nix-collection/blob/trunk/dev/linux.nix

It makes use of oxalica's rust-overlay. It can be used with shell.nix by a
fetchTarball, but for obvious reasons you want that to be pinned and not be
fetching latest version everytime.

Flake is good for pinning, but using flake is a two-edged sword -- it both =
gives
you superb reproducibility so years down the line you can still build an ol=
d
environment (assuming the source tarballs used are still available or NixOS
cache server still has a copy).

But it also means that it can be outdated. So people (myself included) usua=
lly
combine pinning + regular updating by having flake.lock routinely updated.
I'm not sure that really fits well inside kernel.

If we don't use anything outside nixpkgs though, we can use "channel" featu=
re of
imperative nix which says `import <nixpkgs>` will import user's local nixpk=
gs
version. A shell.nix using only that should work, but it will only be able =
to
use latest rustc/clippy/cargo/bindgen in nixpkgs and won't be able to inclu=
de
things like klint.

Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
kernel.org SCM) where we can point people to?

Best,
Gary

