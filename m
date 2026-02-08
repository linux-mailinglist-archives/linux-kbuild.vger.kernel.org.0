Return-Path: <linux-kbuild+bounces-11077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mlEqBh8miGmEjwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11077-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 06:58:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D36107F4D
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 06:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6431F3002D02
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Feb 2026 05:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B66026CE2C;
	Sun,  8 Feb 2026 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CzKh0FpP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4FB1F1534;
	Sun,  8 Feb 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770530327; cv=fail; b=dMtSUH+RRlCmh7rfKy2z55l9N/NCMn2vU96w9lujEolVMjjkQLH55rIj8XY3DD86tJq/OwnmfLX53j1YlOEs9BdxeC10Kqsni1qPyChZXWVoDSPSpxCjqPYfHlW47FWBboVLjxZ0zEM3qBDfrwHGtc+VgwUdV4i43kx/5xj2MdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770530327; c=relaxed/simple;
	bh=SToerv4yBvjbBIoTJnkW/QiSYfuYxFvORkYHlKomJlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S4YPVael++mz/OfWOQUsA1nzIeXiYvaHauGsI9KjH4DrZmFcBJ9/mvAXdXz603SzHbNB4QOukziIXGHlQzZePA0b3udf2ssmuBmTflKDpOO9laUo8PymbGnFCy96QqOQbvdykgJ1GSukfHfgKFflmqv+p43xu+sic6nOnw+XjTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CzKh0FpP; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie/kcnDrh47ubBq1KSm8Zdyf4gNkuXm3+8hfSni3zabsGWgpYLLNSFr82RKhNTZopUpE/k4jsJnH0WDagTp+rr+4QunRBzvL4vXcLDeahya+aeNqaaYAeDYhwwc7zvFkoSLhkn2DNdW+zqlNWVbzeHmqAoMqT6EDgEnYIP1XR/Ua/PDx1X6/lzuNwJ5c0KUT//Z9kcO6YFLCvtz5TtHWlCAf1ZwBLMbtHqgXFbXaJpjgvCJ55tojfbtZXk46uvNeT5/i/Q5p2fm0ytx10iJRO/5S87t2FBV5ezbedx8dmkPYqaswxxfEAGBZPfTXYLRLqpH08pLUfa+N50NjOwGuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MbdmY2hfxwDDrEQODAMZGiLpwgN1WdQ091+zydt7GQ=;
 b=fbndDaGtYN3VWtCFxY4mw/e1yjEXWjbUCWRGeXjItYfif9R5XaPkSOBVYkBlo8k2PjE+0Vfi23FdlABMdo/01Qotr09OfZzK/H1PtfHdLywMyHEWIZ04kGyx6FA5+HJ0nfFso9gnv9GcinNuyoUHT+PNisZUiZTXX1kTDp6UyjT2MFRdRecopt+jmpaRQUCamTL7xbrgBVgLL+WQStfXtc/eptgAT5yWTehwxCsc4JQ1LN3kqcexUfyrFVWMVi3HyDfc9bawm+4yf0w4MxoFjzIkMz4BrGw+wuHob5OZbZnEgPb0O7kOO+dSV3cDVaTz4gpyOoZFCbvi6nKdFnDhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MbdmY2hfxwDDrEQODAMZGiLpwgN1WdQ091+zydt7GQ=;
 b=CzKh0FpPZGjPjop/etZxbL4W8v5vvwUY4uvgjxkwkbL6eBgazRzl/DW/nOmMHFRzjDXIKJE3wSG1kA37O0OUsBt4MGlf3VkCMBhbOAEzZcY2Psm+GBWROVxgTtjf4qiiyj2FHbnZRalpOwkPp9dhZQLyXoZpIHbTNEH7jAxZf+K/pQxlGfbizqzaa4Ic+vs5IJUZGsHxC3uM9tOVdn4gi7+T6Tn1kCaArOl/Q/wBbt7PdmPgk35YuDcmsoxETsNR4Q/pKiSp0cNgTuJsWwLRNq2/Gq5ER0k0KKjrrjJfx4TFlFzCbnneBQ2McycFfKJTYLb/HcG7Ngn2zhh16uOffw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Sun, 8 Feb
 2026 05:58:42 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9587.013; Sun, 8 Feb 2026
 05:58:42 +0000
Date: Sun, 8 Feb 2026 00:58:40 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
Message-ID: <aYgmENPRTdD4wCVF@yury>
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
 <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
X-ClientProxiedBy: BN0PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:408:e9::25) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: abcd51dc-c20d-437c-76cb-08de66d71cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y6W1CUnVI+lT7cTEhkD3DfHGTS4aF7NVGqMDP2AMD209mjL1c6Wy1gqog1Yo?=
 =?us-ascii?Q?VG+RgcyYkRB/yYlGhma9OJ3NDGYM4g86W5bfLzGWeqDi1JdXwKpHerVn0zBT?=
 =?us-ascii?Q?+9wn5nxw2kZ0iyTrWbsd+ARNlpPFATQPhtdlLGuGM/4lbyXc+WmenlFRAR/c?=
 =?us-ascii?Q?TTBOlxYcd4fT06hEXoQoBUWqQXya7HxgF3aBykhDBHEflw2HewhAN4AzsiJw?=
 =?us-ascii?Q?Wbd1YA/wznEb3KXF3qRzHToUol2f/ajvR3DrpDxZG6Igjq7OTuORixU8TNmy?=
 =?us-ascii?Q?CfLmSEQcxitb85wb1GH7Ke98KcS99eDAaMhgNavpd2sTIc2c4eyNQY3BrB6/?=
 =?us-ascii?Q?VjjQdnG3FdFZhgUgoeHIWwNJwlQaLzqAuc8DMwOBT+pOTtAQPduIAsgnD98I?=
 =?us-ascii?Q?kCizQSdValC05FUIvBJePwwXZ3hnHyLyjamEd05828KBca3eWLzTWGEG+GXf?=
 =?us-ascii?Q?dcTgEYt//1cJIVQCCoydVOROGeUBrfpFFIIB2K8BLtHszGn2sttnrQEBnbYG?=
 =?us-ascii?Q?l0F6m7zphUaM0Ml27crlzjDvtcTaLYBRSaDky6surUUXRXI8H/KfA1U++5xd?=
 =?us-ascii?Q?R7z19/ERh0eJXT9f5KO3J0Uga2hcl9uyaIISZ6SU3Cxg48Hbj5AjhraIeYik?=
 =?us-ascii?Q?31wXdc9CrWsOS59J9iI/D6Cm8t44Jxz2jZuZx08KzcHAziuAssmKIrx13rdN?=
 =?us-ascii?Q?PeJr1hduzqystcDjEsU/2gdelL+Nm5o2nuBsmDnrf0CcRUYk9eZQh/VHzyGH?=
 =?us-ascii?Q?zBFu8NZIg9hVaDgtwbeKArcm4Gz8+QjPWaO/k8BiERz4ISNTE0Undv1nGfMy?=
 =?us-ascii?Q?HWvXeD4Na8K8MlkjdDdDUgpw0WxiTexMudIOupG9iP+hbzwkrqOlPXyxTt5e?=
 =?us-ascii?Q?DFInm+41elw/fpsGKpZyksSlUe3jAfCGjoyFAP8m6C1Wy9iz5CHx0jE1K9QU?=
 =?us-ascii?Q?8NRUzGcgbbxj1eQgZYlKR9enl+7xkEKp+qNXuAgluz6wdULA18sym1gQruWI?=
 =?us-ascii?Q?fg0w+ynDglMWn4yIUpKJeCwK2J8ofJbdBcX/w0wl+A+ETSuzkUAGSWY9lj4R?=
 =?us-ascii?Q?9PDbI6sUiEHmYckGxSycVwGtomcLY3G+9MNIkRmPOH3zus2T8nTRTY79gfpV?=
 =?us-ascii?Q?5OLIjRG8qvrSMHNnOeZz67/KGpej7d4Kw87Cwi569b/+++O3be5tiUrMikZw?=
 =?us-ascii?Q?JI4/wawslR2ThGjMIA+C/DKTpvMbpdJpAwmmOz+6vfqxGodGPOW2LrgFUHez?=
 =?us-ascii?Q?QA+soPKhNJVT1jUiIO1MpYnyVgGrbLgOkUAuvmSAeIBvkZfJnZEepAN5qB3Z?=
 =?us-ascii?Q?cqMprNQiX0okqXEnC2zM6AFcnadJa8G0cFk5wbHDwvlv35JhN9xusx4XbZo+?=
 =?us-ascii?Q?RPCYH/KgMGYnBcR6pYUp8dTGz9Oue10E4RegpB7wdpS6L0eWNsnWKj8FqJfh?=
 =?us-ascii?Q?ALHdibPF9KteoPmyR9iMl0uUSIuYxFktOTsjpQzX4bNnLdW3TIochI4B8kFi?=
 =?us-ascii?Q?0DzxU+FB/Wd9l3cGKwqp86TW9s4/Vg2FSa3oZDZYhyXugnpjxmWc3I5Rhz+h?=
 =?us-ascii?Q?Hv5zOq/6RTB1A6KUVwY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83WD/74RhumDGz0h06r0ec5vWGrInoBJp11XuUMJEzcKptkoNXEI3+5A/Oag?=
 =?us-ascii?Q?pPwrZf+96k5XuH+e+m81vVk5Rpy+T5w74ZQxNzb2qdnekdIhJmEyMn2KpAeP?=
 =?us-ascii?Q?WYJtHNTA7p4xieiLAI+vKVNobTijQ9gyQF6eR/ZTkxnXvnKtVffTwV+926H7?=
 =?us-ascii?Q?qpYpJwIlE6/sHaH3S9WxGibGmGlYoYExdhGs4lNrE9QpijGDFapHEvpBUAHD?=
 =?us-ascii?Q?muYgRC5fS+V0K9GHEd3ThG2gm/l7xD2XZhBUBkWvodY2RMjkdcDYYfSQen4A?=
 =?us-ascii?Q?t0c4DK0mYGLnVedK6Pqn6OF5doAyCfrKvKi9lvx19hFXzIN+WOZ0NI3H+HTU?=
 =?us-ascii?Q?e4SyglTbgIY1Gmlb3qTqhQV3gP6dvAGzVUIkk9pXOkNlKS4SK+UqOY3YHU20?=
 =?us-ascii?Q?jJzL/0G2z21Byq4FtiAIWLGFLgOgo/QSCSbcdfs51wVgxgYRnTs3mR8MB5al?=
 =?us-ascii?Q?uW7ser0B5VQqPRcPz+XXKs4O8ivfsPJAT6EXLfT0XYymyAie8NcfE+/auP2Z?=
 =?us-ascii?Q?kfg/vb7Fld0nPSw862fEfFSIdYauFgq/FqsO9lBt/VzQz6cKKUUsa4xcdIHI?=
 =?us-ascii?Q?vjExGWsGoVyGsa/bb7NlTCe3+jr3gWQCb2hlObnI+TjMFdko4xqfjGMbR6ZV?=
 =?us-ascii?Q?6rFoUesbo6p4xkte938lFdKJB4G3pPPOhIOiD9dAwFRfW2VJdH+XLD0J0Sao?=
 =?us-ascii?Q?fTTkYVRzitEHzlZRgngsZ2kk4zhN1oXzT84tWxPn4ocIUSTRBrmRlfIlrCo9?=
 =?us-ascii?Q?/UpFG1FfzqxK+jDQ5ocWdht2SU+350Z/AvUQ/VIx9Ue7wKrmTBm5aP8cObvc?=
 =?us-ascii?Q?/PSpEr3olAFa9mCqi+KnJYYGcKSnZi6+gReYjAWxZR6NdciaK1Wl/1n28EIM?=
 =?us-ascii?Q?RZeNDKsorjtfCcKA5pPnvHGBZXCHuejb0dtlgal3H/0yv1S8BWxmKP6mXju9?=
 =?us-ascii?Q?Fz5dR2SaspSVuZD/+R15Umd4kr6c1eT91O6Ul/iRLGs+3fKj3cjy380G2lLt?=
 =?us-ascii?Q?Q2wjplcNkj3H6r1WiNgFKTWbrMxFcTVMxkyrbM89Zb9yq7SZVzeA8x2nR5a1?=
 =?us-ascii?Q?oEzBCnDnd13UbjkflQDwmart7QclFcXFlTQkCCxnAVrOtQk+fRWQYyhDawdO?=
 =?us-ascii?Q?naQnp/Gwfh39n17W8m6xup4k2GdzVgqasefHnbaETc/ObidtyM85jPLyBvMX?=
 =?us-ascii?Q?nvO170AKGA/gThVXfv8nOyeZAykQdSXWM5GG4NJPSvUP1g25uAW85wF7PiJT?=
 =?us-ascii?Q?pk3CE0BiTuwQfcSIGu0C2Jw0hpOKWgMIz6ej9YIl/6p1KUcMpP6MzSHMgaUi?=
 =?us-ascii?Q?uJ/Vw25kH3D2wGWSYiqa88k2u2rp8n0tFOc674MOzF46q1M216wydqjp6MQr?=
 =?us-ascii?Q?IlMvzVnnqYoy7ckoPTYF4WQa4FTI92jb//odIR3xweqPaqTUAfSqmRQDyIZj?=
 =?us-ascii?Q?TRwHdp4kKbgjNL7ePnYGMLxoU1NLVHr2sJ3f3SKOsJxeu0Xgq/LV5yRbeHje?=
 =?us-ascii?Q?sYyxFMwrbRXD9M8gHww7FFo9Bl/xBg3Ud1bOB/FL6J9xPW1ZtZ2Ax8TweXsL?=
 =?us-ascii?Q?NMjTpc6VcLyFbyAxvPZ7iI/iBTs3l2v/DN8LDFwT6MKLEqmUB+Yqu2lDgQVT?=
 =?us-ascii?Q?RWA/h8P9KW3mZnHk9fI+Mun+15s/ufBP2dJK3ge3aH4Hmpl3f3Egi/J4aStO?=
 =?us-ascii?Q?dkHMgmbuIqecoDCKvWN1QTSkGAJHalKySBhHQ+U3CWe/SxuaIItSUpxXv7qD?=
 =?us-ascii?Q?1BjfHVY+iQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcd51dc-c20d-437c-76cb-08de66d71cb6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 05:58:42.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojqci2bzpPSHf/Eg82L4XcBYWU6kBgSi0e9qYPz6bviAL0nkcpEuLrUvkxGlStyG8RsL/i+QymKvo+uamEYdtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11077-lists,linux-kbuild=lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26D36107F4D
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:48:59PM +0000, Gary Guo wrote:
> On Fri Feb 6, 2026 at 9:30 PM GMT, Benno Lossin wrote:
> > On Fri Feb 6, 2026 at 6:12 PM CET, Gary Guo wrote:
> >> +/// Assertion during constant evaluation.
> >> +///
> >> +/// This is a more powerful version of `static_assert` that can refer to generics inside functions
> >> +/// or implementation blocks. However, it also have a limitation where it can only appear in places
> >> +/// where statements can appear; for example, you cannot use it as an item in the module.
> >> +///
> >> +/// [`static_assert!`] should be preferred where possible.

This is confusing. You begin with "const_assert!() is more powerful",
and finally recommend to use a less powerful option.

> >> +///
> >> +/// # Examples
> >> +///
> >> +/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
> >> +/// Use `const_assert!` in this scenario.
> >> +/// ```
> >> +/// fn foo<const N: usize>() {
> >> +///     // `static_assert!(N > 1);` is not allowed
> >> +///     const_assert!(N > 1); // Compile-time check
> >> +///     build_assert!(N > 1); // Build-time check
> >
> > I think having "Build-time check" here is a bit confusing, how about we
> > change it to "Link-time check"? Since a "Compile-time check" also is
> > done at "Build-time"
> 
> This is the intentional phrasing that I used for `build_assert!` when I created
> it, for the reason that `build_assert!` ensure that it will fire, at latest,
> link time. However, if you actually use such methods with CTFE, it will error
> earlier. So it is "at latest link-time check", so I decided to just use
> "build-time".

I don't think this compiler implementation details should sneak into
the kernel. The compiler may get changed, or whatever else, and this
all will become just non-relevant.

So, can you once more explain when static_assert!() is preferable over
const_assert!() over build_assert!(); strictly from a users' perspective?

On the C side we've got similar statically_true() and const_true()
macros, but they seemingly have a different meaning:

  /*
   * Useful shorthand for "is this condition known at compile-time?"
   *
   * Note that the condition may involve non-constant values,
   * but the compiler may know enough about the details of the
   * values to determine that the condition is statically true.
   */
  #define statically_true(x) (__builtin_constant_p(x) && (x))
  
  /*
   * Similar to statically_true() but produces a constant expression
   *
   * To be used in conjunction with macros, such as BUILD_BUG_ON_ZERO(),
   * which require their input to be a constant expression and for which
   * statically_true() would otherwise fail.
   *
   * This is a trade-off: const_true() requires all its operands to be
   * compile time constants. Else, it would always returns false even on
   * the most trivial cases like:
   *
   *   true || non_const_var
   *
   * On the opposite, statically_true() is able to fold more complex
   * tautologies and will return true on expressions such as:
   *
   *   !(non_const_var * 8 % 4)
   *
   * For the general case, statically_true() is better.
   */
  #define const_true(x) __builtin_choose_expr(__is_constexpr(x), x, false)

Is it possible to maintain consistency with C on rust side? If not,
can you take those C comments as the reference for what level of
detalization is desired? Maybe pick different names then?

Thanks,
Yury

