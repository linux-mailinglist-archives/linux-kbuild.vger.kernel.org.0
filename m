Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816102F6FCF
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 02:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbhAOBBu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 20:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbhAOBBs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 20:01:48 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6D6C061575
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 17:01:08 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2so4444705pfq.5
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 17:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3WeFaKNJEz4OecO9N42Dpu4fB89NTF5qv7y1AdEYTM=;
        b=tSNS1CnMXMY4MD92ZyP8uZtFqK6+/HTf0XPlBgegGtQ9XePOsTqRlN7z6ukXZLrTF+
         vo6nqJpSDJu2YaS/EfmTWPumeIlAl6mQZBpvsEWZHm721/C2DwEs6VneiFjx3bLmb49i
         xYQ+oyNKFiPzgci073pFC6IeUn8YYJWCkQBdOJu3AMk6Jfok4VCGLgMnP2mFOCQU9o61
         02QLwfK8Tov9cBFW/fdWSya9NPrqk0r7EcAtCIl3zZnCMmviFTK1GrhKkfs0u9iGmpOV
         Oi0sA0UlMK3WcFDUReNKxZxWWgFF2ejJE1DkxrTAyD2Hf4/bxSuAl/eDKxlFCojxjtWQ
         dD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3WeFaKNJEz4OecO9N42Dpu4fB89NTF5qv7y1AdEYTM=;
        b=is6OrNdFvrLx4Na8QpyxUqUUt2XGzWDNAL2Vx0h0+wzHV+9L+8WRJUV1YMqVkpUJ0l
         969xv4l9DSwXWPAd9NXcBUUjafCQnYS/FreV9BWA7NUHkWK/izg3d9+taBVODhWh+tS/
         5+iahvHt3DwYIXC2ay8ltOG3+w/E8PqCi7fhEU+XInxAnNC5VlgmlmBgBO3Q8RNzVQjX
         +6o6TZuV+yv6i2Jj8wp6Vs7A142bbdtD/x8uRCeVVQKGuoSOgSHSzbhMGFcH6Q2LTwj7
         OX13pMo24+sypumAARSG2FT79UQ8GNfkLZTVPuRp2efPkIlpUYOWjdEdmBa60z8dHOmS
         mhPA==
X-Gm-Message-State: AOAM532i5dcWjX+0Pv5DaJaBT5uKruoMSBfJDlyyLjUHOhPQLFVP5jmW
        6No1lUEOEHzAdJAYPCs3D/3s9eSVbfu7f7xo9apHIw==
X-Google-Smtp-Source: ABdhPJzfndZUuw1upmwGox7mHE72uLgE5zPIjFF+9u35KdDGolzTQHRIumBQs7SsVzvAJ81KsLR9Qgvi/6jR4L1Ftcw=
X-Received: by 2002:a63:1f47:: with SMTP id q7mr10190029pgm.10.1610672467320;
 Thu, 14 Jan 2021 17:01:07 -0800 (PST)
MIME-Version: 1.0
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org> <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
In-Reply-To: <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Jan 2021 17:00:56 -0800
Message-ID: <CAKwvOdnfm9XvKsgn30HSUYoCSibHND-JSTqNH0yU7bfpYog_3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
To:     Jeff Johnson <jjohnson@codeaurora.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>,
        Elliot Berman <eberman@quicinc.com>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 1:50 PM Jeff Johnson <jjohnson@codeaurora.org> wrote:
>
> From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
>
> Modules with a large number of compilation units may be
> exceeding AR and LD command argument list. Handle this gracefully by
> writing the long argument list in a file. The command line options
> read from file are inserted in place of the original @file option.
>
> The usage is well documented at
> https://www.gnu.org/software/make/manual/html_node/File-Function.html
>
> Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
> ---
>
> Changes in v2:
>   - Remove spurious endif
>
> scripts/Makefile.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 252b7d2..787dca2 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -425,7 +425,10 @@ $(obj)/lib.a: $(lib-y) FORCE
>  # module is turned into a multi object module, $^ will contain header file
>  # dependencies recorded in the .*.cmd file.
>  quiet_cmd_link_multi-m = LD [M]  $@
> -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
> +      cmd_link_multi-m =                                       \
> +       $(file >$@.in,$(filter %.o,$^))                         \
> +       $(LD) $(ld_flags) -r -o $@ @$@.in;                      \
> +       rm -f $@.in

The GNU Make docs linked above use an `@` before the invocation of
`rm`. I don't know what that's about, but that or even this patch
doesn't affect my ability to build negatively. LGTM

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
>  $(multi-used-m): FORCE
>         $(call if_changed,link_multi-m)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Thanks,
~Nick Desaulniers
