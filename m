Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048753CC951
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jul 2021 15:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhGRN02 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Jul 2021 09:26:28 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:61842 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhGRN01 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jul 2021 09:26:27 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16IDN6VF026573;
        Sun, 18 Jul 2021 22:23:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16IDN6VF026573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626614587;
        bh=Ze113MyRnH/xltMWjfaGCsj9jL5X6qLXZcynrxc1yNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AlNhgOXFJuGtM5Sv/s/0YXXa09yNhNu5SanENdrUsk2r8Q1uHMxcd3ggJ4DPZV7lv
         2ds526fDdeqcv3YYoXPzvP2Vlcge+gZOwNikMOwQp9Ja1xuv4A6yrM0wEPd1OPuErp
         LRyNZhpoAd6qWEWVSOOCHrVkMUUBAhjKM4bhutBwJ8YdxK5d6u78R1FrGtk0Le4TAB
         iAhWDdNIVPEzDnz6oh8Ivjx+igizxsXFXAtmhAyOB7+RrH0dpWCL5jobN9Osv1n0Me
         dl3afoSYwwHbeH1N2MhZoG6KZ4PsoTs6nvIC0rbgEBe5RXaJTmUx49pI/Hz0Uk12yt
         5Bm2n0bVQ5TUA==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id b12so8031093plh.10;
        Sun, 18 Jul 2021 06:23:06 -0700 (PDT)
X-Gm-Message-State: AOAM5332RON5xNkw35Ii039Wl6LkErZ0QGdJ2H9sF+55ogIoc0EBJ8NP
        vXR10lny018s9Lf9bEM4mMjQ2bBHdInbqIpJCyY=
X-Google-Smtp-Source: ABdhPJyCp2zQIsACSECMSy2+lp/QzUfLy+IVv/0JoHPh3da16U7sUtk+MqY3b3gWloZTnaAQ2j9EiyvW1u9208mzCu0=
X-Received: by 2002:a17:902:be0f:b029:12b:6dff:2a22 with SMTP id
 r15-20020a170902be0fb029012b6dff2a22mr8231303pls.1.1626614586036; Sun, 18 Jul
 2021 06:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210714042349.219199-1-masahiroy@kernel.org>
In-Reply-To: <20210714042349.219199-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Jul 2021 22:22:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6NgAL7XQ4Hr5n+BFv8bkFiY1ttMj_p9kBXVi_MCxWsg@mail.gmail.com>
Message-ID: <CAK7LNAS6NgAL7XQ4Hr5n+BFv8bkFiY1ttMj_p9kBXVi_MCxWsg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not suppress Kconfig prompts for silent build
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 1:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When a new CONFIG option is available, Kbuild shows a prompt to get
> the user input.
>
>   $ make
>   [ snip ]
>   Core Scheduling for SMT (SCHED_CORE) [N/y/?] (NEW)
>
> This is the only interactive place during the build process.
>
> Commit 174a1dcc9642 ("kbuild: sink stdout from cmd for silent build")
> suppressed Kconfig prompts as well because syncconfig is invoked by
> the 'cmd' macro. You cannot notice the fact that Kconfig is waiting
> for the user input.
>
> Use 'kecho' to show the equivalent short log without suppressing stdout
> from sub-make.
>
> Fixes: 174a1dcc9642 ("kbuild: sink stdout from cmd for silent build")
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



>  Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c3f9bd191b89..6272126abe23 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -728,11 +728,9 @@ $(KCONFIG_CONFIG):
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
> -quiet_cmd_syncconfig = SYNC    $@
> -      cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
> -
>  %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
> -       +$(call cmd,syncconfig)
> +       $(Q)$(kecho) "  SYNC    $@"
> +       $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>  else # !may-sync-config
>  # External modules and some install targets need include/generated/autoconf.h
>  # and include/config/auto.conf but do not care if they are up-to-date.
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
