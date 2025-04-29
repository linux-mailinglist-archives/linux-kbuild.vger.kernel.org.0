Return-Path: <linux-kbuild+bounces-6797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFBAA1165
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 18:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175B1848173
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 16:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303B9243951;
	Tue, 29 Apr 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVfeE9Av"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA697243364;
	Tue, 29 Apr 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745943158; cv=none; b=dCmby2r7ihypVaDMMTM94hrLtSjeHWjIQje9Vb233h5+8R15zsMe9HFLnbjltEXZQBVVGMlnsm9S4RHnknEzAqhkqslE5jUIKu8URTbd2ZKdHhTjai4+k0JjI7Iw7dpOvl/yazVHQHajJVqCPG4CaLA5j2tkYs/D26y1TUInEig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745943158; c=relaxed/simple;
	bh=p9p3C54HaJBzJFhUdZ8Mb+gOWhfp1LSp1qkQYYeeVos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTOs/jZ1QsUlJcGyPFnDnU7TqG+ClvD9ei+U7zDr6OFVdGdxbLo8dhb1gX+5hxZghapl/ZXXDYYpZpOYNVJ1/pzjCqz67bv9NhZEGP48HOBqBm6n9nsYn9LTpg7mLM4DhL110V0b2oSCXzSCiy12Qo+5VXDHLfI2rpMVzcCBhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVfeE9Av; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046F4C4CEF2;
	Tue, 29 Apr 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745943157;
	bh=p9p3C54HaJBzJFhUdZ8Mb+gOWhfp1LSp1qkQYYeeVos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVfeE9AvDuH1UT1v+RTDwMAcC/+SOUQNaT0vy/BhKlB8L3rOiIcBaL8y7pNEmaRpc
	 CAHABn6bCZKtG3yLwSwHMDb1mYMRzmBztJhg2EwWEmcAzG2s/QQfSloc8QI+5j4gHu
	 1QutyqEVzsg5HHUL+zLDVc9E62mXxxcGO+OhB7GjpcbPY3zO/WD11uL55J6Vlh3b13
	 y4v17XYbeE7PmyQvYDNxDUulFXtC3c5OpFLNJbLP8y6M8cY0OPiU06/vnJgNorTN7k
	 K9LRxe9agiHoI44a4GxLdrBr+XnGinghg4Slt0hN8mx7EaYOViFbmKVaKgTe0a6+E1
	 +rAwvCTkEJE1Q==
Message-ID: <edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org>
Date: Tue, 29 Apr 2025 18:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
Content-Language: en-GB, fr-BE
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 MPTCP Linux <mptcp@lists.linux.dev>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas, Masahiro,

+Cc Peter Oberparleiter, MPTCP ML

On 15/03/2025 14:20, Thomas Weißschuh wrote:
> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> Other references, for example in debug information, are not affected.
> This makes handling of file references in the compiler outputs harder to
> use and creates problems for reproducible builds.
> 
> Switch to -ffile-prefix map which affects all references.
> 
> Also drop the documentation section advising manual specification of
> -fdebug-prefix-map for reproducible builds, as it is not necessary
> anymore.
> 
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for having worked on that!

(...)

> diff --git a/Makefile b/Makefile
> index 5c333682dc9142b1aacfe454a5c77f5923554b7d..4f920187cee658ae4d1b807fca365f6994274828 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1067,7 +1067,7 @@ endif
>  
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
> -KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
> +KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
>  KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
>  endif

Today, I noticed that my CI for the MPTCP subsystem couldn't produce
code coverage files like before: the source files are not found. A 'git
bisect' pointed me to this patch. Reverting it seems to fix the issue.


My CI is building the kernel out of the source tree, in ".virtme/build".
Before and after this patch, GCOV seems to do its job properly.
Capturing GCOV data with this lcov command seems OK too:

  lcov --capture --keep-going -j "${INPUT_CPUS}" \
     --rc geninfo_unexecuted_blocks=1 \
     --include '/net/mptcp/' \
     --function-coverage --branch-coverage \
     -b "${PWD}/.virtme/build" -o kernel.lcov

But after this patch, lcov complains some files are not found, e.g.

  ERROR: (source) unable to open
${WORKDIR}/.virtme/build/net/mptcp/ctrl.c: No such file or directory


The output file is different: the path to the source file is wrong
because it points to the build dir. Instead of ...

  SF:${WORKDIR}/net/mptcp/ctrl.c

... now I have ...

  SF:${WORKDIR}/.virtme/build/net/mptcp/ctrl.c


Are there modifications needed on GCOV side to adapt to the behaviour
change introduced by this patch? Or something else needed on the
userspace side?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


