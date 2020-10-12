Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BD128BF8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 20:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388498AbgJLSU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 14:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387765AbgJLSU5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 14:20:57 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49ABCC0613D0;
        Mon, 12 Oct 2020 11:20:56 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id 33so17973976edq.13;
        Mon, 12 Oct 2020 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=en7+cHw+zpp+LIZnFwAodjQVlC83Izxx3U6c4o6e8D0=;
        b=LdoVe2QL2arh9oFysuEfjbiUDo4wQnijZX8WFKCxuw4iMOyCg4OkxwYJkuSMyGoHss
         w8FTMhYH119rUuRP5DBz4W5MFIPV6udmxofgXfZ9KAbzBb0FYWhTlnYGFoK+YmTCf84t
         gKZHzLItmu5+bKqT242hrtLDH3HmluRnM+NgmFDayhA0dPAR80KRiTXCZEMyphTuN5Ki
         3ctnIdgF4kJNUIG0XftUPOycfiOHfvGXGRzVMWK9EYfcydDagFWwVUNWkInM84/v6q/C
         FR2mvutyZPqGPXYSlzfa4aV2HuO3+KXfei/8DV3vVs85ShumBWRhgbaGIFqDCQqqva8z
         Qq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=en7+cHw+zpp+LIZnFwAodjQVlC83Izxx3U6c4o6e8D0=;
        b=YNWhLghsPREnDFzrJ13UQM/jtyDRNa7UV8U7rMBbOeHjDiwGiWhD3crwv7vy1pmfCT
         xWKuMftedSi7q41KVU2A8BlZYrPzMpwjdTaQRIaWq3cP2KJctbpF+B+GvSMbufdKTCCi
         fphe7RxbebOJMlU648GwGyKMhSKTOZh4Ves7GMXNPdF9PZEuQuQdwVIQIrhbLcEaiJby
         8DLBUjxpdTq2tC0BZr7QlaWjGhxAXrMd4N46Hxq6vKZ5W/CNe6FcWwJYRLaGBzepMtUR
         VVgFd3e4bV0Bks0C2BcQ0kXFUV46cZe2hSjtmuuuIjBU+TvXdPWCGBpdzq6IRL7SeDof
         iYfw==
X-Gm-Message-State: AOAM530D/LWMCdT8/MLzQ0iMiR63/O1Qq9GSR58oWA2rDgxkfIm5r21I
        +bhcjNMmJR0tgSR52WwJ5NZ5fLKZYn+JLKpx
X-Google-Smtp-Source: ABdhPJy/WCePAhiFNYC/WvVr3EDosYtqB/OY+tIpiWNLpDWi62nlpJ3S02DEWDiUjD2rfF+w4RTLfQ==
X-Received: by 2002:a50:9b14:: with SMTP id o20mr15052069edi.328.1602526854914;
        Mon, 12 Oct 2020 11:20:54 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
        by smtp.gmail.com with ESMTPSA id w4sm7861015eds.83.2020.10.12.11.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:20:54 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 12 Oct 2020 20:20:52 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
In-Reply-To: <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
Message-ID: <alpine.DEB.2.21.2010122019410.17866@felia>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com> <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Mon, 12 Oct 2020, Ujjwal Kumar wrote:

> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
> 
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
>  Makefile                          | 4 ++--
>  arch/arm64/kernel/vdso/Makefile   | 2 +-
>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>  arch/ia64/Makefile                | 4 ++--
>  arch/nds32/kernel/vdso/Makefile   | 2 +-
>  scripts/Makefile.build            | 2 +-
>  scripts/Makefile.package          | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0af7945caa61..df20e71dd7c8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>  PHONY += headerdep
>  headerdep:
>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
> 
>  # ---------------------------------------------------------------------------
>  # Kernel headers
> @@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
>  kselftest-merge:
>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> 
>  # ---------------------------------------------------------------------------
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index edccdb77c53e..fb07804b7fc1 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> 
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>  	$(call if_changed,vdsosym)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 7f96a1a9f68c..617c9ac58156 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
>  # The AArch64 nm should be able to read an AArch32 binary
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> 
>  # Install commands for the unstripped file
>  quiet_cmd_vdso_install = INSTALL32 $@
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 703b1c4f6d12..86d42a2d09cb 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
> 
> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")

Here is an instance of what Masahiro-san pointed out being wrong.

Ujjwal, will you send a v3?

> 
>  ifeq ($(GAS_STATUS),buggy)
>  $(error Sorry, you need a newer version of the assember, one that is built from	\
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
> index 55df25ef0057..e77d4bcfa7c1 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>  # Generate VDSO offsets using helper script
>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>  quiet_cmd_vdsosym = VDSOSYM $@
> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> 
>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>  	$(call if_changed,vdsosym)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a467b9323442..893217ee4a17 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -104,7 +104,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
> 
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
> +  cmd_checkdoc = $(PERL) $(srctree)/scripts/kernel-doc -none $<
>  endif
> 
>  # Compile C sources (.c)
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index f952fb64789d..4fc16c4776cc 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -44,7 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>  	echo >&2; \
>  	false; \
>  fi ; \
> -$(srctree)/scripts/setlocalversion --save-scmversion; \
> +$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion; \
>  tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
> @@ -123,7 +123,7 @@ git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
>  mkdir -p $(perf-tar);                                               \
>  git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
>  (cd $(srctree)/tools/perf;                                          \
> -util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
> +$(CONFIG_SHELL) util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> --
> 2.25.1
> 
> 
