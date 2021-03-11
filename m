Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6713370F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Mar 2021 12:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbhCKLPr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 06:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbhCKLPr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 06:15:47 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7823C061574;
        Thu, 11 Mar 2021 03:15:46 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 133so21331622ybd.5;
        Thu, 11 Mar 2021 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFeut5mRk7QOpC8AdBxexiS9v0Cku3pHA/7OaXkYKqA=;
        b=dFw4CQZ3N/SJJZtHGvXhEnkZlZEnrYKWsM8cV1pQYih+baCxPCDMyEUgVHqoAm1xfk
         5pbR5+GITiepEL72NXCfkBSYT0w1S2hMdfVoH/aCYnlr7TZcOcb5VDFRopkZStqY2WXJ
         fXvvvvSEhDbPB0SG9bG9B5duWpsHcSv9jN65YW1zvXDbCydKHkxW3OmrIUKy3RDxQVcG
         LyrLfgjEL/vc/zhmWCbkrPKYJrTciU/vbcYOrp5Pnkveb9hpXzuOyK6LFNubh8g9uAsE
         +TrFSU6OS8bIjupyl0DLH1dMkCcdEM63YT9GxZd4DFhAxHBISdjjWXQb8ckMiQ3uhMmv
         tRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFeut5mRk7QOpC8AdBxexiS9v0Cku3pHA/7OaXkYKqA=;
        b=pOnceXUCL2Wefjo0vBFxWY8/RMzVsD9qxFLHNGWA/ukc/XBDAKhdL4OywBo+uNawRt
         B0IoV70I9yE9oA4nziSQGggri5A1PZAItUulQ3AfdNGkqC3eqx28S0kKqZKvJhnbXNP9
         ZWsHwuaEJtBgPfEpiVcgPFkbOMVQ1l2/2zn5Nbot4asNUQnS/6D5b0p0G4EuB/ySeMdf
         KeZi3N1ONGDXsi3w4BwPQoBL3xYWei3buPO+kFZQtkJeqyyoGnDBiNJ8xqwItbQ5J/9z
         wPPjNzLfH4q+6MZedZsRyLNsa3kTMKFAi79FlVyKiptw8OBpBSwp05ob0RlCLlXXgANc
         eCZQ==
X-Gm-Message-State: AOAM532lLgBP4fOteWw4U3k1kqfryACQG/gjGOrGjoHSZ3EGy3uVazCg
        tvrV5wdxf9742N7C2MLXy88zjWvNvm+XZ+9jPKRvQcZHkXMh7A==
X-Google-Smtp-Source: ABdhPJx+B2lm1YY9OlY/r/zl4P+HRIXBZy+A4G8ckrWn5a1E2tn19gRq8zhzAPEmBGze/icASy/0zDUEfCVoRZuGH3Q=
X-Received: by 2002:a25:d296:: with SMTP id j144mr10994633ybg.33.1615461346024;
 Thu, 11 Mar 2021 03:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20210311094624.923913-1-masahiroy@kernel.org> <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
 <CAK7LNATP2ORegUu0tGtSU1+CSKZVX7m84GOT913X5L29MopAXQ@mail.gmail.com>
In-Reply-To: <CAK7LNATP2ORegUu0tGtSU1+CSKZVX7m84GOT913X5L29MopAXQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 11 Mar 2021 12:15:35 +0100
Message-ID: <CANiq72kVk5BwAfXmnfKGPwMavfdHNqF1gjq9D-U4TmMipS4yoA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 11:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hmm, that is a simple, clean idea.
> Then, we can simply read out the file
>
> $ cat scripts/min_versions/gcc
> 4.9.0

Exactly!

> I do not know how to handle
> per-arch versions in this case.

Perhaps we should just push for 5.1.0 everywhere ;-P

Otherwise, we could still have `min-tool-versions.sh` with something like:

    $ cat scripts/min_versions/gcc
    4.9.0
    $ cat scripts/min_versions/gcc_arm64
    5.1.0
    $ cat scripts/min-tool-versions.sh
    if min_versions/$tool_$arch exists
        print that one
    else
        print the default one: min_versions/$tool

i.e. having the plain files allow us to extend the cases without
listing them explicitly in the script, plus it is anyway useful to
separate data from code :-)

Cheers,
Miguel
