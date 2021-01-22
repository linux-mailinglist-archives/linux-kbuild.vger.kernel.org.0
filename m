Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657C22FFA1D
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbhAVBpb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhAVBp2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:45:28 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37775C061756
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:44:48 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id t29so2653652pfg.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4szIhxH58SMfeVsu2cGON3xQLWlR2gAfHY2l9My0L8=;
        b=a6E6wHRDhh6LN0zT+gjJXJcFUZBVsc6638mvWFQzyVsuS51s+OwWbiU55E7HNwYz7Z
         JZE1Lz7xQvSXDcbQThCBjxqzCI6EUN2tSTTpbx9onXiuHvcHEO7zddqYeVCwAR4S3fXS
         gK0rhQhXal4sXWroklw4rUX4xDDaY87IIGfg5AfxKG3O8fZaIgctnnprP7f0auVRBvF0
         XW7XPJe6aTWrBcNzB9nsDtl5MCDogw8G9PetX6unc28syclklmSYgA6wznRpP5HUmtq0
         wzCFEvaI/a6GchYzEIfRCHsdG/ZnUpb1rG5gbXTEEasKCPIv2v9MVZV2uSKrY7UI8krQ
         N7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4szIhxH58SMfeVsu2cGON3xQLWlR2gAfHY2l9My0L8=;
        b=E+j2BlR5MhFU5XkpkSMk1WrWT5MZbLwkmVdQuU7f2aVRhRj9x1bj6b6HDtvq998Oue
         +dFdWoQvfv/G0b0vtyOBr6N2JuXgVelmdiBqU0YDrNZVZHEnCEgaE6KoOcnCF1v/KsA9
         G6DNiU56HNbuusHWrOJnWRNd2Oe5LS0g7ZEK/i2GR/qvCImb9lat/Y0F9Ecgy716DiXp
         dxexhdpbnSUWO5ENNqHj22cjQWVzkENbF5kX5EzIghxxFQY/ic/qr/pri5ZIKXurY2Nt
         u1ZxxR01kYwau8iAMJcjyuMrK1sxtQQVAUlsvhNw+wLLGwGPirWqjn0PL+s468ggHIQ2
         IwQg==
X-Gm-Message-State: AOAM532Rmv98y/q5WGo7gYueDEex6TUkmgzJ5bhCZnrQwYIqT6ZhM//j
        tsmn59JLtHpDdPmEdE7N2R8Bc7qLaEHm1b4fVU/y2w==
X-Google-Smtp-Source: ABdhPJyn75We1U9pL6cl3QASmqae4ZTH30VZWF4AgzRj3Sc9zpsG2zekUkyvDfhFuoaJMfu5IHsKM6IUG7ewSpNML+I=
X-Received: by 2002:a62:838d:0:b029:1ba:9b85:2eac with SMTP id
 h135-20020a62838d0000b02901ba9b852eacmr2304176pfe.36.1611279887579; Thu, 21
 Jan 2021 17:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20210116094357.3620352-1-morbo@google.com> <20210121082451.2240540-1-morbo@google.com>
 <CA+icZUWiXMbZe5d5h6KdoHUSiaHwv7z6Rf_C2Gstmx0rbszT+Q@mail.gmail.com>
In-Reply-To: <CA+icZUWiXMbZe5d5h6KdoHUSiaHwv7z6Rf_C2Gstmx0rbszT+Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 Jan 2021 17:44:36 -0800
Message-ID: <CAKwvOdmmhW36Zbkc0aPLAOrP8UXsX5vKkrfWYH89sCKLmE5vuw@mail.gmail.com>
Subject: Re: [PATCH v6] pgo: add clang's Profile Guided Optimization infrastructure
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

On Thu, Jan 21, 2021 at 2:35 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Thanks for v6.
>
> Small Changelog nits:
> * Can you reverse-order the changelog - latest v6 first.
> * v4: s/Makfile changes and se/Ma*k*efile changes and *u*se
>
> Can you add a hint to this "Clang-PGO" patch requiring Clang >= 12?
>
> Can you please add a comment for people using Clang >= 12 (ToT) and
> have kernel-modules enabled, they will need the patch from CBL issue
> #1250?
> Otherwise they cannot boot and follow the next steps in the workflow.
>
> Can you put a comment about value "1" to reset the profiling counter?
> That there is no "0" value stopping it.
>
> Can you add an example for the workload test?
> Here I do a x86-64 defconfig build.
> See attached script.
>
> Usually, I download this patch from LORE.
>
> link="https://lore.kernel.org/r/20210111081821.3041587-1-morbo@google.com"
> b4 -d am $link
>
> This downloads v6.
>
> What if I want a previous version (compare)?
> Again, I will love to see a "clang-pgo" branch and maybe tags for the
> several versions in your personal GitHub.
> Come on, Bill :-).

That's quite a long list, Sedat!  Do you think some of these can be
follow ups, once the core lands?  I'd much prefer to land the meat of
this and follow up quickly, than tire out poor Bill! :P
-- 
Thanks,
~Nick Desaulniers
