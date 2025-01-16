Return-Path: <linux-kbuild+bounces-5497-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85789A14459
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2025 23:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8285188DC9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2025 22:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41621DC998;
	Thu, 16 Jan 2025 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RbUeOTfL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB9A158520
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Jan 2025 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064959; cv=none; b=KsJZWTsh5xPfVdID2PcOZH7qpuxR92TlCvK3g60HpdjS625e2OxN3BScBh75CObj34pMgCKws7S2pa7We2Kxhab45wM54O68SL4E9x0TV5O7HoYkfwPZO1uVk1AFd5KvnUWEvxVoNUt+WZR09wLLyRAzWIWY83oxyG/fknY0wzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064959; c=relaxed/simple;
	bh=LXml806C/TOBeEr046OC0OvZkBEk1w1exWNnDPQeFGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRbugZ+0jkTYo8JgUve0GKB0+Dp3asyv/HeDjAu7nLWx7rj45bAFKG21/idQjdoHxjNSfY3Vx9xXt00l/PXFLL7UWJi0buQkKLfqWhMXU6JCsz4g1XkCqwojZgHMcI3KgVlc0EYGw9rWBbMadxG1pTTReJN9yHoV+8buXwU9Of4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RbUeOTfL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216401de828so25503645ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jan 2025 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737064956; x=1737669756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9HyN5fzzsxjX7rL5WN4+ekEIWemc4MJvOPgL3AWRJU=;
        b=RbUeOTfLhm/1YsDniGZwLjZ0Ks4t4jCfMkdNdXg/MqZTSp75+pCTKerXggYIlgBQFQ
         5DvMQ4L1j7eiOxKp048zt015zgK0/7TtWvArxExuX4OnjHeoJczGo44RuQPLOPrPcn2K
         LztXyGm+/aqxjLdBI7Wbxc6XflnQd8BW3gSjaPpvVu2pGyCazKiQgsK98nWJVeTylItN
         yE1sAT+Ga9mZmeDJ+VnZVqKC6NkYPwvG76OQCfXr0mFz6ehGKxLVGKuEXEenNhAVVKfE
         +esdvad+6szRSTLwMUZOWZyNSgVatDCWlrUufbXGLDSenENOvsz2lJQA7wSsz7D4kS2J
         b0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737064956; x=1737669756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9HyN5fzzsxjX7rL5WN4+ekEIWemc4MJvOPgL3AWRJU=;
        b=Z3tpQ04IEzqqLEsPNW7PsWg4pjGDqp2S27DPj1PkffoKGZQYPZzXTM+ObzuA/3g54R
         xrO1zNVCdd49bj2Z1zOUwCTBRO/sD1EIXm4JFZcKd+fvaF6W5OA2nWuEgRIPMThfx8N5
         2l/z4wUQ0oWScUvMe349DjR4m1QhrfbPAKCRXtAFG/a5gr+VLQwhwIehq1aUZ4ZyjqCq
         UK418pM8VSzGidolWAm2Vjb3FhbCUTQdcgmWfvyqZgt8rmuadzkReJoYjLGC3Or4vbXt
         5YbIjlyn8+LBCPpcsOzudpHDCRYcmQ2kELSknBqZ0zkxhzVIVWL8ZwGJen0AIz1B37cM
         n+9g==
X-Gm-Message-State: AOJu0YwQTnPHglQzqLNSAb2OnZfn7Bhey4Tmz1hR6RIlbmnv/4KETLIv
	MZPHnSUqgcbpYL1dPXgnPYuZrQXZ/wRNhqCfzPHlqEzax+OvQD0l4zW52ddEpFY=
X-Gm-Gg: ASbGncuBDOdfGKvTAj8pn0uC23ZB1Xg2ZmOXG5sXsFcRCPdReF5zTQ83c+CRrSTgPXg
	4TYMcpagEl16uC9zLt+0SD5hVsUU3ryQPb4nBU14KLlnjSEDHFsKb20SZ9e8m3ZK3EP15reRqap
	pX5x3MV4rusYqQS5S82ujDxEvNg8o1F+I/zFIY9aMMl7OHwU9oOY9+aLP1HgD4a0vcuLYJ1uOxl
	EN6CdlGIlB41o5sUNG438/C8kYHt/DNdxADV51WYzP2ttE=
X-Google-Smtp-Source: AGHT+IFU/8awlpMa01JGFciAUeb1+31NMw3m/BNIqOBK6PrwzwYa7UYwhd6+mC4PgxTTkBxFrumquQ==
X-Received: by 2002:a05:6a20:8423:b0:1e1:aa24:2e58 with SMTP id adf61e73a8af0-1eb2145dc65mr527617637.7.1737064955823;
        Thu, 16 Jan 2025 14:02:35 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabace1bdsm488740b3a.171.2025.01.16.14.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 14:02:35 -0800 (PST)
Date: Thu, 16 Jan 2025 14:02:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
Message-ID: <Z4mB-I5jeGithAQX@ghost>
References: <20250113155306.1922992-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>

On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
>   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> 
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> 
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.
> 
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: Ron Economos <re@w6rz.net>
> Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v3: put back missing 'endif' to fix the RISC-V build
> v2: add missing include of scripts/Makefile.lib
> 
>  arch/riscv/Makefile.postlink |  8 ++------
>  arch/s390/Makefile.postlink  |  6 +-----
>  arch/x86/Makefile.postlink   |  6 +-----
>  scripts/Makefile.lib         |  3 +++
>  4 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 829b9abc91f6..750d2784f69e 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink

When I compile x86 as relocatable I see the problem that you are fixing
here, but I don't see it on riscv. It's probably better to keep around
this code for riscv, but I don't think it even needs this stripping? I
am adding Alex since he added this for riscv.

Anyways this works as expected:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> @@ -10,6 +10,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  quiet_cmd_relocs_check = CHKREL  $@
>  cmd_relocs_check = 							\
> @@ -19,11 +20,6 @@ ifdef CONFIG_RELOCATABLE
>  quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
>  cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
>  
> -quiet_cmd_relocs_strip = STRIPREL $@
> -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> -                                --remove-section='.rel__*'      \
> -                                --remove-section='.rela.*'      \
> -                                --remove-section='.rela__*' $@
>  endif
>  
>  # `@true` prevents complaint when there is nothing to be done
> @@ -33,7 +27,7 @@ vmlinux: FORCE
>  ifdef CONFIG_RELOCATABLE
>  	$(call if_changed,relocs_check)
>  	$(call if_changed,cp_vmlinux_relocs)
> -	$(call if_changed,relocs_strip)
> +	$(call if_changed,strip_relocs)
>  endif
>  
>  clean:
> diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> index df82f5410769..1ae5478cd6ac 100644
> --- a/arch/s390/Makefile.postlink
> +++ b/arch/s390/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  CMD_RELOCS=arch/s390/tools/relocs
>  OUT_RELOCS = arch/s390/boot
> @@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
>  	mkdir -p $(OUT_RELOCS); \
>  	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
>  
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>  vmlinux: FORCE
>  	$(call cmd,relocs)
>  	$(call cmd,strip_relocs)
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> index fef2e977cc7d..8b8a68162c94 100644
> --- a/arch/x86/Makefile.postlink
> +++ b/arch/x86/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  CMD_RELOCS = arch/x86/tools/relocs
>  OUT_RELOCS = arch/x86/boot/compressed
> @@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
>  	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
>  	$(CMD_RELOCS) --abs-relocs $@
>  
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>  # `@true` prevents complaint when there is nothing to be done
>  
>  vmlinux: FORCE
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7395200538da..f604f51d23ca 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  
> +quiet_cmd_strip_relocs = RSTRIP  $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +
>  # Gzip
>  # ---------------------------------------------------------------------------
>  
> -- 
> 2.47.1.688.g23fc6f90ad-goog
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

