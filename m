Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39024301256
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 03:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbhAWCjk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 21:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbhAWCjg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 21:39:36 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E35C06174A;
        Fri, 22 Jan 2021 18:38:52 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id e22so15310058iom.5;
        Fri, 22 Jan 2021 18:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=z/8jFLG0+YUsszHNMJ3nH9uwKAB96HJoCzzgF45TSX8=;
        b=AcAMzJqVyDVn181u89mxAUTMCzamfnzlFT4sngZA86xRQ1w0+PVHmC1kWn+4h3KIqc
         bOwvIfapmlY5j/tM53/QBuDJkReQj2vex7TuNNi10nezRlRJf1WAWbQ7vuoTbThkaExc
         tOdqVIhIEXbpYWUpHmKhxrnPlQxpHWsYfA8nPznh05EQu/SU3FZQUeh9bexb6e7SwoIE
         pxG8h/aKmeO0pgAwHkonG2P2m/9B8GAk0R+n6NALeW2gMm8YOcX8G3vHm4F9WUA8kPNn
         mAdqPkhx8G9J51a28+iMj9rAh9FFraloXq8LI7jKAFMzMRuIRPdmdPwXygp3bbcERl0l
         wiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=z/8jFLG0+YUsszHNMJ3nH9uwKAB96HJoCzzgF45TSX8=;
        b=p3IjmuEj8rFIWFXYnGmzKhDePE46F0+dHCY4JajJo0L7Cv+DHZMQu8XaqOp7nv6/Lw
         hZOYsnRAHZlbSQIadW1W5kI+RkYDKQf3a/oyKpsIYgnST7eYX7PVvG2C/xKQQ8J+Fpse
         NFgJ6UyMybSmKDRZScFrmKqI627MwdvUt1NmnWx2QZW85QK0RPPIshktCp5r1Rm42kbJ
         TQqzbDlZGev8467BXYQWe1P62cxHZcJTodJmZ4tmG9mwRD6bd52k+fWw07FGiLZQrgyW
         hzVO6f4s866Iw/9nmRCXk4QvBcaceN3bEL7mlxZUzFbbchZRu3vdm5PuBYlkkALYE+bx
         SmVw==
X-Gm-Message-State: AOAM530fIGTAis6lDVxeLI7AZH2Dq7BI+cOYd94pJZNh0N8KCXH4D9Vo
        Sg0hAyX/8qmI242/cSQlcZqBLa3cMmzFs/NbBZ7s6k79CDk=
X-Google-Smtp-Source: ABdhPJyLXj5hRYG3u7xc/prk1ULiVEyDmi5kjHtXm7cFcLf+H3Wj22/GLhEmnMtleMoNVpqKG3AZNooClk4vR96FKqY=
X-Received: by 2002:a92:c80b:: with SMTP id v11mr3961148iln.215.1611369532214;
 Fri, 22 Jan 2021 18:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com> <20210122123354.GR2696@kadam>
In-Reply-To: <20210122123354.GR2696@kadam>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 23 Jan 2021 03:38:41 +0100
Message-ID: <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 1:34 PM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> On Thu, Jan 21, 2021 at 05:15:56PM +0100, Sedat Dilek wrote:
> > On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>=
 wrote:
> > >
> > > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > > ./scripts/cc-version.sh.
> > >
> > > Since then, ./scripts/get_maintainer.pl --self-test=3Dpatterns compla=
ins:
> > >
> > >   warning: no file matches    F:    scripts/clang-version.sh
> > >
> > > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > > changes in ./scripts/clang-version.sh; as the file is removed, track
> > > changes in ./scripts/cc-version.sh instead now.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> > Good catch, Lukas.
> >
> > As a tipp:
> > Next time you can pass '--subject-prefix=3D"PATCH next-YYYYMMDD"' when
> > doing 'git format-patch ...' (or whatever you use to generate the
> > patch).
>
> I've never seen anyone use this prefix before.
>
> What does the date really help?  In staging, we apply everything on top
> of staging-next and if it doesn't apply then we don't investigate, we
> just say "doesn't apply.  resend if needed".
>
> We may as well just say [PATCH linux-next].  No one is ever going to
> look up the date if it doesn't apply to the latest linux-next.
>

Is there an official rule to label patches for Linux-next?

Usually - when I was more active on Linux-next development - folks add
a "PATCH -next" to the subject.
Of course, this needs additionally a hint in the patch/commit message
against which Linux-next release it is applicable.
Linux-next releases are highly dynamic - a patch might be applicable
to one single "-next" release.
Git trees come and go - are resetted to an older version of a Git tree.

As LKML is CCed - think of the hundreds and thousands of patches
coming in daily.
So a more meaningful subject can give a first orientation.
That was my point.

My =E2=82=AC0,02.

- Sedat -
