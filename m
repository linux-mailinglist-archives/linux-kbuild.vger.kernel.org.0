Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB32A25305C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 15:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbgHZNrB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 09:47:01 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43811 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgHZNq5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 09:46:57 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 07QDkPCh008653;
        Wed, 26 Aug 2020 22:46:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 07QDkPCh008653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598449585;
        bh=o7eCdAdgOheG7FAIfRne3QfZg51jDgTmJuPqiAC/sK8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=21bA7VpEWxm5UeK7oPZWUFdIhQajYdPhqd3SV11eya86xNPqIzTN61Ph8de6zpGEz
         ErmqVG9CEY1PU4acX9fn1RjP1NiHCEt6A7n+jxuatW35C1Ibmexw2WFRQ5kELQrioY
         nhyyZIHuk/VR/WdHnlXnht+t+83UBcH62kZpZ//xifmRUuh1tOgl6Vf9FKEswPQI/e
         1HW+Kh3ukNNsu7d799pH6Lt8J4iufcPAHoPKoIfVMBLRzxgtROhN0b/eC4qbJ/xFXC
         9uBapHPM+v+BgmVo87jKiZV1cojEK3iS8gv9OsHt49K7yPELvIeywks56mcwBoFz1F
         NvE1zvPqM2Yqw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id 2so900074pjx.5;
        Wed, 26 Aug 2020 06:46:25 -0700 (PDT)
X-Gm-Message-State: AOAM531iH2q2SxVzfu1gBpOSo0Qcp/iYTPkRQNzYTVI8/9B2e6Y42MOn
        iNhZkfMnMu3mEExeab7sGc0PTQDyh6e3eeyBWKg=
X-Google-Smtp-Source: ABdhPJxYguAPl7915j/hpYyN6BaOhYmXutUAd9G9j1QCXn8OaMyaNTPAez6SpGyucG7F48mn5JH7tlL0yZwPTX1xjPU=
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr6288925pjb.153.1598449584709;
 Wed, 26 Aug 2020 06:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200821024358.616384-1-masahiroy@kernel.org>
In-Reply-To: <20200821024358.616384-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Aug 2020 22:45:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkc_LVJ1dvzn3aETgKkrkqNt8hOpjBF0Pn2gh40gJYEw@mail.gmail.com>
Message-ID: <CAK7LNASkc_LVJ1dvzn3aETgKkrkqNt8hOpjBF0Pn2gh40gJYEw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: hide commands to run Kconfig, and show short log
 for syncconfig
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 11:44 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Some targets (localyesconfig, localmodconfig, defconfig) hide the
> command running, but the others do not.
>
> Users know which Kconfig flavor they are running, so it is OK to hide
> the command. Add $(Q) to all commands consistently. If you want to see
> the full command running, pass V=1 from the command line.
>
> syncconfig is the exceptional case, which occurs without explicit
> command invocation by the user. Display the Kbuild-style log for it.
> The ugly bare log will go away.
>
> [Before]
>
> scripts/kconfig/conf  --syncconfig Kconfig
>
> [After]
>
>   SYNC    include/config/auto.conf
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.



> ---
>
>  Makefile                 |  5 ++++-
>  scripts/kconfig/Makefile | 16 ++++++++--------
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9cac6fde3479..0693314d51c3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -708,8 +708,11 @@ $(KCONFIG_CONFIG):
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
> +quiet_cmd_syncconfig = SYNC    $@
> +      cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
> +
>  %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
> -       $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> +       +$(call cmd,syncconfig)
>  else # !may-sync-config
>  # External modules and some install targets need include/generated/autoconf.h
>  # and include/config/auto.conf but do not care if they are up-to-date.
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 52b59bf9efe4..e46df0a2d4f9 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -20,19 +20,19 @@ endif
>  unexport CONFIG_
>
>  xconfig: $(obj)/qconf
> -       $< $(silent) $(Kconfig)
> +       $(Q)$< $(silent) $(Kconfig)
>
>  gconfig: $(obj)/gconf
> -       $< $(silent) $(Kconfig)
> +       $(Q)$< $(silent) $(Kconfig)
>
>  menuconfig: $(obj)/mconf
> -       $< $(silent) $(Kconfig)
> +       $(Q)$< $(silent) $(Kconfig)
>
>  config: $(obj)/conf
> -       $< $(silent) --oldaskconfig $(Kconfig)
> +       $(Q)$< $(silent) --oldaskconfig $(Kconfig)
>
>  nconfig: $(obj)/nconf
> -       $< $(silent) $(Kconfig)
> +       $(Q)$< $(silent) $(Kconfig)
>
>  build_menuconfig: $(obj)/mconf
>
> @@ -68,12 +68,12 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
>  PHONY += $(simple-targets)
>
>  $(simple-targets): $(obj)/conf
> -       $< $(silent) --$@ $(Kconfig)
> +       $(Q)$< $(silent) --$@ $(Kconfig)
>
>  PHONY += savedefconfig defconfig
>
>  savedefconfig: $(obj)/conf
> -       $< $(silent) --$@=defconfig $(Kconfig)
> +       $(Q)$< $(silent) --$@=defconfig $(Kconfig)
>
>  defconfig: $(obj)/conf
>  ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
> @@ -111,7 +111,7 @@ tinyconfig:
>  # CHECK: -o cache_dir=<path> working?
>  PHONY += testconfig
>  testconfig: $(obj)/conf
> -       $(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
> +       $(Q)$(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
>         -o cache_dir=$(abspath $(obj)/tests/.cache) \
>         $(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
>  clean-files += tests/.cache
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
