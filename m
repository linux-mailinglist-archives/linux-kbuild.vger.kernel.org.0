Return-Path: <linux-kbuild+bounces-12540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFW3L6RFzWkkbAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12540-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 18:19:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1A37DD1C
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 18:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 467403162D35
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C093A7F54;
	Wed,  1 Apr 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iczIhJYV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazhn15012040.outbound.protection.outlook.com [52.102.164.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F239B97F;
	Wed,  1 Apr 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.164.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057321; cv=fail; b=EcdOdbFsa0J7ViSdAleDh9seHkWw8+qblcxrFz2RglF62r7jmzvfFV4q04mDuIRGXClsNtmYw1fUTenfzqBZ8TrKxHxBc2o7NXSSRdgLlp2gN75nZXQUTOH6dlaOmvFGxGvSJ/NSzocucqS6deGnQtwvgmLlsC8OmlfYHeOpoDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057321; c=relaxed/simple;
	bh=1mTLiEgx3CxFKCjLfgztsaJxSKladW0I0KdZB3beH3Y=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ILFLfeByqWGXVF8KUC2Mpy7T4ARpnmQ/r83bL2m5os14Kps0FU8qpkIpYtDO+BS3y20Z19KATEyPA1Ho2yg1PdyxyuE3QcWHirJrw8VAZ9IjddCjzJGdbgjBlY8yCYWZrpP4JdHEvW7AIIZwB5JSPUwvQpPWsoamKtYJEtqVsMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iczIhJYV; arc=fail smtp.client-ip=52.102.164.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFk8fm5W8e+1HgMcTWPzMQl4ED0sOwAQPu+qvBsmo5i6hV3ghVakPtZiSUDBonaVOWDdpgrlxE+hocGBYprRatGApnzFGAwjSJBVt+qtYcGIAlY46s/gwTapRRFztVf9jSoiSvzjRJu0WG1wW6eD7TvXc5fWSn7yevsgKbgtbsideU2Wf/hG8wIVRHri+Lhsd8zbNt6If+wJ4Av675Y778QgY1NkTfjZvs/M+JxyUhYVxB+lLCKpvdFE3xXofD5057Rc6GSTr/Nj9cItxdPrQKfnV6pxwFyEuBBn1HovL5TrVXPW7qQmTfh88Gp3JczTMKBg6tMcINCe5MMtonGD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO7kHp2b2SVbdcrVwQKXjuKTfDKK3D1CXKRO0QKYUvo=;
 b=Mdl+CbLXSyI2/owx275rH/c3CwoOCvwi+EM9c2b3w9pwdi9AnrReYKk7xMGFyDznxGFm95WWXJCZWRafXeeFktxsGjERX7GNeNyGOyCqCxrtmXwwvEPjIR+Jv+aQic/quBhZzmnPjNhHRAsat/zOFA0zGVx92ia0eWGPUSvsg60aej+sK1uwTZbr3sqTxqTFHCH73Zb/hZDPQDRbklHZIOqww8x0D4iRwdFIZhi0iNSfzAi4rvWUw/Vx2s1Soy602ciok/BraKeQtz6M6ifbJfHAtraBSe0TmyNpYNzfwfZIFQ04MoOoXfFnH/OTx+hcptOCr8D/jrRgYgDJ9uJaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VO7kHp2b2SVbdcrVwQKXjuKTfDKK3D1CXKRO0QKYUvo=;
 b=iczIhJYVlNlQ5V1n8AxhKK4I8MegmL5+L5o//GyAT9fvwXuK68I+aBCqh/rXIWhJg3v3w4bUfxgu4FoRh3/TOLm1965O4CcleM4vXPCi3p6ejXtOcRVIw0p9EPe41u8C6onFzQzhthIEiYueQr1KWw+jfyiZ2DvI8tsA6muiEhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3172.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:28:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:28:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:28:35 +0100
Message-Id: <DHHXAX86XGL1.VIS2N3R445YT@garyguo.net>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust
 < 1.86.0
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
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-34-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-34-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7001020c-2a5d-48af-3f42-08de9003578e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|13003099007|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGp6M2FHNXplcG03SFlsSmY3STJhMjFZVFVrUWNqaysrRFI5NVpweXY2Z3JH?=
 =?utf-8?B?WGtzVUR5ekRhckRUWVZXR0JDMGlYK0R2aHBETjRkQWJBYno4Wm5vYVM4Z1Vu?=
 =?utf-8?B?aXRsQkhDVEhHeFNHSlhlWE9KWmZTVkpXd2o0OFU2Qk5MVUg2NWVKQ3FIb1Zr?=
 =?utf-8?B?SVg0bmVDNjlIVElMM0hIZ2NTdkg5aVpOc0FBMlJIODZOZGFKbkNNVG1aU3Fn?=
 =?utf-8?B?STVBb0pxMTM0U2VDMW9CU05WL2lmb2ppemdxTzZDTEhjRGtkMlV3Sll6QVFV?=
 =?utf-8?B?b1J0UkxsRDlSdWRZVld6TFFPdTdvNzByOUxYdGVod0tjQWNBa1JoOUxtRm9O?=
 =?utf-8?B?SjFVRkdLb3FjTk1yNlduOURwNFVBQVQ0NGU3MVV5c3RSTUMydzRWdm1VQVQv?=
 =?utf-8?B?VGkydGo0WExNK0NqMzBKbkt2cjRkZDZabzlVcHJmMUdyV2pVQVgxQ1lITFd5?=
 =?utf-8?B?eTRLZGszWi80Vkw0NGdIcklFalE3UFhwaEVMU2czdjByUEVnaDIrdkR2d2hq?=
 =?utf-8?B?S2VSZnVXNkFSaHY4U0EveG53VWRTakxIdGJCanMrT3c2bXFLUi92TGJrZ21R?=
 =?utf-8?B?WldMUXo0NEU3b2hHY0p3UCtCQ3M3bytaOFA3cWpCNmd1c2REVTJsbFVSb2hE?=
 =?utf-8?B?aTZ5RFViQ2tuNmFCVnpEcERQNHR5cm44MUk3K0d0RnJLU0ZNdk9US2hVays1?=
 =?utf-8?B?TGg4dm56aUtWMlZ6SE9FN0hib0swZ1Z5eWJmcVNtNlhLRU5WbWZ1djVuVmdX?=
 =?utf-8?B?ZWJ1R2lJcjAwYlhiakF0dFEvc1pxc3Y1QlFmcGNDbEhGN01QVitmRzg1VWJr?=
 =?utf-8?B?cWNYVEdJSmZxakZGWXQvNEpEOUFYUmtoS0dRTXVtUm5ONDNnZUx4ek5ONzRP?=
 =?utf-8?B?cXk1MnlEK3NkN1JkUm1jUk90WkQvMGNOQUhnYUE0cmRzN1Nob0ZpdkR0Qy9p?=
 =?utf-8?B?OUV6MUJ2alB4QVhPVFJTTG9FdWdDRm9CS3pnS1NSQ0FMMnJ3cHpBOUxhVHI4?=
 =?utf-8?B?UHEwVllsemlKL2VqRWo1L0FQOFJFME9Tc0EraEJmS3dCcmJMSi84TjFRald5?=
 =?utf-8?B?NEVVZVlHdHFKU2xlVDBFbm1wczcvb0Q4emtUdkdGL0ZRZSt6aHNCQ1VNTDU5?=
 =?utf-8?B?SkR6RmlPZllhSVlRN3FCYlRHRXVwNi80a3VqM25mYTJaRnVJejZTdFREd0Ix?=
 =?utf-8?B?clFmZFNTYTJENFhHUTRHRC8zeFhwd3kvNlREbC9YWCtlaXk1VGh2NEI4QmlN?=
 =?utf-8?B?M0Y0Y1hyOUhFMkJQR1BKUkkrSlM2Ui90NHR0TWdaZHcrUjUrYUl6OUpiSnls?=
 =?utf-8?B?cC84V1h4bGpheXpYNEd0MjNTRTF4WkxnYXRKRkVBYkR6UTdvOU50WnBJWEor?=
 =?utf-8?B?SEphZ3AwazBCaUlRL2NRNUZlc2NaVU5pRDY1NU9zYU13c2o2cXZadE12UmpY?=
 =?utf-8?B?Tloxd2dzWjRERnIwa2RmajJCSzgwRW1HVHVwcmxpZVR2RnU3UmR3NTBWRENM?=
 =?utf-8?B?TjJTck9NSEZ5eUY0WmorNC9rY1NyOEdRRVhnazdScENOektBTXVseWJnMzF4?=
 =?utf-8?B?NFcvY09qbzV1WWUzZTkrSnNVVWNhVlF0c0tXZmF4NHVXeHdxbjM3TXk2cDhM?=
 =?utf-8?B?U3FqRlkycTNoZ0xoTE1hSDdSUGpObDlBQUNWV0lUd2dPM1lUOTZzQkFZK1k1?=
 =?utf-8?B?ZzEzM0w1RmEzODY1SHFISTR4dzBSU29zVExIai8vWldueEQ3Z1JPRnRtc0Vz?=
 =?utf-8?B?UkpNRnJjcTdKUVRVVCtmc2pEeXZLYXNpZzNjZGlaakNrbkkwTHVaL2g0ZTB6?=
 =?utf-8?Q?AR/SyYWFfFmzslksUTe0z9dRPHOGJ1idno5Sc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(13003099007)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9INjRROGpuRjNQQnpSYnI5R1grbE4yc2NEaWpCMFlkQkErOXQyWG5sS0Vz?=
 =?utf-8?B?WElscVVUcC9sRUx6eVpOYm5raGhURXFZcGNtM3B3TlkraHc1OGtONjRONXox?=
 =?utf-8?B?dXhnVWJyalRWbnkyUVlSeEgycGJqWGdoTi9sYU1Nak8ycXZhQkpOZ3ZZUU1M?=
 =?utf-8?B?NElCQjE5MWpScUdldFpKbHAycEp4dU5TUTJPcis4S1JlMHZDYlVvVDN4M1p3?=
 =?utf-8?B?RXpZRzcvSkJZbG9XbHY3NXNUNG5EMnh0d2pObmdnS3pRU2RVMDM5TGJGNWpi?=
 =?utf-8?B?MEQxcmVnNjZvSDExNkZtS1Mya3FxWlduOTBNNmxVeXI0T1pGVGdZTS8xWU1q?=
 =?utf-8?B?NzVqWWJXQlRjelZPSStycVRPSVJ2ckJHRmNCSm81aWNQWXNPZFMweHV4by9D?=
 =?utf-8?B?cUZvMlF2Y3lnekpDVi9maWF6eStqaTFneHlaZVVmd1lOM0tqOUFJTDVUK0Qv?=
 =?utf-8?B?dGRzMm9jT3VDYmZicFRvblBYVW5MU3ZRci9BVm5QRnNPL1VFWW0yS1pBdSt1?=
 =?utf-8?B?KzdkbmtjT0VKTnAralNvZGY0UUZSeTBvNGI4bkRLMGZJcHN0T3Q3TXM5Um1E?=
 =?utf-8?B?eDdsRmhZUFhoNTF0ak4ydUhNMXlNSUpKcXRkZTYwYnlDOUtXTEgreUlTWVhN?=
 =?utf-8?B?WkhiVUhsck1uREFUQ2pBQk5oc012OGdkcHlsZjZScDMzMkNlWHdnN1VZRTVB?=
 =?utf-8?B?N0dac090NEdBNEpkb3MyRFYyZUl1NmI0eEJPbXY5YnlWQ0l1ZFlYYTVvTkhQ?=
 =?utf-8?B?eHJmenNpQWc1RzdiTjUrOXI4cTJjZWM2K0kwRFdGYlJLT0NmaURHLzVENklk?=
 =?utf-8?B?TVZFREZhRm4rOGtUWTJmSjh6ZnR0aTFENnBLcm9BQnVxT3p3U2Fpd2ZsdS9O?=
 =?utf-8?B?T1VLbEMwcnpEVllzVWRXY3VBRDN4YU9ibllrMEh3dm5CWWpBdXVvdCtjWXhl?=
 =?utf-8?B?YTc2d2x4Vys1QktnNFNxR2tQa044TXFmT0dFS2lBVUo3OGlXaHQ2RW1Hc0lr?=
 =?utf-8?B?eWFIeXhxYUNRcklxcUdQUmZ0NHVvK0NmalhoUWl3Slo3eTQxbnJnMFoxNXFa?=
 =?utf-8?B?UXNkMGVHUFdxYXQ0SFpnSFJzMGx6S01iT3Mzd3RpZHBtKzVYdUU5UlFQQ29S?=
 =?utf-8?B?VEFMb0lxejlpUERLdjZ3MEl1cGpDSEcvbEtzSEFoVk5LYmxubnhUWDc2Nith?=
 =?utf-8?B?blRuQnVSZ0RuYTE5VytHcTlHNC9NYml0Sk5ROTdhY3JrbDhWSHRJY1NXYzFh?=
 =?utf-8?B?UEJ5VzA4Y3lEUnNwYklya3NRaEdWbDNvR0o5bmIxTi9aQUlxcllIM1hrdG11?=
 =?utf-8?B?K1Z4akNUZ2xZNVRjSXFkQm42dkc1RXFoU3BuVVFmWE5nLzRTV0VYQlNQTjNB?=
 =?utf-8?B?b3J0ZkVqdDlqbjNidzNtNnJKeDdjN2gvNXRwOEJZQTNJNi9kdHpSV2dxODFM?=
 =?utf-8?B?Qkg5T3l1UFQ1cFZ5OWc3bmpleDZTL1l3NU1TRTU2R29PSHJZb2lMWW1UY2hR?=
 =?utf-8?B?MXBGdWlyV1crQ2VZYXpORG1YTXNHSHhsWXR4YUwyL0NqS2RyWHc3UldCL0sw?=
 =?utf-8?B?UjAzSEYxWmJvTFhJSVltVjhXTHZMNlkrQ3ptT2o1dG9rMU52ZThjWXpBSEZl?=
 =?utf-8?B?TllweXh3Nk9TQkRYNms2NzBXMitYMFp3dlRRODlRVFVGRGNUSDZUTCtzVFRm?=
 =?utf-8?B?RzZpQUErWmVCODJVQVk0TWJLQTZocmlBeG1FNEEyajZQeFdhWGgrOTBmRnVS?=
 =?utf-8?B?cG1ubXVRMnVIRm5FWEpMRWVGOFltTC8xWGdLc2Z2NnVnR0Y0WWxuT09iVFQ2?=
 =?utf-8?B?MWtGcDNoQ3FjUGd6NTVQUVB6SENRTGo5TFFjajlpaEVUUkd6dTI1MU5yQVpQ?=
 =?utf-8?B?aXY3UDdIWE56WXVLVlBUQTdsOVE3dVVRbzgyckxTWXU2bm5ZL2dGVnE2djJM?=
 =?utf-8?B?MUdPQkxOeDJJRmxyMkt2NDBpd2ZRZzJZVW0rY3hneE5FSVU3MDg3L2pBNVBz?=
 =?utf-8?B?ZVVuUGw0RVp3cUNUR29tbVZ1dHlST2lNODQyU01jZlFSVnRSKzZXdFE5UkVl?=
 =?utf-8?B?ckdyL3oyVEk4ZjEzR3NuTTNQY25xZjQrTk10MnpLWmQ4cjVpdHZnb3ZaSk1G?=
 =?utf-8?B?R0h5M3ZYTG5rMmNramNiNDNnMitpSzA0MldCYmJYV001TW91b09ZL0luUVM1?=
 =?utf-8?B?U1JwWVJhWDVuYzFlYmZVTjhhblY5YU5ndzlCTENpaUpwNEZraFNJQ2I5UHE2?=
 =?utf-8?B?em9tL2ZYRHM5TDNPTmhWZzAxYnBXcHUyVEkzbFBWU0x1QWtsYWJKUEkrMmJN?=
 =?utf-8?B?bGpFMWJBRFNxNnN4b2l6ZG5mOFhOTDFtbjQya2J2MGYrNk52ZHo2R3psK2t3?=
 =?utf-8?Q?fyLpKtX5RBHorD0go0kYg3OMXLqAWCBjqdjmVnmf7I4uN?=
X-MS-Exchange-AntiSpam-MessageData-1:
	bOAu5aDpgbRyXu3ta3viwugvC6WLurv/+pwLpyXQpHfh3T9NdRurlr/DoGh4xSvaK8yt3kIeQ5Er4yzqe6BSnY6C5pEdks62wq8=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7001020c-2a5d-48af-3f42-08de9003578e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:28:36.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTVXsKBSw7AJpghbpU8AGRHOcuta1+t3JM4/Xqh63muD8XSjp1qy6In5bGId7T51xw+i93j4GCPpi7J282OZFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3172
X-Spamd-Result: default: False [13.84 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MICROSOFT_SPAM(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[garyguo.net:s=selector1];
	TAGGED_FROM(0.00)[bounces-12540-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DMARC_POLICY_ALLOW(0.00)[garyguo.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[garyguo.net:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,rust-lang.github.io:url]
X-Rspamd-Queue-Id: 17F1A37DD1C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> The Clippy `precedence` lint was extended in Rust 1.85.0 to include
> bitmasking and shift operations [1]. However, because it generated
> many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
> lint which is not enabled by default [2].
>=20
> In other words, only Rust 1.85 has a different behavior. For instance,
> it reports:
>=20
>     warning: operator precedence can trip the unwary
>       --> drivers/gpu/nova-core/fb/hal/ga100.rs:16:5
>        |
>     16 | /     u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).a=
dr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
>     17 | |         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::re=
ad(bar).adr_63_40())
>     18 | |             << FLUSH_SYSMEM_ADDR_SHIFT_HI
>        | |_________________________________________^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#precedence
>        =3D note: `-W clippy::precedence` implied by `-W clippy::all`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::preced=
ence)]`
>     help: consider parenthesizing your expression
>        |
>     16 ~     (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).ad=
r_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT) | (u64::from(regs::NV_PFB_NISO_FLUSH=
_SYSMEM_ADDR_HI::read(bar).adr_63_40())
>     17 +             << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>        |
>=20
>     warning: operator precedence can trip the unwary
>        --> drivers/gpu/nova-core/vbios.rs:511:17
>         |
>     511 | /                 u32::from(data[29]) << 24
>     512 | |                     | u32::from(data[28]) << 16
>     513 | |                     | u32::from(data[27]) << 8
>         | |______________________________________________^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#precedence
>     help: consider parenthesizing your expression
>         |
>     511 ~                 u32::from(data[29]) << 24
>     512 +                     | u32::from(data[28]) << 16 | (u32::from(da=
ta[27]) << 8)
>         |
>=20
>     warning: operator precedence can trip the unwary
>        --> drivers/gpu/nova-core/vbios.rs:511:17
>         |
>     511 | /                 u32::from(data[29]) << 24
>     512 | |                     | u32::from(data[28]) << 16
>         | |_______________________________________________^ help: conside=
r parenthesizing your expression: `(u32::from(data[29]) << 24) | (u32::from=
(data[28]) << 16)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#precedence
>=20
> While so far we try our best to keep all versions Clippy-clean, the
> minimum (which is now Rust 1.85.0 after the bump) and the latest stable
> are the most important ones; and this may be considered "false positives"
> with respect to the behavior in other versions.
>=20
> Thus allow this lint for this version using the per-version flags
> mechanism introduced in the previous commit.
>=20
> Link: https://github.com/rust-lang/rust-clippy/issues/14097 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/14115 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Link: https://lore.kernel.org/rust-for-linux/DFVDKMMA7KPC.2DN0951H3H55Y@ker=
nel.org/
Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)


