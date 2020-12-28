Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D594F2E6C36
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Dec 2020 00:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgL1Wzr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 17:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729365AbgL1UGR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 15:06:17 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFCDC0613D6;
        Mon, 28 Dec 2020 12:05:36 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id 81so10301660ioc.13;
        Mon, 28 Dec 2020 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=+/MsPpCh29b44ND0x83djGy2ECRhuoKehorw2KDsX2o=;
        b=CxcY4+gjX1bcha2T2RGhJjo7HxtnyitY+batxNoybrlx91FYHZ0Mqghg6geSQNxuR7
         GXYyaRkl0HMUk9n7wwp+NwPniaZEdzfaOcOgzR3CfQLFFXPr4/8FB2qHnZOCR64iLYHd
         aNWdQx947sUTs1d788ghupI8SaEbO3O9Xo5t/7lePpo372kPTH+1mkzhZ3xybwNuEi6Y
         yI9DfL6dwxTAFPnWFfk0fRQXm+83jI3wrtBB0XkWRvt679gIDEhbfcBl9SQirIwzuc3+
         HyOyh3wVQcv+/8urKOl/BJeg0BctiXmwvDi3nLxQoOWlveY2d5eB1YahbgAOQCgUTcUZ
         yhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=+/MsPpCh29b44ND0x83djGy2ECRhuoKehorw2KDsX2o=;
        b=DT75A9KN3fDCcCMeKY1EGe+A9+P+ewXxjeKIPpEUdzE5301qKk2BTpwJTwC9hN2y5M
         TmCv4kqhMIkxeASWtOEoUiLuIC5NlX5aZ/sZpYZqo1C0IYyrMRhHmZs6SQ6njhe9jnH8
         c7ft4p3YQpg9w0XFYzvfur2ZAlDitbLbj9Hza5b95bQLZtVmCJaUPMxaqeTHtVQ0irbb
         vDXZ1K+D1sNu+aPXJt5xuOH0MZh92RR0FJMVBMlKzMcLAjFSuc0BE6Ure4ngpXRUtSO8
         ZpvX+e6cQ/iUyIIfIxTsQVI06HcINJUk/ag8mWlcA5lgwVkXars5luLPb4HlYpUhmxWQ
         cUEQ==
X-Gm-Message-State: AOAM530cpb7Lm71Icf5sK8j0JMDyacbuyMLN9o1G+x2fp4H9/+WhmPlj
        yLImHedgZNDVxZ4SCpg6tgYNev46LMk2TDQzugk=
X-Google-Smtp-Source: ABdhPJwPztDBX6R+RT6mHuvGQycgQ+038wB9ibLIuTqmBTj1cVMUERFXGKG1H09pgi1zpVB8euNiHNINGKIEd31y9Rs=
X-Received: by 2002:a6b:c9cb:: with SMTP id z194mr37561833iof.110.1609185935951;
 Mon, 28 Dec 2020 12:05:35 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com> <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
In-Reply-To: <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Dec 2020 21:05:23 +0100
Message-ID: <CA+icZUVGKq=_9kJGo7Xgn_MV-ErsEWyY1pXU-aEL7BdWdQDjng@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 28, 2020 at 8:40 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Dec 28, 2020 at 12:04 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > > $ dpkg -L kmod | grep bin | grep depmod
> > > /sbin/depmod
> > >
> > > $ which depmod
> > > [ empty ]
> > >
> > > $ echo $PATH
> > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
>
> Ok, I think this is a broken setup that has a separate /sbin but does
> not have it in the PATH.
>
> As you noticed, you can fix it with
>
>    DEPMOD=/sbin/depmod
>
> or you could just make /sbin part of your PATH.
>
> It looks like on your distro, /sbin is restricted to just the
> super-user PATH, which is odd, but I guess there's at least _some_
> logic to it.
>
> I guess we could have some compatibility thing in scripts/depmod.sh,
> something like
>
>   diff --git a/scripts/depmod.sh b/scripts/depmod.sh
>   index e083bcae343f..a93261207453 100755
>   --- a/scripts/depmod.sh
>   +++ b/scripts/depmod.sh
>   @@ -15,6 +15,8 @@ if ! test -r System.map ; then
>         exit 0
>    fi
>
>   +# legacy behavior: "depmod" in /sbin
>   +PATH="$PATH:/sbin"
>    if [ -z $(command -v $DEPMOD) ]; then
>         echo "Warning: 'make modules_install' requires $DEPMOD. Please
> install it." >&2
>         echo "This is probably in the kmod package." >&2
>
> or similar. Does that work for you?
>

Looks like it works.

I see:

  sh ./scripts/depmod.sh depmod 5.11.0-rc1-2-amd64-clang-ias

But no more a depmod warning.

Will you send a patch or apply this directly?

- Sedat -
