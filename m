Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E78738DD4
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jun 2023 19:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjFURyk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jun 2023 13:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjFURyZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2023 13:54:25 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BF72D47
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2023 10:53:34 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-560b7ac3cbfso531196eaf.2
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2023 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687369943; x=1689961943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=we88AZ15mcIhWAQhZKhKoOix1+2t83No85BbQaNBI9o=;
        b=IeBCuTt+RMOZwbG28Mu4isxocs+vieKJsA6ntfbga7OwV1FmKXU9+YrNcHYpaU0+PV
         4GUjxlMBHHgdrRtJ38cHYUPaL0N+FeNKC8g09fSd8p+1j/v3BDZlBbvhtFp1WZsc07bP
         6OWPnwpYQnozQ3/d5jgnDvASME/ULVK97nABA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369943; x=1689961943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=we88AZ15mcIhWAQhZKhKoOix1+2t83No85BbQaNBI9o=;
        b=VhPJ2NBf/DsScURaHO2C/VLQnqUb73uDZO5T+NxlkPfGqwS4I4hKTKpHBywrCZyLfr
         /uT2nXD7o5zPcxUhZ3/7kVJ+9eDcAoo9rblpU2KWRaf1ZGT/f7Rh87t75wIqzZfZjYJ1
         SjsqJmu5/hHHNoH8uCgurdlEtcSC19IFkPl7x9IxDYa+3ZiRWqGG50TJ2+VQsp4zuao2
         CviEs0EFrpK+YRyozZSCoIEsNpIOiAIN/ytTc9B12dbbDWYqwrKgk5cvI0iiIQmBARVo
         f2Q2gODEMFatHwgDbHh2eu+mUkdOgp4SARd6uYAqKqQ7LEKfENfhVwBiHvj3jHTQLMtx
         lDHw==
X-Gm-Message-State: AC+VfDxo10c/oF/4KNXUregG4OwM1JzIdqHFFiinsz2uk3tWgfkmuMiu
        53Q2prjGmQPUJQ5dbCjLa5qzQQ==
X-Google-Smtp-Source: ACHHUZ7FPiX6xbICfcQfnlk5NeoX1flf6bmaMMZg8oXO6UnONtdYZQiohoWdvvq5ofdLlbveSOSdOg==
X-Received: by 2002:a54:4091:0:b0:398:2f06:329 with SMTP id i17-20020a544091000000b003982f060329mr15283734oii.9.1687369943179;
        Wed, 21 Jun 2023 10:52:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w36-20020a634924000000b0053491d92b65sm3398139pga.84.2023.06.21.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 10:52:22 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:52:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Marco Elver <elver@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] ubsan: Tighten UBSAN_BOUNDS on GCC
Message-ID: <202306211051.1D4038323@keescook>
References: <20230405022356.gonna.338-kees@kernel.org>
 <07dea91f-9b93-4227-9fec-728a9e7a0d55@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07dea91f-9b93-4227-9fec-728a9e7a0d55@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 21, 2023 at 09:42:01AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Apr 04, 2023 at 07:23:59PM -0700, Kees Cook wrote:
> > The use of -fsanitize=bounds on GCC will ignore some trailing arrays,
> > leaving a gap in coverage. Switch to using -fsanitize=bounds-strict to
> > match Clang's stricter behavior.
> > 
> > Cc: Marco Elver <elver@google.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: Tom Rix <trix@redhat.com>
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: Miroslav Benes <mbenes@suse.cz>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> This patch, presumably as side effect, enables CONFIG_ARCH_STM32
> for arm64:allmodconfig. As consequence, CONFIG_STM32_RPROC is enabled
> as well. This in turn results in the following build error.
> 
> Building arm64:allmodconfig ... failed
> --------------
> Error log:
> In file included from include/linux/printk.h:564,
>                  from include/asm-generic/bug.h:22,
>                  from arch/arm64/include/asm/bug.h:26,
>                  from include/linux/bug.h:5,
>                  from include/linux/fortify-string.h:5,
>                  from include/linux/string.h:254,
>                  from include/linux/dma-mapping.h:7,
>                  from drivers/remoteproc/stm32_rproc.c:9:
> drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
> drivers/remoteproc/stm32_rproc.c:122:22: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t'
> 
> I did not try to understand what is going on, but reverting this
> patch fixes the problem.

Well that is really weird! I will investigate... this patch should be
pretty self-contained...

-- 
Kees Cook
