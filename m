Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923142FFA02
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbhAVBfX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbhAVBfV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:35:21 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C136EC061756
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:34:40 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p15so2788854pjv.3
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J3zUPc3/QcY2myKFIxXj5SI3ce2GEipGTyEZDOPm3Z0=;
        b=fDlBOFIQ1ZnIVITy+QSWWFAgO/YYu9cZvfCQeBRQWNapdMdNMFUSRhiuMZPLC3UJ8d
         L3lnVtSYU9/1oToby46J2Cw0y+z9UPOfzmw/DJKKR/8CdR4L2LPivctZvjXtuIhsqzx8
         +Az0FIzLer9VTAgpYLKXVKCQ8+6ELlpXrDVmfmj8F4u7wmj8xQ4/DrB9Xip0qJcolohq
         biILhYvr0lMgqw6d2tEv4qLaAQFqlShtNx5Jt11TC9qiqvlfdfQF0a0jkMFngmFiwfin
         017QeCZdJRcIJao6QzHFCOkFNuF62eHAIfmsvRpgRZ8edinalxw4u7/eEnUPRH8uhuFR
         CcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J3zUPc3/QcY2myKFIxXj5SI3ce2GEipGTyEZDOPm3Z0=;
        b=T3OZ5h5E5kM0MXlcPQjrYqF7uq+ytE0qo3EW/XAnzG0+CVgGilz3vsHvsGdKNc7nX+
         FgdODES4LJhcHD5lHMc1jNstnG3VhuUhT3ttKaCHjlcPzVg4pUPKwguu5gLwsoRUB6cL
         jFvvpZWvaQNVI6FUyYGc8FqWzlbJd1lqRODAOwg1ySSiozPaokXGZI8AQajpFKu4Xlky
         2jddXrox2Vd4iQ+vTtDEASviKc9kaZvQpFyKphWlhm0cAQG2NfwtW/EkSyJZMmkmkjP+
         xQnUs+ZGmcmE2gOQ3UeibF8uG6Owx6Q5SdEx4Cf7hliSC2d8UVIZ4PobtI82kaNME69s
         aBdw==
X-Gm-Message-State: AOAM5313ECamFZgmEdh1e6ku/8ghJV4rmSbtdzgZa7JKNBn1K28l353T
        MP8zwr/ynb1cooPc8nEqJoPR53h32iOs/Dz6XwI80A==
X-Google-Smtp-Source: ABdhPJymYGUU8oGmr6qrmeZ9fqTCbSmRgNuSYGskKCO6E7NWrPXmrTdbVqmTHt695NI72UklVVgWfgD4zTJtiM2zlik=
X-Received: by 2002:a17:90b:228f:: with SMTP id kx15mr2605248pjb.32.1611279280043;
 Thu, 21 Jan 2021 17:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <CA+icZUW63tP7kzWCKofJH0E0xA7yLCYpSOYz_aw1D4mkhNhW=w@mail.gmail.com>
In-Reply-To: <CA+icZUW63tP7kzWCKofJH0E0xA7yLCYpSOYz_aw1D4mkhNhW=w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 Jan 2021 17:34:29 -0800
Message-ID: <CAKwvOd==OfKHKzhWVGAQs5bFJ9qSbm8WRkX7qDF+FQd-p1gdNQ@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 6:21 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi,
>
> When I looked through the code I wondered why we do not add a
> "CONFIG_PGO_CLANG_PROFDATA" which can be helpful when doing the PGO
> rebuild with a vmlinux.profdata.
>
> This introduces a "PGO_PROFDATA" to turn on/off to pass
> "-fprofile-use=vmlinux.profdata" (see CFLAGS_PGO_CLANG_PROFDATA in
> top-level Makefile).
>
> If we turn off via "PGO_PROFILE := n" in several Makefiles - we should
> do the same and add "PGO_PROFDATA := n" to the same Makefiles?
>
> Please see the attached diff.

This is a good idea; something that I brought up in initial code
review (on github).  Would it be ok with you to land the core first,
then follow up with this suggestion?

Also, AutoFDO production builds are so incredibly similar to PGO
builds that I could see a possible path forward:
1. land PGO upstream
2. adds docs for AutoFDO
3. consider a config for hardcoding the location of the profiling data
so that we don't need to specify it at the command line invocation of
make.
-- 
Thanks,
~Nick Desaulniers
