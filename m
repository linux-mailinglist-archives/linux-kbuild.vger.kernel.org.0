Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C007479AB
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jul 2023 23:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjGDVpJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 17:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjGDVpI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 17:45:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32268E62
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jul 2023 14:45:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51d7f350758so7649163a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 14:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688507105; x=1691099105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lTzqTcLNdQWHGk/4LwYDzV1l/9yOlLZxSySpuQU5rrc=;
        b=PpEQwno00coGbfBGQEFiMDtNotaPQDKAHs+KadR8ibcEcolKTpYiocVARsC3mv2jra
         Tm0tk1xrvRirVN4IsNfgcfAYZmPvG7ABTLmjXfaxvgUAP1supyq8TVmp7lF7PmBNQ0fw
         BdjttO5YKgjUO7RkgjdByCGQbFps8+JArQ9Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688507105; x=1691099105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTzqTcLNdQWHGk/4LwYDzV1l/9yOlLZxSySpuQU5rrc=;
        b=DmA+8y0kYhtIJpsIJHY86i0PvUiqW4y7HPGj0zWj0g7e8EWGSuOOqiXeNzS8gEtk27
         MS3FIfxdMyWl7bWwgxW/nb4JfvtZz+R5NJkhDKmigu1YTJiueJmgZO6fW6vQjq0SWG2C
         ZgOQ9lPsPZqXhL3sggXxizGhZElcNy/6spSJBzhXzyYDLKBhCO8ObrHSa25YwI7UBoW1
         UJd2TUh7HwRO+Dluzv6NGEnwtloFI7j7GUpQKn8c+bYWl+Ij5mNHDLvZtZ9GVeAs0JUa
         QjYBRXW1HrI027I8ynQ1JrrOPDYZYearNDykU0IPajzSHcdfNTDlkkqh7LFp+cXnbJXC
         8jLQ==
X-Gm-Message-State: ABy/qLZvaumNy68cnJBQB/9J1/L7sY1/pOde3PH9mPBqF6qvjbHpPFjv
        dmXqNbWtoTP8PaC18+AmCxF868K0qaxcj7f21mjh+gat
X-Google-Smtp-Source: APBJJlEs5a6B+n7JdWlQiLC4CoFQrad82OQkjfLKlieC+orxKc/IQ7Rbydv8Zb9RgHKYoTSs0+DKRg==
X-Received: by 2002:a05:6402:120f:b0:51d:dbeb:1b54 with SMTP id c15-20020a056402120f00b0051ddbeb1b54mr11263680edw.11.1688507105412;
        Tue, 04 Jul 2023 14:45:05 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id g23-20020aa7c597000000b0051df13f1d8fsm6217009edq.71.2023.07.04.14.45.04
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 14:45:04 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so7650792a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 14:45:04 -0700 (PDT)
X-Received: by 2002:aa7:c3d1:0:b0:51e:1095:5ae5 with SMTP id
 l17-20020aa7c3d1000000b0051e10955ae5mr4828868edr.8.1688507104103; Tue, 04 Jul
 2023 14:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
 <20230704211509.GA21834@1wt.eu> <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
 <20230704213415.GA21872@1wt.eu>
In-Reply-To: <20230704213415.GA21872@1wt.eu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jul 2023 14:44:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjPEjrB7eCukREhWu-0qfjbFD-K8sk1TYYRgeHzYr1tuQ@mail.gmail.com>
Message-ID: <CAHk-=wjPEjrB7eCukREhWu-0qfjbFD-K8sk1TYYRgeHzYr1tuQ@mail.gmail.com>
Subject: Re: Overly aggressive .gitignore file?
To:     Willy Tarreau <w@1wt.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 4 Jul 2023 at 14:34, Willy Tarreau <w@1wt.eu> wrote:
>
> But the git am completion rules should actually *not* rely on
> git status output. At least in my opinion.

Christ, Willy.

Where did I talk about git am completion rules?

b4 am DOES THE RIGHT THING.

Completion DOES THE RIGHT THING.

THOSE STUPID HISTORICAL TURDS IS THE PROBLEM.

And the reason those turds exist? Because I don't notice, BECAUSE GIT
STATUS DOESN'T TELL ME!

> Here I pressed [Tab] after "2023" and it automatically completed.

Go back and READ THE EMAIL ALREADY.

Let me quote the relevant part again:

** The reason it doesn't auto-complete ends up being that my kernel tree
** contains some other random stale mbx file from the _previous_ time I
** did that, because they effectively get hidden from "git status" etc by
** our .gitignore file.

so go and create an OLD STALE TURD that *ALSO* has that 2023-xyz name,
and now try again.

Notice how auto-completion doesn't work, because there are now
*multiple* files beginning with the same filename.

Auto-completion isn't smart enough to know "oh, he already committed
that old mbox file and I should ignore it".

And _I_ didn't notice until auto-complete failed, because our
".gitignore" file told all the infrastructure to - wait for it -
ignore that file.

So "git status" at no point gave me that helpful

   Untracked files:
     (use "git add <file>..." to include in what will be committed)
   2023xyzzy.mbx

output to let me know that "Oh, btw, you have that old turd in your tree".

Please. Read the email.

              Linus
