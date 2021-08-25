Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07A3F6E9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhHYE70 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:59:26 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:40136 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhHYE70 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:59:26 -0400
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17P4wSd6004409;
        Wed, 25 Aug 2021 13:58:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17P4wSd6004409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629867509;
        bh=2s1HaRNyPJiY7KgsOGbE/rpbydQNblyKJTWJP8FagRg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ThqoW9MsgkLMZKz+iB02lviGEH3+7EmV+dYU++1iRaOc9yAD4H1qQm+1a0hB/v1I3
         9AD2Zf+QLTKQh5x0O3Xdn0p//wtnQVvu6or3DaDAbxhGwIXb2Tsf/LFNM+ykYh46YW
         c39J2Be1esy4fe5SOcpgS/zWjCZf/MSKgnSIc69ThKRMuTc+KBDh2RHXYF8SRIvXuW
         ioxSXQevF5Wl9f1K7+4T8vWquCLpBItiwE1Hc22bRqzPcjB6cZgOQOfEtWL29dMoib
         KMOahDyByzKiU0ohQGgJsVSkxEwhNv1QFp7cMHLPcKhnSXgBW9X+6Xq+Rm2Gqj/bf1
         LPVlBGrcc4lMQ==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id g184so3394698pgc.6;
        Tue, 24 Aug 2021 21:58:29 -0700 (PDT)
X-Gm-Message-State: AOAM533yxkptxV9H94uAc2awbmoldDnHVB3hOug3Kuu5DUS13mF8C2HF
        VbNgdGV/iQl2bCjubt+DpdmHKh2enT/g5wGGGS4=
X-Google-Smtp-Source: ABdhPJz+VN+CWUAfRNFciSLHejbQ4Na6dnw3C5esx+Dhi62zmRNM/S8gitFNcgEUQ7vketS3waQL4jHGJPX9Dr4jgUs=
X-Received: by 2002:a63:a58:: with SMTP id z24mr40517663pgk.175.1629867508346;
 Tue, 24 Aug 2021 21:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210819005744.644908-1-masahiroy@kernel.org>
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:57:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoxA875uynQHs-HpcfXtzFvuxkzSha9tquR2uV0Za10A@mail.gmail.com>
Message-ID: <CAK7LNARoxA875uynQHs-HpcfXtzFvuxkzSha9tquR2uV0Za10A@mail.gmail.com>
Subject: Re: [PATCH 00/13] kbuild: refactoring after Clang LTO
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 9:58 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
> The introduction of Clang LTO, the kbuild code became much
> uglier due to CONFIG_LTO_CLANG conditionals.
>
> It is painful to maintain the messed-up code, and to review
> code changed on top of that.
>
>
>
> Masahiro Yamada (13):
>   kbuild: move objtool_args back to scripts/Makefile.build
>   gen_compile_commands: extract compiler command from a series of
>     commands
>   kbuild: detect objtool changes correctly and remove .SECONDEXPANSION
>   kbuild: remove unused quiet_cmd_update_lto_symversions
>   kbuild: remove stale *.symversions
>   kbuild: merge vmlinux_link() between the ordinary link and Clang LTO
>   kbuild: do not remove 'linux' link in scripts/link-vmlinux.sh
>   kbuild: merge vmlinux_link() between ARCH=um and other architectures
>   kbuild: do not create built-in.a.symversions or lib.a.symversions
>   kbuild: build modules in the same way with/without Clang LTO
>   kbuild: always postpone CRC links for module versioning
>   kbuild: merge cmd_modversions_c and cmd_modversions_S
>   kbuild: merge cmd_ar_builtin and cmd_ar_module
>


Patch 01-08 applied.

I will take some time for the rest.


-- 
Best Regards
Masahiro Yamada
