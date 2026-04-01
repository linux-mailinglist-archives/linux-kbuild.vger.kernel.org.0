Return-Path: <linux-kbuild+bounces-12537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBgWHE44zWnDawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12537-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:22:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC437CF69
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F69130A0A1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136EB4657E3;
	Wed,  1 Apr 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HIjw0t0x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021138.outbound.protection.outlook.com [52.101.95.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123E4657F1;
	Wed,  1 Apr 2026 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056609; cv=fail; b=swWhdxLr0JaIs3v4wm4NSUfK/Ndu5Sz+SpBWAMLoz4B4ocV3F9Ss7rmZ5AkzhIaMwf3hjUlxhKX9t9wkva2+hS6HklxPY2T9Nnvd2FsaVnxfkLr0PnNUEhQc4+0+YcAf9XbsMgm7giN2zq1y0HX7ODXQw01JQmK2sRjHYQT16G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056609; c=relaxed/simple;
	bh=vKPGlbrAC0FjHh+h8ikxPUP3woOftw4F0uYzogR7B40=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TZ36D0u4JPj7PzzJxvL4BjsYVwohtXMwDzwy7Clsszn59IdplFdDb6XTDR+c7+/ZowqNwlZU+eM8VMqq+xN8GoM8J7PjvherMrCa/k409xw2WTVbQDciF5sV6OuloUyeVY9sHy+8sPLoNboPfeKdTMf6bje6m3pA0gYT6U9rXx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HIjw0t0x; arc=fail smtp.client-ip=52.101.95.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRkDM5YEhCkFDwamfeYvTwsSjy7VArHyrGTX7LE+Yk+V4D5cLVgP6B0Dgeg/DGWCiy+WT7ByEe+RVaHjNM/EOeePVtgVdRnRIdkFGwVjKSwTIWNXWzAZSCtvtcXG8w3KKNf+HRi2tKZU9ASVuVd0MH9gHoK8CTveRVVtsoft1ZAnue45Y5GpoT78qdTgI+xTE5E60ep8U4wkdA4AmB95nrsquLuvfEIPDGuRerLNyaNUjo2PNqZ1HvIo7OaGfcOlyPXFhi1TuDg2tvt/hUimHGKkV3a6gId6DOHNhn9A66Ogv8+o1YpwH1g535uZSmn865CHP8ysqOpBzlbQXoqXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3kpJ4BfJ0VcxgMNDiiTD/LhwBf6gr3xl6GloBED3c=;
 b=LuKcf6/tgd2APXjEGQj8dVuNfBMXAhqyw/IqqsxCgGymYjNlq2CYybCURb33FXVG2Mu79iFet5og5F3GJhbTUzrevyHFv+3lBlEBOARXeeOWCf6rL3jt8HDK16V1cPQ3HeEOKIPaesrL9sZJKNvD/IDvBHaDiI0dXjaJeNE9wu8kbzlOobNckw6PWEfnwYbjZ8TZ4LEOmfpYNzvJIRoibUrBL9mDFj4eIz2aotu6IWFeQCvtX0i2AIY9VtFR0eLFh6PuebqBNrshywR6iC58fWZPDignnyz9QBi1VZq1LBAXnHWV/zzUmBPDj1qjok5DtieIh1chmgpiOlGNl83/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ3kpJ4BfJ0VcxgMNDiiTD/LhwBf6gr3xl6GloBED3c=;
 b=HIjw0t0xYMR+RuNn+eYnj6uaHTMH4H9olJZuhqyH1xZZfxiXqYssWdHilu0kUABU/6ONsZIiXwajPDP46SH2LDBnPPbJXOohNpOp5QQ3uFnCQggbIrvHQIbYn0CygPkdG9ugwjhJetdxqNCZcGOBviwV+bM/03aq5RCK4tiNClA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3172.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:16:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:16:44 +0100
Message-Id: <DHHX1USN2EFX.LEASH5FW1GP2@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 30/33] docs: rust: general-information: use real example
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
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
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-31-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-31-ojeda@kernel.org>
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 6870eb53-ec33-4eed-2b20-08de9001b017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AIyn4ea2YK/YpXUgayz/ximTIPiqKfTEJbYUrHryLGFvQu0OsOTWbrxQgZvyQHEguGIYxAfIIzM4JOWmDuoou7+uTkjofihrpFt3rGCzk6QvaScdI/5BCXpySxpq6kNPcILDyLgGfchrVtxXELbWUlk+A+aIJFeRpjEM0LygoUBBoWpJY7pxHPqwZLSAcwshEXrWSY56bT5xqV80iZ3bGsaE5/n5ssWtGlV5TI93gCmUYJJIjUW8TWn7vyE8kHwexmxK+jEOZW9tgjssXUyvAUgDLkXRAfCviQCqs8EtS/Og1a0bUTojDNO4HKF/pYxQvd97fkvCxGY+v0IU5s5N0kU23Ni2qLES1rc7DnvowXkqy1vqA+QLOcVfTRYvgx4axBpmfSMzVhW4YMz8y/mmVOYdH0p4uUKqIvYdNNIB6aWsJVgz9zlB3xer53+LGuM3PVqZ0U+fE1RVx2vih1sSdteYMnTTgfCQBTM6MCvheAnwKAmS+hBh+05cGMiRs+Kz1CGkDYWXekvavhaYw0pRuKrwoIHfczGJePmNdW7C+X+6ykhKpD9LJi3ytJkI0Gxd8ELT2MM2ktlN8boybEUTkALsR7+51ZBusUHlwu3i67P1Ak/4T3F/8RKyzMACub0fHM0eyXw2xFK5y/WwfieIVxRv7vZKffvREWHsiTTKQq9mufrshMpf5jx1qSgiOOJ7fjnRF/WwuIWxgDXxX/G3XxeEo7UrrjeoaKyK7tCT3iin6w6OvjsvkIPoe/2OCcFOlcV6nb3jM1jBNmtkiTZuLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFwVmRUaEpJdkZwNUlZaWlObTQ5YmZYMFdSUjhzcXVWOUliZHFSc0hTcVMz?=
 =?utf-8?B?MUQ0NkR2SVlYM0kxSlpFNnBtTHZkK3VtQVNYZndGSUpMY1FZdmx6c1hhREpL?=
 =?utf-8?B?RVV4RFlpcWM0RVhtODF6ZCtFS1FKaHB6VUwrZXVpV2F2cHJ6QUdUcEk2SWdN?=
 =?utf-8?B?NzJGZ2NCUTJ3eVFBRTRNYlpUZWRvTzBUcXIvTmdXSDI0ZTU2TFlma2Ixc1BE?=
 =?utf-8?B?cXJmM1pOSXhtVW9UWVRoS0dnVys2SWhuM0lhZUEyenFzaXBGTk9WUG11NFpz?=
 =?utf-8?B?L1BiR3hzYXYvcTFEcE9JeWllcHNndEIzZ3Focjh2OEMxVGluY2FoWVJEZzlt?=
 =?utf-8?B?YUh5dGZmSmFKWXJVakw1Y0M4RzlzaDdGNGUrdTdRWGw2V3ZtckxNalg1a2Zu?=
 =?utf-8?B?MTVDUjBVMnV3K3E0MEdVclFGVVZ5MzlJRUFwd1h3Mjd2TVlxMy96QTUxSmtW?=
 =?utf-8?B?TG5CR3NTdHh0YllGWmp0ZjIxNy9NNzJJK1hNS3lPd1dNcUk0dDhnWTJLNWlj?=
 =?utf-8?B?RGhxa3hQcHZLaS85akYzR0Y3cEdzWC92ZkdBODNKUncxT1JiYUovTEdCMEx4?=
 =?utf-8?B?WEQ1SXNCR00yVFBFQ29qc0lCbW5idmQvUnBWTnVtNXozTU5ZcG14c0pJdGky?=
 =?utf-8?B?ZnQ3MnF1ZFhDQ3VFZXMrYSs5MFBSUlRXMlVPYy9vYmdtcW8zU05haHo1RjN3?=
 =?utf-8?B?VFhCTy85dDgyS3FrU1g5UWtjNXdEZ2dxQ0dLNndHTXdTYUg4dGs4M1BhY05F?=
 =?utf-8?B?ZDVvU2xoZ0ZEaTZuWktQeHE5dFJGVmVqaG04NVFRV3oxcytGN1R2bXRWdVhB?=
 =?utf-8?B?a212YUVZTXNnQ1pkVzFvRTlzWnQydmo2czFVcFlPdUdzY0N2TmhiOTIrNVhL?=
 =?utf-8?B?VGd5dklUYUQ3eC8yS1NJV0Fxd1hMaVhiMDFkdGlvNWNiWHo4QnF3T01VMUty?=
 =?utf-8?B?Q3R5Q3BYV25yNEp2ZHhFK0s4MjlpRDVacUlWV2lZL0JBSTFGSzE1YnZtRWYr?=
 =?utf-8?B?TmJwa21hNWpTd0ZIMktWNG1oNlVwTjdCampVdlRrNGRjWXJBb0lPdC9uYjRy?=
 =?utf-8?B?YnZVNlpGMDBYR25UTUNXeWp6Y2pqN3pRTVR1eVNQd0JRcmxJbHZ4YUY5MGgy?=
 =?utf-8?B?VHlwTzB4U2w2RXpoRFZrNVpQUFdreWRBcEJpb3FaUUJubkNSM29PM0RQeE9L?=
 =?utf-8?B?a1NVdlBhNjZOUzFhMnNzS3VQdkxHNllqOUt2WUQ4Qm5oZjhrNk1laHpOMkFT?=
 =?utf-8?B?eFczaVIyZmQ5MTBCVVNSRi9jLy94aGdySU01akpIRGdsRFhlT0ZXY1VsbnV1?=
 =?utf-8?B?dnk0bmpma1lvS3VYeitvdExCSGNqd0VYN1R2M3ZBVFB6bloreHh2NzdXWTV0?=
 =?utf-8?B?Y3p5MGxMQVJRdVlPaC9ja1pLclhyQkdlbUZuSU44eHY3K1F3WDdzL0V0OEVz?=
 =?utf-8?B?RDZZV05YTjdaSS8wMHhWSFZxQ2RtR08rY1BOOXgrYXRzU3dab3Jla0xlclhh?=
 =?utf-8?B?cWZKQ29zTkpiUy9jYnYweGpiNysreWxsZDVZT0UxRGppQzZZem1SVWZRTEly?=
 =?utf-8?B?K3htYTdaQ2ZQZGl6eTB5V01MWll4YlgrN0JINm5BaFF4YmRFYnFDQXRPRUs2?=
 =?utf-8?B?ZE5tWE8yaXpEcCt5WUFKSFBOczZob3U2Y1hSZ25ZanpnaTVuNGg4VEE3eHlD?=
 =?utf-8?B?cWlaZlpqMnFOdW5mR24zNlpvYTJadTF2dlZqVWxQeTkxckRUaWYwUlZDNE1j?=
 =?utf-8?B?N253TXBRdDRmeG1MOU0yd1NPU3JvNXJPVmxKdWh2d29Ld2hnZDJsV2VVc0dL?=
 =?utf-8?B?Si9vQlM1bS9PcTM5anBwY0NoaVlqZDdRcnk4dHAyL1paSVpPbVpyZTdJcm5T?=
 =?utf-8?B?V3Q5K3JFTmJwMm83ZGgwT2NySTd1N2xzQSsyQVBXeXIwRWJYRy92VHFwYitM?=
 =?utf-8?B?Y25BSHpkZTMwL1VPMmVUVElxVGc4QjhpNUdDNE9xT2k3WjQvODJPbk9hUlhU?=
 =?utf-8?B?ODBaSVN4elRRc3kzQVVDNjExOFlUK29rb3ZtdGRWL0Z2TlZJSG1aQmpZSFM4?=
 =?utf-8?B?WFZoWXN6VFdHQW10T3JKTlhCL0FWWVY1K1l2SFl4Z25yNGxIbGFqS055NDFJ?=
 =?utf-8?B?ZEJiUlFtRU1JZVdFM0lCUE50emZadUl2SWZmNzlsSzRHODgxOFpiUGNPZ1I3?=
 =?utf-8?B?c0svb0U1QzR2OEQxUG95SCt6VFh5eWtJeEJWeDZUeC8vQTh3MHNMMlBXWHFa?=
 =?utf-8?B?eGtoRWJPUnRJblh6dFJabFc2dU9LSzFPbG9Oc0ZVSzQ1RHBEU2xCZGEwUito?=
 =?utf-8?B?K2pIOEFuUU4vdys3SmZqb3pkUlVPUHdYQUFVam9hcmhlVEg0eHBwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6870eb53-ec33-4eed-2b20-08de9001b017
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:45.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6gCAMDRsyHTn+zlxNsQwTqT9V2JFau9QJ1BP0H1G/Bzw/HwcGxMt90lHY9w2Y1kCvM2NLKw0ZqqqaoILDIkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3172
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12537-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 08CC437CF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Currently the example in the documentation shows a version-based name
> for the Kconfig example:
>=20
>     RUSTC_VERSION_MIN_107900
>=20
> The reason behind it was to possibly avoid repetition in case several
> features used the same minimum.
>=20
> However, we ended up preferring to give them a descriptive name for each
> feature added even if that could lead to some repetition. In practice,
> the repetition has not happened so far, and even if it does at some point=
,
> it is not a big deal.
>=20
> Thus replace the example in the documentation with one of our current
> examples (after removing previous ones from the bump), to show how they
> actually look like, and in case someone `grep`s for it.
>=20
> In addition, it has the advantage that it shows the `RUSTC_HAS_*`
> pattern we follow in `init/Kconfig`, similar to the C side.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/rust/general-information.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


