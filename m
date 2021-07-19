Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76033CEFDF
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 01:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242370AbhGSWrW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jul 2021 18:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353883AbhGSUac (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jul 2021 16:30:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19364C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jul 2021 14:10:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q16so32543968lfa.5
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jul 2021 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zb6rr15bSXQwTnBPqI4g1KEDBlw35vq1tATeF4vahZQ=;
        b=l4zG9dD7D5TRbenNJfZXIawPdQYAmC+6KoVsGyDr8lFRRQ+nMV8zf6CakVJ74ozmx8
         vECyxqO5TWTiHtWqFoi+uLPJxjW6P+c6KohNly84YXa5LEl918+v52vTCL8MUc04Fkg0
         FidoisJjEXwrJEZGeYj2xyRBG8xrNKwGwp0Jy+L4vyThjoK5911PpAW4hJ2AglZOFbbS
         jBycTJKlXbwBTmY1x+4yXw8i/eg9P80H1wR6TilaCK4a5Xo+m4xCFix+wNVNQ9hnJRTD
         Rqkpss14DPkVkhN/ICpG16/LdrQfUh3SMEyfzYX8HNliUh5LEHcAarapfkhyJkKBbSHU
         nzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zb6rr15bSXQwTnBPqI4g1KEDBlw35vq1tATeF4vahZQ=;
        b=JwZcdKEpaBAXbVsBJoXFYPVpfLey1rOBguHpVI9Iuye9u5lGXD/Ma0gqtnUwNJucdb
         ug7kOLrnlBGFPePqkMqcyl51MQkJbnPtZu0meme3yQcyl0t4Iueds0CHiXj2b9hlYsS0
         4dbdjTbLYYwbbTLaFVJoMK8MIg9SovNIUOy7VvAMmVvGPFJKfp9jaFnOgvFdyxgm0d70
         wJeHb9syFstpghYmJouNqAXZ/aPW5MYDYo0qwgnYUnP3a17sCms3xvUwWRRw/29rDk2L
         w+slqfebRg+leyj1EIFiUHErVeMKR/ZxCLW57p2ohP3r6Cvk71Xv18DE2FCuSFkTG/hU
         jcmA==
X-Gm-Message-State: AOAM533XF3pou3Nr1XgxhH1aHENlKTmHdMd02WTuL8+YK9A6AjGDlcoD
        hDbPQQrUmW2kBwvgCFvdWfFG++cpAhbhtQmpkreh1A==
X-Google-Smtp-Source: ABdhPJy0PZFmXCRTMOqx4byvOHdwlSuCDhdl5z9Ba70UxfA55JfR5WyxqS2xZlcRCm5/igJgrDDjUGdXBJsIXwQbZD4=
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr20508306lfp.73.1626729043401;
 Mon, 19 Jul 2021 14:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
In-Reply-To: <20210707224310.1403944-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Jul 2021 14:10:32 -0700
Message-ID: <CAKwvOdnG-E8HpK9txn4X=MiZSzfFHd90y1qny=0syNUWY3AaCg@mail.gmail.com>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro,
Do you have further thoughts on this series?


On Wed, Jul 7, 2021 at 3:43 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given ARCH.
>
> Instead, let's infer it from ARCH, and move some flag handling into a
> new file included from the top level Makefile.
>
> Nick Desaulniers (2):
>   Makefile: move initial clang flag handling into scripts/Makefile.clang
>   Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
>
>  Documentation/kbuild/llvm.rst |  5 ++++
>  MAINTAINERS                   |  1 +
>  Makefile                      | 15 +----------
>  scripts/Makefile.clang        | 48 +++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 14 deletions(-)
>  create mode 100644 scripts/Makefile.clang
>
>
> base-commit: a0e781a2a35a8dd4e6a38571998d59c6b0e32cd8
> --
> 2.32.0.93.g670b81a890-goog
>


--
Thanks,
~Nick Desaulniers
