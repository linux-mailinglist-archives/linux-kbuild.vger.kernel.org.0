Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298776536D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Dec 2022 20:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbiLUTIZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Dec 2022 14:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiLUTIY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Dec 2022 14:08:24 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A3E205C3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 11:08:22 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id x11so14399592qtv.13
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 11:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn+t8qDtNQ9Zc5y1ZpPtqZOcEJkis56LzveCTgnEvi8=;
        b=VG2RhAC4GerNWJVwD5eJK2dJtjzxa5jl2ZE1QCuq5JVGE55Nw9FULecqOtzxRwYK6X
         6x1WsybFrqNdJhT41JDls6OTcVcDuZilELmRIQWqu4uWpTYScMFpjXEAVirA2mY2wWZC
         BFqQ0e6nDcmL/pH5o0U4mrpND+AVZUnqI15hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qn+t8qDtNQ9Zc5y1ZpPtqZOcEJkis56LzveCTgnEvi8=;
        b=ymodst1v45kGWn4Sw7v9npc7c8H2e3N2/8Z1zSG6sjj4DpSyuWIqytDfZ6hSPxkgfy
         mEshCiCy4E2SHeGt0jP5WrYTRbd3rE7JV6OtavnB2NfhWqFGFZ1fuzlIS/mjmQTTME0b
         DjaflQGcSmOCeagwdzqgOGsrpmGoJZ0bxcvt3bcqvkDnk2VnzVgkgw4BpKHYZSm8suQD
         Utf1hbTJNOdLHzrhKNVZntK5WjwJ5oKm7QJT2i8WQyMd33U3BoKdmWjK4VreBD/SUp6h
         YjRKt0BZ/VLTHFB610I18WC0x5NV63SgnS6ezh3adsIs39N5VJGtq/shILvONVIKNSIt
         hI9g==
X-Gm-Message-State: AFqh2kpXrBUy0QDfAPuT9XsociUKSeBxN8SWzIUsl7QS9sLxJhNcCUE0
        c3oNX4LkGWHjA/1oU6IdnrpYiAjjTqN6gkgv
X-Google-Smtp-Source: AMrXdXveFUwTc/QN7xEuU6QBmNza/CJrSL+zpepgvp7wa6gP/5AflzyU1HVZBnDaMpuXj+3Lm+0jIg==
X-Received: by 2002:a05:622a:8c8:b0:3a5:7d:3673 with SMTP id i8-20020a05622a08c800b003a5007d3673mr3749323qte.1.1671649702063;
        Wed, 21 Dec 2022 11:08:22 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id bq17-20020a05622a1c1100b00397e97baa96sm9575293qtb.0.2022.12.21.11.08.21
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:08:21 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id pv25so10947942qvb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Dec 2022 11:08:21 -0800 (PST)
X-Received: by 2002:a05:6214:1185:b0:4c6:608c:6b2c with SMTP id
 t5-20020a056214118500b004c6608c6b2cmr133347qvv.130.1671649701297; Wed, 21 Dec
 2022 11:08:21 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
 <20221221171922.GA2470607@roeck-us.net> <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
In-Reply-To: <CAHk-=wjOcqWxpUUrWKLKznRg-HXxRn1AXLW9B6SPq-ioLObdjw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 21 Dec 2022 11:08:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiL2njz3b-_jY7iSJ15eu-9Drb4TOyPdd0cJ=kk_RQEvg@mail.gmail.com>
Message-ID: <CAHk-=wiL2njz3b-_jY7iSJ15eu-9Drb4TOyPdd0cJ=kk_RQEvg@mail.gmail.com>
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

On Wed, Dec 21, 2022 at 10:46 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But it looked very obvious indeed, and I hate having buggy code that
> is architecture-specific when we have generic code that isn't buggy.

Side note: we have an x86-64 implementation that looks fine (but not
really noticeably better than the generic one) that is based on the
'return subtraction' model. But it seems to get it right.

And we have a 32-bit x86 assembly thing that is based on 'rep scasb',
that then uses the carry bit to also get things right.

That 32-bit asm goes back to Linux 0.01 (with some changes since to
use "sbbl+or" instead of a conditional neg). I was playing around a
lot with the 'rep' instructions back when, since it was all part of
"learn the instruction set" for me.

Both of them should probably be removed as pointless too, but they
don't seem actively buggy.

               Linus
