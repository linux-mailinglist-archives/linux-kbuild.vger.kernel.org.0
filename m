Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9392430A5
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 23:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgHLVww (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 17:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgHLVww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 17:52:52 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB41C061384
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 14:52:51 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id r11so1685649pfl.11
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wCbQE1eRz9aMBbIfwDa2a9ZzzYzoMclcPd3bcmvTf+U=;
        b=pnsWam0Wp/0E3S6qPxrXp4AwBCUUlNg+7b/BmAs70nIi94G/xJ1JBy0fLqAMERL6Pn
         1zU/qMyuus8lX6sC6c++xSZejFAb50BuhtcTphLtDG7Vw95yTh63VXlbuVptWKLPaYjC
         SWp/VGWHGOyM+u+uIaf2s5Nrw+B0YF5rN7l4IFCxssYJsAVdAaNv+4oIJDPHPVGDd7Ml
         iDu49GJz/tnqpnRZfYUy+STnroFe1pJukhMaIN2NE9TfDNsWAJXsE8fBvZrbpQ2cAx+x
         kFKR3incgOGzXxf1A2JDAGU4jb5SHKHs8Q+RBk1JwwXR6/Xe/oh5CeGeoZ7XcPF3+4sE
         G9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCbQE1eRz9aMBbIfwDa2a9ZzzYzoMclcPd3bcmvTf+U=;
        b=lD70qbkF01CPzXWRoK/+SkjkhZEwUe1UokERygSseqBsXa12gAr0WdkveEHgULlyJ1
         t+0AQvGnOQH3WH/LHUFxjDcjyQJqrWapmkPVE13jt4OLZsF8s4SrpHllXgij6aIgV+zj
         ckoF8swFLQhtT8Zm5TkEEFbYVhAQViEALRxM+5CZHeFtUYSsmobCRSTuMT4h2foLyt0M
         aVlFp0xH+aiqH/gkF2eTk4/BvDR8ecuXdnEV9Rn4raQH+OXhvn9ce1gwse88LdEbDFmc
         2O1vklWHb+GiMS89CNGA+YLSRpsZ6CNK58xNjWb4hPnHdq6rEEEVGlUQDCzmveFY0/ZB
         /8jg==
X-Gm-Message-State: AOAM530lGMsZlJ9MDXLuqEcYGNp8h+/vfpf0lXEESNcDGEpGoz8qYwNC
        1ATU66UsU6Eo9FyfG9KhDtpwRiSlxDO04cp57qcvhw==
X-Google-Smtp-Source: ABdhPJxUQy0niiQlV7m3IGAUQtZ6U3ue4BBuioK9jJX1/s/4WJwaZbeIrcfZGXHw/vgnXopFF11tLZvLofQ6KwLGDiU=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr1056708pgh.263.1597269170150;
 Wed, 12 Aug 2020 14:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org> <20200812173958.2307251-2-masahiroy@kernel.org>
In-Reply-To: <20200812173958.2307251-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 12 Aug 2020 14:52:39 -0700
Message-ID: <CAKwvOdktQgf3pT-9j5Lo3oKQ=sRdTL0XvPto9j-8NASA6fcSvw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gen_compile_commands: parse only the first line of
 .*.cmd files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 12, 2020 at 10:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> After the allmodconfig build, this script takes about 5 sec on my
> machine. Most of the run-time is consumed for needless regex matching.
>
> We know the format of .*.cmd file; the first line is the build command.
> There is no need to parse the remaining.
>
> With this optimization, now it runs in about 1 sec with the allmodconfig
> build.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Before your patch, my x86_64 allmodconfig:
$ /usr/bin/time -v ./scripts/gen_compile_commands.py
...
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:08.35
...
After:
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:02.10

So it's a nice speedup.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
small nit below:

> ---
>
>  scripts/gen_compile_commands.py | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index c458696ef3a7..19c7338740e7 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -125,11 +125,9 @@ def main():
>              filepath = os.path.join(dirpath, filename)
>
>              with open(filepath, 'rt') as f:
> -                for line in f:
> -                    result = line_matcher.match(line)
> -                    if not result:
> -                        continue
> -
> +                line = f.readline()
> +                result = line_matcher.match(line)

If `line` is not referenced beyond the following statement, consider
combining the two statement into one:
result = line_matcher.match(f.readline())

> +                if result:
>                      try:
>                          entry = process_line(directory, dirpath,
>                                               result.group(1), result.group(2))
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
