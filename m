Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9642119C466
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 16:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgDBOh0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 10:37:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38880 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBOh0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 10:37:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id f6so3929366wmj.3;
        Thu, 02 Apr 2020 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=0iB8S4+A1Wv3UyZCOfLA6/siwWHb+58rpgdbitpl/xg=;
        b=Pomu1tnIX9V8Pi1N95ejBU6xBFg+c8NYMuPmlEQ3OJ1k1gUQWjrhUiAV484RymQnKr
         fSCoAhqb2ZNF8YbszvPIFtUzDb0m/gY8yr7VtDCHBn8sjUo89+MudYDCsJ7DB0M10pIc
         I/ZvQ3+Oi7i+LwAqzxLaLg13Ko+YhGjRqCv6vTKcShV6ttwR7SNv0aGMOUwj7U0DqInz
         zWLLOQk83Jw7HYLPgAcNHafrDs4U8iF5jDtCxnC3oGlLPI0VU1i+XPZugINgYLIH3PxY
         4vVkmdpr78MgZfQmxLlgV+SXZa44o3ew9erSkmrPoqKIb3B6MlA8gSi0Bm9ptjnWICw2
         4Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=0iB8S4+A1Wv3UyZCOfLA6/siwWHb+58rpgdbitpl/xg=;
        b=nzLJkORorHsPKoRWuFsi3hWTIYNjKbXG66/5806cNpECdOOObOGwstdlDKIYok5BJO
         KmZInZk3xXGYvSEFxMIVY25Xiu3VIwTYDGPgKtLdrGmBlPC61Zr0QzV6ZCsn/+wfqavH
         cHTRHpxm/dCfCzG5C1kYOSk1Yw3Ox7r4yc5Z2M+l9hWlnYo609hE1d9u4ZDrOHIGiKTz
         Il0/rJVVU7lrrqcET4Nue4TkJfMmG9nLtOUL7G2E0pR+8G9OK342zYe/GdwX+/7Lw9rE
         IiSdAHz0XLvajy8A9ykZfP3wDSiAxMUoy/jVozeC1PRmycJLftgZT3TFRCccVyvnJhGz
         14DQ==
X-Gm-Message-State: AGi0PuZX/ilE8If7h2utHDkUp7MCLI2uo66xBorDbCtY5WrAzyScqYk8
        2iRpmqVFQDGbLH9XmvnmM86ONjPE31WMW9dc0Hk=
X-Google-Smtp-Source: APiQypJ3hL35aoOgM5xZtZbUy9vUfd6E+nDPtB2n+TW71W/ucaZFOnu9cdo4UxAVzCwZH3Tn8asu0cj0w0Dm+h54/CE=
X-Received: by 2002:a05:600c:2202:: with SMTP id z2mr3580762wml.64.1585838242936;
 Thu, 02 Apr 2020 07:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com> <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com> <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
 <CC22D163-BB96-42F5-88DE-BD203860E7C2@fb.com>
In-Reply-To: <CC22D163-BB96-42F5-88DE-BD203860E7C2@fb.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 2 Apr 2020 16:37:30 +0200
Message-ID: <CA+icZUVBQEzoFDcd=uS14qXAdACUK5tRGbFsKBRhHTjYH1CWiQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
To:     Nick Terrell <terrelln@fb.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 1, 2020 at 9:00 PM Nick Terrell <terrelln@fb.com> wrote:
>
> > On Apr 1, 2020, at 2:50 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Apr 1, 2020 at 4:52 AM Nick Terrell <terrelln@fb.com> wrote:
> >>
> >>
> >>
> >>> On Mar 31, 2020, at 8:11 AM, Sedat Dilek <sedat.dilek@gmail.com> wrot=
e:
> >>>
> >>> On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:
> >>>
> >>> [...]
> >>>
> >>>>> Do you plan to push this for Linux v5.7?
> >>>>
> >>>> I hope that it will be accepted. From my point of view this patch se=
t is
> >>>> ready for merge, except for the maximum window size increase
> >>>> requested by Petr.
> >>>>
> >>>
> >>> Hi Nick,
> >>>
> >>> thanks for your answer.
> >>>
> >>> Did you send out a pull-request already?
> >>
> >> I haven=E2=80=99t sent out a pull request. If that is something that I=
 need to
> >> do, or if it makes the process easier for a maintainer to merge then
> >> I can do that.
> >>
> >
> > [ CC  Stephen Rothwell (maintainer of Linux-next) ]
> >
> > Hi Nick,
> >
> > as Adam pointed out it might be good to ask "Stephen Rothwell"
> > <sfr@canb.auug.org.au>
> > to include your Git tree into linux-next. Stephen will give you some
> > informations about that.
>
> Thanks for the pointers Sedat and Adam! I will reach out and ask
> about the best way forward. I don=E2=80=99t particularly care if it makes=
 it in
> 5.7 or 5.8, I just want to ensure that it does get merged this time.
>

Hi Nick,

just in case you did not know:
The Documentation directory in linux-Git has a subfolder called
"process" (RST format) which gives a lot of hints.

All stuff is also available as HTML if you prefer this format.
See [0] "A guide to the Kernel Development Process".

Hope that helps you.

Regards,
- Sedat -

[0] https://www.kernel.org/doc/html/latest/process/index.html
[1] https://www.kernel.org/doc/html/latest/process/2.Process.html#next-tree=
s
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/2.Process.rst
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst
