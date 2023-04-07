Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57886DB664
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Apr 2023 00:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDGWVn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 18:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjDGWVl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 18:21:41 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FAFD333
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 15:21:39 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id v9so4739196pjk.0
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=b95Ssk747zg+RLEJbR0eO9a1MTDJxYdYnUaZTntSjmS2Rj4HVQ8Jpr0jZIFvMf3fEw
         UOjhsNNB8uqim16QdTBygc9+Ru04GsVKmc5clvuYGGNrEcC19SRfMZ8m/fqKN3OlJPhI
         +X+VRLKwHQ1JOzD4Y4tXdWCYFWtPYYvOYUjJlWzNpyMeyUtUI3fxOgie7g/L+VLkN985
         ss+2cWkPg3uatul3K6jokZN6JROuxVKU/5VeJqzvFoIfcdQG3rzrnuQ53C+KwQddQHCp
         Q5dL8QsHMyMX/sda2+VrNd650x5TMRl+1hGtk3SMZYYpbnLlx/R+gaAdt0FP/EesEB2o
         x6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906099; x=1683498099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ro+RVMdXK0NBTuXcel+kdAi7VofZgmQkuCbPGk/bESM=;
        b=7sABMiJ5BTxBAD0xPFg5IG4+amayCPnwqRnYCWpPsjOnErPpi1k8RGYjQp3NBs1cd8
         8NW/tq8kqU7UkZhsSV6wKidGEvHPKFyOexHfqvLXmk4BOmnz7qpND+AnKPMiv26stTBQ
         h6FTcUgsztCwC9jfEqzVSs6uatbbVX7Nzf0vAFot6fzlvvKmnsb7XoE1090BM5ZWI3gc
         WP7Gc+bN4e8QBzV2Vdv3lxG0mwbBl3e7Rh8+t7A+s/WTHPjfRm/n+IJfr/+YJ5WrVMsl
         m5neofaEwVzJJSdMv5srBaraWRe9RIUM5njYOEKqUTYrTPIZVSHRVMTSGu7Qz8GXdTuf
         LUgQ==
X-Gm-Message-State: AAQBX9d2DnTDElpV4rIpMr5NO6IVB5Cbstytn4oC/l8Nnd9SSiGyGhE0
        Em5j+kRfSFmlDEyD9IguC6HykwRIA41rInjX4EeFNg==
X-Google-Smtp-Source: AKy350bY2iOq+vIPV8oG7runqpk5KeZ0u5OtC5YkazMnPPKV8eLNQwNE533J4ChDGGPTWyiU9G60StkN8QZEZF9a0yQ=
X-Received: by 2002:a17:90a:a606:b0:246:706c:4f54 with SMTP id
 c6-20020a17090aa60600b00246706c4f54mr92664pjq.7.1680906098661; Fri, 07 Apr
 2023 15:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-5-jiaxun.yang@flygoat.com> <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
In-Reply-To: <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 15:21:27 -0700
Message-ID: <CAKwvOd=k6ySaGgHF_J3vnaOpq2+wHSjZ6ab9H5_MmJutCKiVTQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit CPU
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, nathan@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 7, 2023 at 3:19=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
> >
> > LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
> > kernel is unsupported.
> >
> > Detect this in Kconfig to prevent user select 32 bit kernel with
> > unsupported toolchain.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I suspect this may fix:
> Link: https://github.com/ClangBuiltLinux/linux/issues/884

Oh, and there was
https://github.com/ClangBuiltLinux/linux/issues/884#issuecomment-1242729142
I wonder if that is preferable or a source of inspiration?


--=20
Thanks,
~Nick Desaulniers
