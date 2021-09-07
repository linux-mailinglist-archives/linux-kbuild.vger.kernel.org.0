Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8324030D2
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347442AbhIGWTm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241562AbhIGWTl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:19:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833B8C061575
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Sep 2021 15:18:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y34so734846lfa.8
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Sep 2021 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0zmMnIiAhcfycStlfZRMWh53/bzZhPDg9yKAX8nkCc=;
        b=cNF0wdQ/TI780fTJbXH+7PorV+kNufKENvngWCa75x9+fsFjdodc8BLriyvTsCTO8U
         3xhHhbhNl3mJ8vyi986ZALpOUaKDIIiRRrmudAYEM+8oj2aPJHDjMPeTyMLxFH9iIA3K
         h4nrgFG911smxfTzCOCLFHotIQtnlmu1V6DQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0zmMnIiAhcfycStlfZRMWh53/bzZhPDg9yKAX8nkCc=;
        b=pm4H4x7jaUdsoGEkfZknGr9mp+0+pTylKN2N3t8T/nKyAvKL17PGYrXDyiHwYY5ZVe
         MgzF5TvMR1yF8iKY98lp+GEBfVmnGQBgJDWpTCq2ylvZ4Z29+NnR2TkPysOdVh68bbXA
         ou/Iquv8OrurMNTSjgy8hz0YRLpDfSkOPjfzpPnNKJm9YNfMws3DWIkzajbEQoWcJYAU
         4yH7zQQCuSoI3aCyLNWPzhxep4EpaQUVGX6F3sTRosMKMDHDSXmv3uz6YSSb8L/9um0I
         iUYqGll4E/MGXs8y6dlTpxGsoMFgsJESMMwRB6cHxBddCaf/Fkw+TpElP4qZWOiUzK1I
         EypA==
X-Gm-Message-State: AOAM532wi92Cl922SE/Z5YDFWM3KImq4hO1q+VUPgsslayohQ/XhHTjC
        Wqi/P0J3LT6Llvk69NtjrLiMqg619VxvPSQL5HE=
X-Google-Smtp-Source: ABdhPJz5W8IcFd2I2KsYq9roQSxnYVfDfrErW2kv8/4ExJ1SALX5sGFh1nRCFP0A4cLmC2jV0IOMMA==
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr412968lfe.209.1631053111828;
        Tue, 07 Sep 2021 15:18:31 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id b18sm19603lfp.290.2021.09.07.15.18.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 15:18:31 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id m28so743129lfj.6
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Sep 2021 15:18:30 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr426102lfv.655.1631053110042;
 Tue, 07 Sep 2021 15:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com> <YTfkO2PdnBXQXvsm@elver.google.com>
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Sep 2021 15:18:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
Message-ID: <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To:     Marco Elver <elver@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 3:14 PM Marco Elver <elver@google.com> wrote:
>
>
>  config WERROR
>         bool "Compile the kernel with warnings as errors"
> -       default y
> +       default COMPILE_TEST

That seems reasonable. It very much is about build-testing.

              Linus
