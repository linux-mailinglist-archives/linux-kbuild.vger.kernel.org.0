Return-Path: <linux-kbuild+bounces-12513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLc+KYMczWnOaAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12513-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:24:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525337B29B
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39163301F7BB
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C7F38C2DF;
	Wed,  1 Apr 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="j5hGQ/mq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022121.outbound.protection.outlook.com [52.101.101.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50C40DFC1;
	Wed,  1 Apr 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049484; cv=fail; b=C+LP8FU1/xh/R4xfG56GN+0AUdqYpf7wdANd+nxfex933Sot8ZeIjEcOE3sH0SzfwliV/dF3vbME5tUuYOGk1W4EYqtT5UB4TPD7rt2mXm9Gotv3TkC07DjhV8FwLjqHilVOKwfYe4cS/UK+oicSaxvL5xDgPeFOQiJUpiWrcfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049484; c=relaxed/simple;
	bh=CAmTqmTrUwA8R7KW8ypuSRAIGiZUCAqkdZcppB8M5Ms=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=foh3NatEYX+z4PED5hfbbLstTsljaRc4e3icQ4TMeeSA0e5POY8F3N33L16TlZOwowMYwIFI6LlN0FrC3qzoRR+5rhkxJWgRnSAABYBwKVUUHOdVgm13+LoVoYoPfZc2Gzq6k3v5/HqGlFRtDTY9wgrvi5/qyuw3KxkDjIFD1Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=j5hGQ/mq; arc=fail smtp.client-ip=52.101.101.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyD+a2Vo7hivtBuXazA8rSVvcv7MCJZ1isi33WflQ9hZxcZBGpKw+I/wQaMtSj5CElU60V6Dnz4x9tWrBIr55nKpqpDiJU2Id7DVr3aghxnxXKYV6sBNXbc7G6OezEb9Vd3EgvYKHayQQXSogAPnneXmCpSj3lxBVUnH+21Mo1K3Zf+AQ03gaM/yTX9+FzuuvxWyWAje7qfXC2OzjvjSUP+IE4GFS8pVfKljg7nWFIR5SZSAb+ZdAXg5tQZAnSai9uduh8tGKd4IxAbdlnVsqwjeNQNkA0KvJ2KFGZOtPNcP6303JD55jDA+HdIt/cJLC15/s4SXeoUyw9WC3iX3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDnCpM9lVS61RJWFs8BQRWmSZ2Orzft1WPMP/GrUDvc=;
 b=iRon6jS0a3vB0ijunxgfJVHOO4U1GDt8jOIEaQu2UL0hsklxw52UDlxpgtivP0I2deEYDrQwYJdnmC17bI1KXe4m/2j7/pEJsqrHhjxjbkMKI78lIJT0DwgkhsDFQB2Q3u3n83NvTEaI+wRIk+4RFHlxaCX0YCaOjgmWaFmu4RGSqE9u0Snz25km2+KMUxJlZglDW/t3YyVC1dGd8aLAy04JHLLuesOCxWoos0Y/xoJjBytrPKUTZfK2Di/l9vvhBPwvK4o4DrfmsqXEoENnTxFBA7qLJhDjNG4v8DtXhks68bBwBK8lm5Mvk3L5t9YYkXh4R3QhLQJw1rXsOMGYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDnCpM9lVS61RJWFs8BQRWmSZ2Orzft1WPMP/GrUDvc=;
 b=j5hGQ/mqUovBLQr5ciiAccd/Ru92ohrL5Ytb8u5id2Zd00xreX3vXJPBh/F++eSUKsmJ47OWbeN071hjLPYB73glVGWUJq7eJ/+ABZwy5McgdATyDhlsP4hpalQki5jRd32tt7YKVu9ffmy8PzEFamNwIGJvAg0+B6xIAivOZfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB9164.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:49f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:18:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:18:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:18:00 +0100
Message-Id: <DHHUIXWLCGT4.G653WGEB8KMT@garyguo.net>
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
Subject: Re: [PATCH 03/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
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
 <20260401114540.30108-4-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-4-ojeda@kernel.org>
X-ClientProxiedBy: LO6P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 203fd42c-9cef-4a9b-b04f-08de8ff11996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gO+dYv8youB8/Kxnl39dpescYv7ovVxLiYSDElhvRkuBlAj27MjycVbrbGjsJmCql9BZVza4OIQEWXn+g0EEf7GqKVjr9flUuzYvdNuPSHc78vAcFgV6UwFiegpx7UFjDw+3ag5aRgg5xmWd/1GGUeWnChpv2TtXJERSvQ3uN3d/7JGklDH0w/NsezHzte0U6JJ6RwO0kEFG1M/U6fmSAKC5uL15BNzDOL3JlWcWfyh562brc0g+Y7prgbdqkr6Q1nyxzwv0XrJx5HXwY3gh65s/0L5tKqS5YFS4YlMSOc3Ka6wBerGl2akE7wQGYrDQSnQ6UXhX6oYmCajB63aLmET/wRg/kyTdsBi37w4z46HaWv9YN/BylEc6d/y4RHlNkmqhFFH7dAlUVZxtF8xlNpMH2SIatMr6bLdbw6Pla0VGLhVAxnIsl+U47VWf61R6foojhLXSlpREHLSuu0vjofI2gs3PhtHBXhqu5yRFhlDrBEu4CxL8gqEqoKyL3GMCloRoTgbau7kGH9V4fmWsMshsvJsAQmLsat2kihR5P6A8lFqpo0Yyy0OWUFbzi9ffwFUdH1G6XvxzSpgauIuRTQg8FW8VwqDDbI49qbxPTYUVMXtSypDQ1LnmwWHIMsTBtApLDDM216xTQR8q0z9fIuXU+GK3+8K0V7ZyadyW4c2z/p5fdaLskyes7tARNNP4i3SfFPbxDM3bPF+mSit5houBgJQ+wkho9eXiTo1j97+Y07DXreccWOGtKwb9cml3uus0jkGQ+WfL763d+PPHhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkpITmJJdHZrTTZqQXVHYXprbldGZzdhcVhJekRmQUp0a0xvcytwQWxoRG9L?=
 =?utf-8?B?eGJpYnYwL1IxcUh2UGw1dXBpS29OM2V3T0JzOWJhSVJkU0dLRFhheDBEaTZU?=
 =?utf-8?B?Y3lZUmJQaTJiMS9tMHZTZkVkZ1hPVGhnWmxndVdId2xwYTYrWk05ZlhxMEJw?=
 =?utf-8?B?NUV3M1VZQkdaT3BsNUFtcEk0WkI1bENBREhsR2M3YWFlSEIrcENrakoxSStE?=
 =?utf-8?B?NXhLdll0L3RsN3BiU05kSzVpektnSkZVQTdPZkI2dEY1Nk1TOXNEc2pmMDJx?=
 =?utf-8?B?MnFCSWZ0ckdXY2RFL3ozbTQ5QXN5RTFyeE1iSlhBQUI1ek5ET3dCMVUzT1Z1?=
 =?utf-8?B?anNaRG9MZGN0VXBjUGQ4b0syUGhsMkZicDMrcFRjRkJUY0x1a09yeVVIMFVj?=
 =?utf-8?B?bXhaV0M2c1BLc2Vpb2hlTm5QbitoYTJRU3BNdjhHU2szMHViUUhISVI1akV5?=
 =?utf-8?B?MDd0UG15L1E0RElVSyt1dlloWkhnMjd1TWUxRFR1VExQZWczZm5OdVhMVURM?=
 =?utf-8?B?cmw4U2VyT1FkbWlKdGFKTW1Nb2lSZ2I1Q1pxRThPNDQxQitoU0swbVJ3ZE04?=
 =?utf-8?B?RXA5Vm14QmMzOVU1Q0trd2Y0alQrOGloYW9EZFVTbjFQZkJBVXlWcmUydVVO?=
 =?utf-8?B?MWMwend0YTNDNitMRmdybGszQjVEMk5IUlZaWlVpNWx4THcyWjRkM29tOEdo?=
 =?utf-8?B?d3UyemdLck0zdk5jMUk0T25sNnBWU1RyNVNHSWEyY2RvZE1TM1pRRFJRV1NM?=
 =?utf-8?B?cXU2SlhrV3pYcUhiaVZnMU9LeDdreVIwbEFMSnB3R21zTWdraGR6U0VkRWd4?=
 =?utf-8?B?MEtZTHVtci9qZnYzaGRpamFIakR3anVRQVFTMyt4SGh5VSt0SVczWUpVY21F?=
 =?utf-8?B?RnZOcy9Zc2FKV1plMHN0S2NrTmJPd2djZlhxVHRKK1I5d1JISWNDRUg0bi8x?=
 =?utf-8?B?NDVIZXBHdytCVU1kV09yMVBLZ2lJa0M4NXRNWFNiY0lUbi9NVVZ5cm40eWMx?=
 =?utf-8?B?SWJNcnVUM2p6YjAvYjRIWmROUU9GTFJHdVlLM0xEVFU4Nk5ISEtDdm9EZzNo?=
 =?utf-8?B?bHhoRUdNdXpnUnQ3VjhRNVc5OS9kMkNtY1BTUlgrcklibmVkQTFzazNab0xs?=
 =?utf-8?B?dmUyeklrYldTU3JXOEZEWm5YNlZ4NCs2WEQzWEp0Y3F4UVB5WjhPVFVsVFc5?=
 =?utf-8?B?WnJPa0x6cStXWGlTTHQzRnZsbm1BcUlEVCt5ditXVjJRdFQrck80TjljbFFS?=
 =?utf-8?B?UnRMQlIrRlc2YUpnWlhsbURaUHRpSG56cmFseTBJL1hsOUF6TGVieWhvdnA0?=
 =?utf-8?B?UDlwZGxBMHhJaW1MTTdqRWs4cUtTaUd1Rk9ndi9jWjg1N2VQNGw2RVRpbVJH?=
 =?utf-8?B?UXdzNFhTTnowaGxTK1ZpM00xbTBzY0l3dHRQUkF0Y0kvbkxPYzRsOUpYd0xn?=
 =?utf-8?B?RFlKcjd0TnhHaS9meTE1VllWSDBHM0dSSW96SmdVbEsvcWRXMDc2SWRxaklx?=
 =?utf-8?B?WnN5aXREQ0F1aDJOUFJNcEdPVWdDQVUvVjd2eTdOTkFmZEliZ0ZwcWRVbWtJ?=
 =?utf-8?B?RDBYRzhkTTJDSHBWSGJIa3lBZjlpT2lVZjcvRWdGejI1UVo5QThqS1lBYkNp?=
 =?utf-8?B?SmRXR1h6VTUxV3BveHZBWHp6c0YvMjRVSmxuZTI2ek1PSlpjL29QT2tjQ3ln?=
 =?utf-8?B?dENVOGl6VndjUVZVVVJxajVqSy9iUVVyamljdG1TSXBuOUpoTkxlL0V0SnNn?=
 =?utf-8?B?azFLWTk5K2ZqYmJSeDJ1eHM1OUNabEhGWENWaHNaUDE4SkxxQ0NyQng4SlVB?=
 =?utf-8?B?RzBJaG1DbWl3T3BQVjhpSlEreU9aSjZUMWVrUzFFbm5NL25tZmZHeGZ2dnhs?=
 =?utf-8?B?eDVIZ21XTGQzSm5JRVFsV1hmVlNDaUg2YTkvbnJqYmdRdDBadThQRmg2WThU?=
 =?utf-8?B?YzV5V1dHTUREa21tREhUZUowRFJLK0NyM3BWbTFUaklUSitxK1l2SWplNG8w?=
 =?utf-8?B?QVNOeXpGcS9qdlU1QXlreCsyUjZPMEpxRmpJbXQ4M1RteTlvaEVRZXBlbWxh?=
 =?utf-8?B?TDJMdnRKZmtWamZPL2JEdDVrSmxtMEtzV0Rnd2JWZTl4ZWxKUEE5OFMrR2hJ?=
 =?utf-8?B?YjFDUStYdXprU1F2Rk5nQmJwcEV3ZVB3RjFnNVJLcERNQXE5S294UzRRNmZ1?=
 =?utf-8?B?dG5hcWMwYmR4SEFoMHgxQkhBVW5jT1FBeXV6b0M3eTNDZ2lxMUJROGcvL3Rl?=
 =?utf-8?B?T0plTEtGL2ErbG5FRnJIT2thOStHdURxSE82N1JnMTJzZzNIQk9lMUVhdVNM?=
 =?utf-8?B?L084NFZNcnRkVUtqQUpTQW5seWxkdExhNVhFQTZ5OW16OU9LSDhJUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 203fd42c-9cef-4a9b-b04f-08de8ff11996
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:18:01.3199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiRuxGURMiJdFsZZ+5VdMS46QErt+WgZnru1Act4iWPdfIJhxVU//96fIi9dpccSvlqWYYsKP3fLQOE3GX38EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9164
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12513-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2525337B29B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> With the Rust version bump in place, several Kconfig conditions based on
> `RUSTC_VERSION` are always true.
>=20
> Thus simplify them.
>=20
> The minimum supported major LLVM version by our new Rust minimum version
> is now LLVM 18, instead of LLVM 16. However, there are no possible
> cleanups for `RUSTC_LLVM_VERSION`.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  arch/Kconfig       | 3 +--
>  arch/arm64/Kconfig | 8 --------
>  arch/riscv/Kconfig | 3 ---
>  init/Kconfig       | 2 --
>  4 files changed, 1 insertion(+), 15 deletions(-)


