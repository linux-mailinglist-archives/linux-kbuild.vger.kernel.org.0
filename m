Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F257308026
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhA1VE2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhA1VER (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:04:17 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D30C061756
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:03:36 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r14so8067935ljc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jdDuCRzkz9xp+XJsVq7mYn0DfZeI0K4LQW2Z/nEcmQg=;
        b=CuBesJ1LP2UaDvKAEEK9ty4JNIugW6e5APVFSm9E7fiJHWA1KPAf2iH8izI6RoPs65
         G836VUTI89SC+kl1ZPl9l4OgX/cECS+G1kYkfmV/UQBF0i1mf5GuGzIwbuCYArHK+FB6
         knl7IYoNkyPRHrFhmo03wZoUvIqYUTzW/LwZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jdDuCRzkz9xp+XJsVq7mYn0DfZeI0K4LQW2Z/nEcmQg=;
        b=SfAj3h8xu7j7N2VvPwwJRfFXhpCFc2JsUj0QulzGSlVvR+Ztmq0YsT0tzye55xKLGU
         6dSAnDx+VBYaMPIQgn9CToGlqcKNpjfVmNVHjHuynWxabP31TExM3VTLctkBIBclWRlb
         PS6nSeqL+YuTuBdP997k6s+GT3KVz1QR2PAnsvc5oXFbYaOiSKtErior6r+Oy6tKS2di
         v/NGeTsPYuQHTHdwLGsEmf/ccltqWNDsb+CdYSRC73gd8VwUeR4/xLO9DGB2JIflArZT
         Hoq9wCG2N9pjrwtI5CIEZQgFO1iSXZ67aTmg9SytUAoOKusV40v9/l/MIkovBywTZ4Gr
         DZjA==
X-Gm-Message-State: AOAM531k8Vwd9/JelckNIJaM3dIch8g0c8W0izDbKfgMW68ez1uklYxZ
        YmQKtXqrLmMVA+EunWQE3/3YlQyLByYk1g==
X-Google-Smtp-Source: ABdhPJy6edX5ZarUuqMI5T0Oe+Or8WXbQQmPItlFAaxYSbA/vCZ97vGDIKsVdRhVkPRRlVnlnUPLqw==
X-Received: by 2002:a2e:5814:: with SMTP id m20mr657835ljb.288.1611867814785;
        Thu, 28 Jan 2021 13:03:34 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id s28sm2241048ljo.26.2021.01.28.13.03.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 13:03:33 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id q8so9474710lfm.10
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:03:32 -0800 (PST)
X-Received: by 2002:ac2:420a:: with SMTP id y10mr424761lfh.377.1611867812567;
 Thu, 28 Jan 2021 13:03:32 -0800 (PST)
MIME-Version: 1.0
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com> <20210128205207.awdbh4bmx56pxxjl@treble>
In-Reply-To: <20210128205207.awdbh4bmx56pxxjl@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 28 Jan 2021 13:03:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
Message-ID: <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 12:52 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Huh?  Why would you do a "make oldconfig" on a distro-released kernel
> before building an OOT module?

I guarantee you that this patch will *make* people do that.

> Hm?  Are you saying the check is too strict, since GCC9 binaries _might_
> be compatible with GCC10?

I'm saying that your argument about minor and major versions is bogus.

There is absolutely nothing that makes gcc9 object files not
compatible with gcc10.

And this is not just some theoretical issue: this is a fundamental
fact of EVERY SINGLE LIBRARY OUT THERE.

Do you think that when you compile your binaries with gcc-10, you need
to link against a standard library that has been compiled with gcc-10?

I really think the whole compiler version check is purely voodoo programming.

                 Linus
