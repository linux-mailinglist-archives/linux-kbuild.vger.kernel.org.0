Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F58435F07
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 12:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhJUKaq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 06:30:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhJUKah (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 06:30:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 874596120C;
        Thu, 21 Oct 2021 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634812101;
        bh=XZqwcRi8eGbcHfTa8FsBo0CyV+VMmanZEXSL34v2xNA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LSIZboXeBiM2XeY8Wt+EdS5vzOT0y1ZBbT9bRqQsj3JP7BP/yWGDJFdQJDSckB09B
         7uqGgy/9ZJHs5HkWP1mzK+b4YDPzJqFGxOwtsNXcSuJd++RJzuPnbSBghUV5uvPrQr
         48FXQ0hb3XPEUFdAkHZ8go/OfpfNzL7Oi+qwtMWOwsIoe54SPCBCf3WNrap+GInr0V
         yGABj0eWy+Oy4uHPhX+84IqzwjRnnFriSooLwDn9DdP3ldmXSfRxTG8Sqpob+snAai
         xloBuBSX8vt6kna/4iXumpsepFj39VfqjUz5ICYwwc7ll2r4XouRi6EbQQOqDpLgmh
         FssfdAsIY4+8g==
Received: by mail-oi1-f170.google.com with SMTP id o83so295125oif.4;
        Thu, 21 Oct 2021 03:28:21 -0700 (PDT)
X-Gm-Message-State: AOAM532DDyVNWD56Lze+VMe2j0wrKXyHFoz1vzJF7HGTawJ3pxUd+IoB
        fsnsREcnrxDYexSext4MlwHcM8cep6MuXn6B43k=
X-Google-Smtp-Source: ABdhPJwJS57ISbZcVKqBAD81WN0NdiqSiFCaDg4V8so9PFGuh1YHfNT+etwlr7CUC37Bkxt5mEwG0tXwsqwrLAT+eTk=
X-Received: by 2002:aca:4bc4:: with SMTP id y187mr3602617oia.174.1634812100804;
 Thu, 21 Oct 2021 03:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-1-keescook@chromium.org>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 21 Oct 2021 12:28:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEw2P+Q2Nd-+vf6U5apx+v5Q4TTW6y0m-MFaB1O2OAehQ@mail.gmail.com>
Message-ID: <CAMj1kXEw2P+Q2Nd-+vf6U5apx+v5Q4TTW6y0m-MFaB1O2OAehQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Li <ashimida@linux.alibaba.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 20 Oct 2021 at 19:35, Kees Cook <keescook@chromium.org> wrote:
>
> Hi,
>
> GCC plugins should only exist when some compiler feature needs to be
> proven but does not exist in either GCC nor Clang. For example, if a
> desired feature is already in Clang, it should be added to GCC upstream.
> Document this explicitly.
>
> I'll put this in -next unless there are objections. :)
>
> Thanks!
>
> -Kees
>
>
> Kees Cook (2):
>   gcc-plugins: Explicitly document purpose and deprecation schedule
>   gcc-plugins: Remove cyc_complexity
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
>  scripts/Makefile.gcc-plugins                |  2 -
>  scripts/gcc-plugins/Kconfig                 | 20 +-----
>  scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
>  security/Kconfig.hardening                  |  9 ++-
>  5 files changed, 34 insertions(+), 94 deletions(-)
>  delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c
>
> --
> 2.30.2
>
