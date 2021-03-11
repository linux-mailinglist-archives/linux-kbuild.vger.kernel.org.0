Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF200337016
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Mar 2021 11:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhCKKej (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 05:34:39 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44728 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbhCKKeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 05:34:37 -0500
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12BAYJDi012899;
        Thu, 11 Mar 2021 19:34:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12BAYJDi012899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615458860;
        bh=JL39avkr6XAXggrtNaqY+rW1xFvHegX4PxpEorYJ0P0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RALITuhrD/lJww4WxZ9jRR1TUGsxgfh+ecFN+Teknu26oo8czDRd2xWctQ10J79VV
         gHGgcCtnwbeJI7wO8sEJFfmZxE3W4tXtCht2yTha/qdVKppOR5ClUE0+uEGiX83ZQ7
         PQeikUrGirwSAnVJYuggXUQB6KTfw6YoejzQGtCFmz0NBfXLtYZZZqs3iZ2f0GPGJ3
         Zs28N8MBpjhF32KgX4d23rQWh98eo7KV5tWtWXnJXdJMZD1ItNv/KFX3ejDpOdtyDW
         oyucZqvRu1h68UyOP579E5dvlUJ3JfFmTwIrdTJki/EE7nCUk9OcixoeK3Z0nM2R7Q
         aW+az6YeJGgZA==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id t29so14095124pfg.11;
        Thu, 11 Mar 2021 02:34:20 -0800 (PST)
X-Gm-Message-State: AOAM5314pWhdYYH+Yvd5Z4MU/fF8DRpRgMh0S1sqP0SIP1j0akObYAx7
        jelqGmnBbrlb0GiVnig8vTVfP4zNdEyZcREhlS8=
X-Google-Smtp-Source: ABdhPJzY0KKF0RIthLc5mGvm6tX6IBefaVdn9h1YLSHJplyPla5IWMj8zNCsMuxBzvDlUUReTD78xXXy5yDCWprwHeQ=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr6828665pfn.80.1615458859439; Thu, 11
 Mar 2021 02:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20210311094624.923913-1-masahiroy@kernel.org> <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
In-Reply-To: <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Mar 2021 19:33:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATP2ORegUu0tGtSU1+CSKZVX7m84GOT913X5L29MopAXQ@mail.gmail.com>
Message-ID: <CAK7LNATP2ORegUu0tGtSU1+CSKZVX7m84GOT913X5L29MopAXQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Thu, Mar 11, 2021 at 7:18 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > +# When you raise the minimum version, please update
> > +# Documentation/process/changes.rst as well.
> > +min_gcc_version=4.9.0
> > +min_llvm_version=10.0.1
> > +min_icc_version=16.0.3 # temporary
> > +min_binutils_version=2.23.0
>
> +1 to creating a central place for all minimum versions.
>
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> I wonder if you considered creating a folder with files like
> `scripts/min_versions/gcc` containing the version string. That would
> make it easier for reading from other languages or even importing them
> dynamically into the documentation, thus removing even more
> duplication.
>
> Cheers,
> Miguel


Hmm, that is a simple, clean idea.
Then, we can simply read out the file

$ cat scripts/min_versions/gcc
4.9.0

I do not know how to handle
per-arch versions in this case.




Or, we might need to stick to shell-scripting
to handle this.

scripts/min_versions/gcc
#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
if [ "$SRCARCH" = arm64 ]; then
       echo 5.1.0
else
       echo 4.9.0
fi


-- 
Best Regards
Masahiro Yamada
