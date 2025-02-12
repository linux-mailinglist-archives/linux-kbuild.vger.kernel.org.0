Return-Path: <linux-kbuild+bounces-5728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F43A321AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 10:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4016718858FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2025 09:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE06B205AB1;
	Wed, 12 Feb 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="doLY7MO4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022073.outbound.protection.outlook.com [52.101.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02891E7C07;
	Wed, 12 Feb 2025 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351070; cv=fail; b=BIo9B8wIGiSG08bPTjzdLtMM03YlXjQO4+CJc4Ay0q7N4PyuXXzE/Pl1Mxs3Ceg/G1Q/xOQhCqkjuhy2WXBP9EgYmLWcFSMjClSiwRfjcWJAcWFUTNKNSgo2nvbMH4F07MC9sAC7byn1VUYOrTmfn4kZ/m2Fw8oZMEK8MbuoplU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351070; c=relaxed/simple;
	bh=L87/NlcQf5CH6wC11zn4c1BRyik5bH3vTpTqLOWqTFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hcun340zydgiAmjJAHqh0eXVVrTM1pXL8RX+QznSKg5yDMcVBIRqGiW0DEm7hFVZPl6jiWE1XzzSnhe4nO6I/cEkVAYsybGOYmAW2L0NHA+6vFuJIjhMmbCy91Xz8SJjOd4rHQ8x+Erg6Eh8ISHzaPvg9C4AZPioUIoyLlrrHzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=doLY7MO4; arc=fail smtp.client-ip=52.101.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNXZ4TAIJXdhsJf2ysslwNcLlLO/H868kQcphTmPBiN1ENusmXJ4h5TceDjV21gN1SaOxNPSsbLmjkK1pvVPJUK0IPVCHlAm++jMS5y9VZTYlNQmjh11cYYlTD5osaybJHPdhuII9BhnWmrUldKPhZE1xcfdba+2xBTt1aU15SozShFxfoggKkuqEXJkydzWcLCc7HotRuWd0ZvlrK+3yso8GH2Zi4rKZ4CjtYMQuMfofP0ot/98FwqzpkCdi8ejZCfB6aWu8H19Vr2iXaAXCgwwRx7YKJTzcbL/vk7jUBx2AfK0OhDUa6oy+2KmNg/xDPuAJcnv1+SCHta6AW5DLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHlgD7GbW3I0VTuHgOvLEFaeDQpt0F2ealyOo8iwTdY=;
 b=I0onzkrADFmp+5dXAbzc5WzsgGIcZFoLC4CDD4PSAPkdpH1c9Q2eckXR6mSUTa0sRSrZLFVzaFAU4eIL3NOJ0vdkRSqBIU17Pq3uw4at9imnwViPqUmmnev8TVWgqwGiFJ7AONRO4wr/S3CcJ3ChGnLhQqsp0+jEkAxEGxYKmreWyA5RLrJwIvqCEGizjkFNKmCnqIrx6qNlyk8nu6eLyKAK/rZM3p7OD2DFBsvPgWBbvKRoj+rlkZczXnXq6KuOzERqmJl+QAZpJv19aaWQkJcdUhzFNfUG6Mx5P2lm0urnaKEHWVVrleaIN1gb7lc3tnjkVgnUZqmkwh0CwYBYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHlgD7GbW3I0VTuHgOvLEFaeDQpt0F2ealyOo8iwTdY=;
 b=doLY7MO4bpHnrxjwUoCNLWSjKcfyDsQbIK0U1arJ39C4bfSf3tklhWMNkS2IfAqypWOwvVQsK86n5bnDdkI5bq7yKAbu65izMy6t1/ioUHxXMMoAmH9w2e/o0kHY7zh0fte53n4NtwjSaQHwqLcWKxFOoLSJQbv0h4CmfCJVyRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LO0P265MB3354.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:186::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 09:04:25 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a%7]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 09:04:25 +0000
Date: Wed, 12 Feb 2025 09:04:22 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v6 5/6] rust: str: add radix prefixed integer parsing
 functions
Message-ID: <20250212090422.6de4ebf5@eugeo>
In-Reply-To: <87r04444vd.fsf@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-5-24b297ddc43d@kernel.org>
	<vf__dkyg05tUau0dIoKDIkuUlwyYrMe5z2AJGWdFLOM5GpCYJkB0F5-GkzkIC_cG9LjC_YPrdeVc8884CA7rhQ==@protonmail.internalid>
	<20250211164301.47f8d414@eugeo>
	<87r04444vd.fsf@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LO0P265MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: 019ec29e-615c-4e68-2592-08dd4b443f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7pL6jwecZwj39n2tK3sJwZ/Qav8arhVzIDzgoD7go1qZ8jGSHYDU3KNKZkI?=
 =?us-ascii?Q?oVJB1rPDokbm5AnedEycmFFslPale+M3AvsXrMBtRignQCNvEuz/W0bHEJKJ?=
 =?us-ascii?Q?jitoU1m6RbRJ/2ouCdWvA9vEUS84W7peE+a5vVg644+T1fGfzM0I1IuJ3C8Z?=
 =?us-ascii?Q?au842Kkxv2m7FwwxuGdQe6+1oA5cv/JjdFX+6932L10w/yCIDlakXk2z5dFS?=
 =?us-ascii?Q?zJb1vvcVfyBFjY/f65XGTN+z6pNAxaxfB8NeZpc9tCpw/chugg03Yf5iGYVN?=
 =?us-ascii?Q?vbI330PNpRiOrHv8nALO5RlCsCeEMc/VC9Grekm29KmrFmILg8UYMb9qyp7N?=
 =?us-ascii?Q?2mxNTP6QOzxxZfICZtVhBMdE+xo4Zxfgnim+xmbRTDrQv8AIbj/8icexptdY?=
 =?us-ascii?Q?lGrhi5Oplq4m/5A+2AAm+Pk6dVJQceVSpVSDCUzJw1Oi+QZxtyzFDp0aO/Ar?=
 =?us-ascii?Q?dJjLZvKdxQ6ZERhER+ld64jHn7pkrYkOAu6LaGhp9futKGNRx/RAfZkx0VEk?=
 =?us-ascii?Q?OHuFY58fzHuzRdjjjbKeP0RhAj60efwIZNB0+OgHXP5ZqkUGrcjovxjjabDw?=
 =?us-ascii?Q?F5fOrXzl2BKcQyFQpeuUxn8zFmwHZYSwhUlvIWidP6BXC3xRJzztL5DPkwAN?=
 =?us-ascii?Q?fidbSh/AzrMFN62WqMtT4uHZL2Ujo6+LIFpLyv6kxTuwBLziXa8RX1Vze7Ys?=
 =?us-ascii?Q?EehBzKui0KG6tIU0Y2hQQSU0w42AC1BTGPstIHuSDNhZ23GBtabCZW9VUCWT?=
 =?us-ascii?Q?WBFBWtUJiTsWP2mSHQOElmwwcGzqjU50H3HqAwhU0T/jk0suGf/ZZKwnZHVT?=
 =?us-ascii?Q?3RfRa/wOVuD7jam7S+mqZW2JkTja6ubDz+ugmhVw8GLIah4BQiMOwSeiVNuC?=
 =?us-ascii?Q?CLWFcqn6yhWzV4Cvbqd7j4IGaZWxKAjVFnY035+a1GEWJMd3lZ6OYOfq89YT?=
 =?us-ascii?Q?0YvXCk1TjWTovlXc9OSonYoghjgnLgitYP/w2P3B4ZAjnrMnHjAvrqbjTpB6?=
 =?us-ascii?Q?oszPRlBCl+kKOkPrUR3soMiaRyAhu8dIl3pASw7y06FiKUpdHQTU7v/tIX5p?=
 =?us-ascii?Q?jP5BHV7SXu5Zviqhs1izRL7wina1hNsCu5nHZSSDWqHdJ1Yn7k3HIGK7qK6x?=
 =?us-ascii?Q?YzkJZDMDTp8LNtBvRs5XHteyCE1OIz3ZHwjUeRTB0O4MedY3QlPFd6xYZqzA?=
 =?us-ascii?Q?CHOdG3EsWwRQ4Wb9qZTD7H9Rxo6OK0av3A0l2G5F8GSjFGfp6PTQVwyQMjv9?=
 =?us-ascii?Q?MTcAo3rOVzLowPEA1JRlREFpKFr0B4v5mGIBAiVOxdf+U3Lqmlmu9jY2vfUa?=
 =?us-ascii?Q?UbLHzfm8jGBAKCQQjtGjhNWBAqhNMJ2z/QauG0tPAA7ScANcJbYuijzY//+R?=
 =?us-ascii?Q?c88J9PjaoN+OQxbOAl1c8BnWhdPU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCy8R2boOQv0qnlTr/5law1JbQkBl4LZrcZ/Q4yIL0yijQ0YUPlP4ISNmKPr?=
 =?us-ascii?Q?T6p5AYwHKi43bx7NQonIrcWPQXHdtN1kbj91bRHyuryT1s2JFMOHUgUiDKbM?=
 =?us-ascii?Q?GLAjmBTUcaE9CJGT3Fr9pp1gSzMD70wCH7Xp1pPyuGvPiHLmn7Tb+myVWHcB?=
 =?us-ascii?Q?MtM2KSWVhTXkp2W+fbBY6/UKmBae+dU0fx2Lcw1ldQT0T+EiXnYqRFzkO7A7?=
 =?us-ascii?Q?7jiVWReajawRt4GiPH2qA+xu6bj2cZ0S5EwdA5f7/MbRxe90M9COHh5/B2r9?=
 =?us-ascii?Q?2ZaodtgO7QITk8WlK4IjIVo2EAzlr8jFIKBk/MPgxt1YESAhGxbcK9Mr7E6P?=
 =?us-ascii?Q?KXXyFaKzoR6j3VxrwnONektnBzH3AqJ9qMWr62I2Ti/YKTKe4pKyLDatXHk8?=
 =?us-ascii?Q?xakFDauB7BMEXuOo70NS8a8wIxIxr4xpDc2lDoAp421xEWu5dbvXm2kO0rc6?=
 =?us-ascii?Q?LVKglsv7u7ksU8cSLCN1FlwdOsCtI6BJS9mpACVV+xh07HadGVuf0/k2iHQO?=
 =?us-ascii?Q?cM39IKEoF4iNzv2o3QQ8GOprxvhvvI+IPTtNgCp3VP78XXs2vZoW2pb0uXEE?=
 =?us-ascii?Q?xjAS3nfOjoxx1HU5weo5bQCa9F3iVKxnzn9BuCX3dVOQ4Hqwv54ZCQMg3YKn?=
 =?us-ascii?Q?+o8/5wpUudUbN20KYPYAtr3Ba4jDBA1GcBA9LpyVvIEYDgNjSv9k1JgwgEJN?=
 =?us-ascii?Q?gjztYXkoRzQClYLCcDKKqsKRrlFpDi8dl5Junf84N2NLrUrAvWURWmHhPYer?=
 =?us-ascii?Q?+Pv76vJEYKrZ7FZiQUr+s1b5SqDQc903lUk6LWFIMmrs9paCyxpUKs80dJDu?=
 =?us-ascii?Q?hkZTig9mO6j88D5aTnBl8OLtV9tkgN/azgXn2MCzM6wq1uxsXtDxJ2obmixS?=
 =?us-ascii?Q?A61u65hxgnS7EyKXBOk4vfiGfPFJD9IR7ERkUwfxX/acdzpAlmfAyKYtOztC?=
 =?us-ascii?Q?Oo202DudQHvCQRzqGdSyupO99LeNoB+HaPMUoqErIqpTzc41ykykWuYHvY3a?=
 =?us-ascii?Q?BK+DbgoTRvGm2dtK7rQz5tpegBcwXjPzCzDoWJ4KOQdLdM27h/y60K+DZ7lk?=
 =?us-ascii?Q?Mr5DkzwqVT+pWpqSIQG3D+opt3wYsO/Vy1Rg3mDhXFHXqklTGWM6KHZ8vwgC?=
 =?us-ascii?Q?1CXpuGuybaEfAAaQ0pz6rAQmBMmDHa+6FL36uezJv+qVOOTXG2OPOlmiK5Zp?=
 =?us-ascii?Q?6SqI23QXMs+HWtPgXwaBlgIEiPVUQFITxQK5gEOlvv1SOTWgRIgP/Xg8XRlw?=
 =?us-ascii?Q?SrNDiWNI2wZ+UYlNt/gT/1E+0H/5IY2FpvJfxTHvm3ThWmfst0ew6AlgUn2p?=
 =?us-ascii?Q?uaLkV2GDwz4R0nP/X2Eh33WX4e514lmrvFk0rcqbHQQJgjj5tu++KvDJ9HFn?=
 =?us-ascii?Q?nz0iOO5mgAPReC7PXpmkS2UtKZaZZobzTOdfmfF+dnhv/qp3S9Vjvy/egmXb?=
 =?us-ascii?Q?YATeoTyh5tmIeqzlvokrp7pwSIw1rSsnl8Jxxs3hRGGkkx3i8ou3IAt2No4e?=
 =?us-ascii?Q?Qmo5mwGe7pUK3E5YvIVw8qJce/M1AHbnlQX2p2KKqzn9YVnV4DtsmRx5/o8U?=
 =?us-ascii?Q?WzTANSMh+mGe4Ceg6yWXurj4sJhxphCNmQZIbmMM03W99pOG9m7DYIqlMBF6?=
 =?us-ascii?Q?HSFgD2SPmwLBYN/RtX+PFfNWkKq2swxtYN3q0sNN3aBK?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 019ec29e-615c-4e68-2592-08dd4b443f8f
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:04:25.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2eoS+I3rQf6Lsk9VMdTZSk7n2MV9rasUmCZlSV4JH7+OvbXkIQlINCEbUf/fSrllFa5C+zjb+tAyrQ8YjWtQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3354

On Tue, 11 Feb 2025 21:13:10 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Gary Guo" <gary@garyguo.net> writes:
> 
> > On Tue, 11 Feb 2025 16:57:39 +0100
> > Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >  
> >> Add the trait `ParseInt` for parsing string representations of integers
> >> where the string representations are optionally prefixed by a radix
> >> specifier. Implement the trait for the primitive integer types.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/kernel/str.rs | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 111 insertions(+)
> >>
> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> >> index c102adac32757..192cd0ff5974f 100644
> >> --- a/rust/kernel/str.rs
> >> +++ b/rust/kernel/str.rs
> >> @@ -945,3 +945,114 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> >>  macro_rules! fmt {
> >>      ($($f:tt)*) => ( core::format_args!($($f)*) )
> >>  }
> >> +
> >> +pub mod parse_int {
> >> +    //! Integer parsing functions for parsing signed and unsigned integers
> >> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
> >> +
> >> +    use crate::alloc::flags;
> >> +    use crate::prelude::*;
> >> +    use crate::str::BStr;
> >> +    use core::ops::Deref;
> >> +
> >> +    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
> >> +    ///
> >> +    /// [`&BStr`]: kernel::str::BStr
> >> +    // This is required because the `from_str_radix` function on the primitive
> >> +    // integer types is not part of any trait.
> >> +    pub trait FromStrRadix: Sized {
> >> +        /// Parse `src` to `Self` using radix `radix`.
> >> +        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
> >> +    }
> >> +
> >> +    /// Extract the radix from an integer literal optionally prefixed with
> >> +    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
> >> +    fn strip_radix(src: &BStr) -> (u32, &BStr) {
> >> +        match src.deref() {
> >> +            [b'0', b'x' | b'X', ..] => (16, &src[2..]),  
> >
> > This can be written as
> >
> > 	[b'0', b'x' | b'X', rest @ ..] => (16, rest),
> >
> > to avoid manual indexing. Same for o and b below.  
> 
> error[E0308]: mismatched types
>    --> /home/aeh/src/linux-rust/module-params/rust/kernel/str.rs:972:52  
>     |
> 972 |             [b'0', b'x' | b'X', rest @ ..] => (16, rest),
>     |                                                    ^^^^ expected `&BStr`, found `&[u8]`
>     |
>     = note: expected reference `&BStr`
>                found reference `&[u8]`
> 
> But I guess I could use the new AsRef impl. Or is it more idiomatic to
> implement `From<&[u8]> for &BStr` and go with `rest.into()`?

Ah, alright, I missed that this function is operating on BStr instead
of slice. Keeping the current form is fine then.

> 
> >  
> >> +            [b'0', b'o' | b'O', ..] => (8, &src[2..]),
> >> +            [b'0', b'b' | b'B', ..] => (2, &src[2..]),
> >> +            [b'0', ..] => (8, src),  
> >
> > Perhaps add a comment saying that this isn't using `src[1..]` so `0`
> > can be parsed.  
> 
> Good idea.
> 
> >  
> >> +            _ => (10, src),
> >> +        }
> >> +    }

> >> +    pub trait ParseInt: FromStrRadix {
> >> +        /// Parse a string according to the description in [`Self`].
> >> +        fn from_str(src: &BStr) -> Result<Self> {
> >> +            match src.iter().next() {
> >> +                None => Err(EINVAL),
> >> +                Some(sign @ b'-') | Some(sign @ b'+') => {
> >> +                    let (radix, digits) = strip_radix(BStr::from_bytes(&src[1..]));
> >> +                    let mut n_digits: KVec<u8> =
> >> +                        KVec::with_capacity(digits.len() + 1, flags::GFP_KERNEL)?;
> >> +                    n_digits.push(*sign, flags::GFP_KERNEL)?;
> >> +                    n_digits.extend_from_slice(digits, flags::GFP_KERNEL)?;  
> >
> > I think my comment from a previous series saying that this shouldn't
> > need allocation is not addressed.  
> 
> Thanks for noticing. This is the discussion from v4:
> 
> >> I don't think we should allocate for parsing. This can trivially be a
> >> non-allocating. Just check that the next byte is an ASCII digit (reject
> >> if so, in case people give multiple signs), and then from_str_radix and
> >> return as is or use `checked_neg`.  
> >
> >The issue with that approach is that 2s complement signed integer types
> >of width `b` can assume values from -2^(b-1) to (2^(b-1))-1. We would
> >reject the value -2^(b-1) when trying to parse as 2^(b-1).
> >
> >We could parse into an unsigned type, but it gets kind of clunky.

I would say either that or just call into kstrto* family.

Best,
Gary

> >
> >Another option is to stop relying on `from_str_radix` from core and roll
> >our own that takes sign as a separate function argument.  
> 
> What is your take on that?
> 
> 
> Best regards,
> Andreas Hindborg
> 
> 


