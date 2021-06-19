Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC583AD9CE
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jun 2021 13:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbhFSL3B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Jun 2021 07:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbhFSL3A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Jun 2021 07:29:00 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C35DC061574;
        Sat, 19 Jun 2021 04:26:48 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id f70so17668132qke.13;
        Sat, 19 Jun 2021 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3qptZHIBpv3JxNQPkyiO+mSheyAcYqB/CsUvSm+UpOU=;
        b=vdXQ0zFaCYeb3u6QxofEl6GX56wlrAOqgRXV8CZe9Vlc7Uevz6a5sP5aeuPNNrxx1j
         /8iJsG8vNyasPhbG87LpsE5NTTvPhTAEgZGtLUruqLYIrPg+ZjibFeQUKZNubCHUpRoo
         HtZqojcW3xs35EeNV9lFWLCgFJ2HngBTnMux0lsScchul7xMlpGLiKIUrAhzqd3KPrPv
         emCjGqcHpuKkj9GOC9eeVzdr8bj8a312siQrobqErLBk8g7FGNchsLNwZJ4B7F0Vta+G
         vcwJcnkVa0A0wQJXFWcZoo+Rpn0YAkfWlpvYq6veEgt1u6lg2Cp5x5hROb11Kj1eIHbL
         d58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3qptZHIBpv3JxNQPkyiO+mSheyAcYqB/CsUvSm+UpOU=;
        b=lC8LBk8PpKKw6vW3mDE/lFbyr3sq7ya/Hg+2YriiW3LdMplVMxUxrKydD1C1DUWOkc
         JUcFMcUE+Ymk9yYwvBiuI/N+Dd0jXcEvMsRoJhhiTVEd6wBS7Ylu9tu7B6c81vKqdECS
         bjSfRDSno9lhgcEp1gjr+gi0h4RQb/yAJDxYml3h6VGxlzyEz51HMsP+VYAsb8IGZIkg
         vwaCI/ASHdsl+C8/hQV23Qa7HL+UBassWwI6t0Y8Z+9ml8aU8T4M+uFuUQv67SrVgEyn
         /8Oxmz2F8i2JhPV/8wl0ODzN8RowEI9nnkl51PSmZvCGfoWopVEUp8PLjV7CVOQtK0Zf
         vpDA==
X-Gm-Message-State: AOAM531MxG7f6wqepoWGH+Rx6isf490chOyYwdljTuIRvdra0F9p2vFl
        LxVWF+RWrUEM3jNXlH3lyLPTCOTcs40kPk3KvYk=
X-Google-Smtp-Source: ABdhPJy1asqv8Q5Z5vk+ewOuWO+vnAY3L/cXdjdtq+Yq0qTpukFXoDsNrmSnALn1koXZNPc6uasYqmp5kayEy3tGsM4=
X-Received: by 2002:a5b:892:: with SMTP id e18mr19183246ybq.22.1624102007702;
 Sat, 19 Jun 2021 04:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com> <20210618233023.1360185-2-ndesaulniers@google.com>
In-Reply-To: <20210618233023.1360185-2-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 19 Jun 2021 13:26:37 +0200
Message-ID: <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
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

On Sat, Jun 19, 2021 at 1:30 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> +/*
> + * Optional: only supported since clang >= 13
> + *      gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
> + *    clang: https://clang.llvm.org/docs/AttributeReference.html#no_profile
> + */

I am not sure if it is best or not to have the GCC link in order to be
consistent with the rest of the links (they are for the docs only). Do
we know if GCC going to implement it soon?

Otherwise, it looks good to me.

Cheers,
Miguel
