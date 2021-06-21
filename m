Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFD73AF965
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbhFUXd3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbhFUXd2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:33:28 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D13C061574;
        Mon, 21 Jun 2021 16:31:13 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id bj15so33149822qkb.11;
        Mon, 21 Jun 2021 16:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1X2SLkqMIFPd+4/wsO13rRAUrRxK8PS8uC3zU+SLBzo=;
        b=RdgjBg2hdUEMBc1Jh+w6c4eTES+hq3dFebL8cQsIWyWrqrPQfI2S/7tnA2WkyVuUhG
         PF0j7hwJd3oNGcls1LiHqmz8w3N/jBne5F30XiEIwOMFOTQk6GmC2zUcI4iSxDWnwuZP
         cPJhokyr7jVMp0J3uNmkzSc6wcI60/l3l7w/xtXRsYMHrPCzVf6yP77W9Io5i7zfMrTg
         E7lMUvCzq6ZKScI2PPcbTbhLt37Zlwt5zxHdLAI1IOKElxQu0rczu+E3lq+VbXaOMWDf
         5IP7QyXzD45DgX6LS7cTE4ONYVo+aKEEsUNaFun3z0MdMALgOcoVcUQaVEgTIC1ClP8V
         Dcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1X2SLkqMIFPd+4/wsO13rRAUrRxK8PS8uC3zU+SLBzo=;
        b=EfbbOrOJzhhxjGA084WymiQDtPnoNSyiV/hmdV2k+k9pb7MS2rFX4Ck6vqHy9NRXDB
         2qjmS/JZo7VeCG72RqRlnLz0AEyUTowH8amp9D3Oc+8y6XZZYC0rRWCTP+AvH6ixqCcW
         5Djmvz9mTvj0jsm9II8Sl9JkmSx+BmiX+gi2kjak62xb37yvNobrgZTGs5ZTkhS3kE3w
         1mC8wnGJaLIe9rsQ6dexkb5Uc6jO2kVr3mmdXWIlYbZQAQVdvFTVuHENiLPIHEyXVTvy
         0uqG7m2yeiJA35B5aSCWqtqWemAxzwpa96pGYI8nnT8aGL7il29fbXZ93b43pFT7YcK0
         IqHA==
X-Gm-Message-State: AOAM5300kdWX+5uQNZbPvP9/jLsgoXSLjPnjf4BFs6nhpAbrswbHnt+e
        iodCeaxu9GXlgOWoSwvaSsXMIjbjCFWpjKK8BipzXBQx7Q1wgY/2
X-Google-Smtp-Source: ABdhPJyqwtFlI4PPGTFm8/ZOjyVUpkHEIF4sTGl2aMywzDqBmtO+E7Q1fJIkU0al2k5TQyAkxaGJV9iIDdUE0WM1RVo=
X-Received: by 2002:a25:6c8a:: with SMTP id h132mr815172ybc.422.1624318272474;
 Mon, 21 Jun 2021 16:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com> <20210621231822.2848305-3-ndesaulniers@google.com>
In-Reply-To: <20210621231822.2848305-3-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 22 Jun 2021 01:31:01 +0200
Message-ID: <CANiq72kQ29ZnFB9RYe=pCzZLgSu=A+cxVAdq=hLPtymbc0XAag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] compiler_attributes.h: cleanups for GCC 4.9+
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 22, 2021 at 1:18 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Since
> commit 6ec4476ac825 ("Raise gcc version requirement to 4.9")
> we no longer support building the kernel with GCC 4.8; drop the
> preprocess checks for __GNUC_MINOR__ version. It's implied that if
> __GNUC_MAJOR__ is 4, then the only supported version of __GNUC_MINOR__
> left is 9.

Yeah, I was waiting for the raise to 5.x to remove the entire block,
but this is of course good since we did not get that yet :-)

    Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
