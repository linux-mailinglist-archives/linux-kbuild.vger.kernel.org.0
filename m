Return-Path: <linux-kbuild+bounces-5749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38276A34C7D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 18:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50CD188C6CA
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 17:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96E423A9B8;
	Thu, 13 Feb 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsbPabev"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F323A9B1;
	Thu, 13 Feb 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469282; cv=none; b=hUUqm1+z0t9MtvpJcgZBneEOrw+ki+8Qt+m9y1xDCkBqrI/77An62hGJS5zzp2Z2z+LTcy2VuNdWpIXHo1t4iIjgdpVHvJP5S7qSOfPE6GMtUU7r5/LaFz1G3sNARg0eRGy1fka15pUIiwzXl24dmgFP27o2f/b1m1VhAbf4cEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469282; c=relaxed/simple;
	bh=iDL3s3NaZnaoGm6u8HjuN2ua/uzNLftNBCQrWX/yTCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VudI6W9SgFuyjUkCFBI9U3t4A3W9b6UQTc7FI0w0Tkk7p/Gcp21synJqMlv9QWDJL32Hcx64N08Dfnk30EaoRbR4aoi39aRyDPJognUeTWYOgvjxdXbI+GBDTPRuJkv75KX/xmt03OBMihjbd15vC+VgJzL77+QqIW5gDVw3Es8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsbPabev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA810C4CED1;
	Thu, 13 Feb 2025 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739469282;
	bh=iDL3s3NaZnaoGm6u8HjuN2ua/uzNLftNBCQrWX/yTCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsbPabevbPzuy23oKJjArPyKeP55PYyANXqhxizJPqCZlcjkx8uzMt/V07xTXwF6E
	 PDkZVFchKnXgqR/uYFsIjtijZO24jhXJGRB1om7Q/d9sXrm7tQL3aoJk/VOGqhOHQb
	 hgtjY8eILxTM4htOQtPs4GXUyo3P4EZxSH7Vd4YjewYTO8lIWECJToFSiZwzFwga0k
	 EoCo+bHVFNm9mLMahppZ9n4Ts2Yktp7sKo9XjL6SOI8ZPqJigqo4Ie8asftUnvbmbb
	 OH27csbu2kbqhfQWA8X4O7jKkW9nqGbYoSveW1JRqic2mk9Vetqv4OGnouhXkrGB5V
	 9tbReHafQoD7A==
Date: Thu, 13 Feb 2025 10:54:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: userprogs: use lld to link through clang
Message-ID: <20250213175437.GA2756218@ax162>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
 <20250213-kbuild-userprog-fixes-v1-2-f255fb477d98@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213-kbuild-userprog-fixes-v1-2-f255fb477d98@linutronix.de>

Hi Thomas,

On Thu, Feb 13, 2025 at 03:55:18PM +0100, Thomas Weiﬂschuh wrote:
> The userprog infrastructure links objects files through $(CC).
> Either explicitly by manually calling $(CC) on multiple object files or
> implicitly by directly compiling a source file to an executable.
> The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld would
> be used for linking if LLVM=1 is specified.
> However clang instead will use either a globally installed cross linker from
> $PATH called ${target}-ld or fall back to the system linker, which probably
> does not support crosslinking.
> For the normal kernel build this is not an issue because the linker is always
> executed directly, without the compiler being involved.
> 
> Fix this by passing -fuse-lld and let clang find its matching lld.
> 
> Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

First of all, thank you for catching and noticing this!

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index bb5737ce7f9e79f4023c9c1f578a49a951d1e239..b4c208ae4041c1f4e32c2a158322422ce7353d06 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -510,6 +510,7 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +KBUILD_USERLDFLAGS += -fuse-ld=lld

Now that our minimum supported version upstream is 13.0.1, I think we
can make this

  KBUILD_USERLDFLAGS += --ld-path=$(LD)

as it should respect the user's choice of linker a little bit more, such
as if they specific LLVM=<prefix>/bin/ or LLVM=-20. That reminds me that
I can clean up what I did in commit 4406b12214f6 ("powerpc/vdso: Link
with ld.lld when requested").

Additionally, this would not fix someone using CC=clang and LD=ld.lld
(it is uncommon but still techincally supported) so could we use a check
like

  ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
  KBUILD_USERLDFLAGS += --ld-path=$(LD)
  endif

further down in Makefile to make it more robust?

The stable backport may want to use cc-option like I did for the powerpc
vdso since there is a lower minimum supported version of LLVM there.

>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> 
> -- 
> 2.48.1
> 

Cheers,
Nathan

