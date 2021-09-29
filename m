Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155E641CFF9
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Sep 2021 01:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347142AbhI2Xam (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 19:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347252AbhI2Xam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 19:30:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E4FC06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 16:29:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u18so17449314lfd.12
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 16:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wu7M9DqJBeP0nkRCi2RNd2jpALrZarew4V0B2j/Hy5M=;
        b=bhHpZyvcnjj667ISJMLub0celi+kt+zVqfIzcCPfZukUu5XefTPXRfdWC8knj6kXPc
         jgMg2WV5OIO31aRDSyVX4N6krkVbNHuqKLNa4W/V101X8LhdVflUZwttL6myDyzVAHJM
         XI3kq/uqBUUwVKgeHOH6PKPwESm35JtMrexfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wu7M9DqJBeP0nkRCi2RNd2jpALrZarew4V0B2j/Hy5M=;
        b=XplgQv+l1NOL8JHhA/FkcxfZOILkaJmiSaPpeBlvoK2GV/p1m9xOhPHceFWxv8XzT4
         4jww3mL3OMsRTr6OTR24Z+I8j1TKwFsl2nPKYDyhwzDHftMptSjHtmn8CCte4eLUWLmD
         xlDrvxSCvTpltWE7flCeWsbE+ZY+CLqonHRMHWa2cjTUoI+5qXp+E2bygc0gNTNTaDCl
         f3hICFsI3Dv8FsTVbAJxVOsLJ8SfuiadmxyZqQO1LlPBLtwEraXHW+gjNovIU0aOXgI2
         H6C9Sr0vzRk+stgSQgb9LZSZGsrGbQeK2KyN8vYIA2SPy1DJKk/nyxb02a+ZB/xbT1Yt
         Jrig==
X-Gm-Message-State: AOAM532uPTwD+Teau9SHFkPgK8Js57RNsmne/ZmUwD6RcqRln0MFjpNj
        Fc+gIB4wgpt1kaKPJaqCnkrDYnAf9nD8LkAy70I=
X-Google-Smtp-Source: ABdhPJwBB6CEw8xyKm5ip9K7CBp8ommamhrmASc2zz8ygXsi4pgutHbLEZ2gQHrI9Os1HtkaZ7LfSQ==
X-Received: by 2002:a2e:d19:: with SMTP id 25mr2628166ljn.167.1632958138335;
        Wed, 29 Sep 2021 16:28:58 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id n7sm148503lft.309.2021.09.29.16.28.56
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 16:28:57 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id u18so17448930lfd.12
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 16:28:56 -0700 (PDT)
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr2701754ljb.31.1632958136150;
 Wed, 29 Sep 2021 16:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
In-Reply-To: <20210929225850.3889950-1-ndesaulniers@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Sep 2021 16:28:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
Message-ID: <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 29, 2021 at 3:59 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> +static const struct secref_exception secref_allowlist[] = {
> +       { .fromsym = "__first_node", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "__next_node", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "__nodes_weight", .tosym = "numa_nodes_parsed" },
> +       { .fromsym = "early_get_smp_config", .tosym = "x86_init" },
> +       { .fromsym = "test_bit", .tosym = "numa_nodes_parsed" },
> +};

This list is basically made-up and random.

Why did those functions not get inlined? Wouldn't it be better to make
them always-inline?

Or, like in at least the early_get_smp_config() case, just make it be
marked __init, so that if it doesn't get inlined it gets the right
section?

It seems silly to add random source mappings to a checking program.

It was bad for the gcc constprop hack, but at least there it was a
clear case of "this inlining failed". This ad-hoc list has cases of
things that are clearly wrong in general ("test_bit()" must not use
initdata), and that "ok, the function just doesn't have the right
section marker.

(All of get_smp_config/early_get_smp_config/find_smp_config should be
__init, since they most definitely cannot work after __init time - but
why a compiler doesn't just inline them when they are one single
indirect call, I don't really get)

         Linus
