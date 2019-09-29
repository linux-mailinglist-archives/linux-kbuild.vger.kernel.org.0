Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC995C166C
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2019 19:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfI2RAO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Sep 2019 13:00:14 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42394 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfI2RAN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Sep 2019 13:00:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so6990556lje.9
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Sep 2019 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RNDoutGDvOZvHTVduDc/xowF3Yl3vCcT50+XRcdHU+4=;
        b=a9TpzaH3q3HwmagNzHo1UyLPfKUrFN8tPFY8I1+plKnNTY1e10w+JBEJFpaTuRBvRW
         W2yIcI3Xrultoz6vVXOdWNqGlQo+iCB6FGJsrDMifCWX1Qms3kf26i2WdF88FE2sIvJA
         AEgkWZvERAKYAY8SVcmU5Emsf3IfqPwGrj15g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RNDoutGDvOZvHTVduDc/xowF3Yl3vCcT50+XRcdHU+4=;
        b=SAwN9ui3KFbpss0VUAkI9Ec4MW6R0b928qBL60n7vJxdd8t6/RBqPo9Ea+v6WxwHo2
         GNGYcKAGgkuRj0kvKAHEuFpRlqWIo0aVLH61QlRl+kaZyyjq78ydQnDIuq7VAZZ0HARh
         oW4wUVl9EtzopEM0/9IXjIEwwrMyG2Jn7rMuFf5xdEkeQTRxCg6crJrtYGrO9DWXQa1I
         OV6afTFiPsfqeMMDpKcfZABEht/MU7CtfOexHnyJ/bSa7oQ5gGfnNagDhEHLLR5GmWQQ
         ncrrX3J+JQ4oMt56imkm7ZFlaSvk3gECwZIiI+vtqLBtG0Ygn0H3Y1yUGxMAOA461gM8
         CeIw==
X-Gm-Message-State: APjAAAVoY0mq05u3v50FMLMAPe3EtwV85YFC2QceS6QiAp2XNm2uqIkE
        s1HSelhQqzzFkxOtvcVRgko0KIzrpbA=
X-Google-Smtp-Source: APXvYqwaTHsrUOPI566uQphBGrtkJT/SFGOGsc0luFy9gK+LWguBM6+7gkjxaqY4L+EJTiK8AF/p3Q==
X-Received: by 2002:a05:651c:22a:: with SMTP id z10mr9170887ljn.103.1569776411418;
        Sun, 29 Sep 2019 10:00:11 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id y8sm2444354ljh.21.2019.09.29.10.00.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2019 10:00:10 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id a22so7047887ljd.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Sep 2019 10:00:10 -0700 (PDT)
X-Received: by 2002:a2e:3e07:: with SMTP id l7mr9326176lja.180.1569776410194;
 Sun, 29 Sep 2019 10:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
 <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com> <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
In-Reply-To: <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 29 Sep 2019 09:59:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhKeCH+yGOmHk_2v8GY2EHwXboSS6R-Jov63JHat21XQ@mail.gmail.com>
Message-ID: <CAHk-=wjhKeCH+yGOmHk_2v8GY2EHwXboSS6R-Jov63JHat21XQ@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.4-rc1
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 28, 2019 at 9:00 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The concept of header test is to make sure every header
> is self-contained,

Yes, I realize. But at the same time the filenames it creates are very
annoying and clutter up the tree, and I'm not sure we really want that
in the first place.

The thing _I_ would want is actually a lot less includes, and a lot
more streamlined, just for better build times. I sometimes get a small
pull, and wonder why the *whole* tree recompiles, and realize that
it's due to some really obscure header file that just gets included
"in case".

So I'd like us to be stricter about header files another way entirely,
and I'm not sure that header files should need to be completely
independent.

> Of course, you can argue that it is addressing hypothetical issues
> "what if the include directives are arranged in this order?",
> that nobody has been hit before.

Well, I think people hit it all the time but just add the right header
file when some build fails.

In a perfect world, we'd have something that understands what symbols
get declared in each header file, and what symbols each header file
needs, and have a SAT solver for this that actually also understands
about different configurations and architectures. And actually
minimize the headers, and have a tool that warns when you have
unnecessary ones - or are lacking some.

Yeah, it's probably too complex to be worth the pain, but it would be lovely.

> But, at least, I want to continue compile-testing
> uapi headers that are exported to user-space.

I think the uapi headers have a much stronger case for being
self-sufficient, but even there I'd really prefer some other model
than "*.h.s".

We have the dot-files for dependencies and for tracking the command
that was used to generate them, I'd much rather have that. At least
then we wouldn't uglify the directory structure.

Yea, I realize that some people "solve" that problem by just not
building in the source-tree at all, but I find that annoying too.

               Linus
