Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896573DC076
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhG3Vyw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhG3Vyv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:54:51 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1E5C06175F
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:54:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so7501359edt.7
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7aKMKn982p52Fvo+RafbN4nbzmOZcaHi43o8L8qnY+4=;
        b=e3gD2omhgrGKs5t8W/r7K60LV5VhuqUli3ecVKeHtZwHM7LBwgxR5XeOkr9ewdjd2c
         xj7a/kTRU7IGkPLriaWTtOL1eBK9al/wjxGWkB8yqh2majJgR9YYX+ywzrfrf/V9JOXZ
         zWJXESZp+8E/VgCG4qnblM8fAdGwsxYdb03HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7aKMKn982p52Fvo+RafbN4nbzmOZcaHi43o8L8qnY+4=;
        b=UfoM05r9PmIlTzpvCLSYoYU03lH/s5o267r1XoSkNmZPVIbYlxrWc25Xu9BLZdFKB3
         64/ttcXw03sVlQeKFYOskZ7l3KPUJaVHpazlitRk2BiOMQQcKGytC+cm4kA7UrbjxRTd
         MQ0H31PaREJjaEzT/r3pNfxo6+V2HKvPKUC4AH4lLCt5c7e51tqSgpd1rC1MpXwxsupI
         5dYUc1kz64EMd2SNVmiq+tulqK8WjX83CFDmfigVskj6hy+OlATh97YXJ7CwvyVotddl
         k/WG3ulRFa8hiJucYauxu8BJaONFGZ3BuAfqAoYtd9NzPNeCMbapBE6DrZWDgaH7x/46
         Jo8A==
X-Gm-Message-State: AOAM533HJBxGy/5YHoAnu4bZgKcikyuZ6KlGZEF5bqbvaDo49LRIDPei
        CdXXifAPqOHgouCLmsdk2X/pIX2o5S24J8Ik7MA=
X-Google-Smtp-Source: ABdhPJwq6umK4+G8aA/MZFYOLZ82u6Ok5agcndZfZD3gZlU4NnIIZ3EjcrELOaQC54Owz8miqomkQg==
X-Received: by 2002:a05:6402:176e:: with SMTP id da14mr5628596edb.348.1627682084877;
        Fri, 30 Jul 2021 14:54:44 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id c13sm1204286edv.93.2021.07.30.14.54.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 14:54:43 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id nd39so19309981ejc.5
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:54:42 -0700 (PDT)
X-Received: by 2002:a19:c3c1:: with SMTP id t184mr3428280lff.41.1627682071251;
 Fri, 30 Jul 2021 14:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201701.3146910-1-ndesaulniers@google.com> <20210730201701.3146910-2-ndesaulniers@google.com>
In-Reply-To: <20210730201701.3146910-2-ndesaulniers@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 30 Jul 2021 14:54:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgh_gk17OoVjXSiuT+7=oYDUKjYGWibd+tCfQRpYJ7cGA@mail.gmail.com>
Message-ID: <CAHk-=wgh_gk17OoVjXSiuT+7=oYDUKjYGWibd+tCfQRpYJ7cGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Makefile: infer --target from ARCH for CC=clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 1:17 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> +ifeq ($(SRCARCH),arm)
> +CLANG_FLAGS    += --target=arm-linux-gnueabi
..,.

Ugh.

A wise man once said: "All problems in computer science can be solved
with another level of indirection".

Just do it like this:

   CLANG_TARGET_FLAGS_arm = arm-linux-gnueabi
   CLANG_TARGET_FLAGS_hexagon = hexagon-linux-gnu
   ..
   CLANG_TARGET_FLAGS = $(CLANG_TARGET_FLAGS_$(ARCH))

Which is a lot denser and simpler.

And then the only if-statement can be something along the lines of

   ifeq ($(CLANG_TARGET_FLAGS),)
   $(error Specify clang target flags)
   else
   CLANG_FLAGS    += --target=$(CLANG_TARGET_FLAGS)
   endif

Plus add *random handwaving* about all the details for CROSS_COMPILE
and friends.

            Linus
