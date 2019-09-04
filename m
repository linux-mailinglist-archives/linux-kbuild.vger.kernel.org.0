Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4030CA7FE0
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 11:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbfIDJ6T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 05:58:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35113 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfIDJ6T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 05:58:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id n10so2929713wmj.0;
        Wed, 04 Sep 2019 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=lkR2Ca+FaxVlWbFtmtut4HN81Y4TL/IiykdxaBdNlG0=;
        b=QuwnzrzeBewqrpNyHGaKvRTyDkGOzIXzcyfOiCvBiJCs1ugvHmgM1uckgJJDM12US3
         GjnAt/uKck5kjK0ndm5gk59EO1raWdStt2ghmrHmfNl8KGxshQfQrZuSyW7Z9wgEyes1
         8zB7zMg7KHLwnBQhL/cQmZycl5Y69vQMAfy74wxdfKwBivxYWu0pWnAiHfuuOPbL2PFu
         6oVDao+lxcmYwdQ157sx4b/QcjIGOoPvBqAfulfzIi4Akzs+WfxuUzAkunk6dXv8cOeZ
         KQ0qwPnZF4B0Gsr7NYrcpZpyZjTqDRBk8SR3FZZdO+WyCVzmrv9Nr91hSg5ngSPkkyrF
         EzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=lkR2Ca+FaxVlWbFtmtut4HN81Y4TL/IiykdxaBdNlG0=;
        b=le6hVlxqF+UVh9v1zDtPTCNfAZu1puSV3OsoVUlXAcnrLEuQC5eu8TOFezhzHosYU6
         X//xRggVslhxdJpxjDnirXr1BJ1IRIg0bBpRUN+uozzLNG3ByzxxleZvYGyuGu1iFaVq
         qQWZlx5335gY/PFEDlGnHiqdKKr/SDaAslgCOVSFb/aeXqEfRxpdGhgoADdFmVdavh+J
         RDwNAr/6jJP9ZEN6iQOWOhnz8K/RZHjHTd8VQV2gf1sIBPyy/zXIP7uf1X4liDUA57dh
         VglBhy+9CPLlaz+CTFE7XnGI9NZShrHycUj1isS+VoLrJ2fckNUHTaywOJxtD3UbJVL9
         +FFA==
X-Gm-Message-State: APjAAAW8jxoRND5oj9yzqB34YXjQljjJ8hX+cOriL2ZAbeVLpjahzdav
        EHDoHAB9Nam0E1oGdue1Xqjn23UP2LKXZNecAVk=
X-Google-Smtp-Source: APXvYqyfITegUY7/GGfU2Yb5L7f+Fc4UoA9mAMRhHsgK0IA3qxBFEzEtTJLYW1QDy1dULlmkGUCBwejmA83IPr3fQ2I=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr3477750wml.36.1567591097217;
 Wed, 04 Sep 2019 02:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com> <CAKwvOdm0zcyaBLdSVc7PmjUa-wyVuCaN=6qZoPLvnoJC1ammog@mail.gmail.com>
 <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com> <CA+icZUXboR-0TzpSHf7a8MSjxPWxdC13Oudu8D+b+umtvWCCkg@mail.gmail.com>
In-Reply-To: <CA+icZUXboR-0TzpSHf7a8MSjxPWxdC13Oudu8D+b+umtvWCCkg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 4 Sep 2019 11:58:05 +0200
Message-ID: <CA+icZUVN1zRi5P8PPWMjXoXwtSCkbzTFNreYXi+0HtTjPnfkTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 4, 2019 at 10:07 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Sep 4, 2019 at 8:58 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Tue, Sep 3, 2019 at 11:50 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Sat, Aug 31, 2019 at 9:26 AM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> > > > options for GCC, but now it is a historical misnomer since we use it
> > > > also for Clang, DTC, and even kernel-doc.
> > >
> > > Thanks for the patch!
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> >
> > Thanks for the patch.
> > I like the backward compatibility and am OK with pointing to 'make
> > --help' for the documentation part (KISS - Keep It Simple and
> > Short/Stupid).
> >
> > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> If you will do a next version...
>
> - @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
> + @echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'
>
> ...clarify on extra checks for compiler...
>
> + @echo  '  make W=n   [targets] Enable extra *compiler* checks, n=1,2,3 where'
>

+KBUILD_EXTRA_WARN
+-----------------
+Specify the extra build checks. The same value can be assigned by passing
+W=... from the command line.

For consistency reasons might be better:

- @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
+ @echo  '  make W=n   [targets] Enable extra build checks, n=1,2,3 where'

- Sedat -
