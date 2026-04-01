Return-Path: <linux-kbuild+bounces-12511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BMJOFobzWnOaAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12511-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:19:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DE37B194
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 498DE301F7AE
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A563CFF7F;
	Wed,  1 Apr 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iXuBq52T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2A40B6E7;
	Wed,  1 Apr 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049125; cv=fail; b=UdExSfvBlzPkn228z3++mtFo8RZ6qxsNziX9e0mJ3Rgn9swYKUpj5T69im4hOEX6XhLJRwwDUqgcc7eZ778WgGT9xPJUWci+ljna1h8xP/KzEWTfWJzNPE6533gAG9g2XShIgB+ng2ew/0Phu3LoG4fEWaxY4ZDz3C/XHoZ9qTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049125; c=relaxed/simple;
	bh=kQe3PThORM37uMO9FRKFNBDm03jkegre773EGxTeZp8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Et3X8oBFdeh8eo7OCCoaUG0BNYp+INmB76uAYLBiYlBExuWTELqv5bIqNBIRJJAgfuNhXLaXP1apEW7rVKWb1mzkGAG6QRZNyz8iFPZq9TOs6nSitKrV9PJmXuukEKiXlnJecZhctcLAoivn+bdIz937tdK1J9/WW6LUpVg5UDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iXuBq52T; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzrT5PFISsJeeudpdwl+yluCFEjSvF4fzNUxM5fXWB072zeY6tYv36qk3VHMGyfw59x89K5380PFkVPXJXL/Zt1lWOR5owQjonm07VTSS+72vqfT2oT511UaOCnbC4GibJ1OV3yq8hZ2DzvVAuC3xTOWmd2pmkRk3Ta1m1u81uV1QVPx0MPly+HUCbQZX/ckC+8ouPkv3tNX3u2mGK6if84itbj1AWNXs9shgOoP7oy613rTkVHf4qrD9OKZiu+FdZrjX+voqmxCZmsPC90tEqy7yvANCNhX3HrLDWG1sj6F7NJywbCcRdQam0jnXNSJPcrP9pywRQTWl9UWYRNWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRe6BWFx3OJaQCJOjVLECkujwRpjZedzEYsv0GD0Xac=;
 b=U2ei/Pvpcpaw0jXcQwYR6iP7KhwUbN/sQ0nG+tNflndq5JMlApWknnqWe8ULe1QHb6jCwVBoI7ssXBfLk+4xf49qdslDEOGuEPqLa3NH/vHZ6pIf+SEI98SymBdQANE/ou/5jpOPcNMHUxwKFwDsdihg7HB3fMt8NCG8KvH+HV696rtgzoaYlTt+SaIsh/T7eBbauiBM5uMsT8IAymzLFj4r/tnJxBNs/0G+/l3vM0KwBlPhUn90F0LebnBrjZPatwLlWP6vbM3jmwR+j4eHtqtYsM5lltabvMi1xhRkZUqagRNdhctlQVWG9vPRSQeSq5MqNZdgCgTx9+epvPyjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRe6BWFx3OJaQCJOjVLECkujwRpjZedzEYsv0GD0Xac=;
 b=iXuBq52TOEpwPII18iZiVgEDJ0vD7Slqg+yCpdIw/rBtxM/HZNXX2Rc8bv8IlrhMF1bX6oeDaN3GonOE0veiz8AjjCf3DuUlkSEWxTMr2YcQxnBaEbOXYtypyKsu7nvW5cGdSdCEdfgoeu671DXtDj2KiNKz6+MfKrpR1hHTnUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3390.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:198::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:11:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:11:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:11:57 +0100
Message-Id: <DHHUEB0VHJUN.3GRAJAJXWUTTS@garyguo.net>
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
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to
 1.85.0 (Debian Trixie)
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
 <20260401114540.30108-2-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3390:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc8c23e-a9a1-47c0-7caf-08de8ff04112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	skft0gZtrgyaB/OMfTcR5syYq0VeLL33ToBSXOG8VDCY+xkFzUhR/8kBih6c9mOsalaaA0B4U92DeOn1/ZPeL77KQ+xfm5aos+b5B/Fm2HPWPnS53f3U5rNw96UshWEE7qYHKydKWqvxB32Em3lySMAM+HwJIgyezeHdgPeDupA43Icui101qjtHmjuos8fgCT/1o/QD6nOxPo9rH6uwmX/3GX2zMLuZ9br4xrtXqIEJvsOCOE5+OpZPwY/namg9QPNOvafIVE76xylsZfYsYPfElFr5dxQLqOXKBtQMRmLMq9i+kj8rA21tz9MnBmaeRi2Wyh/NrjXEaHhFMlN/2hgR81RrSQ/gP7yfegmbF/+iqWxc3k0PEvr/SnYEVxtygda3HUkIF/4NMwNIiKIr3QsAoyV+8dc5IPhGbhmtdvEeXR9QsSvQ2GBBD/pOXSzGCO3kJ0ohz9gFT5nIoRTYV0tMygv7OJJNKP5EnAXpQAMoZ6/2pGjYfty0Ze2gQKw16GyypbCiZfe1rP74JUO0wl1ndDgseHeh+9Bttf5C/NBJ3U8zKbJyXd5Z68mJIQNrIDhXZCNAHB160M2dM+dYzQeGVx5L4Rf2PbV9/SPO2pU1YFhkCZowLJCm5esCGUraFCY0JBQxwouWNhaESDoQTKa7qAKBf5b6AOKAiEqwv0UFpwm+yosEMDW+VN0LTwqHaUfCZf4LUg19vPcvh7U9utC/hFO98R0JFtV/BWHhRbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDEyejRGZmNRMExJQnlOUzBodVJ6enlzNm15Uy8xYWl4RlVqellyM2tQako3?=
 =?utf-8?B?L0c0N3JXZTg5Ky95dTFiR2FzQTF0MjRPNWppaDFEcG8rcGZ5NkFFR21BY1Z4?=
 =?utf-8?B?Q1N1c0pCZ2RmdXJrend2QklhYkUwc2VSZGVqWXNtQmJhVkFkVGJxaXNzWmF1?=
 =?utf-8?B?K1kxWE11YUJVTnpKWE9rbysyMEs4cG1hNmJ0eU96TmoxQ3lENVppWkYxamU5?=
 =?utf-8?B?WW95YlNQZHM3N1JzZGo5UzFRck4ydHpZbWJaMDhjekNVZ016QXNXMFlTVnNw?=
 =?utf-8?B?MWhWTEVQUElmV3BrNlNySFVsZFl6VXg4NVk1d1N5NnR3U3huL1ZkU0lDOFpv?=
 =?utf-8?B?cGh2MFdMNm1aQzYxU3BhZEJMZ09jTUZuVGxaL3I3YnJ1ZXNJZjE0Yk9PbmVM?=
 =?utf-8?B?MTlXU2dvV0V5M2U4V2UvNjhxL3lnWkRrd3djNjYyT3NVaFlVdWdBOWkzVmlP?=
 =?utf-8?B?T0lBRTJ3SExML1VUbXhjKzdIYmRNSVY0Vk1pdnp0UmI4Y3ZHWkdKeUNuQkpF?=
 =?utf-8?B?aVJaVUx0YmRQbVZ0QUpFNTVvRWRvNVAxNjlHQkU4SnhoU2JjNFUwT3A0QmY0?=
 =?utf-8?B?WjF6NFVKd0RnMzN0dWxxc1lYMG9HeVVQRWJYejJTS1BSRUdVSnNsZ0ZRUXZp?=
 =?utf-8?B?SjZ1U2N3WmFEN0RMemlLT2h3TWNVWTdnaTk5NXdZRnV0dm1XVUdCSVBFL1dj?=
 =?utf-8?B?UkRFOVYvQWNsOTlDZ2xHNDdQQnE3Yk9LS3UyMmhqVnRMbWhkVE5aTGpVNmM1?=
 =?utf-8?B?UTlYa3o1WkRid1RCZDg2OWwvMjg3ejRmZytleVFTSjdadEFnb2FUUHhuTDNw?=
 =?utf-8?B?d0JwanhNcnc0SFh5THlDZnY2RXF1d2FONUVxNDdYODRIbmF3TTB5YkJxTEpq?=
 =?utf-8?B?TUVlZWVMNE5uMEErT00vVE5QWkNaVjBRVGV3cXJJaGZYQ282YlhRcmRrRnJ3?=
 =?utf-8?B?VXhkaW9pR3ZMOGo2dTh1UVFtQ2VYbWtBZWpHbEwwekw2eTRmZGpaYUlIRU1q?=
 =?utf-8?B?ZFpVVjFmZ1BFZVk1U0syRm1leTVRZElXVmw1NFVYNVZDZXRobThGTUtNaUJC?=
 =?utf-8?B?eHNXakdXMzMwako3eFJRQnl6UVB4YW1RVmswZncyZXV4cVI0N1g1NTRFUStw?=
 =?utf-8?B?N0JHMGFIdnhtSmZOT0JReXNPa2RHbkQzUmh3TGthSTUvVi8yd3BmSm8xTG9B?=
 =?utf-8?B?QkxOek8yL2xIbTVBV0JsQjJSSEZaclhXN2lvWHRRSS9CQXZ4RHdhVHRob0la?=
 =?utf-8?B?c1c1WVNDSXJhSUJzdHh5NSs4eXJaYXY5TTk0MWk1am9BRFVCK0dZT2JQcHpY?=
 =?utf-8?B?ZU0zL3Z1eHNMTFFEdElPOHF4am53NjhpTzdWWDJtL1ZoU3dybkpEZ3FpZ3ZR?=
 =?utf-8?B?Ukg3RUFWRXUwRUxYUHZIL1hzZWVEQUJUcU5vYlkvaFQzTzR4Tk9tdW14dDZB?=
 =?utf-8?B?TGtrRTBQYUpiV0hrMUZ5SWl2YlI4bWdnWFJuSnZpNVlVWTl0U2tUbE5KOHlN?=
 =?utf-8?B?dm8vNEtjMFNwSk8vUXU0c3BSNE16VFAzbUN1ZDNQZUlieTJReW1LdENzTnUy?=
 =?utf-8?B?Q1VEWDkzZysvN05LZmNEbDF4RWpGT3ZsMVI4Q2hXZFJVVVU0bVlDSEpVREE3?=
 =?utf-8?B?YzNJL0h3MUx0TlA1VGEvcnlmaVRuTGN1TDAydnUxUjhRUzFxVjhVOHNRRUxY?=
 =?utf-8?B?cEpiNHhPb2FFR0hUMVpTQ1RnYVErSk01UE02aWFyTjlVTmdZQjhod0o3S3U3?=
 =?utf-8?B?eDVkbnYrOFVTUDdGQmh0SXNwS3A3VWpBR2JlRTh2U1VYb3MrZ3puVE5YRStX?=
 =?utf-8?B?SWg1ZllJbVlVM1F3ZGgydHI3a1FUOW93M3VOYVZLMDZING9aVXJJS0xZRndx?=
 =?utf-8?B?K1BpamZRUTRac1JvODhUVjRmWlRLSnF5TGdvbFJnck9pSDBMdFM1alFVQU9G?=
 =?utf-8?B?cjdMR2htTy9NZHk4L2hFZmlqQ1p1aTdTL2R1cFB2RERBNHQzT2Q5dFlsSmg2?=
 =?utf-8?B?eWRZcG5tc1U1enNlR1R5d2VzT2psT1BMbFZwMThaaFRSa1NmYUZzSGcxa3lZ?=
 =?utf-8?B?dk1STkhsZ2VnK2RnNm5WYmkxaGhiV2lLbmdoNURrWHZkUW40dUpPRGYzUVJl?=
 =?utf-8?B?eW1sZ3dGRnM5MERhdk52UzUzNWtkT2lzemdzMmxBdDBqeHgrcmhQcVhZS082?=
 =?utf-8?B?QVBtUld3bFN6ZXRER3N2VVRUL0hwMy9PZXU4d0tON1RyZ1NzTHlzRUoycUlR?=
 =?utf-8?B?SE1WYkZLU0ROSEx1NWdkNGpYSjVUeVNkN1JDTE5scEVlSWxQd1hYUHJLampK?=
 =?utf-8?B?eFJlL01mTE5EdDcwQ1JUT21wL2sxNEJzTHJkQ1FsMW1GNmxHK3JoQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc8c23e-a9a1-47c0-7caf-08de8ff04112
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:11:58.0852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdnlOuEOAmqqhTGmpIJkJrsH/P98TN9Q0x/arNTWezDET/2VkZaThY7iZg+XxLzJhuVnKp4Fc+oh+8OwjDeuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3390
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12511-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,ubuntu.com:url,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:url]
X-Rspamd-Queue-Id: 6C6DE37B194
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>=20
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>=20
> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>=20
> Thus bump the minimum to the new version.
>=20
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
>=20
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
>=20
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
>=20
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
>=20
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=3Dall&searchon=3Dnames&key=
words=3Drustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)


