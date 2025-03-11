Return-Path: <linux-kbuild+bounces-6054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED50A5BEB9
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91388170C56
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63D224AF3;
	Tue, 11 Mar 2025 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Nq/lxou3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1FF29A1;
	Tue, 11 Mar 2025 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691882; cv=none; b=rvQA1+eXSbYLqQQ0fmBChdX90irvavoyPjams7AWJYGJTnbqsYIlBbUxQ9hPXFX+tyuW1uXnhIDhuhgF/kVB9+ghJV45I2MzSKqcLzF35ov7yckudWXeRiScGjRat/gfWtx/NkiF2Z4t0gQIykIWphIwYq7zLLKkZAy/lZqknwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691882; c=relaxed/simple;
	bh=ANzMonclTV44VJy9H0c2FCCBJdNL8hQGxAaoWHlCpGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOMmVYqHXSaImr1DKbS0s0iSWUPPcM53bdT+ckppw1W3sQTm8xbboj1j1yIIcP2ETSbHuA1zo3Bm4lFjUypCVpfQOtBUQCrJjd6sGFURAmV8sUaBR8kpTJel5suTFKMLvuYX6ykTTb8dX3t11S+UKvmcSY7AWl5u0aP9nZ+Rrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Nq/lxou3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 41E8440E015D;
	Tue, 11 Mar 2025 11:17:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id H4FL8XNhNoEl; Tue, 11 Mar 2025 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741691874; bh=yb4r/vcfCtod52jhxzSeBLW72Dv5xW6kz176PIoHlas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nq/lxou3zOuLduIo8NzTGA8e/nGWIYlfBZMiQ/MMoYw2P/EItP1igQxXFPRPAbIfM
	 UFjXIklsTecL9f4XKDaZu3v0GFQjpLWOAx47GVERBMcpZ6XWUnnqAHOnFGvl7WTe6j
	 NLTc3HdXFha8OH0YVvq0JBv3a9SfJ3C+rts2v1D4NwOWy09rX67G1So7uxR4hzpYHF
	 sfK97sRWc/rnWieacZz5E7LXZ2UbaRmjhFsSjT9NeDCordtUd62sqprwWGR0ikKaIT
	 71ifHkoxp5dKzSEsDLr7rejdMN97iU6aJsFmoywuQNoaD68oR9c6ar8A8P9w1nFTC+
	 wzxTG0/hrDO1qmwnd8zY69WhOCe7/wkLjBI2vB35t9hVdxytXu/UunX6d1V2/eOMlp
	 CgzjPGk28vRFmgiZHODqAiohzsM8L1uE3pKPUDvefl6ND8BDzWH8bXPReQvjWNCSX/
	 tcQ012GNghPf4pkh1ApIZaQkPFIHsywKntSOiiwnPgy0qQIP+C6srDS6je3LrccQdA
	 Dguq5aj00ptFCNZ28ioX52ueF9WjLnt5kOOKogG6XLJ+KLoSG4bzCJMuoVgocQpA5A
	 c2re4QQYz2B/R7rA0t9vPXvhekghYxCIR5DauhBu+YRXnckhy+ApRfuQFV2Tu2/fWz
	 69WJRxsIqdfGFh0IZE0P1LKA=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3224E40E0218;
	Tue, 11 Mar 2025 11:17:46 +0000 (UTC)
Date: Tue, 11 Mar 2025 12:17:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 4/4] x86: Get rid of Makefile.postlink
Message-ID: <20250311111745.GDZ9Ab2f6-iHLXmRra@fat_crate.local>
References: <20250311110616.148682-6-ardb+git@google.com>
 <20250311110616.148682-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311110616.148682-10-ardb+git@google.com>

+ Petr for 9d9173e9ceb6

@Petr, you can find the whole thread on lore.

On Tue, Mar 11, 2025 at 12:06:21PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Instead of generating the vmlinux.relocs file (needed by the
> decompressor build to construct the KASLR relocation tables) as a
> vmlinux postlink step, which is dubious because it depends on data that
> is stripped from vmlinux before the build completes, generate it from
> vmlinux.unstripped, which has been introduced specifically for this
> purpose.
> 
> This ensures that each artifact is rebuilt as needed, rather than as a
> side effect of another build rule.
> 
> This effectively reverts commit
> 
>   9d9173e9ceb6 ("x86/build: Avoid relocation information in final vmlinux")
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile.postlink        | 38 --------------------
>  arch/x86/boot/compressed/Makefile |  9 +++--
>  2 files changed, 6 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> deleted file mode 100644
> index 445fce66630f..000000000000
> --- a/arch/x86/Makefile.postlink
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -# ===========================================================================
> -# Post-link x86 pass
> -# ===========================================================================
> -#
> -# 1. Separate relocations from vmlinux into vmlinux.relocs.
> -# 2. Strip relocations from vmlinux.
> -
> -PHONY := __archpost
> -__archpost:
> -
> --include include/config/auto.conf
> -include $(srctree)/scripts/Kbuild.include
> -
> -CMD_RELOCS = arch/x86/tools/relocs
> -OUT_RELOCS = arch/x86/boot/compressed
> -quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/vmlinux.relocs
> -      cmd_relocs = \
> -	mkdir -p $(OUT_RELOCS); \
> -	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
> -	$(CMD_RELOCS) --abs-relocs $@
> -
> -# `@true` prevents complaint when there is nothing to be done
> -
> -vmlinux vmlinux.unstripped: FORCE
> -	@true
> -ifeq ($(CONFIG_X86_NEED_RELOCS),y)
> -	$(call cmd,relocs)
> -endif
> -
> -clean:
> -	@rm -f $(OUT_RELOCS)/vmlinux.relocs
> -
> -PHONY += FORCE clean
> -
> -FORCE:
> -
> -.PHONY: $(PHONY)
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 606c74f27459..5edee7a9786c 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -117,9 +117,12 @@ $(obj)/vmlinux.bin: vmlinux FORCE
>  
>  targets += $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all vmlinux.relocs
>  
> -# vmlinux.relocs is created by the vmlinux postlink step.
> -$(obj)/vmlinux.relocs: vmlinux
> -	@true
> +CMD_RELOCS = arch/x86/tools/relocs
> +quiet_cmd_relocs = RELOCS  $@
> +      cmd_relocs = $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs $<
> +
> +$(obj)/vmlinux.relocs: vmlinux.unstripped FORCE
> +	$(call if_changed,relocs)
>  
>  vmlinux.bin.all-y := $(obj)/vmlinux.bin
>  vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
> -- 
> 2.49.0.rc0.332.g42c0ae87b1-goog
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

