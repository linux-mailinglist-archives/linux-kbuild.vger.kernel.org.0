Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4331429592
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Oct 2021 19:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhJKR0M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 13:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbhJKR0M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 13:26:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CF0C061570
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Oct 2021 10:24:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y26so77350689lfa.11
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Oct 2021 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nu4G/4LFT2B+dN7Ud24heVwfxO4x4OPVUBz/3Y6zfcc=;
        b=EUjn8oMwIJr6hI/Bj9RHyQtE8rNarSGeAJzHLDRlf0gs56UilEaSyWlLkJkqtHPbXs
         ZEODFTtC/dQJ5P8HlTZ1hq6XDtsIsYJirGNPl2h8K1eNe9bIivfDbjjYmAfIe3Q5fZAU
         O6taffpbbG7GOh8ZSbzYa1GAvKvy+aZgoj7QJkSX0v56ptHUMjXpUKrA9FXnQpjapUyb
         6ehm8hxJJwznPBHD7rrBhXrHkHfIE+hzuNQ5rZAlJtPEbnFA/y3jGQ1YwicY40J/NweQ
         YXADeHg47bCpGEvT/Ug3U/QSUMUuwIBm/d6R+zxmKWJse000kTWSS4znRTrxelOAg85V
         fC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nu4G/4LFT2B+dN7Ud24heVwfxO4x4OPVUBz/3Y6zfcc=;
        b=BKN5P5x1UR9ZClqrRCsNcGnrYSWWbM4NTjxyyr6MguwoSJB2JVYDoU/tkFizcBnfmn
         nlWI68h7Ug7hHN5YjGcBofbaeDQ77d4tA/oTtCZ9Dv6XEQg45SF583XQ/x7QOAI9nGTs
         zaVpCs5pHj8ScspUzVfEg6xKtBo2XnZS8IDTypnm9a0p5qCAh12uqe4elV+X/Jelxwfk
         RjRHWq0N8KyeX6g76Oyq9moGGNDPFFmCoSFw/Fx7Lp6k1UQbicsrRt0TLYddsnoDnh2t
         DWoFCPoQMsq65fBpZN8tcIrjlwEaSlJNcyExAJs/7wvT+xX0ofIriYvkU7e0bx3ni4ZR
         IgbQ==
X-Gm-Message-State: AOAM531HDax/m4lk4ixRAWBDYdUYYKXbaHfAavvzCCAXXjNAsgYueqch
        dKRm9vzaOgjk3httO0if9TQzBoKkHiOOa230vhXdQQ==
X-Google-Smtp-Source: ABdhPJx8Wmu1eFUyMMOc2Y6/MLpi/jVTxrWxVNHptlry0/segS30TKqsljF5elMMFSgFv2p74FpCXhrQjYRj5WhX7lE=
X-Received: by 2002:a19:6a16:: with SMTP id u22mr29139566lfu.444.1633973049612;
 Mon, 11 Oct 2021 10:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <1633878992-32884-1-git-send-email-ashimida@linux.alibaba.com>
 <CANiq72nBqiyrcaW47ZW-6i7zJ6HrmjZWSOr==HkEuBR5rXmpdQ@mail.gmail.com> <a25b9286-fc1f-d398-150c-ce073eadc6c1@linux.alibaba.com>
In-Reply-To: <a25b9286-fc1f-d398-150c-ce073eadc6c1@linux.alibaba.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 11 Oct 2021 10:23:57 -0700
Message-ID: <CAKwvOd=D=UvGfHjEyeYPk3c=ksg9mF8nUX-9jyJhkX8QbugMSQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH V2]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>, frederic@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, yifeifz2@illinois.edu,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, andreyknvl@gmail.com,
        Colin King <colin.king@canonical.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hardening@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 11, 2021 at 8:42 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>
>
>
> On 10/10/21 11:43 PM, Miguel Ojeda wrote:
> > On Sun, Oct 10, 2021 at 5:16 PM Dan Li <ashimida@linux.alibaba.com> wrote:
> >>
> >> -         This option enables Clang's Shadow Call Stack, which uses a
> >> -         shadow stack to protect function return addresses from being
> >> -         overwritten by an attacker. More information can be found in
> >> -         Clang's documentation:
> >> +         This option enables Clang/GCC plugin's Shadow Call Stack, which
> >> +         uses a shadow stack to protect function return addresses from
> >> +         being overwritten by an attacker. More information can be found
> >> +         in Clang's documentation:
> >
> > Perhaps it could be worded in a better way? It sounds like it is a
> > custom plugin for Clang as well, e.g.:
> >
> >      This option enables Shadow Call Stack (in the case of GCC, as a plugin),
> >
> > Cheers,
> > Miguel
> >
>
> Thanks Miguel.
>
> How about writing like this:
> This option enables Shadow Call Stack (supported as a compiler option in
> the case of clang, supported as a plugin in the case of gcc), which uses
> a shadow stack to ...

That sounds reasonable.

One question I have Dan, what is your sense for getting this feature
landed upstream in GCC proper?  It's neat to be able to use plugins to
support older versions of a compiler than when the feature initially
lands; I was curious if you're working to submit this into GCC as
well?  I didn't see anything in GCC's bug tracker for "shadow call
stack," but maybe there's a different feature bug tracking this?
-- 
Thanks,
~Nick Desaulniers
