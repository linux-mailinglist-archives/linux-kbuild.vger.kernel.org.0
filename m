Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0049B65367F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Dec 2022 19:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbiLUSq3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Dec 2022 13:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbiLUSq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Dec 2022 13:46:28 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FE9E088
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 10:46:27 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id pv25so10906944qvb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 10:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sODeRBjvPETeUrYPz7JbnedMQB/IxCocAx1FoaszTU=;
        b=Wy0Sz3Rojhc+tOVGf8KvjRmRjEZJqCHd1i96YwhlFe4AQJBhrynZfO6wMunqOJzcXp
         OtAxmPiWamNa669nglrJtYL1LY751fImTMMRlSeC3y0bx2EEI6E+E52yb1KBO5mdAHbC
         maEreRZaysRS4E6MKmemJDVUZ/OrXE9mHf/EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sODeRBjvPETeUrYPz7JbnedMQB/IxCocAx1FoaszTU=;
        b=Hx45O1xosYV3Yf+2bi+qmQXsyweZZbh5drpQCpJZ/7R9mqKWTr7z1IroqUiGQWvy04
         u1ap+Jh77BaNR2uUOEvnf4EkP8Du3Wd3BSZ3V/5kKj9dHexr5vx4Kz+S+u9yLvTMMDgS
         L0NmmyYej1DwwJCyD2Xgk6mbQ7us70VJvUhB133PfeqLB/EGE49uy7xdXe0dW+++uU0Z
         2l26ntCB+HBLW/B/dpQbIhnEgvxx6PJ3LQpmPwN8KLWhmGXGxy6cdBc9s4TkK7tCio1+
         diRv0AGIm/smQtIwSLL8ADmlcoIaobSAYhJfB/ABLjLFzYlrlNwuAIEvQSgTdQgi0hBS
         W7fg==
X-Gm-Message-State: AFqh2kp3lMoC58vKzhv7aZbkBCy03GLOURvzrfZu+vfuyOb0IQjA5F+F
        4CxRdQFqaNXUUyf0EuF78pnxdmdF/qyLsfEP
X-Google-Smtp-Source: AMrXdXuuM7r4lxWp3q6hXUhdNnx3yHu4SJGYrhfs8ddZjD+0NKbPlsYGcvpJuWujpof2+PRnwJs1jQ==
X-Received: by 2002:a0c:fe64:0:b0:51e:e977:8b80 with SMTP id b4-20020a0cfe64000000b0051ee9778b80mr3594569qvv.29.1671648386048;
        Wed, 21 Dec 2022 10:46:26 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id s81-20020a37a954000000b006eeb3165554sm11018022qke.19.2022.12.21.10.46.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 10:46:25 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id jr11so14367387qtb.7
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 10:46:24 -0800 (PST)
X-Received: by 2002:ac8:4e26:0:b0:3a7:648d:23d4 with SMTP id
 d6-20020ac84e26000000b003a7648d23d4mr140158qtw.180.1671648384706; Wed, 21 Dec
 2022 10:46:24 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com> <20221221171922.GA2470607@roeck-us.net>
In-Reply-To: <20221221171922.GA2470607@roeck-us.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Dec 2022 10:46:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
Message-ID: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 21, 2022 at 9:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Dec 21, 2022 at 09:06:41AM -0800, Linus Torvalds wrote:
> >
> > I think the real fix is to just remove that broken implementation
> > entirely, and rely on the generic one.
>
> Perfectly fine with me.

That got pushed out as commit 7c0846125358 ("m68k: remove broken
strcmp implementation") but it's obviously entirely untested. I don't
do m68k cross-compiles, much less boot tests.

Just FYI for everybody - I may have screwed something up for some very
non-obvious reason.

But it looked very obvious indeed, and I hate having buggy code that
is architecture-specific when we have generic code that isn't buggy.

                   Linus
