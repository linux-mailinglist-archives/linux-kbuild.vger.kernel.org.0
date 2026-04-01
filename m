Return-Path: <linux-kbuild+bounces-12534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AvoGlc2zWlwawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12534-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:14:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D637CD02
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A10D305446D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A047639934A;
	Wed,  1 Apr 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qDk97i71"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020113.outbound.protection.outlook.com [52.101.195.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950E372678;
	Wed,  1 Apr 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056258; cv=fail; b=XI00YFhybhC0Dn330tl4LsjNpKx3tw+OnV9mfc4Ltg7mVwdxg6YMQTK/9BHs6svg7odoygH4C5ryf0caowLa0VUxa3+G+3e501Lx4ava9B0FGJkXlWEcHmhelJDuCm47Bi7TPOQz+pTde6Cw/TXyPIahd0HUD59F5ueOkl2UWt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056258; c=relaxed/simple;
	bh=h8nVw+a2F9+E0uY8oR4HGMxP5Y2d0quWCG2uBg/DQVc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=BRwC2k+iq9eLhLvOY5yl4zUScBvCfReCiP0S4FbrYzvTHL7rv7pBdRcor0iN+ygFF9VcIkPtO2fK2Izdg7S6pcEfIr35CiTURwwzfAFsbeXoPPpZ6P/cgfrq77pjcGtc9r1GNxTFAiZ6dRXhg66ifveC5Zr2cMXE/xg/1ol6aJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qDk97i71; arc=fail smtp.client-ip=52.101.195.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swl5txZBaLCDA7OHYTKCbs6xdRd5h+rvyFn2jN2ErJtEUMx/vK/M+pDfmrCHBG/IUrEYN4O/pGLzND4jGNN9B2DWe9iIsF0BA2UKMuRw2HsIPPdkYsmsa9hPzCUCmqBetajL3XShJnOij7rix6Qe42TCRVp6YjzdDstyPeCcuE+ADMs8MZ4pEqt701mNZTAT8B3U8QtGo0SZu+Lr0VKh+I7YeEtmtYpbrmV40o4BBlUYVqePPZmllchoyxKIhbul9Msf7ZhEFR9tb2obRsTP5jA6+aWJdBJdN3vn5+xkCCzyyuht32JQg5TaYIS2Z/Xq0ytJTVrPiL1bMk5gCAEYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrpMZG7EvJ3HFXRdK/se06hkR7mkf+NQAYbTV9lrt6o=;
 b=Xzy0T1Kenau386Q0NNhbG9Eg61SPrPOi3t67iXicH5AZnt+nSCCYpCeV4HzZhJD1V2PxTL1g+sprd4T1neB1hdE0YvHRZOBBs/rl86Omiw6y2JiP6zXRlwYl+2s3H2Col1wOp24NZ50KVwZ+N3MvKrww7lJ5iILB9F+/3iEFDTFvjkiNvpL6j3SLy92BZoOJJpSYVpxY7/hp2yrwPrWEVXwO7T0Z136uZGr8i8g9bwcTTiQxiCJwXJhu12eRV3fLBg9cp1D63eKB+ifIQ2f3SyR9Uj665x8g4FdeZhRQaKexqi/5yAlD89kNQcXRENTue+lLe6drXQva9OZ18EsoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrpMZG7EvJ3HFXRdK/se06hkR7mkf+NQAYbTV9lrt6o=;
 b=qDk97i710KY1eMCpkYvurazFQvbkaytIzOwllsEUfPJtDJCr9o/cqh/KOdVNQQhgXXlyllWL0STids0ujKT0ExcTgGGwouIdhCJWXxuZa94kPXG9JSDMOLFUMRyLvBhazrZMYdKVKB7tqynzN2K44IYQ5cpBomrMEs9G2HCdDkc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7215.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:347::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:10:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:10:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:10:52 +0100
Message-Id: <DHHWXCVBO9UJ.3SLI8JZZ4QT12@garyguo.net>
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
Subject: Re: [PATCH 27/33] docs: rust: quick-start: remove Nix "unstable
 channel" note
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-28-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-28-ojeda@kernel.org>
X-ClientProxiedBy: LO2P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: ef02e534-0380-4c3e-b838-08de9000ddfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	spYyYyKAx2kTbpI28H4VRL408AdcMOzgp4rtJZWIBEneyR/1sKISco6QtMQHWxxrLR7lJ/WtqTp7UK+K3gofa9TJg4jbx/PFZZ1Pr5ugWRr4MUH7wuzXvr7aLxBUkQtnpvaK7uGR0Jk27Yp/egmn6YzK1f/6//gbFEbDYHb/vbRfzZArVoZ4c8+267LAmiUEfjbIhTXh++J5WNhHxd7ak4QSTajMGtNVK8OsM1eRN3gXn9KskNw1ggaRpb8Ozmu4R66T5hfYwrYfrrVD7c9pATyqIRd1c24xe9+Ni629Saok5u+ICh2VTMmfzyDFTs13P1wTLgt59CUulhpIx5+RKSx3vhaapCEZlPznu2qJOV789erYTrair4OEyov3LcFrcvcVeBfJMda8gltEnAE5Q6fIvFAhhZcJaEYPSQjs4t01BmIOqxRt8+R1LIwLM/h1zm2wOkubPRPlYgyumodKZK9MZ90K4c0suGwrf2Wpc0u6sX0KFZGTO22fvgj4ld2dLWsQOQB643TjyYbEIXViYH+1JIaYPFEmzOaRCUYvAGJEq0ncTWEMrr506neIR3jxx9Nrf6PTJooC3M9c8jO7TttXl7ZzrMXCkBCTgQOR2fR90A5XnL06J76nfMp+UEEgWqkzfFlaGptUO5MPaSnKkLQZymMuBODt5UjGo+fiBz7Z30Qj0XJas5dUNjFjThccYNo4dx1m1pQNIzgE2SwUxY8J+GdIb+K3XWU37u8xpj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVJ5d1F5VDBqWXQ2UDJxdGFLL1BoTjRtais3TkFvNFdRZDNzZ01mazFuYU4x?=
 =?utf-8?B?U2IrdFNkL2FqUnVXdW5KZU93b1E0Q0QzOHdCWkpQNGE0eUNLVVZVK2J2MWQ5?=
 =?utf-8?B?RUw2WFAraUpibCtUWjhDQ3hKZGs0UmNmZTI5dFZ1QVVDTjM2cHhUQlJWTnZS?=
 =?utf-8?B?Y29uQ2pHNS83V2tDVXpGRjNIR0pZalluWjh2QlNQUFJxUTI5U1NDM3ZEUlpI?=
 =?utf-8?B?NzR1ME9VdFp5Y3RXc1Z6b2ZrQ1dBRm1ZRk12VTdFT0h2WUw0ektwRzZaS2VS?=
 =?utf-8?B?NTRwZ290d2pzblMwamQwWDVUNGxIbDJqTDVZVWE5QVZyMGxEQlZTcUlNd3ZB?=
 =?utf-8?B?UlVYWDJIMVZ6V0hmNGtoaXZuam0zdE9tTlJWc2VXZGtCRzF5Um5nR0tFQi9L?=
 =?utf-8?B?Tm55Q3F4NHRMd2xDM1BDR0VyWkY1TGFRY0FXWHdiMTUvUVRsSkVPZVlEc0Vw?=
 =?utf-8?B?NmdwRFFtQjFPUklNWTdMTUY3bXpGUzcvZmNjZU9oTm4wZkNCVCs4M0RXMyt6?=
 =?utf-8?B?MUFNNEltSDZpRVlaaFRHK3ppRlBZOGhHWXMyMVYxQ1o4Vm8vZEZXbUhJMzhi?=
 =?utf-8?B?UWo3NURZYkVYL3RDUGRFajVOaXJnaVY3Z1d4NS9tRHhaRVQ1ZCt6ZURleFh4?=
 =?utf-8?B?QStYM1FvNTNYVkoweGQ0M1h6VThzNzBRNnYxampqU2ZTaGpTZDlxV0plbDZt?=
 =?utf-8?B?UlNPMGZHcEp3RWo2VHVtYnZTWlN5N3lleFJPK2Zna3FEZ1FCOXlTdXUzbjZD?=
 =?utf-8?B?YUZ0NXB4M2E0bk1URmJZd0tNVFoxbzE0Yy9jR3VIL0E3WGs4b05UL0JDdjZU?=
 =?utf-8?B?VE1XaFZ3eGJ5bmd6L1ljSE1hN2RxcGRSY0lVQUhUZUp5NFYzc2JwcGFLbUF6?=
 =?utf-8?B?S25rWHNiQWM1NkRHT3R3VnRqUE5WdWJDOU9HTDRxQ2ZDZHpUUTJuT1VaSytt?=
 =?utf-8?B?QlI5TWdFZmVmSndnd3hZaVF0d20yaVBiYThkQ3NTM3dtclFPQ0Njb0t2TUdr?=
 =?utf-8?B?UUxvQWdObndkakZwNzhnd21taHR4bDZSeVc1Qjk5Tm44UXpXQjNzSzE1MFFU?=
 =?utf-8?B?NmtvUHZnYXJrVi9xNXN3TmRUWlBSaHhFL2hNU0ZQS1g2T1dpR05GemlDaWhy?=
 =?utf-8?B?dkhZK1psUE13YUxGZTRxZWpvK3dSbWZTNzA0SVlaRU5BdURZSTkrZHhzbkpl?=
 =?utf-8?B?bTdrVzcxTE8zV3NMZnNmVWhNWmM1blYzczY0S2UyR0lxTkdmTUpzV0xOUS82?=
 =?utf-8?B?d0svQ0Fud0dkYmJ2S2hMRzJpVjc1eWlCbUY2R25TUERpWTZydm9sb3g1d0ND?=
 =?utf-8?B?VVQ5L1F3UFRmdmV2YVNQT21tMzNBak5pdTNUQnZGU0h5M2JWM3pnRTBPeHFN?=
 =?utf-8?B?M2N2cWlNZjBSRXMvUU9NZk1JRFI0Yk9JWDE0TDg0VHZYMEt4MnJpMmdZTC81?=
 =?utf-8?B?T2NsOWtBeDlENFg1Zkl6SDA1N3l1a04yRTFmVEJmSFZrRFJqZkc1dENIMXg5?=
 =?utf-8?B?VDNqMWpvSVh1TlJaSmFSSit6NU9QQjNndzFVS3FUZU5DUGZscjRnTURrMkVy?=
 =?utf-8?B?Sy8wWlJSZ3FsTHRaK2ttcEFQMGIxUG0rSTVPZUF5Kzdvc1FSeHUwc1h5YmFq?=
 =?utf-8?B?S1ZSUjFKL3VjbXljTjJySC8xWVlyQStaWmJVcGVCdUF5ZnFuWGptOEZmL2Zm?=
 =?utf-8?B?MjdOSDBoeDdoQ0dNcWpIbDdHcXdmNUtSQVcvTFk2MjlqQTZhRTlBeWRvcHBi?=
 =?utf-8?B?YnRURzhGWHpLQ3ErR3ZySy9uelQzTExtRytmNTZsYWlZMWEzUndlVnhXek5n?=
 =?utf-8?B?eTlnNDhVeFhXaVA5SDQ4dGpEUXU5ZEh4QXpkbTB6dEpEeHhpV0pTREtmM3hJ?=
 =?utf-8?B?V1N3WllUdU1ucnFqRUwvZGdDajVwWGVHWVJid2Q1U3luK2NQWnRqRUFGUm5u?=
 =?utf-8?B?Nk5heEJrRHFub0VFMUdESisrU1YxYSs2b3FnRTBjNlA0blFCRjRGTGFKbnlJ?=
 =?utf-8?B?QmZxdmgxSkFqU2RXNVdMNlV2bk41SnNHNFBQSDZDY0xSSlBWSFVJZW9mZFlq?=
 =?utf-8?B?Yzc2S1l5NjNQYysveGR4QnBubWJIODdGc0pLK21wWGozVXJrVWtKSDEyTld5?=
 =?utf-8?B?WEZueGU4TlBaQitacHdkRVlVa0REbkd2MmQ1VUxpQ3dkakdOejIxVjUwa2JE?=
 =?utf-8?B?TnN4SWRxZ2dmeDdic0hkR1Nldm5zVjJGNDZNQkNaZDZpVFhJRGdGMHBSMVNH?=
 =?utf-8?B?T2RLTTZkMm5sT2tidVZYWHpMUGduOU84OGtwVEQxQ3FZbENQR2lDUkRWVkd6?=
 =?utf-8?B?N0hTZ1pVQUg2Q3B4bkhWby9kaGxnT3BhcFBxaFZIa0VVczZ4a0w4UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ef02e534-0380-4c3e-b838-08de9000ddfb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:10:53.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwBORnNDBucRKED3vHpUfF0oGKsZS7OKh/pyzSwSiVWF0Mw/tny2E/ZTvotoOuMYMQU5wvX49YT1kXLotAJIug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7215
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12534-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,nixos.org:url]
X-Rspamd-Queue-Id: 027D637CD02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Nix does not need the "unstable channel" note, since its packages are
> recent enough even in the stable channel [1][2].
>=20
> Thus remove it to simplify the documentation.
>=20
> Link: https://search.nixos.org/packages?channel=3D25.11&query=3Drust [1]
> Link: https://search.nixos.org/packages?channel=3D25.11&query=3Dbindgen [=
2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/rust/quick-start.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


