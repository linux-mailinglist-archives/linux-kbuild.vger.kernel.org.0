Return-Path: <linux-kbuild+bounces-5858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007DA3FF16
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 19:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 037637A92AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 18:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAF2250BF3;
	Fri, 21 Feb 2025 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kry8Cziz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021080.outbound.protection.outlook.com [52.101.100.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430822505D3;
	Fri, 21 Feb 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163986; cv=fail; b=Bvi8ehOrUTGTx4nooYFTiCL9l3/m/8Eb81kXyIuHKDDdMAKpjYp5GC8yqs4Wc+8aczlb8vPdgTIHiSyiqgaodoUmjkNyOuzEj5CAdAw725dI1InzzuvagFTTh2WQW1iGh12eDrt+k92++Mq7dc9btJsUqITr1sVTMd3B9VogRmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163986; c=relaxed/simple;
	bh=IrSryUHmZOD2oOBt0mxnudgaRznAHEwmQDeYiS5o3UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oZ6K82uvQjDDjUhRzaNN0ECXCs696IKyCeSv+jXEkQnqHNCr4Y772GmnlznoBrilt6wlxy9oBDMHmo5olYzpUllhLe7toNShYjBNvSz+tvnS9EL/iXhkNVmx5LZETZIt9+vnPOLdpYzvzG90e48xY4219h1PeNjxghOto+YqkJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kry8Cziz; arc=fail smtp.client-ip=52.101.100.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0f3s4SAfbhfFAoaQW6busiv3R0GU/J3pB5w0B4e1hlnQsKIJH+f7uWo49nfklQtNhygr3meeBmchxQy0rcqoBHnDYIIbndZlBzLR3Yf7nDHFvvK0HsyF0bJiSnBmq3b8ucEAqKqfkWOGF1abtvUKxwU9kw7ab/J/Q8VkQ3R+752vZMtui9b+x9XR7q0yE8XXlg1yyAzIvGHAWZK0bShfsimRZGst/JYkvuRAhu8wK6Q0kS0G6vKE9OhY5yrERtknosPO8rwQ12yty+qii3TRS1HC/fgY7BcXrty9CncdQYokH4dNEx8h8VZew27oeK7TuzWmMQNcxU1aVJUvqUu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKYHj+Pz0kxowbKeASvTi1uFgp61Zwp47aIwiTORX6s=;
 b=EuJI8Lu9b6KnNhv44GZoqalpS1IP3jOUJkFrdgsKLOXP5EKB9mPrRl6XrAFvdXxgjOyLePWYs4JRwnUzJHRW+ubeHcSn5dtufq4k4KA32CtnXLHm7y+jm2MreTK63vHNxQCpH1gJSFBYscOts+Ha8GHZUKWzdTks2Z0YkchY4ty+D8TC2YKvnS65EZ1ih3tM3kKgHj4AvRAZumEPyFlXwxVYjXfHD+nNH4jHxkBXMjdm+7iI324+GrFXeGa6mJnWdi05w5XwI0/mnSfcGUAfQ6A28m3E/qJgv4RPuuv0CaKpSlc4jsxd9jXOCinIUaCx1bzmAAlJoJvnd86mtHvxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKYHj+Pz0kxowbKeASvTi1uFgp61Zwp47aIwiTORX6s=;
 b=kry8CzizdtUllhlVPc2rNEvW2IljdzxLCxFpB2Y9NcYgNwJu2ajTDQaj16bhPWLka3fksM+fd8gkcJ7sMYe1tucGKnB1XACQQK1KzVAXcRfYjgfXumrsf7wCTgstSddcQnU1BsU+kSx7gZHYTUkMtgVrzd1SXT6sn4n4p2UyTl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB7207.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:335::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 18:52:59 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 18:52:59 +0000
Date: Fri, 21 Feb 2025 18:52:55 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Adam
 Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH v7 3/6] rust: str: implement `AsRef<BStr>` for `[u8]`
 and `BStr`
Message-ID: <20250221185255.6cc33367@eugeo>
In-Reply-To: <20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 2014e4e8-d853-45db-2229-08dd52a8f5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SLZ2vGzruWu2eYPliggPXN2RQzyEi7O+hzH45xpFuYNIpB2OcVBnRFuup/R4?=
 =?us-ascii?Q?BFpy2Dxdwq8r7FXxkCNc3ZDC1a2eeMbOtKVXw6JJIRHefQ91WBFprbcKcU+f?=
 =?us-ascii?Q?mJ2I+VrT3jUoBpqRBNyN9gmgfafz8xPOFUu4r84fnfMQpyezKww7CYcrY7Qf?=
 =?us-ascii?Q?EHtaZlLGt/CrlYdY0/qyFvzvWAFmZpBj+JdPucFrGlsrfTdmXFg9kroJmVQY?=
 =?us-ascii?Q?s0K37nBJ96kwqGI0kW7ZCbmbnPyF5zL6Ezs1nmVc8jIVckJphF6Q2iSWCtSV?=
 =?us-ascii?Q?GVtwPfpScIOxaUKOmlv0IGJqiD7rvbG2IMrQbQywv+8/ZXNXRfg4FQCsY0wc?=
 =?us-ascii?Q?oAk5FOFig6KQHam/tEXtL1cII9Z14siQdJ1CumxMzic6fElcIYLKmovZJh0U?=
 =?us-ascii?Q?38C1EuOh7c1U9tUPwcI9VKww9+fFbZzYx+nCqIsJBU94QhA12y1w+i6DZgmN?=
 =?us-ascii?Q?dZURcMn1GFVLhmwqiAXdqYzBHK9Q5v7vR1UhuFRcwYj1e5QcB8RekTBnB2rD?=
 =?us-ascii?Q?AL1r3bepyD+RSXbJBXEvIRieubEqTl8PnI651PanbhlHb2bltLBJ+4h044hY?=
 =?us-ascii?Q?Wru/nKxRH9EuL+mF9pIOlWrEBEbSZdzOxNwNiFku1tzRIbc5DqmcOF2h5d/X?=
 =?us-ascii?Q?1d4c9blPrJen/05fQiROhpyTfHUci3fJF3RNNxI6p4Ehtn40I3d18VXo9DLI?=
 =?us-ascii?Q?jwBXKQkr/Cez6eqLClIWxLLmc5PQXPsI4pZ87wJz/hLc48cq43VvPTH0X9zo?=
 =?us-ascii?Q?fbW5AIJ6EWIPLPaT/tl10SwFlqeer+frTwn8GHVQxis+EeG4HANVbWU8qd0n?=
 =?us-ascii?Q?GTHe0olSj6lmCLvyD95hp9lkhLKbhVYCVAVGIm94Xre/O4iFMmQylLNuZyhS?=
 =?us-ascii?Q?Iyzep44ttYuO9kOsnBKO7NONmVA0q6qOrG86HVqBwe1mQ2CbHru0K9Pwma6+?=
 =?us-ascii?Q?0lAGy7uarFS4QLgTjwhKZibKlnSIKxuazTTJRTVkQIMOtmzR/3+Go95oIpFz?=
 =?us-ascii?Q?hyIidPTnOGkiyVu8gXVvvxM7n/Nhib4ZiZrRLsp2F8/3g6D6i2AN9tQ23JHh?=
 =?us-ascii?Q?x/GmI73i7Jff2PMEI1RUKgLDPHbhMaO0S1+u3yvzqsBz/D2aA7jtRlyu2h96?=
 =?us-ascii?Q?hEXhV+f1J5G4ZP9soOUXTbMRlpHnsRwVlLAD2ZNGNyMvrs3SB3t6biyXJXDP?=
 =?us-ascii?Q?wpV1vCjMQ5vDfMvFalqz1db88HOV9GRspbawZgBqsJwj/6+h9cjCpMDIrYwZ?=
 =?us-ascii?Q?InkvjXxMPjVoETpOUL8+1DWRlb2zMdHqeyLI/g5pyltk5p9AUo+lEuad4hW7?=
 =?us-ascii?Q?FF8SYWgWlJZ1r9mdLhfFedNkKQyhEazDfBGwAQlP3SqM5vQ8tCq+PmneR2VS?=
 =?us-ascii?Q?HrKEzpNEtcoyawXXUCLmaYjELDHJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvkUcxg1mkydjsj0INFoAzulJtBbFWyvtvqE7FjP7ozknImnezswIOLi//Kg?=
 =?us-ascii?Q?/FBFl8iHYIIhn+NJ3AfkADIKQ5MtAHKylbp1O8qRUIW/z42Gm/XLZB8hvEMc?=
 =?us-ascii?Q?VJqBDhHcNRFGrn3KpQKeEzFVFiutiT2K7neWa9mIfAK2ls+pJZDSIQNA4EDQ?=
 =?us-ascii?Q?Sz+n2ru/2HNleHT8IKDUVDuweoEoQBIBifnI7wNEg9Yk0RnHW5FIr1+Eb1t7?=
 =?us-ascii?Q?YTgrR3Y2ril1LnbbgGWw14KrIyWke8TW0OPYTbQzn0Jb5DS8hrBn0SLPhg8T?=
 =?us-ascii?Q?4UUT1XEtZXbOYq0ZcZKjhXGwf8/t3S1AfkdE8tJ6x66C4KMV7kel74Q8MYNc?=
 =?us-ascii?Q?DcYPW5M3aP6kl/VR2AR9nlhA4dJkghT2xa5GQ4/4+CPb3vdSJMCCPr5oupfR?=
 =?us-ascii?Q?22Lc8mFtb1lWVEEXeRzOFrHieMz9MYJ1YTDF0QoJ49VhnYswhb4M/h+FEhSu?=
 =?us-ascii?Q?xYHPxzV58XZx8fIGmxlCIb2pNScIHymdaqfXe2xfJLFEV5Z1bS7uE0IaK6A2?=
 =?us-ascii?Q?GdrFSM/hGYj3uBr5/WmP765qiN4i6Jh5xKLrjeBHuAQYjJGwROKyj+eg9YyJ?=
 =?us-ascii?Q?/jb3xxaM4O/2qnEjiZQR29cQEMDqxc4Ml9ss+wyg5mmivy8/uZWGLf7u3wEy?=
 =?us-ascii?Q?s3/wmGw9dW6mvgAAfgJbpgbUI4HgEiPpus2Llx6VY064z/tbu8uPTBLVfI+0?=
 =?us-ascii?Q?mV3WqsB1kOF/dYIk+zzFKd6mQAnmZMiJ9F9dDrkBM8LqpMJeKhvZyFRpty5N?=
 =?us-ascii?Q?cQGEJoqAO73TMCfYttkhlSUSi223cK4POe5NtzgZGmWVnqR4Pyl4GlUaZE/N?=
 =?us-ascii?Q?SMjwdCLlAyjXUPugOWf6PoVBkmJCohdloccsOAcjNALXFfaLlhgEcmQTewcA?=
 =?us-ascii?Q?CM/nqijOkYePJ85sgTIBO/Re8oyZ/upkV9XB9XaXkM/vfbMoop5WDkZwn/4s?=
 =?us-ascii?Q?qgkHBLGThx9aSsTBqRUoVzcsmQrwRi+3AGLBMAIRmjynTet6Qily12byXtmf?=
 =?us-ascii?Q?sqw3/tS1XE3eTkkDReMQ30q7I85AzWbDcmbTgcxMiY+5FoOT8F2Owhmh5v9Z?=
 =?us-ascii?Q?rMysmuE0uyFropp5FoILu3s6zq7hss6RdBYrV2p7TDcLB6NU/Nz27CUMzyUE?=
 =?us-ascii?Q?OAI6z//qHzYD2lb8C7Bpv+p2hHS8zS5x6nUf17+KtggtxsmCfk5rPv6qI5+l?=
 =?us-ascii?Q?IaziyRGz6npPzI+arrqu40fh5l/fJAvWGONm8LNx2LsDoFNhtCr6x/FfUZS8?=
 =?us-ascii?Q?TYNVYnjqIczRJ10NZYeie9vivDxrhER+LGR45TFxXL3VvdIDws1Z6v/l5d8R?=
 =?us-ascii?Q?tcWT94V0DjvNg2qGtRy90nfUZ1sPyo9hr4gE3i7H1bP1ZyTyVAOrGXlSadRE?=
 =?us-ascii?Q?a33B9KXAi1AhC0cM035xm3RyCrr7OG8YfGcVnJafdF494AJNiLCwTVRAY8JJ?=
 =?us-ascii?Q?S6kPzKzQMaGzNTC058opwz4hs4hvPGDCp6nGIKJbYYlkLfJYAWH+s0nECkhn?=
 =?us-ascii?Q?rE5JfAqQo8HCB9/1/6Avf3yDWb9G0eICg9a544StjEi+fbORR3sfNptQFENw?=
 =?us-ascii?Q?QqRXunQjjc1Wh7qo0Tc=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2014e4e8-d853-45db-2229-08dd52a8f5ec
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 18:52:59.2289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJvWbzVidw/jLShOYq0YnCtLdHmTaECn/vdFKd6ifd5qT5ouQCGm+qHF4SejQKJGAW2rYJF0k0igBQpmgsxfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7207

On Tue, 18 Feb 2025 14:00:45 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
> interchangeably for operations on `BStr`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/str.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index ba6b1a5c4f99d..c6bd2c69543dc 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -125,6 +125,18 @@ fn index(&self, index: Idx) -> &Self::Output {
>      }
>  }
>  
> +impl AsRef<BStr> for [u8] {
> +    fn as_ref(&self) -> &BStr {
> +        BStr::from_bytes(self)
> +    }
> +}
> +
> +impl AsRef<BStr> for BStr {
> +    fn as_ref(&self) -> &BStr {
> +        self
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII
> 


