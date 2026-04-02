Return-Path: <linux-kbuild+bounces-12590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AE8C7/JzWmHhQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12590-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 03:43:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B732C382534
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 03:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D7553051C4D
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 01:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4354422689C;
	Thu,  2 Apr 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ceyOgkuL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021121.outbound.protection.outlook.com [52.101.100.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F651DED4C;
	Thu,  2 Apr 2026 01:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094194; cv=fail; b=reKnwM4j/r3lpBfEBkrJiv/TiqSo/FZEUHRp+i9wPG8nhc6WGYKGmFuHHnCeUot7IGPo/gtA3t1xYYyRw4B0UgNBJkEnAR8AOZYrPlKc5JwZaQAlaCi5tBSdXaeSFBl031wuDThIzeabHp0NRqJeKiidZW40oWzfU/Sm06J5W8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094194; c=relaxed/simple;
	bh=BvZcpENzV3m/vhs8j9yvhHWUTV/0DL/3Dt9LeQqi1HM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=r9LeLyTrcdMLYF9ttOF+MQTz8jUWiq4kFlMLERHiUQuq6IxGZKPhWuj01rQIxcPVvkH1jlKKIqHM9NCwHgKkrCQAH00N83oUJaS+OAkOfTBTmPuGxuGblMPcAVhj9xWyafqosygEVBNblYdkiAIQDe8YjIiNEutzDXIRE7Qpgyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ceyOgkuL; arc=fail smtp.client-ip=52.101.100.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrtYVB9V4Auf5CCcIxCEZXp2bOujP6TGIyky7qsKbymvAgBIATxBS700aUlGKced6jirqmOQroTRqxAvYG72PVIyLzt/NUFgiJswxmJxCHYbaQb9dylVr/RzDI4I1XHAIV3h+cPb6+JegfP7CVQQBOFzvc2KM3r/PfouNXDOxKOYfTPmSPCvypYM7xivnxHeO/Zp0ChmkBFu4dICY0uWqVoO+CKHzV0j3nuJPGLZmTnZlGgM6PemV0usqd+PBjMxO8/s+uSsEVMUGkgt8bTHdcJnR9nNQNZcZ5NBUAH2UzDbNgCGmqv9zwUrySB9j4ROP8WhfHEls8xwsavU9TmoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qB/G8D+a9qdkAOTFYwaI8aFKUBkBofs0Mj2RRHrZvk=;
 b=OPEgW5n/CjBq7RDfNXCtoP33ohiSYOV/FpiT6xGXApV8ND3h+wOGd/mgpBr05oGtt7pVrWX4P12gtRJk3Cmr9jeMCFKcjdQdFrUhCLgOv+G4q50FFSKwNBOHkuXq0spO+JxYHhuS3GES5FZZZ5WFVcSZA/g9ZtjJvlmejcpq12LPu05c+IRBO0Y+KCrqmgh50bhU2fwsq5s0RSov7WHjLCXw/jabXevHTK6OK4QL2i2sdQ4OQ0yzwzhW63Xr+7wsOD/x171iCxqJgLRoGcT5yvqO7Kwjyali4j8dgOewxbnXNMlJu+XHFEJBGk53SLtyRh7YQ0UnkoYuXU57MHM7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qB/G8D+a9qdkAOTFYwaI8aFKUBkBofs0Mj2RRHrZvk=;
 b=ceyOgkuLTNtVfumaYrvYf85iZmol8B1GfgMb2cBRuvYgZaNlBg8v31smlhJPgheZ4a6hSydoMcAQOcz+b/cQd1AYy3Uc8pBuLHDcIuLS3Uz0LRY60hQTDbQPBDx04uudEIJUwyHzXLpdP/+t74U9Ra8BmmvPXCyEk7Iy/AJ0mEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5671.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 01:43:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 01:43:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 02:43:07 +0100
Message-Id: <DHIADG9V159W.11HS1SCCTSLWJ@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV
 TODO comment
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-14-ojeda@kernel.org>
 <177508434450.73816.3437422593454602087.b4-review@b4>
In-Reply-To: <177508434450.73816.3437422593454602087.b4-review@b4>
X-ClientProxiedBy: LO4P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dd5d2d-c8af-49dd-ed9b-08de9059316c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	teX9aT8qhgetoaThj0e/pfb8C7EKhoyqwisDKdIpka2qjAzwO+4anJm23XraA9UQnjOpVk7c4o6CdxZw46pPC+9xyMnZIjK/1bkzsGPdNTvC7BmMWq3C4YIm9dBa94H7D2iDj1aL1Hvrgti0JwQe7PnGNmfaPJDMJemgXjRivRRcR+f7sl6eXQMS8p2xOb73vquACsyQagAHxthGeO5/0Ix+wRV4As2IUOxQqfCU8Fw+eDd3kHuUXuBPspg5Sxjl8ozVPtz/M09yil5PcwAxPG5+RBXRz3vxIjVoVAPULpfzXnL9YOs0T5+e5IzD+hi7XvgjrBumW9m4YymNKYS2n8NkiKz1uVNYLk8gv9zevbFVQsZrBQvvo5gIl9nHIXDYaAC49PkDuW5g66j5z6ETYQ+qOURXtAo0Z7NNn8xczGFrITpzhYYyBLosBFPXV6GHzPczAy5kXzaVec9TiTuG9YruMp4fGJTwmJULpaJV05A1qBzos6Zxbj9hQoy2obZR/5vfkJxuvvUoKUWGfrIW7Ws3ZYSt2MvJzAfDPCGJ5FuZTfWEYovLDPgH3SnUFZ9Bu+LCfgupDIYbphEWkLmXLwthoBILgBAvnR/4Ld7HBxNwcfgQnWWV5SPZFT7XN4Ez+4IaftLaLwTem9eArUx12pUJj4W8ggBaS+KfDuzhrJFHWi0a9+JUgQ9/3V+marFMNNwqIg3yWSUrCJtrGydl3oqJPnqxtAGUXvfN7d+yHq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STBYemxvME80YWlPeERTTjhIZyswTW85TitQMklZaU4vSzQ2RU1XcnJLUXll?=
 =?utf-8?B?Zlh2OXIrMDNxTFFYVlFJWGdXTjRyWGt2RlNPd0pTZ1lxa0pmZlFSWXF2dVlv?=
 =?utf-8?B?REVIWk43dThlY0YxZDd2MWpHUzNPa0Z4emFtL0tyWnpGVkRZUE9oM21PS0hy?=
 =?utf-8?B?bUIzQzMzWHNDa0kwS2hROHNqMnFQOWRHZ0kyYWZUK2E5cm1LdUdyeGdsVG5n?=
 =?utf-8?B?ck9lcnNzRkcwN2tIUVRsRVA2ZDVIOGxYM2luMy9GenJKNEovZHE2WDFRK0VC?=
 =?utf-8?B?OFBaVDRZMlRkMUdQenpzRDA3ZWhZWkp6OE01TzYrVm5QYU1NZXVlU3BNbUFq?=
 =?utf-8?B?OVNPMWRlMlE4aUlkK0ovLy9jWDVMSXo3b2tTMWo5eXpmQnhOWWY5OGpCSzB5?=
 =?utf-8?B?Njk1QVdJbHkyOXgwRThqdHFOZDlONVVTL2w4V2owdEJmSGZhandTem1XUVJ6?=
 =?utf-8?B?NHQ5aTNRN0l6bU5uYzlsa0huV2g2ZFVYMHZqMm9uU1BxS0xwdTBqZEFaVlVH?=
 =?utf-8?B?dS9Mb1p0YnBzYXZHdnd0ZXJDRlErZzZIRUxTZ1VaSDRNbG4zU2E2OUNWNkRj?=
 =?utf-8?B?M1htSTBmTExIaWV1MnlyMmo0bDZCR2l6NFVqcXNrV2FCMmdTU0R4UEhKT2pn?=
 =?utf-8?B?ZFc4VmxxbnBrUUZRZlNSdU10cVkrME5mdHZjNWhJNXNBclhUR1k4Y1Z5dDFy?=
 =?utf-8?B?bDVRQ1V4djFqNmZxeWRiQmlPZTFmWFRoUENqS2U4cDJtdXJCL2dJVGRQNkFJ?=
 =?utf-8?B?R1lsUUpzRUNnOGZ2aWNuaUNhTmVoVkxqVWw2SkwzQWNMQWZ4U3I2WFpLZ2Zs?=
 =?utf-8?B?NjFMeWxkbHBvM1RaeUJDbFZCMnIzTlN5ZmYwaENwL3dSeHozT29TNmxYZG1l?=
 =?utf-8?B?WERreSsvajdBYjVENDZObnhGMUFidlBpSTRoM1U2VFgrNDdnUVE2OVZLVTdB?=
 =?utf-8?B?ck5XYUh6SWc0SG4rNk9sTW9IOHdwOGNrY3Q2Rmk5enMyL3MrYloxaVNLeFZ3?=
 =?utf-8?B?T0ZZSlV0M1dncmw2aTBrbWJjeTBuSDNEdTQwN25JRGsrcGFZaFgrZjN3ME1Q?=
 =?utf-8?B?Mmt4eGhOVC9SVnBibjFPT0xVYlB2dGZad1lySFo3WEdoY1VGYjNkR25uUW81?=
 =?utf-8?B?Rm1QWDlLWHZFSWU0b0dzQ3VRR1phUkJOdHJRTldmeVIxVzZvZXQwVmJjRklT?=
 =?utf-8?B?N1haWm4yWHBGbVNwaEhkV3Izd1R2WTlwUmE1QzVUV2pvMmNiamlZWTMrM29x?=
 =?utf-8?B?aDlOUFM2S3BtWnc4WFpBMnJhMzk3emJMVVVoVlltVm56VlhJVDJPekFiWVhs?=
 =?utf-8?B?dGI1ak5EeFd2dXAxSlhCMTUrOG03c0ZvdzlSejlTam5nTTUxSVdaVnlPa0Y0?=
 =?utf-8?B?QzNOOVNiZFk4OTd1UDNJRHZHTndGWFladmJROXJBa2h3aVNZTndrSVIvTkpr?=
 =?utf-8?B?Y2cwYSsvalJJMDhud01rSUlNNkhqQlZXbHYweXRwR2duL0pOa1p2U3BHRU0y?=
 =?utf-8?B?NVpSc3F3NmhLNjg4UWY3ZWwxVkJ3NlBHWEhjT2t5V2F4N0l3UWM5RDVnK3ph?=
 =?utf-8?B?clZGTjY5L2FUaXpNWXZtSEhIMDdrcTMxZXc1dHVmTXNhcHNPME9Pc0NQNkwy?=
 =?utf-8?B?d3VTU0dRYWpaU3cwRHVHMWJacnRZbVhnWWZreUR6TXVpcTkwcHpVb0wzYVYw?=
 =?utf-8?B?TlEyclZkNWxBUDNuZkNNYis4ZmJ1Y0dGakpnc2I1ZlNGYUhNeVBpSjJQeTA4?=
 =?utf-8?B?VVArMjduUW85NHR0RjNxRTFJTHZBY3hIckxiNVU2UGNrMElUb2M5OHQvOFM0?=
 =?utf-8?B?WjNhcWxPQmxsU1F0V1VSa3UvWFFaTHFiUXdLRnNPMkcwendrUkZITzNWNXJ1?=
 =?utf-8?B?ZkZ5d3VnNmhobEFlWC8xNzk0V3k0QjdaVkt5cW5OeVJQNyt5citvWnZBTklM?=
 =?utf-8?B?SE50ZEQ5a1d5VVRVdEc4ZDFZMGhhZXpRdy8xL2t2eUpkQlBuWFdSSVJ6T1dK?=
 =?utf-8?B?Q3VSQUlIMy9kWVpDUlZXVDF4c011QWlxaDlnWDlGdURua3VnRGFvUHoyQmdN?=
 =?utf-8?B?MVRCRHhvaWtCZDFoT0lzQTN6K0FaVFhLbXp3QnFyU3NwTVI4TVlCTUFURnJm?=
 =?utf-8?B?eVZORmFiQk9DMHdJZ1JsbEFaVHFIRkVrNnIzN0RzMm13U0FhMGMwN0FpcDE4?=
 =?utf-8?B?UjczT3ptZTVhejNqZG1BVFZzVWc3WUNMbUdveHZtQ1p4Y1VtZEVzdHA3WG0r?=
 =?utf-8?B?S0RVWXVCSXJLZ0xZRTJ0M1RNcEpGNTA4RmpuOWNHNWRxdFlUOElLbXk4bEpp?=
 =?utf-8?B?WUZEMXRhbGdjanpqcmR2WFU0L2hvMmgwTlowUEtWMkhVdmJmRUN6Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dd5d2d-c8af-49dd-ed9b-08de9059316c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 01:43:08.9962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNCZjB8sYAU+qaKr5073OPqesy1d+LlCsrc2G6OPQU+JdfTj8ShMyi3itM4GiP6aiT1uM3cU1FU6tDJIzTEOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5671
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12590-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B732C382534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 11:59 PM BST, Tamir Duberstein wrote:
> On Wed, 01 Apr 2026 13:45:20 +0200, Miguel Ojeda <ojeda@kernel.org> wrote=
:
>> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen=
_disk.rs
>> index c8b0ecb17082..912cb805caf5 100644
>> --- a/rust/kernel/block/mq/gen_disk.rs
>> +++ b/rust/kernel/block/mq/gen_disk.rs
>> @@ -140,9 +140,7 @@ pub fn build<T: Operations>(
>>              devnode: None,
>>              alternative_gpt_sector: None,
>>              get_unique_id: None,
>> -            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_stat=
ic feature to
>> -            // be merged (unstable in rustc 1.78 which is staged for li=
nux 6.10)
>> -            // <https://github.com/rust-lang/rust/issues/119618>
>> +            // TODO: Set to `THIS_MODULE`.
>
> Good first issue?

It's actually quite tricky. There're already attempts on the list, although=
 I'm
not very happy with the solution.

The tricky part is that `THIS_MODULE` needs to be supplied by the leaf modu=
le,
it cannot be constructed inside the kernel crate.

Best,
Gary

>
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>


