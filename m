Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4F1400C40
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 19:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237150AbhIDRXs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 13:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbhIDRXr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 13:23:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28BCC061757
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Sep 2021 10:22:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t12so4767318lfg.9
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98jOqbKpX72E4sPthsn4i3f66mKPjIJDIcd25lirePI=;
        b=eG78AXkrvMPYFu6Gt5/vrTdbimFDR9TXxplLlMw1nHmpyJUrQcTh/9wCJeHztK4N/O
         YH6b6mzsWGz7vhhhzfSL8IebU3Rub4K0pwZno/LNvT//BotGevQQBUiOT3pV0qZM6otl
         SWBcPAB7k8Xg5RezMwEmNMsTPJcn+HxEyK5cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98jOqbKpX72E4sPthsn4i3f66mKPjIJDIcd25lirePI=;
        b=cM2FDO+ImXxfolSOo6nKyviYaTuLJEuASQ9k6tengeCoqZecDYNfmQJ5tuMfSrUcAc
         JyhcjALIyXyEkjT+z6jQpCX4dS04PZDFgdOxSwhmGcnnGLTDganhLd3NRQnH2zmng1lJ
         0e1WZPJZLSPUI8sn+b6bf21YI0fdv/I+c7DE5mpe4tUcBoHdiBj/dO8CMDdnCauXVx3/
         CVFp5OVJSmMwMzD0u+a3UUjDufYMcFhnjpWJvP1Gx3iuKa4tVyNl7WFKBCCU/RjV8woX
         +2wBc6qTSFZjW+3mCrsmku3c5ACY5BDKEz7+gqAbb7fV1STfxSUyreEGpAP08kW0MIYM
         vi0A==
X-Gm-Message-State: AOAM531YRZAbZ9jV7edfP8aEOCgorTYPIT3YL6HqRs45zTt2+xdE5zF5
        vaWJILs6Y6WcSw6+Pn7eBQMMzaNh8jGB4rWF
X-Google-Smtp-Source: ABdhPJz611VVxTyFGLwAUWOLr5i94UYxjCSslOp9lT0JQ6mc1mHmoCOCE+EOXvcf9kSnUiL5BagjGA==
X-Received: by 2002:a05:6512:2294:: with SMTP id f20mr3767730lfu.431.1630776163337;
        Sat, 04 Sep 2021 10:22:43 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id u3sm295054lju.107.2021.09.04.10.22.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 10:22:42 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id s12so3900233ljg.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Sep 2021 10:22:41 -0700 (PDT)
X-Received: by 2002:a2e:a363:: with SMTP id i3mr3513230ljn.56.1630776161685;
 Sat, 04 Sep 2021 10:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
In-Reply-To: <871r644bd2.fsf@oldenburg.str.redhat.com>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Sat, 4 Sep 2021 10:22:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Message-ID: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Florian Weimer <fweimer@redhat.com>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
>
> In any case, it would be nice to know what the real motivation is.

I don't know about the original motivation, but the reason I like that
patch after-the-fact is that I've actually been in situations where I
test out self-built compilers without installing them.

Then it's convenient to have a completely standalone kernel tree.

Nobody cares about things like <stdatomic.h> They are completely
irrelevant for the kernel, exactly because we've always just done our
own, or used __builtin_xyz() for things.

<stdarg.h> is the only actual core header file that we have always
taken from the installed system headers - because historically it
really was required. Everything else we can just do ourselves.

                 Linus
