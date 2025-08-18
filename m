Return-Path: <linux-kbuild+bounces-8495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D651B2982A
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 06:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23A7316EF2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 04:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3559B209682;
	Mon, 18 Aug 2025 04:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4pP5MgU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050DD3176F1;
	Mon, 18 Aug 2025 04:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491226; cv=none; b=KUoHFqU9AHo+pGjxmYLtJG4AxZG5mggHri9lhvozPaRHoWyvSY1mdFdZ5Aax/JdiMJKrkYUTyLzB7iHKI2ymJmYGoFdeB52grl8vZntc7lhE4i1QIBcUudwNw07QZRQpflI+Su6/khFJD9eMnbuJ6qXnotj3ahytA7F9kZQBVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491226; c=relaxed/simple;
	bh=JnQY8NDN2pdIetpcGWvdEZBqepzNIMN4/HkZz6ce+gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqZ5mLWuRGThSR2TE9SiLBgaP2YGaMqlqhcjEvzCkmTXNoyJpJSocfEv8aEZOBaxTsYw66m/nM9W7Zlr0vButMBnHfIwCcnt2Njf7SvDhpX8X9clkY/g/HMVcHfyO7yD68qGvLT7ky4bsQejEC6wowMhVoP7avMy0VNm8L6ZTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4pP5MgU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AE7C4CEEB;
	Mon, 18 Aug 2025 04:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755491225;
	bh=JnQY8NDN2pdIetpcGWvdEZBqepzNIMN4/HkZz6ce+gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4pP5MgUfxQaK8jI30lEEbctWKiVsXFExdrch1e9EYrD8DfGKMVHMBhp/4xUx+eRs
	 KtOG6c1AOzmRFM0b5OgqmMQIKFlgCciMocfXuFVGUssNXE57w4ZYVHk4/KXtdhjSdH
	 Vne7fWfRJe80BTAGabHSYb4lOJOi95UIa/bigXevug80DsusMP5S3ioHGLThiy5xne
	 Kh1jSuTZ+/3Ugqe6QIFc6wSaomukD02Zadr74/Zsy7TFAt4NqLmgw10cveI8GUywjB
	 n4dxndjhcR0h3gSXZxvah+5tIbQDFFeMs2JC4VMiJZ2CgPqMqol26ztwFsS/lXduJj
	 9uYeGIvcEaPdQ==
Date: Sun, 17 Aug 2025 21:27:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250818042701.GA2367466@ax162>
References: <20250818140143.61b8c466@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818140143.61b8c466@canb.auug.org.au>

On Mon, Aug 18, 2025 at 02:01:43PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kbuild tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> /usr/bin/ld: /usr/lib/gcc/powerpc64le-linux-gnu/14/../../../powerpc64le-linux-gnu/libgcc_s.so.1: error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> make[5]: *** [scripts/Makefile.userprogs:29: samples/pfsm/pfsm-wakeup] Error 1
> make[5]: Target 'samples/pfsm/' not remade because of errors.
> 
> an so on for lots more ...
> 
> Caused by commit
> 
>   478494044bb4 ("kbuild: userprogs: also inherit byte order and ABI from kernel")
> 
> I have reverted that commit for today.
> 
> Build was done on ppc64le, POWER9
> 
> $ gcc --version
> gcc (Debian 14.2.0-19) 14.2.0
> $ ld --version
> GNU ld (GNU Binutils for Debian) 2.44
> 
> CONFIG_VDSO32=y
> CONFIG_CPU_BIG_ENDIAN=y
> # CONFIG_CPU_LITTLE_ENDIAN is not set
> CONFIG_PPC64_ELF_ABI_V2=y
> CONFIG_CC_HAS_ELFV2=y
> CONFIG_CC_HAS_PREFIXED=y
> CONFIG_CC_HAS_PCREL=y
> CONFIG_64BIT=y

Thanks a lot for the report. Now that I am looking at the test for
CONFIG_CC_CAN_LINK, I am not sure that change is fully correct because
those additional flags are not accounted for in that test. We would need
something like this but if I understand correctly, the filtering of the
flags would need to happen much earlier that it currently does. I have
dropped that change from kbuild-next for now. Thomas, please investigate
and send me a new patch.

Cheers,
Nathan

diff --git a/init/Kconfig b/init/Kconfig
index 836320251219..ab8aa6ab8aa4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -84,8 +84,8 @@ config RUSTC_LLVM_VERSION
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(KBUILD_USERCFLAGS) $(KBUILD_USERLDFLAGS) $(m64-flag)) if 64BIT
+	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(KBUILD_USERCFLAGS) $(KBUILD_USERLDFLAGS) $(m32-flag))
 
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921

