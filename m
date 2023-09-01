Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64DAC79029B
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Sep 2023 21:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350671AbjIATuf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Sep 2023 15:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239166AbjIATuf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Sep 2023 15:50:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC7B10FC
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Sep 2023 12:50:31 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c06f6f98c0so19459375ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Sep 2023 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693597831; x=1694202631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=fthS1VCzHXcUTE00n6Svm+w9LyBnWbPXRCnrtKgX+lTjv3pVBau3i2G6Pvfs8DVQzU
         /nfveQ+9ZqExXKHzR6oyct+mYWKIOxeSp3O/Vx8676FV08K0KqjBfMlfIm31/aag0RFb
         yo7ea3ltuXO9s6NKx5UR7Anzy/EYzDLZSjHfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693597831; x=1694202631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnGlOgpcJfhSyX3oWtweduRxRFI+vcvjVBEfz8W6REE=;
        b=eGMsHNiQ2pqZb+UqZlqZvs8izb9a0cAGxOKWVafIrngMNIWSojm2HR+Gu0ewlAJzGx
         mCc09xSMZ2lNdXrRSLC/N684/bEW4ecpOhmDmKekhXvX0yqfVNVMiQpS4N6Gfx5lx5Mu
         yZnyweWXMA5pYiO4KuTktN7+njvfyzx5N7IaXzlOlJ38Xomt42tR/ZvoTIL1kvf92l+e
         KizAs1carLETVket3OZa3mViIorjIDcbzlXjlCpIIfPtiVuNBQECNej4+Qv74FE1qJdS
         nsOGBl9HL0qkwRdunkrMYcE7lFM/C2dBDhDf6ZzVTGb+JgutpN41u5kfKsXic2hxEikL
         Pf9w==
X-Gm-Message-State: AOJu0YzT17Mi7JXfKeMhiB+IymcAmHXmP0iYZFVfxTtd+Kd89JHjDkrd
        7OLj9wTM2wGZRyVgmi81NljJ9Q==
X-Google-Smtp-Source: AGHT+IFLMLtB06xgjItzzUv50zhsXFZ37ehwBfgJSIF2V6heU41cis1M/xhTkDTyzQL7J2okpu7MHw==
X-Received: by 2002:a17:902:f682:b0:1c0:b7f4:5b86 with SMTP id l2-20020a170902f68200b001c0b7f45b86mr3871500plg.65.1693597830846;
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001b8b2b95068sm3397478pln.204.2023.09.01.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 12:50:30 -0700 (PDT)
Date:   Fri, 1 Sep 2023 12:50:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
Message-ID: <202309011250.AB0DAA03@keescook>
References: <20230831191335.give.534-kees@kernel.org>
 <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 01, 2023 at 04:58:37PM +0900, Masahiro Yamada wrote:
> On Fri, Sep 1, 2023 at 4:13 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Currently the Kconfig fragments in kernel/configs and arch/*/configs
> > that aren't used internally aren't discoverable through "make help",
> > which consists of hard-coded lists of config fragments. Instead, list
> > all the fragment targets that have a "# Help: " comment prefix so the
> > targets can be generated dynamically.
> >
> > Add logic to the Makefile to search for and display the fragment and
> > comment. Add comments to fragments that are intended to be direct targets.
> >
> > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: x86@kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > v3:
> > - Use Makefile logic from Masahiro Yamada
> > - Use "# Help: " prefix, but only on desired fragment targets
> > v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.org
> > v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
> > ---
> >  Makefile                                   |  1 -
> >  arch/arm/configs/dram_0x00000000.config    |  1 +
> >  arch/arm/configs/dram_0xc0000000.config    |  1 +
> >  arch/arm/configs/dram_0xd0000000.config    |  1 +
> >  arch/arm/configs/lpae.config               |  1 +
> >  arch/arm64/configs/virt.config             |  1 +
> >  arch/powerpc/configs/disable-werror.config |  1 +
> >  arch/powerpc/configs/security.config       |  4 +++-
> >  arch/riscv/configs/32-bit.config           |  1 +
> >  arch/riscv/configs/64-bit.config           |  1 +
> >  arch/s390/configs/btf.config               |  1 +
> >  arch/s390/configs/kasan.config             |  1 +
> >  arch/x86/Makefile                          |  4 ----
> >  kernel/configs/debug.config                |  2 ++
> >  kernel/configs/kvm_guest.config            |  1 +
> >  kernel/configs/nopm.config                 |  2 ++
> >  kernel/configs/rust.config                 |  1 +
> >  kernel/configs/tiny.config                 |  2 ++
> >  kernel/configs/x86_debug.config            |  1 +
> >  kernel/configs/xen.config                  |  2 ++
> >  scripts/kconfig/Makefile                   | 15 ++++++++++++---
> >  21 files changed, 36 insertions(+), 9 deletions(-)
> >
> 
> 
> Just one thing.
> 
> 
> 
> 
> 
> > diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> > index 00009f7d0835..60a4b6d80b36 100644
> > --- a/kernel/configs/tiny.config
> > +++ b/kernel/configs/tiny.config
> > @@ -1,3 +1,5 @@
> > +# Help: Size-optimized kernel image
> 
> 
> I will drop this.
> 
> 
> We already have a hard-coded help message.
> 
>   tinyconfig   - Configure the tiniest possible kernel
> 
> 
> 
> 
> Then, some lines below, again.
> 
>   tiny.config               - Size-optimized kernel image
> 
> 
> 
> tiny.config is for internal use for tinyconfig.

Shall I send a v4, or did you fix this up already?

-- 
Kees Cook
