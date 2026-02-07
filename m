Return-Path: <linux-kbuild+bounces-11073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bGuOMKdrh2kYXwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11073-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 17:43:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4401068A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 17:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 927B4300493A
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Feb 2026 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34930246762;
	Sat,  7 Feb 2026 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GKi8vSYw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022101.outbound.protection.outlook.com [52.101.101.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9BF513;
	Sat,  7 Feb 2026 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770482596; cv=fail; b=nxbjiDURExQ1DyUdILsh31IMjisX49uqab3OjVqjwUVtDnVcUcW1VE2JwNL2asQ1M//fn03/tXHW+5HygfqpND9+f61gnBzdAgWaey7Qm4/Lu4vo1bbYwDD2mpe4/r+dQ5l+kFqxZ7SrQOT40eeJ024Vz2li+ah9Nbxbz6jKP/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770482596; c=relaxed/simple;
	bh=IAjW1dGAD1vTg3a8QO/DdRLgnl1U3A7WkvIYyPc+caQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=M8peVkx7EKDGQeFa3pHhRWdscng97De1qtkxHIJ+uRBsv94eFVEa6xOAZyDmWMzEOkdDjSl1pXFABBBD6zJYyBWTd1wjSVWH+ZnZKxBv9IqltJ68a+NCT6oG/OTxQDdoBsUHZEHFTZkxsM/b5aXqGWfN5ub7V3px14DGcY+lbXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GKi8vSYw; arc=fail smtp.client-ip=52.101.101.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swmJkMmfn+9kJCTRW/JQYgCzKYJppztl+OTJrbIineIF3YD2k4uwdr7gtsVa5CNnE4NCtFdMgMj0UyrcgFDt/A1z7mpF1bSvkHC0uq1x93kvmtdr/FrBAW8B/Ub6BROVc9GDMuPLwvwtD5JO3RRZF21wm1LazmUMJZa9M1+1spsZECrSnoQQ/RgAC2jXUQib/2DS9Z5mjr7gwKoP5v7dsS6npqieR7WWFrDheTKxF9yCSOhmWV12A14S/GJqMwMdZqJVs+EsuOUIxUe9Meul0m1xPwjcKKsV3+OEnaUK+bkuH+Ut81qsEWd69O/k2EmbRFgPGzkBj/Ur68yKpEXU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49o3NyOtREJAlHNgkqP6H+DIUZEea/lIG4/XQUutFZo=;
 b=MyNoFraGWBdhXbBw17YxS7w6FEkl4PXyplAn0YbHS8LYEF8CqsY8/J/+mw0H7RcqMcIOPRZOHM+FQCMjIEIyvLBr5fam2WkgSneCbQg8qJJ0S6Pry7GLzldoRnFq0KbyPFyERWon6PS3z3afTFjSZB7fdBKme0Fx5vi6RJZMc0IQyJf+hjbGJFcO2IBv9pjXOWRwg0sHnYh7xkkLFjO7M0lS0f1AOR8O8mk+okKtkiP5ybyjRLndLru9Wl5a+xFRINfYT7v5PPvgUuBQWPDbPm969uK8bPSQ2NF/fdCf8CPMqLT7vE1jpY94WzlSELXYP5AATK/EFSsUyG+Rgmya2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49o3NyOtREJAlHNgkqP6H+DIUZEea/lIG4/XQUutFZo=;
 b=GKi8vSYwiemV6Nb718Ozr7MvhFKwuDBvBW0vx5EaPN6KFGLnbZyNYkguibhAOahkc3Ial+8sHFVfXtRomI84qRspvPqANqtaNDhdcTxXPeVJVVzU1uMi60uDpIBNa9JX4PqxlrQsOhtH6UN3m7XWRDKZ5aW1yNNN61PkdQEFcZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8589.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Sat, 7 Feb
 2026 16:43:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 16:43:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 16:43:11 +0000
Message-Id: <DG8VP6BH1MPV.13AHBBEMZHOF4@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Janne Grunau" <j@jannau.net>, "Asahi Lina"
 <lina+kernel@asahilina.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] rust: build: remap path to avoid absolute path
X-Mailer: aerc 0.21.0
References: <20260207144356.3063613-1-gary@kernel.org>
 <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
In-Reply-To: <CANiq72mhhSKV=CecnZnqhKrt9tpGdMu1hePJtGDgRiD4JG902A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ab2580-1943-452c-3251-08de6667fbac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHNFeHptVTI0VHdOZWdRYk81U3pGZTVCeExPa0l3c0xQYVVYUXNMekRsV1l6?=
 =?utf-8?B?ZlZMU0l3WEQ4Y0R6R2dCd2pkR1pmWlRRVlpoRUxrbThWTTlVZ3Q1L0lpa3dQ?=
 =?utf-8?B?MzJCczBJWVBEZEVrbERlREIyaUhVOEhnVk5YQTNTMFVXTE92QzU2Sk9hY1J2?=
 =?utf-8?B?M1RZb0djUUxBZ2N2NllONWlyYWpIb0NlaVQxSzYxSktOWlJFcnRFS2x3Qyts?=
 =?utf-8?B?dU9qU3FRS2Y4TnpOMGdZVElFTkdtTHZpYVRMd0hpRTRkTnRMYndDQ3l5R0NV?=
 =?utf-8?B?Vi9tS2FzaFVvOE9uSnl6VnhpMXYrL0Rsa1NORGszcnJwbXFoUU1KczFzN3BU?=
 =?utf-8?B?VlErYURIL2tGYllvZFdJRXR3U0V2VHdaamIwZE1ZTFErdjZHNjhreXg3djRW?=
 =?utf-8?B?cGY4N3diRy80b3JBeFJOMGxsdHFxQ3Y4QXRTeU1uR2ZnVmpYSXNUQldUQk9O?=
 =?utf-8?B?WnRzOFVNSzByaWRhRE5aWmExRXZUZHF1bXpWOThucmgvZndxVXRIb3lLdEdG?=
 =?utf-8?B?Zk1MUU9EU2tCN2J3Wmc2RjEwNHhoa0NkWDFqZTJTMnNPSnhzTlp2Q01uTWtx?=
 =?utf-8?B?QUN2c3RlWXVHaWdDUlJxQmR4K2dxMjAyQ01IS29PQTJlSXlsT2FrVVFrdlpn?=
 =?utf-8?B?TzVUZU5pWGdBNWRJSStXWFphVWNyOGZMMm1MMkFldXV2V1VLR21tMmROOG5E?=
 =?utf-8?B?bDd6QXJaRCtvd0tZRTZJR2hVWjlrWWJyRStCSGxGL2Vwa0VqdUpBdzhOQ3JZ?=
 =?utf-8?B?OTdGbzAvclYwZmF5SDd5WGh2TGwvUS8vQkF2SVh1TWNFeGdVakhIUkJHbXZn?=
 =?utf-8?B?SFkvbWZPZTlsS2Z0aE5rV054dHY1NngxaW9BeVJDY1JRaWI0UVQ3KzdEQysz?=
 =?utf-8?B?WldGckN1WkhKYmp5SXZKQlBYMkIrWllubHFoRkwwZE9EcFNWcFpWdE50amNo?=
 =?utf-8?B?R0xHYktxT0JjTlJSRmZBM096L1BZR2g5alFTbWFaNVlGZ3ZJNGZFZnRYczh6?=
 =?utf-8?B?NnZXVjRhcGU0SlJTMU5Rb21FWXhxZGlKU1JzZzBBaXN3dUdCWlMxOE9uM3My?=
 =?utf-8?B?QUsxM24vYW1udllCcUVTZnN2YU1vZ2VlQ2dDSzQxZFpXYmVhY2hYRXY5ZzVH?=
 =?utf-8?B?WFgrRTZ5dHkwTDhnMnJOZG1pNTZTbDV3TmtIZ1FIQ0VncEFZRTFna1RJUDdq?=
 =?utf-8?B?RFY4N3R4Q25DYndyRDNqcGUyVU9MR2JyMFhiK0NFblJuU2hVbER2d1laT1Zi?=
 =?utf-8?B?RGw2SnIxVjE0WEpGa3FuakhrTVB1Tys3WkVKc21hR1JUWWNyUmYzNk1CSnhM?=
 =?utf-8?B?V01namtjYmtOOGRTOS9jaGVjWnZFSU9veXFUMS9Yc1ZHZWFXSGQwOTVmbEZE?=
 =?utf-8?B?OWRWU1JoMVRGRFdnV0hCY1dESUtNdWRSNHhKYjBadmJYMWRVRzBRdVZ4UnU4?=
 =?utf-8?B?RU5LM1hZVmo5QW9JN2RHTkltbWVUS2orc0c4MktUY3Jnckprakp4cktjU0c5?=
 =?utf-8?B?SjFVMGVEMUQwU2NXU2N5V0lHbHVoOHFFcEkrc3dNdzFrNGtKdUZQbWFjUmk1?=
 =?utf-8?B?N1kvMXdidmtQWEJpWU1MNXZlQ2pZbkdQeExnL3Bmc1lYaEJqZlVmaTdNVmpm?=
 =?utf-8?B?UXFMaTFKV0xPa2M5UEx0cjhLaFlQeitLbHdCd3VaV05EL3ZLU0IxSmtSc2RE?=
 =?utf-8?B?WUtWcEw1Q1BvdjI2VEVZMGh0U0RpUjRBeVowNE40eTl1NHZVZHZrYmNTeUJG?=
 =?utf-8?B?dGVTWStKWkhQZjJ1dUR4cnFvb1JmRHg5czdvUi91Q0YvNmhRcmRvSG1nWDR4?=
 =?utf-8?B?ZmVYczJiT3ppaCtNMk5TbnQvcUJydThYRkZkSDJPS01pRWt6K3B6MTUyUjQ4?=
 =?utf-8?B?UUlXREU3ZzcxekxaNFVOZWozRFUrYmlqWndma0VxTzMzd1Q5SlFHQ2RsT1VS?=
 =?utf-8?B?Yk4rdXdnZ3dlT3I5OEpmMEp6UGxqb0xreGxMK1IrZlBvVjlTZTVwZWJEeWRq?=
 =?utf-8?B?bTV5SlVHU2JGcjZTaUFuOVpsWEpjcmtscUFrMHUrYi85RHM3WmRQbjl4Q2hh?=
 =?utf-8?Q?XV0sE+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDFQcnlldm0rdFp6WGk1NWV4aWV1T3JJSE5mMkM0VlhJL2NIMDAxaGJ6emNB?=
 =?utf-8?B?OThqWnZlK2pXWlRPOVdXNlRtZS9uNXNXSWZSR3ZrT3AzQU5Bck1JNUxia3Nl?=
 =?utf-8?B?MkpqVmVyU2U2V0h1RlNiZ3VWQlAydmdkek5wN0pGbGNpS2NBaHNTZ1lOSldp?=
 =?utf-8?B?Qi9rQ2RRblV0bkdwNndDYUhNM2RiSEJEY3VFU2xxMW9OeUdaaUFGdDBhUHFB?=
 =?utf-8?B?R0ptVGVsSDQwcVBHVWorSWxYbWNUS0s5YjRoMUdyYkJHNUg1ZE5BZERUVXBF?=
 =?utf-8?B?L1NrNlFpWktQYmJOemdBMUhmRjAxV0xHN0JtOFZ4MmY0MXBvSmxTb1llTjJB?=
 =?utf-8?B?VjlHUUxYVGViSnladVlTT20rWDlwNXlCa3UzNEQ0MlFnSUlLdTdkZW1mTlkw?=
 =?utf-8?B?R3hNYnI4eXphNzAxVVRxeFNEa3ZqVGQxQWFjUXN1Z1JqdzI0OFRTbDd4SEFz?=
 =?utf-8?B?SEU4amF6WmpaRWIwblhqS0tuOUR5ZzlmS2UvYWZta1YwWU9xY1FSS1R3b2da?=
 =?utf-8?B?bjJKOWlOQzIwb2kwUEMrbUxaejRTTkdQaWJSNHRlME9ldWJKL3hFbFkwOW9m?=
 =?utf-8?B?MEtRb2xnM2s0OG5XZzFUZWdiWTdyTzZTTWpoSXh2VE9RV3ViQlJhdVVFQk9R?=
 =?utf-8?B?MnY2VGtkb0N6OS92WHE4R21vemVhRnE1UzZFUUVPTVBjVFVPZVBmUHI4QWxN?=
 =?utf-8?B?YVEzTWh0bGxmeURlSkN1V3VrbSsyK0VZSS9qVTZuc2FnSWhWMTY5MmxVRTIx?=
 =?utf-8?B?Z0NSNlNVdmNtR21tMjdmNnl4dkxDaHNZQzZWWU91UXE1bEpEczZOWWs4cytM?=
 =?utf-8?B?MHk3QlNIdHFsQjBkY0FrbjhiSXZzdFA0UXpBMUZpUkthK3NORW5yT2swMnh4?=
 =?utf-8?B?clB0MG5sZjhYdW1MMGRSeC9ZY0Y3RjF1ZWNXa3h1NW44VkZudy9MM3kvL1Nk?=
 =?utf-8?B?aVBuaXdKZlBFN2I5WE13RnJoajVHbzJKZzdmSkswZVNhQkJmVXhUZlZSN25B?=
 =?utf-8?B?QmZvODkyYlIyNVlXbXE3dnlqcWYrZVc5VzJxN1FTUFZBNm96QUlubU1VVE1s?=
 =?utf-8?B?aUV4anZkZ3ZKb2ZpMnpSU0lLWXIwZm01UUtmNW1ob1hsOTMzSkdMdnB6Q2pR?=
 =?utf-8?B?RFl1a2l3d3k3aUdxM3NHd3U3UlBFdVVOcnlqckQxYXFHbDAySG52UkhmWHZH?=
 =?utf-8?B?NlVTQ2Q5ODBGY3pxSHVUU25adnVGeDhmUjRjQkJWN3gvYmNaWGovMlpyeVRs?=
 =?utf-8?B?eExMeDZZS0lhU3V5cTE4clMwUlBQVHhTRGJhNkdvQWwyM0FDczJTYmVMQW5F?=
 =?utf-8?B?QkhsTGpTclJONzFScXBxZThHTkJWNUhmSkFYQ2lab1NsYTg2NlR3QllIWG96?=
 =?utf-8?B?ZHBITkM4dnRXN3BYRWVwZEcwMWl4YUE0K0JyVmM5OWRKYkRJU0hEWUk5Y2dn?=
 =?utf-8?B?SkdCamlKMjFaaHNkWldiSHg2RExOR0w1dVo3dDBXOThXMmdoV3EvM2pOYk4r?=
 =?utf-8?B?MGZ6a0hIQy9yVHFwaGR4aVkvekVyWGk3OTlxcXhreXRFZHFxTjZKQS9RVU9M?=
 =?utf-8?B?amF1K20zVkdRdFpoRTFFS0tuREU0MjFYcWdCdW50RER2R3k5V1c1YXI3V24r?=
 =?utf-8?B?VzFyZFpudHFnLy9jTG9MWjFWZVUwdnovL0hoQTBubVFDalIrK2QvMEtCWnk2?=
 =?utf-8?B?RnR3Y3paY3UyMmJ0SC9Oa0Vzb2dOTWNvbk5vSXpYc3VsYjFOMjErdlBZc2tH?=
 =?utf-8?B?d2tINWdxN0Zic3FWZ2dYZ1dDZXVTRklHRjU1QmIzUDk1bWpNSCtYNnBTdVZo?=
 =?utf-8?B?UC9vVHBDYm40bUNNVmFpTk5yNERBQWhML1hOUDQ2K1JLY3BwSDZZS0hicklj?=
 =?utf-8?B?cERMQ2lNRDl2Qklkb3lJWjZxaHBPK1E4RTVuekVvaUtyUTZyM1hvSjY4cnRX?=
 =?utf-8?B?RnRsQm5PR3FoaDZ1UzZVNU5SV05rcXpreGljTjIrMitoWUZ0cFJFay9TTHc4?=
 =?utf-8?B?SERSWHlrbmJaWjZGd005V1dYVGY3SStKV1p1MTlOblJ3eVhXYU9oVGlUV1Zv?=
 =?utf-8?B?b1JyMGsvcGNEWU1KbUR5aEd0U2MvWlpLSHlwVkdBVnBYY2pKSzFZWmlneUZF?=
 =?utf-8?B?MjEyamplOXU2OFlHdVQvZWJrUzVtdnRhenhnc2xuQkQ0UXY3dytLQUpyUUJ5?=
 =?utf-8?B?TnAySmw5ZzR5QXgvNDdCQkN1NVB5K2VEOE9SMjRGYkJkODkxblZzcDRaSmh2?=
 =?utf-8?B?dDRRVVAvcjdsdUQxa1BsUHVhdmZBSC9vUGFLQVVyc0ZnS2x3OEFWa2hnLzRW?=
 =?utf-8?Q?WgwBNAEy9lp67ajwhK?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ab2580-1943-452c-3251-08de6667fbac
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 16:43:12.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2V7uzKV61pNloaigt4OCrQOfLZnL3/zx8C4e0Jeb+VYaWx6HYbfvKbBDNIWFIRdDoc/CKmgoYaDrgC8CntWVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8589
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11073-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,jannau.net,asahilina.net,vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 5B4401068A0
X-Rspamd-Action: no action

On Sat Feb 7, 2026 at 3:22 PM GMT, Miguel Ojeda wrote:
> On Sat, Feb 7, 2026 at 3:44=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> So, fix this by remap all absolute paths to srctree to relative path
>> instead.
>
> In case it matters to Kbuild, we had a relatively recent revert
> related to this flag:
>
>   dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths rela=
tive")
>   8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
> paths relative"")
>
>   https://lore.kernel.org/rust-for-linux/20250511-kbuild-revert-file-pref=
ix-map-v1-0-9ba640c8411e@weissschuh.net/

Ah, that explains why I recall we had this flag in Kbuild but can only find=
 the
filter-out directives now. I missed the revert email.

I am not convinced that the ability to launch debugger outside source
directory overweights the benefit of not leaking absolute paths and making
builds reproducible.

The reverting cover letter says "As there is no simple or uniform way to
specify the source directory explicitly" which is clearly not the case as y=
ou
can just invoke the debugger in a different working directory... GDB also
provides a way to provide source directory search path:
https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html.
Similarly, LLDB provides `settings set target.source-map`:
https://lldb.llvm.org/use/map.html#remap-source-file-pathnames-for-the-debu=
g-session

I think we should revert the revert, then.

Best,
Gary

>
> From what I see in the thread (but I didn't get a confirmation back
> then), the issue was some developers relying on invoking the debugger
> in a different working directory than the `srctree`.
>
> Thanks Gary!
>
> Cheers,
> Miguel


