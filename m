Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465C928B730
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 15:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389049AbgJLNlV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 09:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389075AbgJLNlE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 09:41:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA34C0613D0;
        Mon, 12 Oct 2020 06:41:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x7so10645163wrl.3;
        Mon, 12 Oct 2020 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=IJUnRg3mPl7jkNIy9dsIVIo/IklmtiJHaWeguv2Wi6o=;
        b=myis63Jh6YDVFMzfEygbdF9hf05zpKmITCIrOSFpVhbl8MbqTQUpPKNrthRN4bO5yl
         wc79p3g9mtnnnjpkbqE9eiHSA37bYb5Kmu7yBK8xzdzMJOXHsoG7tGnSjVRrbpixUFJT
         cCHC/QGUeGslVcgZ2c/UJtWpO7GPQRjz2YD534IFFUaJ6vOn7yjSSksjjaniWJz+FB6q
         wNLNI25LsHqQwfxCir6BNSrnP+QPQ0QkBSL2sTZiQgUXIhHNyV1J4dAg1/EaMbkRsm+S
         RPv/tqbypnh6u5mng3PsfzcItpfboZQVu9V+MrAJZ+K3r9O2qPe8sKWtTE67WrbcR4ws
         jRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=IJUnRg3mPl7jkNIy9dsIVIo/IklmtiJHaWeguv2Wi6o=;
        b=gcDD4uA+Pi5yCOl7vn6cg1fI2fpUeMLzsfrMtH5ep8pCWCOQfCBxUJpkmMQqbGGzlw
         Pw3fuqMMPaxsKCFr9+0Pfv8ZVB/OfPOCToM1ONJ5rFPKk8SueYhYnTU6PWS6+WUNv27q
         OLNJvOBfeCL6cyjdhkhU7arwsvVHImGqe9UZurthf76fANg4Y4DjU0Cl4WDf83TV3sp4
         atlG7b2JORFpdim4U7GlMeZj55YlCVBDTgpdQzAYLCIUwlSOAlBv1gr5YXxrAY+6HHyt
         oyvnspyLp54K6yBZUJhoJM4CnpR1byA9R7JSDcteGK7sa0qwtQ86QmrzUGbBPDsI+p9r
         oZuw==
X-Gm-Message-State: AOAM530DLatO5BWRXuHyMLFANrHLcok8vhxHirVUc5yNFS7/qzNd1MC2
        vgX0GrSbetJQpCdvGRTcDG0=
X-Google-Smtp-Source: ABdhPJxNacfJsPZ4yvtD3vkFSwscCrt+i4xkgGs8nl4/9iPQ2QPpRexcbXY0JT8irITMO0Ma8G6Vyg==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr28721128wrm.308.1602510062848;
        Mon, 12 Oct 2020 06:41:02 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
        by smtp.gmail.com with ESMTPSA id t5sm24754891wrb.21.2020.10.12.06.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 06:41:02 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 12 Oct 2020 15:40:54 +0200 (CEST)
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
Subject: Re: [PATCH RFC 0/2] use interpreters to invoke scripts
In-Reply-To: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
Message-ID: <alpine.DEB.2.21.2010121537150.6487@felia>
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

> This patch series aims at removing the dependency on execute 
> bit of the scripts in the kbuild system.
> 
> If not working with fresh clone of linux-next, clean the srctree:
> make distclean
> make tools/clean
> 
> To test the dependency on execute bits, I tried building the 
> kernel after removing x-bits for all files in the repository.
> Removing execute bits:
> for i in $(find -executable -type f); do chmod -x $i; done
> 
> Any attempts to configure (or build) the kernel fail because of 
> 'Permission denied' on scripts with the following error:
> $ make allmodconfig
> sh: ./scripts/gcc-version.sh: Permission denied
> init/Kconfig:34: syntax error
> init/Kconfig:33: invalid statement
> init/Kconfig:34: invalid statement
> sh: ./scripts/ld-version.sh: Permission denied
> init/Kconfig:39: syntax error
> init/Kconfig:38: invalid statement
> sh: ./scripts/clang-version.sh: Permission denied
> init/Kconfig:49: syntax error
> init/Kconfig:48: invalid statement
> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
> make: *** [Makefile:606: allmodconfig] Error 2
> 
> Changes:
> 1. Adds specific interpreters (in Kconfig) to invoke 
> scripts.
> 
> After this patch I could successfully do a kernel build 
> without any errors.
> 
> 2. Again, adds specific interpreters to other parts of 
> kbuild system.
> 
> I could successfully perform the following make targets after 
> applying the PATCH 2/2:
> make headerdep
> make kselftest-merge
> make rpm-pkg
> make perf-tar-src-pkg
> make ARCH=ia64 defconfig
> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
> 
> Following changes in PATCH 2/2 are not yet tested:
> arch/arm64/kernel/vdso32/Makefile
> arch/nds32/kernel/vdso/Makefile
> scripts/Makefile.build
> 
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
>

Ujjwal, I suggest that you continue to wait if you get any feedback from 
Masahiro-san within the next two weeks (although the merge window) and if
not, try to rebase to the the next rc1 and resend this patchset with 
Nathan's feedback tags added.

The merge window is busy time for maintainers; in the meantime, you might
look into if the build target 'make tools/clean' works on the current 
release and if there are fixes getting merged that fix that.

Lukas

>  Makefile                          |  4 ++--
>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>  arch/ia64/Makefile                |  4 ++--
>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>  init/Kconfig                      | 16 ++++++++--------
>  scripts/Makefile.build            |  2 +-
>  scripts/Makefile.package          |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
