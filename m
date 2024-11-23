Return-Path: <linux-kbuild+bounces-4808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F19D66DF
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 01:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD69B21997
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 00:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8D92F46;
	Sat, 23 Nov 2024 00:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QU2tVmvz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81007257D;
	Sat, 23 Nov 2024 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732323220; cv=none; b=F38dRzGNUQvuB9YXZDkwMv8NXwXCanKsBLdTw17aoCcIS+M6P26MGqzbKQALnCW0Yx4wfJYjr7R+qWWErTe80V/AYRutrwMupbFg3bZDUjXgQDEPCBv3xT4BOHsgogHWhjlzaIajTxKe6V1CegtH9aPkpJvG3ZkTteixISBSw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732323220; c=relaxed/simple;
	bh=ZOzgDCszNpXOPabHGe4wYbuuBiKrW5VJPNfRwhtW3h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bivi2hIgcb4gsgaCJVeGQmHEXHiO7b0IjRwE2H9ipxTUpLsV8Ju/eHYUX0ojZ9hd5tp3V1jtYOVCwv2s+vlRkEe9u5xkWWjywLDuKi3i0YqcEdBrVyYltG5Kb+RJC1/OXkqhdKBcAdGvEpHjSZH00yYwGY5AAALXJ+4k1pySuHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QU2tVmvz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MySxW6Yvv72K+z2FlW9SiPYONLnpcffXjHrq0N51mFU=; b=QU2tVmvz9D0LyQZn/2E6OR0PhY
	KqXPwT+XvUFmnjhx5IsgFic9byvXjamh8g3lJVkl/jKjHX/h8Ggf7+w5Ghw4Lsdg5GIoWmsnqZm8D
	ePaR9EfPcQPX34JQkfJmVVzE5ZIupnCRIXKH0w9Cn54RS3pY8r0/hB+sE7/0f+3W1WYsM8fEo8AFg
	BRh4wa4LCvl8zk7i8GQXoG0u7/6solDBLYQ181K8Kg8OIy4rr4QMBbrE2+f4NwBdqvFtp5bs0iRPO
	1IIaqwvExMrR54msJqJW+LFghYYaBHjDtNT7UZSRQDrevYXT/7znfak++IuQLvgyD86oKT27WPwRa
	HPwW7zZw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tEeOj-00000008XJ3-3vvj;
	Sat, 23 Nov 2024 00:53:19 +0000
Message-ID: <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
Date: Fri, 22 Nov 2024 16:53:07 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] modules: Allow extended modversions without basic
 MODVERSIONS
To: Matthew Maurer <mmaurer@google.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
 <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/24 4:19 PM, Matthew Maurer wrote:
> If you know that your kernel modules will only ever be loaded by a newer
> kernel, you can disable BASIC_MODVERSIONS to save space. This also
> allows easy creation of test modules to seee how tooling will respond to
> modules that only have the new format.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig    | 15 +++++++++++++++
>  scripts/Makefile.modpost |  1 +
>  scripts/mod/modpost.c    | 19 +++++++++++--------
>  3 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..f28b361494c4b4cc2446d683589f9452a0043b2b 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -161,6 +161,7 @@ config MODULE_UNLOAD_TAINT_TRACKING
>  config MODVERSIONS
>  	bool "Module versioning support"
>  	depends on !COMPILE_TEST
> +	selects BASIC_MODVERSIONS

tested?  'selects' is not valid.

>  	help
>  	  Usually, you have to use modules compiled with your kernel.
>  	  Saying Y here makes it sometimes possible to use modules
> @@ -218,6 +219,20 @@ config EXTENDED_MODVERSIONS
>  	  The most likely reason you would enable this is to enable Rust
>  	  support. If unsure, say N.
>  
> +config BASIC_MODVERSIONS
> +	bool "Basic Module Versioning Support"
> +	depends on MODVERSIONS
> +	help
> +	  This enables basic MODVERSIONS support, allowing older tools or
> +	  kernels to potentially load modules.
> +
> +	  Disabling this may cause older `modprobe` or `kmod` to be unable
> +	  to read MODVERSIONS information from built modules. With this
> +	  disabled, older kernels may treat this module as unversioned.
> +
> +	  This is enabled by default when MODVERSIONS are enabled.
> +	  If unsure, say Y.
> +
>  config MODULE_SRCVERSION_ALL
>  	bool "Source checksum for all modules"
>  	help


-- 
~Randy


