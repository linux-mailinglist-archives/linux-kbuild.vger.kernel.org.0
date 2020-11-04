Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0E2A5ADD
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgKDAFt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgKDAFs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:05:48 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F30C061A47
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 16:05:48 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 72so9078250pfv.7
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 16:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IDPVpMjjQxmT8T6bAuv5nGEF9Cscu1+LLKKWzkBSO0s=;
        b=R0wn1eCKGkIpdF7qPMDWF5Y9Lb9R6jSyf6aZRAPk7alVldWDSe6WLYFH7QJcvpVRpm
         D7Uh6sXlkwLfIzghi5mWA+Z/7XrrJT0Iq6QAIEDLibW6egy5U6Ee128wcKtYdNd9JlMM
         yRQgCt0QRnApGeusxYpJwHkb1DMFCIkH4SLvv/WD3WZEtYvurV6XVNpBEgG10mpABTgq
         5v4Sj5nZlvuQcLpjc0t76D6IsFMNUzqy4K2wKNK21U5z9DARW8Lgg+zxgDkrl5HhPMhp
         Y3NEOMCnJVFsVM8I4IT/y4mZiMratvIMIvIwtJA3qu5gDI5ILmOlQrA1A37nVxAO5wEz
         yyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IDPVpMjjQxmT8T6bAuv5nGEF9Cscu1+LLKKWzkBSO0s=;
        b=m6PCg5kGIR+ZcDVWXN//UjwlRGObilY/FhHVl5UWBGJRVl+FhEOjiXAJnw8hR8I/SF
         6+/d5SxsFx83m5NuEsbCR6uJJkPLuc4Eo7KQ+fD1mzgS1d7BDENmdxbFOCcYmw7gpgYA
         m40IiCkxI/JH0nnGY0fMfNVVGwz86+2AvrWbEzrHp16iAP7WcfYO3QYIU+ukseBIyU6y
         Ec64+swKDAv2fOvBO06VHzifg6gQfNpwAcZLdulc9ghD4AYxfL/OAM55YWMqGWcIDei4
         UWhoWumDhyEvUB9x8V8SwXvcZbRB93WnQmsd65NWeJGexagKg1XxFzbJl9Por0Zu7Wih
         MzMA==
X-Gm-Message-State: AOAM530P8Snecjl9R14PcIGUORoZUuGza0wlCkjtQ1pPXgsU9+UnZBzt
        TrGpbjAnx/CfhR1Vlcrjz9xdMVpwQriy0oR/v0YJOQ==
X-Google-Smtp-Source: ABdhPJx0JWeFLR32JFqyWMucOaCuuoT6BwNLjsxdj20SI+yVYY/HHcBG6kAPgHnBrdZbPJLKe90CxK/dZv7AsQA7ooA=
X-Received: by 2002:a17:90a:6b04:: with SMTP id v4mr1725520pjj.101.1604448347880;
 Tue, 03 Nov 2020 16:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com> <20201104000016.GA2399651@rani.riverdale.lan>
In-Reply-To: <20201104000016.GA2399651@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Nov 2020 16:05:36 -0800
Message-ID: <CAKwvOdnFstgMa3c+=Vo=QtFYsABDekVeddcPmP=8Pn2bqWfxpg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 3, 2020 at 4:00 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Wed, Oct 21, 2020 at 06:21:06PM -0700, Nick Desaulniers wrote:
> > Further -gdwarf-X where X is an unsupported value doesn't
> > produce an error in $(CC).
>
> Do you have more details here? On godbolt.org, gcc does report an error
> for unsupported dwarf versions.
>
> https://godbolt.org/z/G35798
>
> gcc does not seem to pass the -gdwarf-* options to the assembler when
> compiling C source. For assembler, gcc will pass an appropriate option
> depending on the version of binutils it was configured with: if the
> assembler doesn't support dwarf-5 it can call it with --gdwarf2 for eg.
>
> If the user is using a properly configured toolchain it doesn't look
> like it should be an issue to just use cc-option?

I wrote the base patch back in May, and didn't revisit until recently.
I could have sworn the cc-option silently failed for the check
cc-option does, which is /dev/null input.  I need to recheck that, but
it doesn't hurt to simply include it for now, which I've done in a v2
I'm about to send.
-- 
Thanks,
~Nick Desaulniers
