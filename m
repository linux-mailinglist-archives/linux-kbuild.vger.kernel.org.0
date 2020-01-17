Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34F71402C6
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 05:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgAQEHg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 23:07:36 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33083 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgAQEHg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 23:07:36 -0500
Received: by mail-io1-f66.google.com with SMTP id z8so24516369ioh.0;
        Thu, 16 Jan 2020 20:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=RQQ9qmJfALB3jvs3h7v5mfdPDr+Bl2r17SesMRcqOsE=;
        b=KWRYeoGPAAAN/w8oxb7L/g32DsecNbKN0roRQUG2kHc60k8ZC66yPQbKI8L4/Ma72M
         TytNd9yV4gxD5xT9wzGifg+IL68Ni1AuM5UjCUtCJAHTE5hoedYcZMwnBb5mpl62opfZ
         YpzjHt+VPe6wctZrdmw/1oLcOkiZgrv8ekIwymO8Yjs+dLlN+2QRjeU6L2WoMd04JuH5
         0fzh11K1PqQZ+906r86GJbfXJM114Z0ixML2cBvsm/lH62gZDxQWIVzlULsgT5qYJdaP
         hNSTu/Hudpd3wcqADf4cVE1CrbTD7Q3WhrU4qHP1US/pLcHrc+bVjU2zjnq4x56nBS96
         dIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=RQQ9qmJfALB3jvs3h7v5mfdPDr+Bl2r17SesMRcqOsE=;
        b=XMiyGWdmgmAl1D59suF57yJTOQizYYYisqikx+1Uvvx8QwrhS71kX0nJsW4pvqcbVE
         Yc768dcqvV843Fsiaz9Dhrf3w2kw7VxVkFy40yFNB9Dz6NImoqO5dhzYke5TiHMZTm8C
         1QLB3TDOHYo8lGWMNN6jydpSaPPEa9Kuwm2elTGHw2l6VPfLEdIaYdOuZLvntuGcYLsu
         S3QRHrwzkEwvSQTILd+hu4zfpfv5X5c99I20FUp1mE9ZKwB1YPN9ECD7FXrkLGueHS4Z
         vo8qatmigPsmlpRuSrGbgKuqbbcoBwGTn46lXj8c0laNXM3EJ+zBb49LmXGAcmtPv5UM
         lQgQ==
X-Gm-Message-State: APjAAAWf/Rc7pbiUR90nlt5Pxs6O61NX2AxM8oL9iq7Rtau41mCLZk2K
        U4yFVPphIeopIR/SoO1f2CQWqUMn1TG8/pzc8mE=
X-Google-Smtp-Source: APXvYqwuX6GZteC/eOCDjRdvkjt3g3PCkqJ9DuvH2ogsyQclVDQ+MtnsrsSCBG9/MuRhWMAnZrdY+8AwJG2pv7EGqZk=
X-Received: by 2002:a6b:ec0f:: with SMTP id c15mr27966363ioh.149.1579234055350;
 Thu, 16 Jan 2020 20:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20200113232212.138327-1-helgaas@kernel.org> <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
In-Reply-To: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Thu, 16 Jan 2020 22:07:24 -0600
Message-ID: <CABhMZUVjx-z51FkCNPTKzP3=8m4CBM3cp57ZvMBcMXTfA6ARKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 16, 2020 at 8:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Fix a couple typos in kconfig-language documentation.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  Documentation/kbuild/kconfig-language.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > index 74bef19f69f0..f547720bd82d 100644
> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
> >  Documentation/kbuild/Kconfig.recursion-issue-02.
> >
> >  Below is a list of examples of prior fixes for these types of recursive issues;
> > -all errors appear to involve one or more select's and one or more "depends on".
> > +all errors appear to involve one or more "selects" and one or more "depends on".
>
>
> I think "selects" is strange here.
>
> "select" is a Kconfig keyword.
> select's is intentional, I guess.
>
>
> Keep it as-is, or perhaps change it into "select" (singular) ?

With rare exceptions, apostrophes are not used to form a plural noun.

Maybe it could be recast as "... at least one 'select' attribute and
at least one 'depends on' attribute"?

I'm not quite sure what the intended meaning is, because the table it
refers to has lines that contain only "depends on" (without "select")
and also lines that contain only "select" (no "depends on").


> >  ============    ===================================
> >  commit          fix
> > @@ -656,7 +656,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
> >  the deduced semantics matches our intended Kconfig design goals.
> >
> >  Having well defined semantics can be useful for tools for practical
> > -evaluation of depenencies, for instance one such use known case was work to
> > +evaluation of dependencies, for instance one such case was work to
> >  express in boolean abstraction of the inferred semantics of Kconfig to
> >  translate Kconfig logic into boolean formulas and run a SAT solver on this to
> >  find dead code / features (always inactive), 114 dead features were found in
> > @@ -683,7 +683,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
> >  boolean formulas and run a SAT solver on it [5]_. Another known related project
> >  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
> >  has been introduced first with [9]_.  The basic concept of undertaker is to
> > -exract variability models from Kconfig, and put them together with a
> > +extract variability models from Kconfig and put them together with a
> >  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
> >  solver in order to find dead code, dead files, and dead symbols. If using a SAT
> >  solver is desirable on Kconfig one approach would be to evaluate repurposing
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada
