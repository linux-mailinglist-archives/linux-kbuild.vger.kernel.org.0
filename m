Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F9E2F6862
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 18:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbhANRy2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 12:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbhANRy2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 12:54:28 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E790C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 09:53:46 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id b3so3808408pft.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfaedLmNvLX9iXMcjLIGfzS3Dnirkc2r8wJOKSFLYxk=;
        b=ZE7YhPIxnAH9wJH9MuGy59rsc1tN6Erf8CBdzJkGSZhX6hx9uAXE+UCZeP0qJKV7Zq
         SxGTztF16oB7m1rKMjWwLhgi7fetSqmJUuzLjWcVusufL4s+2zQKE9dEonorB9JMdl89
         QD6te7Ookv8gxjLQUH0ORn2RiDMf29EHEXgxCabyCB87N+MvDJBGt96tTlisRptCP+Q2
         kkVsak/EyDGDG7PwtG5NkRFBA6W/zagK1OeIKdBwor+df5J9shu48OUQanwDnnKI8wpM
         ERD3J3hpHgWZcP9TUMikiqWXDif0fb3S8ri/JcIEMzfN+lDKfqajY/o91QE5rKYp8GPL
         c5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfaedLmNvLX9iXMcjLIGfzS3Dnirkc2r8wJOKSFLYxk=;
        b=s6W37lknRUURhHUbLk9dQSs45n/OYFi3lUtWR8wQHKugXZ0U73+aV2pZ8beqiXCRkS
         eBEW1FaNK1M4LrU+Jccky8GcXiMFj6mXE6TqpjABB+yHpK1mNmQJhBnlSEkGfPKP0Oky
         /TZyKnUW2JgtJaBtKwYt+GX72wcjUDtYzv0v4bg07N/ArDuuB0+bvzmKFf/DBnNTZ5ji
         3f/Qe4PbfbkWQOREzTd3ImfkkeV2T6rpHlf+oo8M/32vGXk1yQ0DNGgEOdpkr1JZIJnf
         wMKhF/GAbAG8kCZyPQDNxfcpcLmAiSaoHs3sPGDOXeyHVGaQ0Mk9j/J+SNoH2HnAdWLp
         B4yw==
X-Gm-Message-State: AOAM532DATlBXch/4CHFCJJO5a5n0orCBGh0D52FWKDE6wTaszJ2KuHl
        X56CKrIHZc7S4iNwK+Ex6uS9ABtL1ioRuu380jDTqw==
X-Google-Smtp-Source: ABdhPJyBUypb786yryp6blNciChZStI2I1CDCu88xcv+LslZfIragXD8PM08QyJtJO3hV9yIYpnsAwgnJGYyDZuEM30=
X-Received: by 2002:a63:1142:: with SMTP id 2mr8639411pgr.263.1610646825496;
 Thu, 14 Jan 2021 09:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com>
 <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com> <20210114073615.6b9add58@lwn.net>
In-Reply-To: <20210114073615.6b9add58@lwn.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Jan 2021 09:53:34 -0800
Message-ID: <CAKwvOdmHsO-yqUuCFouy4jhDwLaL-5+K8JkJ0Jo5Q_UQEF_2rg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 6:36 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Wed, 13 Jan 2021 17:19:59 -0800
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > Patch looks fine, but `make -j htmldocs` seems to be taking forever
> > for me so I can't render it. Is this a known issue?
> >
> > $ make -j htmldocs
> >   SPHINX  htmldocs --> file:///android0/linux-next/Documentation/output
> > make[2]: Nothing to be done for 'html'.
> > WARNING: The kernel documentation build process
> >         support for Sphinx v3.0 and above is brand new. Be prepared for
> >         possible issues in the generated output.
>
> Sphinx 3.x is *way* slower to build the docs, alas.  One of many
> "improvements" we got with that change.

Oh, man, yeah. Noticeably.  I had sworn I had run `make htmldocs`
before.  Have you had a chance to report this regression upstream?
-- 
Thanks,
~Nick Desaulniers
