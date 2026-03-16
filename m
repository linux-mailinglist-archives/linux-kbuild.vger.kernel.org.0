Return-Path: <linux-kbuild+bounces-11970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAcUJzZAuGnSawEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11970-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:39:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677D29E66A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C2D730387CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7218233557B;
	Mon, 16 Mar 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C8a16WPV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC5327BFC;
	Mon, 16 Mar 2026 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682451; cv=fail; b=uefhB0hk9/2e7+0q3K9JYMdIxWRPU+k3JsebNg6yDC+nSWoETXyg07/kzti0tA2lu+Gulh4pkuxLVKy40im+Miy1j1GkJ1UrCx9KIwRJARTljXn59ks3/C+sKN178JTG9OE4AnvtBiRzbs2CFarqu1g+kGAXk6faLjjtH1Bbv1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682451; c=relaxed/simple;
	bh=RT1REWvP02YIPd5SKFuLk7K9ONIHbWRauCo6kw97bJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KMNf3MjMJ4iEh7DbmYmFErFDwBewyDrCtl19sKhxcZCxncCrs1WKjI1fomKLMGwmC9/3nLzK2adRKQqowIfIuIznj5OZS/sbJ8ojfKSDvRPgNFWrm5hTqgvimf0ESTWyXi1Flr7XPczwOYoxx+q75dsgaVS8eOz9SGiR8Gre7FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C8a16WPV; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMcuaSQZVrtOlrWZgt5ZpmLEGMd4RadzrMQZV94emsVr2G44xvFcmlctpyf8h2N7ijnsSBJPROJSTUjQJU5HdUz/YZlaXtS3nA3akKmhG9Gk8+65kLtYQvy3wTdP+FKdUAEfyYYNz9fw0AVCcj9xZmAlMvOxoqWQyHXXu5eNwkAhr0vwL1fxzn+KmnFbdgXqbfVM5JymdN0D+eazY8ItZ6MWBpDZJRb8CWv4XwNMNDt2U8VvW5oVRFUm9wPDL/nicMFThtkouQ9uwTk+0iJYqxyh5oWLYSX+tE/deM1YqxILXNYUhniWkejyvz20Cm8pI3Vjz/QOphjG2eH1p07NoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LCz0yrwHGXCNV6GFHNOE3Y8RLmbsl2akfaGKwA0IPw=;
 b=bXNzdn5Ajq3Y9OnNJBWDHM9ZXtt32dpLGSGBQXJ8Fp1dKFDz72/BB0WzTYIHVw5O5uCtrdR4JtdbtHhgoz8eToRjgY1KKvMIALaAA5Doo/gZSPCt2pLpJQuOMl01hXBugYHLhAgXiwnfEOsz8K5J0sNX9L3P1YXN8CdceYwSiKMF2FjWct/peQOmcUHakOjdwv+lQ499tkVNlFme2fxGuLCckfDM9L40O791foEUiW/gkCS69N3qCQqiANlnZYnH/3a+ijnxCy9ut51INGpGp/JgHddQKC3yHZZVY7NCiIIpOEpL7TV+pUV7lJnZRXp1xFtDrBVqax0ytRRHDEonUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LCz0yrwHGXCNV6GFHNOE3Y8RLmbsl2akfaGKwA0IPw=;
 b=C8a16WPVa4/jRf/wiJkjZZg+f4gI4XgB7FcEKWkSA9Jn8RUZ493Yr2CDxWswTzlNMAlluS6mK9ZGFZYZKULxDYzLJnmUQfE8M47BmOLW4EtYZ8eIaula0T+6iLqtAdstOtVmCnNyH2bFtEnq9XKr+6BOElSQTFy8WKjEPcxXHAsqwioFwsjFQyMjKHYQ2E8P23UFqNPQUTikaKO+33RRhqeAW6lSOVjWQWarGV+rzII4fLZgvNSYlACBhLxv0JlEx3ZefDwGvgoTPyH97bnV9IgS0votCbVMbgI8EXRFB0Ttfitdgs2+f9lXZgMzD36kcZS3SE1ShYERLH3DOnB/RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB9737.namprd12.prod.outlook.com (2603:10b6:208:465::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 17:34:06 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 17:34:05 +0000
Date: Mon, 16 Mar 2026 13:34:03 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/4] rust: add `const_assert!` macro
Message-ID: <abg_C-X9LJ2vAoqq@yury>
References: <20260316150720.1646109-1-gary@kernel.org>
 <20260316150720.1646109-3-gary@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316150720.1646109-3-gary@kernel.org>
X-ClientProxiedBy: BN0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:408:e6::23) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 525a2434-7d87-4fe6-2808-08de838238cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	vRTp3C/vBb+2tAi+txJXqQ/Ownov4L6WfYVkr0zQhMf3pXZM1+ooFIo5d5BcWLluxsATfzMIlto+y4040TtLeYAKsbVcTuxJu7RqQKoKzkJDG6lMVdKkkhCMaDhffcYC5nmHBzCCHzqGtl/27BM+7XWnDoRRvMesgriAgeBECrYyMijkB8iEX9Ksz8v9LxBKxnjB+j1GQhYOpqtKlDnlmL6l7DsHCo/tOQ4pNCqGKCVV0adoSR+TofwqQevvTamXoKK89xf8h55gXA+DnFF5iA2luXHDDliCb78v/Ux87lFRE1EWPAKfVHj2m+qAwdJAjQlZcti/OmJVvDC1vZHSEiqPEHVteLPtkDt95W09g9ztYH6d+GoybMzJjnu4VKlNZzsGgPVX3m4gZ7lmx1Ym19Rji2dolOmhR/MbBCfd6iq5bPiK/x2GLOnSNf2wIvL/T631ztEyiQ6+NWAZrlo0utwJKf6l3iUPMWNIbKujMq7YKj+g8GRVBiVRVtT+XRgmtykWiOCoHpOS2PvO7v14Op5kgRy5LB5nMY5Wwgb1COR7g5r88HrKhH/SgCeXgIwwy/MhNQHfeYH6XxWyxOmHT8ByXJy2OoS0jnIcAe8jx3YuO0eCduFWn5Ica1ZPFc/OhQghsSDLDiB/eSobQ1HzaB4894MrHqqhUoHgtG2l/GgsdOTIaknDw5C37aiOs5oZBkz+9/rLyZhgodjDLyeFxzOdM3t7HolDUzggQu/j1hI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?24PTjo0ezpcyndXs0bQSpYmP4oUUBvYiQGD9tiAHG7rjha5m3XeRCsq3GZwa?=
 =?us-ascii?Q?OTKHhl4J4sO0yHhjrKvdH+O6WcF/+LWiwM0dBTTXJdoyX4U1cB/bgUUiFNpP?=
 =?us-ascii?Q?rH+KxujCeYGJDOsWuWzDx1IhmoKJ35+ZSJAbrx6tb35AULbcinNrZxxbMANu?=
 =?us-ascii?Q?00UQzAs3HKV5fJEBQ5lhy7fROfbEfdp+gJbz0e/GjrSlFOpyQM8U/bXYp72C?=
 =?us-ascii?Q?d39aZ8hxUWpHzj0gwbFqbVxA4dQwCNYumCF675a9cUbqhuWGYsxlr633GceL?=
 =?us-ascii?Q?eSwdeoD4HpXEEjssNvBxqOxMzR2fkwQR0FGQH7iVydZoRTu0egOClkL2KHCF?=
 =?us-ascii?Q?g2dPbcXEDDAfvyGe6yyzlMk6+8ArQnHYjSV7V3y0yxdNJ2F9IEYDRoJAq8Zk?=
 =?us-ascii?Q?s9I43EZJJltgv1GwUOIvS0+tAmZSAgM0ljsNDlL6TGpMTFpnXOBFm5iy1DPJ?=
 =?us-ascii?Q?ou4JndQRlqk+gSQISyjZhlDPTfnerU1HUmepzl/UZCX3WXOjOX099zKlCsDy?=
 =?us-ascii?Q?XtFXEAHGUiYl7ZegaeeDUkhc3L0eH7iH+uTNl7UmL+lUWx4oyYMfOKoiSk3a?=
 =?us-ascii?Q?tk9+MAAKO65gfl7WkR6IKBdn3Q3XyT+/l5k2ajU9NkgNQ2S8mvJRYX9LtwcQ?=
 =?us-ascii?Q?0/fH6ufDBBmxXeikfCUcanwV/oG/MpV1HWEbwe+zuzDUayHG4T8sTv2kGr+T?=
 =?us-ascii?Q?fF33dTUGhXFrU8v/DVZHgloEEYsH1dcFmCEw1TEAnfsn0j/q6zSWQpVpNlKw?=
 =?us-ascii?Q?3gfvhJbxtTgRDbfyjWeC8oTERvVCKBGkRIrOmiV2hfw/j5K89NiqG0DcIDqV?=
 =?us-ascii?Q?RYQZA+NLSrr9IwRrDYSmrhULtjyZiDBz3ybhOtEbxO9eXPaYkyxKAwUhV83R?=
 =?us-ascii?Q?r+FiL9hho4eJuN+wIgbMD8ZpgJ7SI0OvaiSwKS3lQOI7XGlmoQgzL0lAZt1J?=
 =?us-ascii?Q?eJSKP2Anep8Z5Fn3Tmkf3SXQgWD8UL7n0DC9oxA+6svDz1DcNikB9fPHRkBb?=
 =?us-ascii?Q?z2gQYtlguE6EujwlvySW6QaN2JmIX8ulGCsCmjkukSDL9j+kELiHPVmawjTs?=
 =?us-ascii?Q?mM5b9BBOsplrkf8qIMBorhodEtYHE6W8oaFX24wAsNqn2+YoevG938xl5f50?=
 =?us-ascii?Q?9xVmEu3yCyGU+a9eEodhsmysrUusD/8r/9zmoImdneXFfnVVidizJztndLud?=
 =?us-ascii?Q?cxSzT1IlLDNiSmle5ko1PXMcGWbJibgg8KTz11AxCJKB3+aTlIOHrMXR4Cy/?=
 =?us-ascii?Q?5qvQXqDS9GInXnXGXj4A7a1i40ECyJfXr6dijLKjcldBYxD8eowNdzUif7uT?=
 =?us-ascii?Q?8K7wG8/889SUb+3Qko4B/r+ABFssFGwV7Hksv6RCw08rITdhUq1V9Iqhg4lk?=
 =?us-ascii?Q?rQAfIMibj959Gq2gNOE61G8SR+uT7G3uy0+NeP7X9PJPJSWW4qL3IOIWcvuY?=
 =?us-ascii?Q?uvr/LmtDI3WPCAsXGlvLXm56IYYQG+CApgPJHGY35Frpn6Ib3ia6XM6pZ2mc?=
 =?us-ascii?Q?7VCdkyFysfjFfIWDWbqWYCMp08FtW8ehPe10yi8yvTujQmh6UF/Hs/m6TI5I?=
 =?us-ascii?Q?dzf4gSDsefRRipUH/k4z1ukNu8F2XpQn/j817s0Q7CtkAd13hsS8FSbg1iKw?=
 =?us-ascii?Q?FcrysY8R0OGU8AOONFG42Pb/gY2cewJzv9AxUIiu4sgdpVQZSC68IpmSheN6?=
 =?us-ascii?Q?Z4MAp47gXHmgW9GcrTnhg+5XSwaW1VdDB1AtGRDm4dq6Ke9nZ+N6wUw2Xtia?=
 =?us-ascii?Q?DzUUZxos+zqhqyxD9XK/vIhwE9pVx6PNUdTTFURZ/c6dSZhA1PSy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525a2434-7d87-4fe6-2808-08de838238cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:34:05.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRYyba8UN3cjZBrCDFCJAf1+Jo/wEzgGCdefYSPhBZRA7RBWQHe+8FexDBJi5YyCrIKrxP8uCsSiLl/dsoOMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9737
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11970-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0677D29E66A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 03:07:13PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the feature
> for old compiler versions that does not have it stably.
> 
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
> 
> Two users that would route via the Rust tree are converted.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/build_assert.rs | 24 ++++++++++++++++++++++++
>  rust/kernel/num/bounded.rs  | 24 +++++++++---------------
>  rust/kernel/prelude.rs      |  7 ++++++-
>  rust/kernel/ptr.rs          | 12 ++++++------
>  scripts/Makefile.build      |  5 +++--
>  5 files changed, 48 insertions(+), 24 deletions(-)
> 
> diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
> index d464494d430a..51c0f85a9014 100644
> --- a/rust/kernel/build_assert.rs
> +++ b/rust/kernel/build_assert.rs
> @@ -41,6 +41,30 @@ macro_rules! static_assert {
>      };
>  }
>  
> +/// Assertion during constant evaluation.
> +///
> +/// This is a more powerful version of [`static_assert!`] that can refer to generics inside functions

This line is 101 lanes. Can you split it? 

> +/// or implementation blocks. However, it also has a limitation where it can only appear in places
> +/// where statements can appear; for example, you cannot use it as an item in the module.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// fn foo<const N: usize>() {
> +///     const_assert!(N > 1);
> +/// }
> +///
> +/// fn bar<T>() {
> +///     const_assert!(size_of::<T>() > 0, "T cannot be ZST");
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! const_assert {
> +    ($condition:expr $(,$arg:literal)?) => {
> +        const { ::core::assert!($condition $(,$arg)?) };
> +    };
> +}
> +
>  /// Fails the build if the code path calling `build_error!` can possibly be executed.
>  ///
>  /// If the macro is executed in const context, `build_error!` will panic.
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index fa81acbdc8c2..54d0ce3ba595 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -255,9 +255,7 @@ impl<const N: u32> Bounded<$type, N> {
>              /// ```
>              pub const fn new<const VALUE: $type>() -> Self {
>                  // Statically assert that `VALUE` fits within the set number of bits.
> -                const {
> -                    assert!(fits_within!(VALUE, $type, N));
> -                }
> +                const_assert!(fits_within!(VALUE, $type, N));
>  
>                  // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
>                  // `N` bits.
> @@ -287,12 +285,10 @@ impl<T, const N: u32> Bounded<T, N>
>      /// The caller must ensure that `value` can be represented within `N` bits.
>      const unsafe fn __new(value: T) -> Self {
>          // Enforce the type invariants.
> -        const {
> -            // `N` cannot be zero.
> -            assert!(N != 0);
> -            // The backing type is at least as large as `N` bits.
> -            assert!(N <= T::BITS);
> -        }
> +        // `N` cannot be zero.
> +        const_assert!(N != 0);
> +        // The backing type is at least as large as `N` bits.
> +        const_assert!(N <= T::BITS);
>  
>          // INVARIANT: The caller ensures `value` fits within `N` bits.
>          Self(value)
> @@ -406,12 +402,10 @@ pub fn get(self) -> T {
>      /// assert_eq!(larger_v, v);
>      /// ```
>      pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
> -        const {
> -            assert!(
> -                M >= N,
> -                "Requested number of bits is less than the current representation."
> -            );
> -        }
> +        const_assert!(
> +            M >= N,
> +            "Requested number of bits is less than the current representation."
> +        );
>  
>          // SAFETY: The value did fit within `N` bits, so it will all the more fit within
>          // the larger `M` bits.
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index c7e91b80d301..6a54597fa0a2 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -29,7 +29,12 @@
>  
>  pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
>  
> -pub use super::{build_assert, build_error, static_assert};
> +pub use super::{
> +    build_assert,
> +    build_error,
> +    const_assert,
> +    static_assert, //
> +};
>  
>  // `super::std_vendor` is hidden, which makes the macro inline for some reason.
>  #[doc(no_inline)]
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index bdc2d79ff669..d05e5888e80c 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -11,6 +11,8 @@
>  };
>  use core::num::NonZero;
>  
> +use crate::const_assert;
> +
>  /// Type representing an alignment, which is always a power of two.
>  ///
>  /// It is used to validate that a given value is a valid alignment, and to perform masking and
> @@ -44,12 +46,10 @@ impl Alignment {
>      /// ```
>      #[inline(always)]
>      pub const fn new<const ALIGN: usize>() -> Self {
> -        const {
> -            assert!(
> -                ALIGN.is_power_of_two(),
> -                "Provided alignment is not a power of two."
> -            );
> -        }
> +        const_assert!(
> +            ALIGN.is_power_of_two(),
> +            "Provided alignment is not a power of two."
> +        );
>  
>          // INVARIANT: `align` is a power of two.
>          // SAFETY: `align` is a power of two, and thus non-zero.
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3652b85be545..960b4630cb2c 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -310,7 +310,8 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  
>  # The features in this list are the ones allowed for non-`rust/` code.
>  #
> -#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
> +#   - Stable since Rust 1.79.0: `feature(inline_const)`,
> +#     `feature(slice_ptr_len)`,
>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> @@ -321,7 +322,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg

Same here. Miguel mentioned in the other thread that newer version of
rust will make this list shorter, but once that didn't happen, let's
follow rules?

>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
> -- 
> 2.51.2

