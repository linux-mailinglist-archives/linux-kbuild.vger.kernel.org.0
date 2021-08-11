Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D3E3E8EDF
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Aug 2021 12:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237020AbhHKKl6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Aug 2021 06:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236830AbhHKKl6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Aug 2021 06:41:58 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC2EC061765;
        Wed, 11 Aug 2021 03:41:34 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id r72so2997668iod.6;
        Wed, 11 Aug 2021 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jBxrILRt2SSh2fFdT37FtH3C1pi2n07Z5azmqkHTR4=;
        b=GBu7/zNya8TczYMIjvoZ1rPWwQWr/T+ndzwYlRYAZaZVNThGkgmSB3/KcTUoeeguWg
         m5WiMTFkNPwd4ZyFL2Oh79KI3nMO3BzmARNfTTHIw/8IPSd5+tIyDxY92l27fLAnVTlr
         zXGHx5WAdRk+y8gY89hGxsGFYHXjopFH9G8Hg3nyzHmNbKqPcIIYRZTaZ7HBpJFK0QLL
         NzFVPV2qx1kgoJSNlV8OPHcKeLfoh1sBqyEfBzL3tKc/n/xnBnQeeg64TBHss4Yn4qr4
         7w+nVVfxKvFHvltt9bZM8iwElO8y2dh9F+GjzmiXSnF4Sl3/y1nu1+DtQe9Ax4TsfpWP
         dy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jBxrILRt2SSh2fFdT37FtH3C1pi2n07Z5azmqkHTR4=;
        b=HzE20ZF7qb5b71iC/qrJlUmTBtEucsOS7EvF898kP9vKcEbnXNwP903m5orCJVCPkj
         e+O9wewd8GPq+V5f5VyKdMBK20bzAkwe4yUBHtPE9SisA11xrBU1hPSb6yg8a0GbOQgw
         o2o+4oSH2S8hA44p40uwEVuoV65YEDAoVZ8Rn9oa1UdaOkLQmWJQ91z6BPwXTzEVsUfj
         FXaOMAvRVxQNntPiqzp3GM3iERn0j1luAAh8MwaQK4Ig4cp+46LLFotKF0yMmRY2cBAt
         Lm/gWrBmWrdYp2tq2R0ESYhIoimw/kWLyjOXu3JgdKF3zATBJyXs+52mnZf7W4ntC79k
         sgFw==
X-Gm-Message-State: AOAM533IKyULTrJjQeynOVHXSAhChjPy1GKVXM6QspA2+/ZWM2glqcXG
        vszpoG2FGge6emvO0oZD67oFf/r9dIHXOeFUnADDX+sS2Og=
X-Google-Smtp-Source: ABdhPJycoNHw40fL9II1818UbrarYt4w9igNbJb+eNYBEUPPaKyHpoRFToFL4KS8zotbGF4BsY8CwNlMh4xCJNRXzLM=
X-Received: by 2002:a05:6638:2714:: with SMTP id m20mr31099642jav.41.1628678494149;
 Wed, 11 Aug 2021 03:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com>
In-Reply-To: <20210810204240.4008685-1-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 11 Aug 2021 12:41:23 +0200
Message-ID: <CANiq72=H4ofcSfD=scFa3moBBDf81h3fFKEd52-4Y8ZygANWWQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 10, 2021 at 10:42 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> cc-option, cc-option-yn, and cc-disable-warning all invoke the compiler
> during build time, and can slow down the build when these checks become
> stale for our supported compilers, whose minimally supported versions
> increases over time. See Documentation/process/changes.rst for the
> current supported minimal versions (GCC 4.9+, clang 10.0.1+). Compiler
> version support for these flags may be verified on godbolt.org.

Always nice to see cleanups due to raised versions!

Shouldn't `--allow-store-data-races` have been on its own patch, though?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
