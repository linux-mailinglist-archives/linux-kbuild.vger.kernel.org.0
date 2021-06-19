Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9CF3AD9D4
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jun 2021 13:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbhFSLeb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Jun 2021 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbhFSLeb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Jun 2021 07:34:31 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69842C061574;
        Sat, 19 Jun 2021 04:32:20 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c138so17794661qkg.5;
        Sat, 19 Jun 2021 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wzF+HDIW4RpiFDwS3pehtK/Z2s3VtrcKXebmPCvAZ0Q=;
        b=X+Qf5RWTBKQu6s7dtYculR2/zvfqf8gdMKqjVYzEv3qNetrKxMPAZvzz1cv4lqJJCZ
         BrrhDIMj1wZnX/GbuH72DXqZH4gxo2hEmwxP9FXWh3fWaUR2BOkRNxB0vpdLjw/HVo95
         dJPnzLlar08ywytPHAaNIBGbK56LyRTP1xkBdF3gdbQ0V/1IojPRvl6Rm80Ee4IEqPJV
         l0Ldrs566oPH7TDjkfqgZ7pzyBXDroT3o5goUsH1lgBiK/2WWPFpdeOzG+YmgDi4HRov
         ufMvi8cIShMHu3HgzKIU9+Vdu0Rd1+Zsv+fBgfiZ/XPBdcI+QUtLuzws+6HLXwOpEN33
         WJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wzF+HDIW4RpiFDwS3pehtK/Z2s3VtrcKXebmPCvAZ0Q=;
        b=jDuDNqsTt12tdy873VUmv8k8LBO7zNtHau86E2qkbO/8Cuo83kQpFvc6wSpSdbnTgh
         SM4KBogxIbCgFULJ/Y3CJS4wyw5J01btkg6acesDY+yfI673ZtokYSYGGEgmgbsZZUcD
         IH0M882gwDJNJ+eygpLUfAL6RHtFrVmH8Up5a0Gte26PkPkq1hf15G0MHuA2pQE76kTY
         1MSyCk/5y5CbxHKRAroADIjN5LqTsYmin1uM+8JRGDCBoh2mwrgIGcXGXqGM/ZlV0g5e
         0tU/k/Xx91zeS+nbUwr7ya0hY4hcAh50sDW68HgN8086oNiUPvE+9363roz3X1n/W+8r
         Z90A==
X-Gm-Message-State: AOAM533RIEq3oR9SdwXA3anNPu0oOpckOpSBqyxcUYuwV47Hp1UVj7ha
        b5PPmU+HKrfCDVJqtJatUDZxAcluG3jIoJTFMWA=
X-Google-Smtp-Source: ABdhPJx92e5rLjLDFjNc+QgHX4Z6IHN/Br95iCNXiblcUb6SA9kzIrWK8a3IFw+BgDRLkdt6KKpgOVMgSlR04EbJ/MA=
X-Received: by 2002:a25:880f:: with SMTP id c15mr18259680ybl.247.1624102339591;
 Sat, 19 Jun 2021 04:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-2-ndesaulniers@google.com> <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
In-Reply-To: <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 19 Jun 2021 13:32:08 +0200
Message-ID: <CANiq72nbbqeD2dv3z0y3rN-_kdnh=9-pD7oSyWUfaG8oJ2y_8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] compiler_attributes.h: define __no_profile, add to noinstr
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>, johannes.berg@intel.com,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 19, 2021 at 1:26 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I am not sure if it is best or not to have the GCC link in order to be
> consistent with the rest of the links (they are for the docs only). Do
> we know if GCC going to implement it soon?

i.e. if GCC does not implement it yet we use elsewhere this kind of
marker instead:

     * Optional: not supported by gcc

The first of its kind, normally it is clang/icc there ;-)

We could nevertheless have the link there, something like:

    * Optional: not supported by GCC
                https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223

Cheers,
Miguel
