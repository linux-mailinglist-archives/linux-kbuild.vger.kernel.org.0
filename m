Return-Path: <linux-kbuild+bounces-10838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAsSOjVpc2mivQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10838-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:27:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176F75C4D
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 13:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26B33093FB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 12:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79C7284B37;
	Fri, 23 Jan 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xEZX8oLg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022096.outbound.protection.outlook.com [52.101.101.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD46122689C;
	Fri, 23 Jan 2026 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171027; cv=fail; b=ZHo/BUNmPJKyYy4O9iygTHvsaR6HijJ/NZABEP7jWbH3AkveKQRr2G/TfTTsZ9nMCvTtIpkpSr15kyBhf6/4QYj+KiW/LmX1gS4pzyRvgZnwYuHmIYOcNGItmG6DeKIbDaSz//9g/GZav97JM42vGmQeduX91QxzxV9hsEBcSuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171027; c=relaxed/simple;
	bh=XdhCKbym3bpDXRkGv0bd9sl7zzQqnErXleH5aKZb/8Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=i9FObdkfxyeFUja4eHXeAPQRHWPz/Nw/sQIHzRjBGpgq/RAMPFQFdFhhhnPstJAFC7f1LDAe302YTW7WWhy4QusORsXEl49LvrPaSsUPtTDCNhua3d5qdiWneLp81Alc+6nKxu1JFxzpyPG44ma07e0ECYmm433kkM9qNfYKf/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xEZX8oLg; arc=fail smtp.client-ip=52.101.101.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PenXJabkEpkxR4aj1Ednriq8ExBvOcTv5YtydMugN+sE7FNM6Mb45++vMm+39kqF/53/suQoWz8kmNtji4+uhKxM+MJXXY9D3h+A68TmC2bMcqx77v4YUqYi5Fo10STvDCy0X59jjOMSCixbFNB/biPpr4UbqoxepdhoX8x0mrI4j9EmNI2BEguNK+87pzeqDbh8ordewB3FO9lLQqua3L34dDy1Snh3Viryx/YE2lFA/3xz0RiBJJ9M4nUlvJ/tSUMTufYRVFwwfzM/hlnvKTL8JL9+ZHgOwUggBbXxRP3+3pZzJznihvL4EDUfjNJ/SEn5C8vuyOOwMB0jJUcKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdhCKbym3bpDXRkGv0bd9sl7zzQqnErXleH5aKZb/8Y=;
 b=FTSazJYWKGtujtFG3p/ZbuvEwnO/AveQZNjYPHka2QWWqCidHg/OfBgbAQGTf+bJ0640e6v4TgRj6Pd2lpDXis9zuIqGt13h/tgg9IpuNRMX1l1zEJsErVFGPC+XxZMSzAyGOJ1gA0odj1/rFdccaWogGjpijcjt+xKUIEVpTKCd6GT1RvaR45frL7rYAyxNgDLahuV3TPJ6DBJ//EGbQw5vCI6qCu/4GW69t16wurWWvR3waCpxINY032L8SGkV6eWvxJaZck9vhd605R5F1LJIx73sIMG6ZFo9Xrg5ylrkRUbj530G5CZaSWnVuKU4zi/3qYnjVEZQz9WKMtvcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdhCKbym3bpDXRkGv0bd9sl7zzQqnErXleH5aKZb/8Y=;
 b=xEZX8oLgkE2B9fx8I0YcJjANXtIxK6lMknFHikx5q6NtSfiknToBrVFTrRZLwyjGvcqTXUBYgDAVq5Ceg34vMoElnU00gZaOfAHM7XosN5zz9fWZRE0QlVnH+TWQOjBIFul/7JlwqnOGDX3DhENZhu4K6aJWkr2YA6h2mseAp7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2727.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:23:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:23:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 12:23:41 +0000
Message-Id: <DFVYSBDDF4L4.24SKCFXJ1M00A@garyguo.net>
Cc: "Jesung Yang" <y.j3ms.n@gmail.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot
 crates to sysroot_project
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
 <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
 <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com>
 <DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com>
 <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com>
In-Reply-To: <CANiq72n65eLUmWShvpVBzkbCork_85A8nMZPKdf+rpw-nJ6j_Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0236.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2727:EE_
X-MS-Office365-Filtering-Correlation-Id: 0209120e-2c57-4e91-9048-08de5a7a3f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkxHR2VPdnMybU5waVZPV1U3bFJHSDlxZEdkQTlqNVNRVEE3SXEzMFprRW9h?=
 =?utf-8?B?RFkwWTRrNWtiVnd1ZUdQTENYSFJ0M2NrUlFsay91L3NlS2JCak9EclNmTlRQ?=
 =?utf-8?B?R1RrRzROcDZBZjdwUk4rZ05NUkh3aWNFS2ZTSSs4eUVOMU9rc2FWUG1XYytM?=
 =?utf-8?B?VHJobHlLR2U3dWJseHBXVTc4TjR3QWNDWlRNdWltUXhXZmFtUHlDOVdJQW13?=
 =?utf-8?B?WE9tRjcwVTFpbXhURTdnVkJXQ1FCTjV3UElmL1crMHhtVGRGTVEyaS9XaW1C?=
 =?utf-8?B?M0ZBOFBoUHdLMGlMZlFZZEViNXJKU0xRZDJMS2RuOEhKR0tERGd4azhJR1pu?=
 =?utf-8?B?T2pIRXVtNnlrcXVkUDA4aGpKNEZISVNYUEtDWCs0R3A5MXJFektnRWZDWVNa?=
 =?utf-8?B?eXBLWGlOcGwzY3FpbFM2dCsweDhMYVcyVXRYOUI3Kzl5cU4wTmF2WG40SlE5?=
 =?utf-8?B?Ym0rMTIrbjdRVU5tbEZMMGphTjZNbTl6UE05Qk4yemR2REc5cHExdXo4WTZl?=
 =?utf-8?B?VjhlU3F3SUpUK2wvQUpmMlhPUkN6VjFEa25LS2RXeGszZGZLUHFaU2d1ZHhO?=
 =?utf-8?B?Mnp0NG5ZY1Jid3pIT0pOdy9tRkE2VnIvZHQrNE54NzdMOXU3TFg4N3p5TE4r?=
 =?utf-8?B?TjVCbktUT3dzZ0VuWVVFODhncmp1bzJkSWYvRFZvUnB6WjBwRWR2cXl5UFkw?=
 =?utf-8?B?R2RmZ29HbFp4MzFienM4T2twTjB2TXZ5cUFVaGFWNWNUVS9XaTltQ2ZaN01B?=
 =?utf-8?B?cGJTdDdSdzhwOWVrTzMwZXdKa0kxanJ6L0VYam42R1hKM1NicmkvcDMvTUM4?=
 =?utf-8?B?L0ZENkhnUHZ6TEJ2MUJyMG5wQnJVR2o5UTZnVWZSUkFteXZSajZQMHV3cFNY?=
 =?utf-8?B?dDhPbGwvRGx0aW03OGRsQnRrVkpSb3FTRDF6VitIaUordkw2a01zdFRqd2lC?=
 =?utf-8?B?akRTNnlZSE1LQjkzUlNrQ3RTUTlUcFhadThJZUZWZ3UxelROanhpVE5VU2tv?=
 =?utf-8?B?QnlUTjh5M0h3ZGp4REQwQS8xMmJFS21oQjBadDhsTDJiTTVyVEkvUnhad3dJ?=
 =?utf-8?B?Q3Y0ak1aaDlKdFBBai9Eek4xUmV4ZnA4R0tNenN1UzJ1UHhWNDhRQVd1azRC?=
 =?utf-8?B?aitqQUFOQXNrR0h3U2lRam9vOXhocHJWRzExL1FJNW85UEt5SXZMMFhrMS9R?=
 =?utf-8?B?NmlHWWZCUDE5QnZQM3V4UVJiRklJcmkwaWZ4d1dTK3dsaVhHUEtOOWZzSFIv?=
 =?utf-8?B?NnFReDFFM1B1Q0RvejcvclNiOGZLWHdjTXVlTFhmZUlBTUUwcUZSUmQxZmR1?=
 =?utf-8?B?Q01pT1NXZjhQcFUvQllad1RGdCt6dzArVEhob2htRFhTWFVXc1JTUVlFaXZq?=
 =?utf-8?B?eGVsa3F3SFg2VTlUWG5sRmdWS2NrdTdtbmRwRjJtb1hEZHRjclZidXB1blVS?=
 =?utf-8?B?MU5nMFJjSDhqdnFJT0s1ajJBSFlzc201c3NCWEZ1Ujk4aHYvcURPUTMzYkR5?=
 =?utf-8?B?a2dWdGZoU21FRTRnM1pxa0F1OXh0cENsb255YlZ6TVlURmcyZ3duWCtCSklr?=
 =?utf-8?B?MjduZXR0dzN5bFBwb2FsMEZSd3A1U2djUVFrd2dXT0xuTksrSnRVZWhMV2JU?=
 =?utf-8?B?V0RTSHJZRnVzaDdSL1JSUUtRSzhhV0hRN2wvQkpYTVVOS05DYUZndmtBcXly?=
 =?utf-8?B?cXpER2RJT2JhM0hXVVpRK1VIZ3RVWS8xUy8yU2xlaUhTbUpyeWwvNkNvYVd2?=
 =?utf-8?B?eEFOVVRGUUEvTys0NWloWGdoOXpjdmZ6b2tvRGRJeXBUMUZEYWY4cmxTcTZY?=
 =?utf-8?B?emhCN0toQ2c5UW5SZnAyTUhyUjRYNUM1eXpUcCtkYlVCNTBSZkpEb1lRblIx?=
 =?utf-8?B?VSsrYkNUSm9mMENpUzZEbUZ2cVBOVm9pdHBTZmhPa1NTT3FVZ0RvVXIzQWdH?=
 =?utf-8?B?UmZsTHNSR2ZHb1U3QjkyM3czUHdSZFBXS1VPSkFGaWI2ZkhQNHlBMjBXRUFm?=
 =?utf-8?B?ZTBpLzdQM1Q4TTRoaUlNVURNZ09ZZWRGSEpvQjZqZEZha3B6eE4xd3orUVl1?=
 =?utf-8?B?QWxIZ3Qxbm5DdHk5eWlzUElJMVJCMGRiWUh2a25SOUo4TEFLdW1PcDVyOHNz?=
 =?utf-8?Q?OM7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDZjTSttZm45TSttWjRuUkFxbXhWSjRLbFNNemRadlF1WUJiUEJmdHUvd0Nt?=
 =?utf-8?B?TWYyRm5nNVVKdTM1Z0RvbXlvbHY3ZFh4aEhHT2dyRnRnekV3amdnUkFnSjBN?=
 =?utf-8?B?WWVGQnowOGdIRjhoc25hbFBSSGFlRWFDSEQrY3VqOE1PVUx6N1RRWG1rdnR0?=
 =?utf-8?B?STB2Q0kxV05NQVp5NHhMV0FZbCtHbXBCOEdjanRoTXhMckttdmxCL2g3NWFm?=
 =?utf-8?B?RGJpNWZ5SWYzRERQMzl2anh0dzFyWE9IYUZWWWxOZ3AwaktQN3ozWGlJUWFC?=
 =?utf-8?B?ekNoZlJQb2RHdlU4R2hEZkxTMms1NGZ6RVluZlhNK0RXbUF2YjE5U25GcHFq?=
 =?utf-8?B?ZEhkdSttdXB1dUxqNzI3SlVieG92cWw0TFVITEdlUXVvN3ZieFlzN2JBd1B6?=
 =?utf-8?B?VnpwNExNSTBmQnVNei9TbUM0cW1Cck9obVlhY3VJajN1T3FiekpFQyszdkww?=
 =?utf-8?B?VHRkd2tpQWIzQkp5SEZ3ZTNFWG55VWU3bFVtVHZubW1iM0FzTmZuNENmN3h2?=
 =?utf-8?B?ZTRrcWFRVElJRGdXeHJRTEtRMjV5TlFkMlBEZUo0YkFzQTgraDliWFpUVVZM?=
 =?utf-8?B?eWloTlNiQjRhSXgrUitNclVnZExBZkFNbGllazFhWndYN1pmUE15ZXJPaUpE?=
 =?utf-8?B?cm5FTG9YamptWXloSXlMVW5xazBwU3FuakNuYlhoY1hycHIweHZGRzV4UVlB?=
 =?utf-8?B?aFdNemhjU1l5eFVweFdjNkFVVkYrY0w3eVVFK0t4VVdrRTd4bE9tR1RXbVN2?=
 =?utf-8?B?czhJLzNoeWlnQlJ4TFdzdjF1VndtQjloRThwOHlvL2d0VExxWWRVTEd6ZGt3?=
 =?utf-8?B?ZFJoUkU2eS9TQ1hCMUJwMjd5UG44cUZVZlpQZkZHcUFReXgxT0JmdStFY2d2?=
 =?utf-8?B?Z29oSEVBOUE4a1kxTnV4dlU5Ui90T2wzZVRqMHpEVnJUditJVUNacHVwTHd5?=
 =?utf-8?B?cXp3Q0dpMG5pVDFoVWdvaTMrN3BiOTJwSE5PbnRxNkw0VUhLSU9UeVBKOUo4?=
 =?utf-8?B?M3liaUtQYzc1eWdQQ2E3TWQvYjRqWFM4dE9mMkphVVNWZm1ndlJtazZVS2NI?=
 =?utf-8?B?RmNpN3hJSlVySU1qRkloRlZMSkFzZlhFT3ArbHZ6cEpEQ1RReldRRmNHQ3Zh?=
 =?utf-8?B?d0dCV2tobDJLTGs1T0Q0bjBhRTRReCttZHdIQ1dTRVNUeEFYcXdFUFVaQVZr?=
 =?utf-8?B?bVBGTnBNWkw1S0JkR0ZKenZtZzRwczgzVkdNOC90TEo0bGZpRlY4N0JDWU9i?=
 =?utf-8?B?SXBVajJnMDhoY3U2bkp3WTk1REZoVzZ1K1pXNytKeHVFNFVQRlBhbENwcmFn?=
 =?utf-8?B?RFZPRCtjWnlTOWpBaW9RalovaDFPSmk0Q2VvbXI1R1NZSTBGZjNzV21uMHU2?=
 =?utf-8?B?Q1dGRkY4a05IRC82Y3NKTWljVTFiVldCemdqOTg1K0ZmaVRDOVErTkpOVDRv?=
 =?utf-8?B?dFBVcW9WbnFoWGpFTFBlNVdRMFh4NVFPM2lNa1kzSjhvOGgweVIrajFWVkR3?=
 =?utf-8?B?QXBrKzNyMHM1SnAySzZNd0NJK01uL3FIeGNNM0RDUFpmZUdhdFJrbVJOWmdz?=
 =?utf-8?B?ajB2ZnowU0NFRzNaRlFGbEhQNERZNHhDRm9mYk1TeENMbi9ydThmbmFBV1VB?=
 =?utf-8?B?MHVSREYyUEZ6d0lzWkZLd09ycWhibytRTlA4SkdqSnNsNm00YnN2SVhzaWF6?=
 =?utf-8?B?aTg2U2prMStlNWwvTEpxS2lFblBTRlJhcGlpRHdQdHhRNVJqc2VQcUdVcGQv?=
 =?utf-8?B?TWhXM1htTFJxeno1YytCeFRrNmZpR0liNVJVbGZrc21oMXJTUm1rdEtWVkJY?=
 =?utf-8?B?QXJvVGJBdURGT3ZUcUE0YmoxUHZESnFEUWMxUG1YQ0dHbEhiQnNxRUZSSnJT?=
 =?utf-8?B?RkxCNEpJSEpFbnc4aFpjSDd3T3VjcldOcUNuemRBTndFOW5xV01Hc0c5Z3I0?=
 =?utf-8?B?djBNeXVYQVlzTHNMTitNNzE0OFVseFdLWmFxTkE2Ny92OHhmbHlsQlYwczB2?=
 =?utf-8?B?UzJ3b1ArRDBkMlNkQ0d6djZqeGRRNkVDTUZybmttWGdUcHhIZUJoT0tBSFMz?=
 =?utf-8?B?TTd1aVFOa0tmeDlHZkpDckYxd2ZaVmdIQjNialZvbUYvaFVFOGVDbDVnUlgv?=
 =?utf-8?B?Y3ZBWU5IVFFlTVRyTTNlYjlSRXdYQlN1NmtBb2pTK2dRUE5jSk9wamZBVHpn?=
 =?utf-8?B?VU5LenJJdkNiUFYxSWs1ZXZSUjg0UFRjM2hxd0krSEt2NE9BaldxYW5JeGlr?=
 =?utf-8?B?RWxhMnh0YzEvUHZyOVliSGoxZUVXQU9GNHRGQjYyRUxqejJZeDNwTHdFRW9T?=
 =?utf-8?B?aGd2UncxbnNBeVJKMWRoM0hYcEZRMUVTLzBwTkFsK2wwUUZqTy9QV2ZMa2tu?=
 =?utf-8?Q?GLFL5uTjyKyPr/t73i1B6yNjNHfUHa8YMDIA3?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0209120e-2c57-4e91-9048-08de5a7a3f21
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:23:42.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQE8DNDsV/pKSfW/yjfskocCfsbIXHarQTdpn3ieT/2JXQezMmwVcXm6xpD5DmE5LyYmaL+BFDNGCVj9m9ooug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2727
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	TAGGED_FROM(0.00)[bounces-10838-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5176F75C4D
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 12:08 PM GMT, Miguel Ojeda wrote:
> On Fri, Jan 23, 2026 at 6:45=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.=
com> wrote:
>>
>> I think it's possible to get it to work (at least better - not sure if
>> it fully fixes all issues) in RA 1.78.0 without specifying sysroot_src
>> if we add include_dirs to allow the relative #[path] references to be
>> resolved.
>
> Generally speaking, if a version of rust-analyzer is complex to
> support , then it may be best to consider avoid supporting it.
>
> It is an optional development tool and many/most use the latest
> version and/or the distro-provided one. Plus we will be moving to the
> new minimum soon, and so far we didn't support multi-version for the
> tool anyway.
>
> So, in general, if it is something trivial to support, then why not.
> Otherwise, I would recommend focusing the support on Rust 1.85 and
> later (especially the latest plus versions in popular distributions).

I would still prefer we support the RA that comes with the minimum version =
of
Rust. I don't care about intermediate version between minimum and popular
versions, but I pin my toolchain to 1.78.

AFAIK there's no way for rustup to use a new rust-analyzer with a old toolc=
hain.
One can certainly download rust-analyzer from other means, but rust-analyze=
r
does not recommend use against old rustc, anyway.

I would avoid dropping old RA support before we actually bump MSRV.

Best,
Gary

