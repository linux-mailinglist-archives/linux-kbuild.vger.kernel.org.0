Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B192B554E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 00:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731190AbgKPXlz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Nov 2020 18:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729638AbgKPXly (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Nov 2020 18:41:54 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D44DC0613CF
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2020 15:41:54 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t21so8326303pgl.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2020 15:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6oT/iaJpuUzbJsO3ZOoSLXJmJdPmOezInw0gF4IJ28=;
        b=DaGY52y2S53RfC36H5AiJH5A419IlvPKioPWUhj1fz1ee9KTimKZDJrmWgb9v776ET
         /gwm9XOeX0BJZikJIRY2/UxXgYgquVvhQpNrFV9XiB3qeL7RefN2AprNWMpLRtxOxzh/
         cEls2g7rxSNDVIvusRCwaQNeTXxi720q64jwxbjjYoBdqrs14vxzI0lX+DaArhZWJvkT
         WUQOjJO9Sx2tTPiyKzbVFjdPpaXTpnQN+CsR7FFBk1TEPMkBAqU6nHxQ/P0Zl6adCwuQ
         iWqm5vwTuaud25e3h4ZXeTqdYz5ypSBmKJ2FlwNnr1RTathlitsBCuYUyGKuRDxrr+HC
         AKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6oT/iaJpuUzbJsO3ZOoSLXJmJdPmOezInw0gF4IJ28=;
        b=ZzONhiW0wYxYEWNSO8GbIUYXUmbK7jx9F2/NamSFnLhMfDpKsJpr4YF3+/mIbbaubz
         hdtVgzFP2sBn079cvlOljXzixNnwWjU799pLV8cZhagjPmOoqO3fTZKHViGxvO2AN7bu
         1nzaukDTix3UqFCS3PvNCqmKnyGkzhgPkSLvciKKuvpHRa1sA6ojAge6dZ69Cba1UxLe
         5pwDAaVDyLp/VpD/IHEYotLzQ1CnM5WtMidOSmcHd3oOTaarJgg2hkRzE+lMnCfcNm/N
         zNZymI7JguVr99DQgbElRIUx6fmvhgBupFklxSUFY9LAH8OJe9MR2kcZgOHMbVLfIWiA
         gtFg==
X-Gm-Message-State: AOAM530vfWRQ45ad4MCyn/XQR33EV/o3At9Yt/JQE2YBvMzRlwCRJbOm
        fBmm41LI7UbFh+n9iHXXKyK+5YUPlbLumXYYVmuOgHpuhqk=
X-Google-Smtp-Source: ABdhPJwVHouTg7EVX4W0i+4378wI412Q2tEtRHUYdk7lrZpa4Bigm1LcPNbScK1zq4PEp4tG+BUF6n3Mdrpfjn0WHQs=
X-Received: by 2002:a17:90b:d91:: with SMTP id bg17mr1379665pjb.25.1605570113934;
 Mon, 16 Nov 2020 15:41:53 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=9iqLgdtAWe2h-9n=KUWm_rjCCJJYeop8PS6F+AA0VtA@mail.gmail.com>
 <20201109183528.1391885-1-ndesaulniers@google.com>
In-Reply-To: <20201109183528.1391885-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Nov 2020 15:41:42 -0800
Message-ID: <CAKwvOdnxAr7UdjUiuttj=bz1_voK1qUvpOvSY35qOZ60+E8LBA@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: do not emit debug info for assembly with LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro, have you had time to review v3 of this patch?

On Mon, Nov 9, 2020 at 10:35 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Clang's integrated assembler produces the warning for assembly files:
>
> warning: DWARF2 only supports one section per compilation unit
>
> If -Wa,-gdwarf-* is unspecified, then debug info is not emitted for
> assembly sources (it is still emitted for C sources).  This will be
> re-enabled for newer DWARF versions in a follow up patch.
>
> Enables defconfig+CONFIG_DEBUG_INFO to build cleanly with
> LLVM=1 LLVM_IAS=1 for x86_64 and arm64.
>
> Cc: <stable@vger.kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/716
> Reported-by: Dmitry Golovin <dima@golovin.in>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Dmitry Golovin <dima@golovin.in>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f353886dbf44..7e899d356902 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -826,7 +826,9 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> +ifneq ($(LLVM_IAS),1)
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +endif
>
>  ifdef CONFIG_DEBUG_INFO_DWARF4
>  DEBUG_CFLAGS   += -gdwarf-4
> --
> 2.29.2.222.g5d2a92d10f8-goog
>


-- 
Thanks,
~Nick Desaulniers
