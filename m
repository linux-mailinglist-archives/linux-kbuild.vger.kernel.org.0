Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C18528C00E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 20:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbgJLSwe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 14:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgJLSwc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 14:52:32 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BFCC0613D0;
        Mon, 12 Oct 2020 11:52:31 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id qp15so24659095ejb.3;
        Mon, 12 Oct 2020 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Utz5fM0P2YU1R9Vxa7FixOsKNQgjeSpIPU8Rbs9qTf0=;
        b=g3WHjRsxaAa1FxaEZhH4y5vPnpaXMW6J8BLFRqS/63nANoLJvP1sT97Ex+YiPk7jLk
         05yUckYSDS/4lJRuOiQ+HJc5V4CPNRMSmsFXIdLkiMTwieaQ38L2LyHD9oh5rASH28zL
         eQWcId6G1885WolMzbMQ8wpiIn3ixy6sR77yjIkGNr8H7Gy5cAoEfWX7Ph6TbL4NvsNy
         ATAUaw/L4F0TfdXU9KdxVeB6NWTZbN3cQuuTpvvbnBbaugjLHiZl6hwHkD7mm+r0/UA7
         tOtt7E0F8+m03et8oQyDkVss3VuJsUKXLkkGCO3AFXeDgq1ebnRCdUCX1K63Kmlvj8te
         OpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Utz5fM0P2YU1R9Vxa7FixOsKNQgjeSpIPU8Rbs9qTf0=;
        b=QYWlB/ps1geFmfgNtFzs+aWG9Wy2FVJzu7k/9E3d8pbEAm7Vi/gF78LiDKHYcp6DLP
         L/8u7rHp3GpfB3lop9a1ZRLzVnb/Ly3LSbIjb9edmdxNWfQpovTsNhk13fkNvC8PaS+x
         /oRQihC/Rdsk90EHM/5byMmY+pe+9/CBCio9ENsFrxOY5R1qhajLZke96ZWWLRiaG5VS
         7cee5+Rp8LQbOmzoBtaV5QDlG8LsUub/nMBY82SYiwT8XpKzWhEKsISYDCMtMafMjjX8
         lfGaB6PEzJxpKywLVPZOabbqkqcQIfFbgSoKDED168bm4ptd5Vl2zDt35CS7i2XVHDYc
         9iCA==
X-Gm-Message-State: AOAM531jX4UrPkd6wpve9FTH7/1Rj66il3T8mwZbiO/DBQV0gEy39hFV
        7VXA3dxdkV09vLgV6Lu2tSlJ3S2A6sF+jPn7
X-Google-Smtp-Source: ABdhPJygk+UNjkQWYhM6jSrBsntcB/NXNLo9g4pDeyQsZFyHp5olvQWHvELluyPGrbnJ2thSnHytig==
X-Received: by 2002:a17:907:366:: with SMTP id rs6mr29271827ejb.352.1602528750069;
        Mon, 12 Oct 2020 11:52:30 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:a1bd:911e:26f6:597])
        by smtp.gmail.com with ESMTPSA id w1sm2707349ejv.82.2020.10.12.11.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:52:29 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 12 Oct 2020 20:52:28 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
In-Reply-To: <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
Message-ID: <alpine.DEB.2.21.2010122050400.17866@felia>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com> <20201012170631.1241502-3-ujjwalkumar0501@gmail.com> <alpine.DEB.2.21.2010122019410.17866@felia> <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Tue, 13 Oct 2020, Ujjwal Kumar wrote:

> On 12/10/20 11:50 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
> > 
> >> We cannot rely on execute bits to be set on files in the repository.
> >> The build script should use the explicit interpreter when invoking any
> >> script from the repository.
> >>
> >> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> >> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> >>
> >> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >> Suggested-by: Kees Cook <keescook@chromium.org>
> >> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >> ---
> >>  Makefile                          | 4 ++--
> >>  arch/arm64/kernel/vdso/Makefile   | 2 +-
> >>  arch/arm64/kernel/vdso32/Makefile | 2 +-
> >>  arch/ia64/Makefile                | 4 ++--
> >>  arch/nds32/kernel/vdso/Makefile   | 2 +-
> >>  scripts/Makefile.build            | 2 +-
> >>  scripts/Makefile.package          | 4 ++--
> >>  7 files changed, 10 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 0af7945caa61..df20e71dd7c8 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
> >>  PHONY += headerdep
> >>  headerdep:
> >>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> >> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
> >> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
> >>
> >>  # ---------------------------------------------------------------------------
> >>  # Kernel headers
> >> @@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
> >>  kselftest-merge:
> >>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> >>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
> >> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> >> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
> >>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >>
> >>  # ---------------------------------------------------------------------------
> >> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> >> index edccdb77c53e..fb07804b7fc1 100644
> >> --- a/arch/arm64/kernel/vdso/Makefile
> >> +++ b/arch/arm64/kernel/vdso/Makefile
> >> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
> >>  # Generate VDSO offsets using helper script
> >>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
> >>  quiet_cmd_vdsosym = VDSOSYM $@
> >> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> >> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> >>
> >>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
> >>  	$(call if_changed,vdsosym)
> >> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> >> index 7f96a1a9f68c..617c9ac58156 100644
> >> --- a/arch/arm64/kernel/vdso32/Makefile
> >> +++ b/arch/arm64/kernel/vdso32/Makefile
> >> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
> >>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
> >>  quiet_cmd_vdsosym = VDSOSYM $@
> >>  # The AArch64 nm should be able to read an AArch32 binary
> >> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> >> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> >>
> >>  # Install commands for the unstripped file
> >>  quiet_cmd_vdso_install = INSTALL32 $@
> >> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> >> index 703b1c4f6d12..86d42a2d09cb 100644
> >> --- a/arch/ia64/Makefile
> >> +++ b/arch/ia64/Makefile
> >> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
> >>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
> >>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
> >>
> >> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> > 
> > Here is an instance of what Masahiro-san pointed out being wrong.
> > 
> > Ujjwal, will you send a v3?
> 
> Following is the quoted text from the reply mail from Masahiro
> 
> >> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> >> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
> >> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> > 
> > 
> > 
> > These changes look wrong to me.
> > 
> > $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> > 
> 
> From the above text, I understand as follows:
> 
> That my proposed change:
> $(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)
> 
> is WRONG
> 
> and in the next line he suggested the required correction.
> That being:
> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> 
> Which is in v2 of the patch series.
> 
> Lukas, please correct me if I'm wrong so that I can work on v3
> if required.
>

Sorry, my memory tricked me; I got it confused. Your patch looks good.
 
> Also, Nathan reviewed both the patches in v1 of this series. So,
> should I be the one who adds his tag in next iterations?
>

Masahiro-san will probably just add them when he picks the patches.

Lukas
