Return-Path: <linux-kbuild+bounces-11067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FYBNNxhhmkdMgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11067-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:49:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6B1038E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FCD6304CB64
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 21:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4233126D4;
	Fri,  6 Feb 2026 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ghstOH+L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021124.outbound.protection.outlook.com [52.101.100.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181D28D8DB;
	Fri,  6 Feb 2026 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770414544; cv=fail; b=FHnf9Yr9KpzbZq4LvbPiykzrNDPZWbYh6xpkd2kbz6O/Ia2Ejz5lBp/t/IXiH4oTrd52fRE8wKQFfswQ5rsMNrglfH8Hsvzkj6huyO0gsbDlpYbUbmTlHmDRqpsyYT5cFWVxfU2fjihumlgcQWFzQfkA8JySFQy9VxXC0I7SnqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770414544; c=relaxed/simple;
	bh=f8O/umLx0g65HXrnE7JCAUGMs/xECAyiVvCBMfKJRiY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rOFv6kmRz+JJABNg2B48tLpRBh5/+m0HiA9aQ2mRAKY+AvWV98pjNwxRToFnXTBRfkWc7nWF27GhPtRIbgl+MRIZDHGeL4+NB4Na8s54k1KgoXEw8k+PYVDxILpyuIyKv/y+jjXgFRBjKk2Yv21JnUGD+poRv9hZjbSI3j05iyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ghstOH+L; arc=fail smtp.client-ip=52.101.100.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGBEn+Ju+MPQWEI9UeER8xpJ+b5jDl/0TiNhwg/wf5juAi2vKeyII/5UIRk9vbAt8dZMvCIXQStZmnyW596qTA/lWJC7RcrW+ULYUQTeMnxr1tCGWobe0X/ebV12VDlhdH2RB9g0AU/FTVlzlBm4WSbwB1owCJkHLTzlPpRULOc327Xxi/M4BgGL7AtpW5KdWXJ6aYKoKrizi3KgtU8gjPx4jeYfAQorVn3p4ZE1qRRn2yM6KqpqQBqXDkcLnzeG3SGuC4ZxICS8S0A/By4a49RKoJuJkya/LVCArGf5JZKN6/Mmo/j5e++JjEjZZkX3xwx7m9JSU7b4J3JNLeEnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqhgm7RNPfA+g70WzLorg0FE1va4KyKeAljYjwC6bcg=;
 b=SSO6xb3BsLbihtvQyq9iXO9F8unb/ynDz7rOsVFD76PQXFLRLGGvfUqBs6LTDBN12o5lOn2BDcBaDtupn7h3bwn9B3RLgkuyi1V/diLfoB/dpcvYlbW6qhDCs0dneJxqZO1iAfCtCbQLK4GBv28JXX7qK2y1pYk0m3iHT1j/ii8yhEHtAyrzAa0lbcPqLK0vkXUMYxHrboHojGX/9vAeKnJu64G7tCg/FamE+cSTI/L0NW8uIZAtUBby7dek7/wAheLJedF1gS5HwONMwzngw0MIeDKXNbNpC09talIJ7szxpzU5IkDCW2BAy1w+N5j+/Ms+rYOUguV2xhxYdP7h3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqhgm7RNPfA+g70WzLorg0FE1va4KyKeAljYjwC6bcg=;
 b=ghstOH+LqvY2oTr/le4f58my8HMxTlomaw5QO5HVGYqS3PiA6mXNPkhQ1Yuu3HP2j/3nOnI+PQP1c71JrHgnpRrp2Ki8Zaz7DTLB6GRlQFiVgzgNulcpszk/D1BTijOTqDOdreJ2Atpfi8ZitwDoVjzUeHpf0e4ruW+fwvUtDX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:219::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 21:49:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 21:49:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 21:48:59 +0000
Message-Id: <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
In-Reply-To: <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea71589-f1b0-4e2c-e38e-08de65c98982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHlqTkpCV3dlM1lFUFYyZ2N0MDVaMUMzMXB1alF6WkRkbk8vWmQxWHF2My9U?=
 =?utf-8?B?OENnV0NSdWRLdUV1clROM3UyMDl1Z1ZrS3k2UitvNHhHZDczVDYzNDJub2R1?=
 =?utf-8?B?K0ROVG1iMkw2SzN0Z1JKMHdqWXVzelAza3h3UnhweFZhRXY4Vmo2RGtvcUh5?=
 =?utf-8?B?TTc0OU82dWE2UTF3cVNzNXR3b1REaWYvWjhaVkZXR05CWUJrMjluamxGVVky?=
 =?utf-8?B?dDJQZWtXeFdPVFJLczNiRk9LWW85bHF2WDIvdkZIdlhHYUpOQ1lIclZlWlha?=
 =?utf-8?B?OGRRbGUwdVpCeThFS0ZNRWZvMVFPaENhb2JyMVJNM2NabXpQd0tIdHZESUN2?=
 =?utf-8?B?N1pYcUpLUkFvNnUxeHBDTGFRRzNudC9Ld2x5TVdWRWFFVEw0dExzdThRRmdY?=
 =?utf-8?B?UHhtL2IrcGlaSWJpallYM3hrelJyNFF2SjkvOFI5cjZFblpmb0FENkErMzhV?=
 =?utf-8?B?YUxydEJLczBkNU9ySmd4Yy9OS1hUMCt5ZFFMdDVSdEUwRThTMFNHbUhyMG4v?=
 =?utf-8?B?TWtKRDMrYVl5ZWxVS2VVK3NkOW5KMEFkYWl1WFphcEw0WkJLcWovTk83emxQ?=
 =?utf-8?B?dTBWc2dQTU9WeWF3anFseVUyNHVoSXlQaTdLOVQ0YXN6LzRmblV0bG5KS29h?=
 =?utf-8?B?Z3p1NXVWeno4a0NLRVdlcWZzU3J3aE5HVkx3MlRkaHFpSjFZajB2ZXJPM0Ir?=
 =?utf-8?B?aWNCZUN6NlZCTlNFN1VwSnhkeXpzYTRJbkRIYUlmOEs5OEpocVRBbS9KTGZa?=
 =?utf-8?B?Ym1kbHo1WFFEa1kwejhyV3haZGN2RjJLelVHTDloVTVHbUU1UWlnZ2NyUVpE?=
 =?utf-8?B?VWl1UlZBVTlHY0dyNGlaRVpxSnJJcW1UdGtyYUdQMFdKd1c0VnU1RlNJZFZ2?=
 =?utf-8?B?d2o3bWFHUnFaR1l6M2plZzBGRGpRSWpGVjVOMXppSlFnZmp2dXE4SVY4YUlr?=
 =?utf-8?B?d3YyNmlkUHJKWWpNVTFpbkVTemNqNGtqc25CS2w5V2Q0ckdHMGs5SkptYko0?=
 =?utf-8?B?K01XWGJhTUdFb1dkU0VLdElZcjBiMGc2RWJoem9yN3BMVEdnSjlvNTRPZDF0?=
 =?utf-8?B?OXFWeGpFNk1pYnowem1OMUx1VkQ2ZzBsNHJzUUREaVBqdlBOQ0VBWGp3cExa?=
 =?utf-8?B?MzBhcnhTWVI3UG5DVXR2Z2VPSGFLTlhvay9sT29OSThIcEt3dXJVRlFZVXNY?=
 =?utf-8?B?RmVDcWlQby9sWk1HSWlCN3BxcGI1aGVQdUVVWmV6QW9ORk5FYm9yVmJwK3Y5?=
 =?utf-8?B?RlpFc3NxL1dKc0hnTXA1eTRhZWFnL3VFR3h3c2JhU3V6QWttb3dWbFdvYjVS?=
 =?utf-8?B?bEI0Q3FQNjBVT2wyR0d0c3k5aTFoV0Rtd3p1YWxMUkJlWDlIYkpsNlBUc1Rt?=
 =?utf-8?B?eEthb2t6MTRib2M0Vm5YYXJkK2VvUEFDa0gvNlhpNGNYWkhIblN1VzBXSTBS?=
 =?utf-8?B?Z0NUK3dMSFlFNko5d09BdkhvaUNFTTdVeWo3TFo1SDgvRUlQNXp4b01kV1dk?=
 =?utf-8?B?OWdvaDBoK2h6MFJ6L0lRUnJMZ1I5WnBHaGNDdytvYUpDTWRDbzBUMWJrTEg4?=
 =?utf-8?B?VjBGdjJnTWltRVV0eTY4L3V5ZXhhZktSVzh2dW10dFdudnJEY093bXdzWkhs?=
 =?utf-8?B?cGxFakxWWEpMOExYaFdyaHhWVzVxdnV0MTZ6b1B6a25HYmZKQnJiS2FEQ0pE?=
 =?utf-8?B?RzZsa09tTFZrem9LT3RIRUFvSmluZ3dNWlltMVRVM2RLd2FqeDBQMmtmY0VI?=
 =?utf-8?B?RXdVRVhZUlZYN295TWZQdFdWSzB6N3N2ajJ1ODlXRGZoVmRlZ3Nva0xRNW5n?=
 =?utf-8?B?aE1XdUVBRmpZUzM2SXduY2pDeDdxV3A2YVN2MVYwRldnSC9OUlM1OGhkMTYz?=
 =?utf-8?B?aWNnNkJZcWJ1ME1GLzJuN29yWWVURUdIeExFQ0hrZ2J1NWRwdzV6RmJGbnpj?=
 =?utf-8?B?ZU9nRldxczY0aWMxeWtoNDRtNm1hQzZIVFhFVHV3azNWZmR2WUlsajdHNnE0?=
 =?utf-8?B?dXpZK202SFlqbjZ6RHRoa2RaS1ZKMFJTaEtLREE0T2FZOXlqSkVnOUozYWtW?=
 =?utf-8?B?Z3BiTDJrVWluVERBZUtQb2gvRjhsWE4xK2RIWkNjb0xKQytCbERUdUV3bGF6?=
 =?utf-8?B?NXlBSXcyZTJPaFgwUFdacjBQakwweUI3SVNxaHFvZjNBcVdJYWM4MTFDbU5C?=
 =?utf-8?B?UWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZseTIxUFBka28zaWhHL003eDJkWmpvN0YzUy9IdE51YnFJczNGUXZzV2Jj?=
 =?utf-8?B?UnNlcTN1b3lIOTNHN0RkQ0hDM3dGVzdHZUZJeFpqNndLWjRJczFzWE9MWU9K?=
 =?utf-8?B?RjdicnlrOWk5NHZwTDROK2ZENzdDWkVyK1hpYkFaUzl6WVUzbDhwSndWRjkv?=
 =?utf-8?B?UjgweGZKQndFQXgyQnVLTnN6Z0RxOVV3SzJPSGwzYUw1ekJNVmZDRXNiaGJC?=
 =?utf-8?B?bTlpK1BWUDVwcXlWTFl2VWsxNnVTRnZkUEUyR1NIR1diL1ptSFlyNUgrWHQ5?=
 =?utf-8?B?YjZmOVg4cm5nMnVNVVlqbkJsMi8vLzZ6Skc3TUZmMzRjMFZ3R1B2enRxWHo1?=
 =?utf-8?B?K0JjSWFlcmRUa0RtRE1pQmVRTzBWQm5ZakNJUUZySFpER3pubDFRRFoxdU10?=
 =?utf-8?B?cFFoaWtEZGlUMjI4bHpiQm9PQXJ4Qyt0dkRsanltSnVwTm1MUkI4dklUamRx?=
 =?utf-8?B?cFZzMlRibWFjNklTbGt4ZGlid0VnK0kvdUFUblA0S0o0RWZXL3c3eXpGWm1Y?=
 =?utf-8?B?djFLUFpxV0RkZW8wa0RCaGZLdytoRW5zSGpxWmFaVjQwbUk4djJKODRaa003?=
 =?utf-8?B?RTVRcGxKUTU4bTdyQWw2Z3lKN3pzYUdYVkxBcGJZUzJrLzgyNUJLNFdZRFB6?=
 =?utf-8?B?Y3dQcWdCOTBPSStnSS9PODh0RWN5M3YzRFgvcllDTEQ5TmFDVCtYTWNOaFd0?=
 =?utf-8?B?OHpieDNKS0dhNFVlQ2RzSDBKMzVHWWFVYXl0TFlSQzVSckdOV1piS05sekdk?=
 =?utf-8?B?SUV1SDZ3UGFROXZyeTZZb0dxRDZGZ0V5dU4wdmsxU29CZEJDd1F2U1JFMy9R?=
 =?utf-8?B?ZUMzbjdybGtzTW0valJydkkzdmJ4Nm5YSDI2c1JQVThoRXd5Y3VLVmZ0V1Zx?=
 =?utf-8?B?VW5NLzlGOU4xUS9aSS9Zck8vQkUzS0FiZVlkUU15UmtsQnlYd0NtRWpHay9p?=
 =?utf-8?B?L1ppYVRWNzZLa1NERDB5aG5UMnp0blQxYWxWTGFoQWxiU2pCempXcTUvNUND?=
 =?utf-8?B?VFF1MjRXaXpxdUpSb2VUU0UvaGtNWDJQaGNvR0tlbjMxR1d1VlZBREFjQm83?=
 =?utf-8?B?OVBVL1VlWTNEQzMrdnFvcE5ITnU0VkRuYjBpV1orYjRVdW9SUWZTUzhvbnFV?=
 =?utf-8?B?R3hXRnFNVjBjaEFNYXMxcXVXVHFTZkIwRm9YbDBzOTBmVkdmcW1RVHVVYUZL?=
 =?utf-8?B?YmlLLytnNE5FNEEzSWpWMGRLV1A2RFExVUJYUCtEZGNIcE1VWFFZeDNpS3pD?=
 =?utf-8?B?eHBEOW5ITHk3cHpVb2lMdVEzMXF5K1JOWm5Tcm4yb0VhNUdmdWFDQ01IYlRl?=
 =?utf-8?B?UW5CMisrcTFkK1FuYnNOSWRCQWppMDZTNFRONWNDT2dWamRsREVjSHdXaEli?=
 =?utf-8?B?bWFnWGJBd2ZQRDJLNUNETGdBK05UMkxNVlhKUlBxRWFiaUdDaVRrUHh2RGZw?=
 =?utf-8?B?QldFWW9BK2g5ODVlTlMxVW5RNHFkRHJlOUdoSzZEaEM3enN2aHY3czRnMDJZ?=
 =?utf-8?B?Y0ljWFczekhUNms0Vm9ER1FsUUJtaExVUGJVU2YxbVRGbUxpeHNwNW44NkJC?=
 =?utf-8?B?WXJqZkZjRmYwZEtRbmo1cmtvc2lta1c1ZEd6QUh6dlFEblBRdnJXdEM3UGtp?=
 =?utf-8?B?N0J6djM5QjRLVGFUTmQvYnBTRnl5MHhoRWgvcTJibmNtNGg1cmpaV1EveTNI?=
 =?utf-8?B?MmpyQ2xTNTZ5YzZ5d1ZsOTNIeEZ1ZzBCbTRlTDR0eVppcHlNUWxPQnpLZVZ2?=
 =?utf-8?B?Mzl0VHJXK0FJQXY1VkhFRDgxNFFUQ3k2ZmUzTXBzMmZidjV4SkZJOHdQNTZi?=
 =?utf-8?B?L1JQTkZGM1VKbmFWZHZpc0VudWlBdm9ncGJQQVYzUVRZRFVIV0ppdWFSL1dQ?=
 =?utf-8?B?U3kwbTFsRU42L2Y4UjAwK1NtUEZXZ3RTb3d3SWlNd1o2Nkh6ZUJBaU0xM0pZ?=
 =?utf-8?B?ZkpnN25kRWxQSzlZUEZpZURKeEFTN3RmSXFhZi9JblJhbW1PV2JvM0swckM3?=
 =?utf-8?B?aWFKQktHaWtSU1hucGpzT3dzVEtYNXNoeHFUQjdYYk1GcS9pUi9xZVA0NjBl?=
 =?utf-8?B?NklLQ01wbS9OUkpIRWRzTXRUMjIxN3NHSktzVk1QWjdWdU8xUVpKcmFrZlMy?=
 =?utf-8?B?aTU4ZkIyVENVSTZ0UzNzamdBOTdkK1BjbnVSZ1JSbGh4a0RKS1pwRC9rS3dx?=
 =?utf-8?B?ZVJOeHgvYUxmbUk3RFdMY0NXQzJkOGRLS29oZkpHM2Y2aEl5R0lBR3EwbEtz?=
 =?utf-8?B?REJDMzUzRGQrT0hHQm04M2VwU0lpazlocjBFR1p1Y1VQTXFtNmQzUzRKcjNm?=
 =?utf-8?B?SlZ2UVY4UGZJMlpkNjBwZHA3ai9IWmRtNmxSQ0NwN2Z6d0MxZU5SZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea71589-f1b0-4e2c-e38e-08de65c98982
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 21:49:00.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4yxgsIeWHeZGVp9RdWR/5R9JDtBGlfkjwUSMa85Xbo/9YMqi5aY9DQz9lT7boACZhJsy44H6ube/1+qwtRagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11067-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BF6B1038E1
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 9:30 PM GMT, Benno Lossin wrote:
> On Fri Feb 6, 2026 at 6:12 PM CET, Gary Guo wrote:
>> +/// Assertion during constant evaluation.
>> +///
>> +/// This is a more powerful version of `static_assert` that can refer t=
o generics inside functions
>> +/// or implementation blocks. However, it also have a limitation where =
it can only appear in places
>> +/// where statements can appear; for example, you cannot use it as an i=
tem in the module.
>> +///
>> +/// [`static_assert!`] should be preferred where possible.
>> +///
>> +/// # Examples
>> +///
>> +/// When the condition refers to generic parameters [`static_assert!`] =
cannot be used.
>> +/// Use `const_assert!` in this scenario.
>> +/// ```
>> +/// fn foo<const N: usize>() {
>> +///     // `static_assert!(N > 1);` is not allowed
>> +///     const_assert!(N > 1); // Compile-time check
>> +///     build_assert!(N > 1); // Build-time check
>
> I think having "Build-time check" here is a bit confusing, how about we
> change it to "Link-time check"? Since a "Compile-time check" also is
> done at "Build-time"

This is the intentional phrasing that I used for `build_assert!` when I cre=
ated
it, for the reason that `build_assert!` ensure that it will fire, at latest=
,
link time. However, if you actually use such methods with CTFE, it will err=
or
earlier. So it is "at latest link-time check", so I decided to just use
"build-time".

Best,
Gary

>
> Cheers,
> Benno


