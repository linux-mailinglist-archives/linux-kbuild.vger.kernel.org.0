Return-Path: <linux-kbuild+bounces-9517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD121C470EF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58470188FE5D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8D830FC17;
	Mon, 10 Nov 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OkOb1gEs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A752FC011;
	Mon, 10 Nov 2025 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762783179; cv=fail; b=DfBVw7FbcWXVxn1jTwi7lmfUYw4/82ldBfjnc/tEGG5rLuyXbcMA5qE0Y1HCt7IgBEQzN/634X2lZxVeuGDHcNN6lRG0bYB3pep2OgsLbQh25x76KMbdWiSPz7vM7RJJaAb5fknWy3heZDOO2Iqg2TABItmbciGMnwaouTJQ2yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762783179; c=relaxed/simple;
	bh=u1W9ELoFZVDksS0d+ZUokd+lZx3NGEfkb/5ocqfKtxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nd7TROvAAxfFgHOFpitshm1FqdUJsyP9kZdU4Gmf/OQvboWsttrzAnsRNjICBHB8s7WYkA4fKnmEpozydZZ5lBozY0mfUWVKnrdjVeUR1eqGL/oT5GSH+h112AWqTzM2ZHXP75SfTnbDSgwAt1N+RmiSd9O2pYmcoJasQGQYVEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OkOb1gEs; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQcm3kwZZGmwe2uxwndpaK4ssO+zcba1p+fQ1zZKE8wr2AHy0Dm7pEy6jTOUWKDfv/Uv5ChMVeTZUD7Zqi1fXlnMpV5kRnpGm3BkyJ2muoVe7Zqh42J4A4ncXG+EFqO7lFXzr0MPTr4BXLCV27NvnaBEN9PUQ4krFlZbIMlZUBHHiPHgWzMS9jkzE6OrzmbBjE5fc7fHvk1crVPJSTfWRe0pz0sewvC+yIq8r7yGkXSLboYhuIp0i/BiVa2rbcsrGIZn6ng9notkLacBRyC3ukUVQdvs3M2w9Fab9RIH7bG4UBY4AjQNZDhsHKbEmhUxPw/1XxHgubsBanmKTXNEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa4cbcM8vlXBFGdy3TDPYk5tYwD6oscwcGivWpL4Hy0=;
 b=i54D6oFE6SWbGFEEMAfOlbMSKfjN2iYBLkt3kygTt28AMm5/HfSmb3MDy3Dgg0Q2e0ZFDS0IKvr1hOEDTDXLYLxq7zQhpoRRSvinhjzuGePWiKwEW8o2HZHnD0GbtAD7J72W0v8OhYS+7oYVdtdh3CifTr40v1DKZls/ec/wbKqu5fWzhzaTqq8jBlYOWGErGrmXeXgSu8aDJm2yEIvFbgWb0UV52Uq97BAinxR2cjUIxaafD/iFvuKVqUnxknP9mX2EYdQBpCOCiEkLE/lQ2lrNgDhrNs/IEYLU3vtSw+v5jLz1SI1sTrw4WUJ/2xfOZ/nuhbsE6yl7LGHVilv7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa4cbcM8vlXBFGdy3TDPYk5tYwD6oscwcGivWpL4Hy0=;
 b=OkOb1gEsbQcEqU6frmHNBBn/CeyO/iC1CLvtaZXq4VXJJGnF/S5XmaOUsDbYwoiW21khBL4vDvOXE3zdVlTmtcm72t6X9QtdRc3PuEfk1L9eiqNRL7Z7IzFo+NtLGE3ohht/8znf4WtzcTSSLKJ8FI/Z833lbPeKChKnYt+8a5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB5955.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:59:31 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:59:31 +0000
Date: Mon, 10 Nov 2025 13:59:27 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 00/18] `syn` support
Message-ID: <20251110135927.05d83da2@eugeo>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::8) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: b275e646-b1db-49a0-4101-08de20615f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7pLsTuv9yEIkBzIqaSfYqw0Ov4RYkHaB/EGD8cjqyky2f02Dtniyot4pOJW0?=
 =?us-ascii?Q?g+dl2JbUsU3pwZvsAbeyjPPpxpErG4D7zj5Me0AWzpKQJ0Udq8Q/58ReoQ+V?=
 =?us-ascii?Q?g0cfrFbfqqPI14LunvyNLKmbL6sihmsT9Phwo/7uzL5YX3BWON5joyQvqR49?=
 =?us-ascii?Q?mP+NpZ1P2TL1/rkpdVZ/rzVaDvFaojWe/gDXz6dfYCd+BAVY/8ml6C81Pr0f?=
 =?us-ascii?Q?JttY11dH6jIwcHmNUG1xZSwWSn3E3Snl9xV7AVRRi9yRYW8EGYZ9krEFa6sV?=
 =?us-ascii?Q?DuwpHkpYJGdl9OI3VOKb+qYeNE5loq6zO1m4dveuv0cOC4CAhfZl3nSucjj2?=
 =?us-ascii?Q?TwLRNvLSQtuMN3vE2HoIJh4sks//VVOPhwi0Pgp/cpFOLDzts4h7X3PwE95E?=
 =?us-ascii?Q?+4Ikr5i5Yy3d2Nk09KXJoHzHpIIkhfVZfmd68QG0uQhBNefGzs4Ab0ekVAQk?=
 =?us-ascii?Q?NvSXSK5B7Mxf8Tt8Rd4N7qEJC+r2rNagbN93LVUcBWJSzrYjVPKboAif0mSc?=
 =?us-ascii?Q?HNSTC2XlJIgAl133NN+JSbSUvq4x0ZHp6QrkFKlq4b0bkj5fbBdClj8VUg3W?=
 =?us-ascii?Q?fayFJAaW5TzXKv3Ho+hET1K6C8o5kB/MKpeGCNuASxFFkLgw8TRuneZaVNnt?=
 =?us-ascii?Q?a38+SM1a970y6F7Rg4GrisZ7XHRgJM2AhQBhX1vfGfuWHlbhJgEYWQTGULrc?=
 =?us-ascii?Q?9eh2E8vPKOMoB9fXphlTAuwXke2gkZJQkAZ7VAEoOSRZ6/02s8sNBskDIDEN?=
 =?us-ascii?Q?A+LFLY5jKMUKCfLyaTmv3/RblAfsZSRD6Il6lYDh5JTDWBwYGbFrmYdK0fFY?=
 =?us-ascii?Q?rKwd9pSsbQTEneegTbS0TvG/4ZiQIgr6sIafES4aWZAW96VXudaY2/k1GhLh?=
 =?us-ascii?Q?frn6I/kP1fKAltu5Q6ORjHUJ9HnRwLmBFkFFEX8enBSvQwHZXgrdMf65BV8F?=
 =?us-ascii?Q?SZWORCtj7g+VgdCUQB5lvVx+BfNqCOlJjzrK14IQVwbCA8VelJSxWO2ywwKQ?=
 =?us-ascii?Q?AqIlwtA2Iw/17y4wiPrXOZ9hFTpE9TrUE9zoo2MbJhDnEB4FBeVd6KI5B7HN?=
 =?us-ascii?Q?W5ZVtAhIDjWo+H/kL/V7l1g1ONyZyBs03SCaEcrIyv/3M+1O47FnestsSA1X?=
 =?us-ascii?Q?JgiaMRdmz8ene1S3/Fcs3YKB0iwuurIgJLYPQGNx5LBNZEHLP/J6LP7XmbBQ?=
 =?us-ascii?Q?S5+oz96xJVlnFD94l1FT4s+yHbtEEF0/Ggr+bGfenDtLmDkKHvKhJUJom6gR?=
 =?us-ascii?Q?2Wrbi5+CEsLFsGtiMB2GnTEP+rvD7+WUzm9T2jQ/l1De/Yy1yE4NpPTHy/8R?=
 =?us-ascii?Q?mNa9Tq1AbJE1GwNIhYMtaGTFnZqZhqo+8f/EB9GsXCelUL7oh81B5fFDVb5l?=
 =?us-ascii?Q?p2/DydFJwmyG7i4oEEPtvK+UWPs5x3oTMQ1R8uulgKaI1UY7lQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dl9qmRU7WhP4QTeIMdBjZ77aiTtTpl1cxZF3rirusKB3cuQhwtnrqDHHfyWb?=
 =?us-ascii?Q?zV7Djte2mpPwrIXBb0fo23NHiheQITFIWmoQRCUuvLdUG0Y2XWwLTliadRC+?=
 =?us-ascii?Q?3G+bBF4ZNNLZ3mvgL/2cGHz+zqlzQjraUM4cxhaz5VMjUWxVE2ml8MjJhRHC?=
 =?us-ascii?Q?kIg1jSy98+RJhu8EktVPvEOmwhNinJTj/fJs2MFc60pat+jkajv3JOlRXBnk?=
 =?us-ascii?Q?AHdWe5eWmzlyDBdbQvcCPYwIh/qYEHwbcfPKVpAx0h4mcVwJutL9SaH9uMY8?=
 =?us-ascii?Q?9OT6TuqX6E/4wGEHWbWfyN0Pt9sLXpKgE9I3Tqxqnzro4UR8J4SWQFDlhYTp?=
 =?us-ascii?Q?nLAu3t2ZR1apBf1hr1MehITanupysQpRF+H8MuwfADUoQUIw9PQrhutXsTtB?=
 =?us-ascii?Q?tuOsdS5Whu07BOUsFZQSjS7iB/nNlaNK8nBJ+LX++5C8nL3AzuyzftzYh+z/?=
 =?us-ascii?Q?RbQjojeihDM3sknM7E0M0YN/f66DdjOf1nUnVz2qjofGkf5HBnzpFA2Lrr7D?=
 =?us-ascii?Q?wdfQOkeqjPgidMUMlHsetkvIIaacD3jlGpB+WUrEQEmqynoeSmFafRqSTgec?=
 =?us-ascii?Q?sJm/O5Abn+fXIe6giz/m20IolJsMWsc5SsZr/uqQN/531WNbJXxrjTHqGYaA?=
 =?us-ascii?Q?aQWCTIpCHHWC5YHzx5GK7Kal+kBafIcf4Nup19uTaICV+DmwmLEPDFk+AeD3?=
 =?us-ascii?Q?JCDS8WuUg0JFWvi/QpLpuQkgtvfp5ygkQJq+GFCFz7j/p7SCLI8b4eLnBiBj?=
 =?us-ascii?Q?PPOM8i5O1NkI1NbRv2L0zT74BefKKJUOneKtVmuKc3TLwa1aXttPfjFYIT5K?=
 =?us-ascii?Q?iowe0+3oxNYMjBsomki8VEBuj7ii9T46x++KVtEmOilnMAU/jgWMosBPVqCd?=
 =?us-ascii?Q?/BB+fsSKARJeK0Rd7vhyAmAB6nfqImt/7OO9t2EXHagYvc0THreKy/nG6Etp?=
 =?us-ascii?Q?kiCtQfsxm0+4SR0gbPANHIWGparLXVqD9uRtfWmNgST+qd+qXeNQerfw9ZnP?=
 =?us-ascii?Q?wJg8OV49FUZ4/NTJH603psD3MBmJNdvSmIuGvHZwdslz3rsAcGaOtApqLbp2?=
 =?us-ascii?Q?dv1GC+DSPusR6WSvqWyOaRzkumsvoqpdbCsMP/uJjHby3MxUjZp+foWWwimq?=
 =?us-ascii?Q?cBy+RKD7xleFAIytk50UqwqTtHpZCWXSspkpow6fxMw/2eSy7HcrXB9U2NAf?=
 =?us-ascii?Q?lNSJeXi66JwJ896HxHj/w9WZjSh8wFNCt7E6AuyWDxa8vqfVqcPexFEjTt6/?=
 =?us-ascii?Q?2hYFBdy4Ug5D4onadDCVjMcT1RM+0AiKcgj1OBHvGrsaFH1LH8hVz0bqUEEQ?=
 =?us-ascii?Q?AeZq7TiUY6QmjvkyKG0ZytXgEc/UBJSeKyeBC5MO2ZVUYGvst3FCpiAHwNrB?=
 =?us-ascii?Q?jmMjIzckPOt344d1vG73cvn54aFt/sFRKVPn3wtn7myvLoVbv8T+/ooDwo5b?=
 =?us-ascii?Q?tXTogT5sD0C+qGnjfBg7fCIa0V3ba8L4q3o/u7WM7GoeTqY77zlGuf9ceCZJ?=
 =?us-ascii?Q?E5ymZ1Kl1OSJbF6/IcTZbrnG/uKvkJzkW4s0OGL+5ZeU+BzO1pndKwTZ5D8w?=
 =?us-ascii?Q?ALIEHzWv9yzrgnl0fxurotzrs3GizJYZoXtbfF3+zM1QhDGqERwpNajNKxE4?=
 =?us-ascii?Q?JzbZDNz9eJ+soq3C5l16vV+MxQ6rTPpiO1FtyFTcuhlW?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b275e646-b1db-49a0-4101-08de20615f0f
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:59:31.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP5UY3shH+YPsMV42sV4dVePbbI7NR69Lo+J131Ne+HmWRJ2+4fwgz89ACZwcj7cskg7qho9tVX4QENeAPAiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5955

On Mon, 10 Nov 2025 10:50:05 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> This patch series introduces support for `syn` (and its dependencies).
> Having such support allows to greatly simplify writing complex macros
> such as `pin-init`.
> 
> Benno has already prepared the `pin-init` version based on this, and on
> top of that, we will be able to simplify the `macros` crate too.
> 
> The series starts with a few preparation commits (two fixes were already
> merged in mainline that were discovered by this series), then each crate
> is added.
> 
> This has been a long time coming -- the first iterations of this, from
> 2022 and 2023 (with `serde` too), are at:
> 
>     https://github.com/Rust-for-Linux/linux/pull/910
>     https://github.com/Rust-for-Linux/linux/pull/1007
> 
> After those, we considered picking these from the distributions where
> possible. However, after discussing it, it is not really worth the
> complexity: vendoring makes things less complex and is less fragile.
> 
> In particular, we avoid having to support and test several versions,
> we avoid having to introduce Cargo just to properly fetch the right
> versions from the registry, we can easily customize the crates if needed
> (e.g. dropping the `unicode_idents` dependency like it is done in this
> series) and we simplify the configuration of the build for users for
> which the "default" paths/registries would not have worked.
> 
> Moreover, nowadays, the ~57k lines introduced are not that much compared
> to years ago (it dwarfed the actual Rust kernel code). Moreover, back
> then it wasn't clear the Rust experiment would be a success, so it would
> have been a bit pointless/risky to add many lines for nothing. Our macro
> needs were also smaller in the early days.
> 
> So, finally, in Kangrejos 2025 we discussed going with the original,
> simpler approach. Thus here it is the result.
> 
> There should not be many updates needed for these, and even if there
> are, they should not be too big, e.g. +7k -3k lines across the 3 crates
> in the last year.
> 
> Note that `syn` does not have all the features enabled, since we do not
> need them so far, but they can easily be enabled just adding them to the
> list.
> 
> I will be updating the webpage as well with the result of this:
> 
>     https://rust-for-linux.com/third-party-crates
> 
> Please give it a test -- thanks!

Hi Miguel,

Thank you for creating this. I have been wanting to use `syn` even
before RfL was merged into mainline :)

I've gone through all commits and they all look good to me (I've also
verified the "import crate" patches against the source). So

Reviewed-by: Gary Guo <gary@garyguo.net>

I can build with these patches and I've verified that libmacros can
indeed reference types within `syn`, so also

Tested-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> 
> Miguel Ojeda (18):
>   rust: condvar: avoid `pub` in example
>   rust: kbuild: introduce `core-flags` and `core-skip_flags`
>   rust: kbuild: simplify `--cfg` handling
>   rust: kbuild: add host library support
>   rust: proc-macro2: import crate
>   rust: proc-macro2: add SPDX License Identifiers
>   rust: proc-macro2: remove `unicode_ident` dependency
>   rust: proc-macro2: add `README.md`
>   rust: proc-macro2: enable support in kbuild
>   rust: quote: import crate
>   rust: quote: add SPDX License Identifiers
>   rust: quote: add `README.md`
>   rust: quote: enable support in kbuild
>   rust: syn: import crate
>   rust: syn: add SPDX License Identifiers
>   rust: syn: remove `unicode-ident` dependency
>   rust: syn: add `README.md`
>   rust: syn: enable support in kbuild
> 
>  .gitignore                                    |    1 +
>  Makefile                                      |    5 +
>  rust/Makefile                                 |  134 +-
>  rust/kernel/sync/condvar.rs                   |    2 +-
>  rust/proc-macro2/README.md                    |   13 +
>  rust/proc-macro2/detection.rs                 |   77 +
>  rust/proc-macro2/extra.rs                     |  153 +
>  rust/proc-macro2/fallback.rs                  | 1258 +++++
>  rust/proc-macro2/lib.rs                       | 1351 ++++++
>  rust/proc-macro2/location.rs                  |   31 +
>  rust/proc-macro2/marker.rs                    |   19 +
>  rust/proc-macro2/parse.rs                     |  997 ++++
>  rust/proc-macro2/probe.rs                     |   12 +
>  rust/proc-macro2/probe/proc_macro_span.rs     |   53 +
>  .../proc-macro2/probe/proc_macro_span_file.rs |   16 +
>  .../probe/proc_macro_span_location.rs         |   23 +
>  rust/proc-macro2/rcvec.rs                     |  148 +
>  rust/proc-macro2/wrapper.rs                   |  986 ++++
>  rust/quote/README.md                          |   12 +
>  rust/quote/ext.rs                             |  112 +
>  rust/quote/format.rs                          |  170 +
>  rust/quote/ident_fragment.rs                  |   90 +
>  rust/quote/lib.rs                             | 1456 ++++++
>  rust/quote/runtime.rs                         |  494 ++
>  rust/quote/spanned.rs                         |   52 +
>  rust/quote/to_tokens.rs                       |  273 ++
>  rust/syn/README.md                            |   13 +
>  rust/syn/attr.rs                              |  838 ++++
>  rust/syn/bigint.rs                            |   68 +
>  rust/syn/buffer.rs                            |  436 ++
>  rust/syn/classify.rs                          |  313 ++
>  rust/syn/custom_keyword.rs                    |  262 ++
>  rust/syn/custom_punctuation.rs                |  306 ++
>  rust/syn/data.rs                              |  426 ++
>  rust/syn/derive.rs                            |  261 ++
>  rust/syn/discouraged.rs                       |  227 +
>  rust/syn/drops.rs                             |   60 +
>  rust/syn/error.rs                             |  469 ++
>  rust/syn/export.rs                            |   75 +
>  rust/syn/expr.rs                              | 4175 +++++++++++++++++
>  rust/syn/ext.rs                               |  138 +
>  rust/syn/file.rs                              |  127 +
>  rust/syn/fixup.rs                             |  775 +++
>  rust/syn/gen/clone.rs                         | 2269 +++++++++
>  rust/syn/gen/debug.rs                         | 3240 +++++++++++++
>  rust/syn/gen/eq.rs                            | 2308 +++++++++
>  rust/syn/gen/fold.rs                          | 3904 +++++++++++++++
>  rust/syn/gen/hash.rs                          | 2878 ++++++++++++
>  rust/syn/gen/visit.rs                         | 3943 ++++++++++++++++
>  rust/syn/gen/visit_mut.rs                     | 3761 +++++++++++++++
>  rust/syn/generics.rs                          | 1479 ++++++
>  rust/syn/group.rs                             |  293 ++
>  rust/syn/ident.rs                             |  110 +
>  rust/syn/item.rs                              | 3492 ++++++++++++++
>  rust/syn/lib.rs                               | 1013 ++++
>  rust/syn/lifetime.rs                          |  158 +
>  rust/syn/lit.rs                               | 1862 ++++++++
>  rust/syn/lookahead.rs                         |  334 ++
>  rust/syn/mac.rs                               |  227 +
>  rust/syn/macros.rs                            |  184 +
>  rust/syn/meta.rs                              |  429 ++
>  rust/syn/op.rs                                |  221 +
>  rust/syn/parse.rs                             | 1421 ++++++
>  rust/syn/parse_macro_input.rs                 |  130 +
>  rust/syn/parse_quote.rs                       |  242 +
>  rust/syn/pat.rs                               |  957 ++++
>  rust/syn/path.rs                              |  968 ++++
>  rust/syn/precedence.rs                        |  212 +
>  rust/syn/print.rs                             |   18 +
>  rust/syn/punctuated.rs                        | 1157 +++++
>  rust/syn/restriction.rs                       |  180 +
>  rust/syn/scan_expr.rs                         |  267 ++
>  rust/syn/sealed.rs                            |    6 +
>  rust/syn/span.rs                              |   65 +
>  rust/syn/spanned.rs                           |  120 +
>  rust/syn/stmt.rs                              |  486 ++
>  rust/syn/thread.rs                            |   62 +
>  rust/syn/token.rs                             | 1098 +++++
>  rust/syn/tt.rs                                |  109 +
>  rust/syn/ty.rs                                | 1273 +++++
>  rust/syn/verbatim.rs                          |   35 +
>  rust/syn/whitespace.rs                        |   67 +
>  scripts/generate_rust_analyzer.py             |   23 +-
>  83 files changed, 57895 insertions(+), 13 deletions(-)
>  create mode 100644 rust/proc-macro2/README.md
>  create mode 100644 rust/proc-macro2/detection.rs
>  create mode 100644 rust/proc-macro2/extra.rs
>  create mode 100644 rust/proc-macro2/fallback.rs
>  create mode 100644 rust/proc-macro2/lib.rs
>  create mode 100644 rust/proc-macro2/location.rs
>  create mode 100644 rust/proc-macro2/marker.rs
>  create mode 100644 rust/proc-macro2/parse.rs
>  create mode 100644 rust/proc-macro2/probe.rs
>  create mode 100644 rust/proc-macro2/probe/proc_macro_span.rs
>  create mode 100644 rust/proc-macro2/probe/proc_macro_span_file.rs
>  create mode 100644 rust/proc-macro2/probe/proc_macro_span_location.rs
>  create mode 100644 rust/proc-macro2/rcvec.rs
>  create mode 100644 rust/proc-macro2/wrapper.rs
>  create mode 100644 rust/quote/README.md
>  create mode 100644 rust/quote/ext.rs
>  create mode 100644 rust/quote/format.rs
>  create mode 100644 rust/quote/ident_fragment.rs
>  create mode 100644 rust/quote/lib.rs
>  create mode 100644 rust/quote/runtime.rs
>  create mode 100644 rust/quote/spanned.rs
>  create mode 100644 rust/quote/to_tokens.rs
>  create mode 100644 rust/syn/README.md
>  create mode 100644 rust/syn/attr.rs
>  create mode 100644 rust/syn/bigint.rs
>  create mode 100644 rust/syn/buffer.rs
>  create mode 100644 rust/syn/classify.rs
>  create mode 100644 rust/syn/custom_keyword.rs
>  create mode 100644 rust/syn/custom_punctuation.rs
>  create mode 100644 rust/syn/data.rs
>  create mode 100644 rust/syn/derive.rs
>  create mode 100644 rust/syn/discouraged.rs
>  create mode 100644 rust/syn/drops.rs
>  create mode 100644 rust/syn/error.rs
>  create mode 100644 rust/syn/export.rs
>  create mode 100644 rust/syn/expr.rs
>  create mode 100644 rust/syn/ext.rs
>  create mode 100644 rust/syn/file.rs
>  create mode 100644 rust/syn/fixup.rs
>  create mode 100644 rust/syn/gen/clone.rs
>  create mode 100644 rust/syn/gen/debug.rs
>  create mode 100644 rust/syn/gen/eq.rs
>  create mode 100644 rust/syn/gen/fold.rs
>  create mode 100644 rust/syn/gen/hash.rs
>  create mode 100644 rust/syn/gen/visit.rs
>  create mode 100644 rust/syn/gen/visit_mut.rs
>  create mode 100644 rust/syn/generics.rs
>  create mode 100644 rust/syn/group.rs
>  create mode 100644 rust/syn/ident.rs
>  create mode 100644 rust/syn/item.rs
>  create mode 100644 rust/syn/lib.rs
>  create mode 100644 rust/syn/lifetime.rs
>  create mode 100644 rust/syn/lit.rs
>  create mode 100644 rust/syn/lookahead.rs
>  create mode 100644 rust/syn/mac.rs
>  create mode 100644 rust/syn/macros.rs
>  create mode 100644 rust/syn/meta.rs
>  create mode 100644 rust/syn/op.rs
>  create mode 100644 rust/syn/parse.rs
>  create mode 100644 rust/syn/parse_macro_input.rs
>  create mode 100644 rust/syn/parse_quote.rs
>  create mode 100644 rust/syn/pat.rs
>  create mode 100644 rust/syn/path.rs
>  create mode 100644 rust/syn/precedence.rs
>  create mode 100644 rust/syn/print.rs
>  create mode 100644 rust/syn/punctuated.rs
>  create mode 100644 rust/syn/restriction.rs
>  create mode 100644 rust/syn/scan_expr.rs
>  create mode 100644 rust/syn/sealed.rs
>  create mode 100644 rust/syn/span.rs
>  create mode 100644 rust/syn/spanned.rs
>  create mode 100644 rust/syn/stmt.rs
>  create mode 100644 rust/syn/thread.rs
>  create mode 100644 rust/syn/token.rs
>  create mode 100644 rust/syn/tt.rs
>  create mode 100644 rust/syn/ty.rs
>  create mode 100644 rust/syn/verbatim.rs
>  create mode 100644 rust/syn/whitespace.rs
> 
> --
> 2.51.2


