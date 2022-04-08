Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E9F4F9E2C
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Apr 2022 22:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbiDHUbg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Apr 2022 16:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239484AbiDHUbe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Apr 2022 16:31:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED2F7938A
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2022 13:29:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s17so4954050ljp.8
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Apr 2022 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZrdFf2yh42JrHc2Dek+WObBYvTZikKF1XOl4wbzHjs=;
        b=lVvgZ8xLHBXTpDM+wZmf05pbYzXDDYFJUck/bcRj31lOoWi0SeIlLtxNJ8FIljVBlK
         Qqp5QgGws8wpwIEjsDGSJYMCz0SL87NgXL9GmQtcnmc6yTvkHf2aTbHrg9z8cJM/Doto
         vpiY0x7FlfFhh5pASFjGfs6uu9T5XsSZK+9GrDG5WPVOuNsxOLftZboRi1Wl61lrf94s
         zSEagVKiDnhil68YIOv7CuW/ZqIvpjG0GivpragadYpt9RBLtsiQCrzAjTye+Og8/pM9
         pLr3MK9NrkmxLxmQZNridF7aKHXLuU9TToR54QH8C6lnSE9G+B/Bp7WZ1km2kFyxb7jp
         TCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZrdFf2yh42JrHc2Dek+WObBYvTZikKF1XOl4wbzHjs=;
        b=MCNMVPDctrn/I8jSvfTrmD7Xe8/McqcUkdqbt6sHRhZUj1tGMbuddkE5AemjfmeqtH
         H5I/WkZVAbkxBJ1f9AzYkFf8QHJvxKlRZEwu5KBibx0j3QgSwwemOi5uu1ges5xZr24x
         /joku7ltHfE6I+R7dW54FKYMwFQlt2Sz067MDHXoECDKce2WHbIWLtDJNbgfFTEl6Egb
         CvmSWuMsS4n4RxW4X1qjUA66Gepu2Gy8fUq9qzmh225c5egZG4gHET953YrIjkID6Z6e
         eyUL/l0Am2zHrS6rqr7n7yiwdGceRRmr5qYJHKSE0m4SuYuZIj+eCj1gnAcj1Kze0KW7
         /yJw==
X-Gm-Message-State: AOAM5303FAxQgNPUmN4MZGhfTuK1YoPReisoP63pAKBMPNa5yLkyfGRV
        wFedvaDou9IADmop0fTmRH2UOitIPDYSnqcMbqsrDw==
X-Google-Smtp-Source: ABdhPJxH3D8gXPBoV4TSDcjzoHzG6H+bMKJDFDSrEQDpRK80a/mazb9kGKiK8ZFBujQSP4LFFtjxw9PdktULlxVPdL4=
X-Received: by 2002:a05:651c:19a8:b0:249:a7f3:25e7 with SMTP id
 bx40-20020a05651c19a800b00249a7f325e7mr12377184ljb.352.1649449767522; Fri, 08
 Apr 2022 13:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <1422803720-14723-1-git-send-email-ydroneaud@opteya.com>
 <20220408084607.106468-1-ydroneaud@opteya.com> <CAK7LNAQZLt_OecOogOQiSu5snW+sffsMoFgVcjPTx_idj_=_tQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQZLt_OecOogOQiSu5snW+sffsMoFgVcjPTx_idj_=_tQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 8 Apr 2022 13:29:16 -0700
Message-ID: <CAKwvOd=yNnKsHJo0QWvoTuFF9p-y=cTftTD+7FY-wJ_f23zFTQ@mail.gmail.com>
Subject: Re: [PATCHv1] kbuild: support W=e to make build abort in case of warning
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Yann Droneaud <ydroneaud@opteya.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 8, 2022 at 4:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Apr 8, 2022 at 5:46 PM Yann Droneaud <ydroneaud@opteya.com> wrote:
> >
> > When developing new code/feature, CONFIG_WERROR is most
> > often turned off, especially for people using make W=12 to
> > get more warnings.
> >
> > In such case, turning on -Werror temporarily would require
> > switching on CONFIG_WERROR in the configuration, building,
> > then switching off CONFIG_WERROR.
> >
> > For this use case, this patch introduces a new 'e' modifier
> > to W= as a short hand for KCFLAGS+=-Werror" so that -Werror
> > got added to the kernel (built-in) and modules' CFLAGS.
> >
> > Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
> > ---
> >  Makefile                   |  1 +
> >  scripts/Makefile.extrawarn | 13 +++++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > Changes since v0[0]:
> >
> >  - rebase on top of commit 64a91907c896 ("kbuild: refactor scripts/Makefile.extrawarn")
> >  - document use case after commit 3fe617ccafd6 ("Enable '-Werror' by default for all kernel builds")
> >
> > [0] https://lore.kernel.org/all/1422803720-14723-1-git-send-email-ydroneaud@opteya.com/
>
>
> I remembered the previous submission, I liked it, but I had lost it.
>
> It seems already 7 years ago, (before I became the Kbuild maintainer).
> Thanks for coming back to this.
>
>
> I like this, but I will wait some time for review comments.

Dunno, this seems pretty simple:

$ ./scripts/config -e WERROR
$ make ... W=12
-- 
Thanks,
~Nick Desaulniers
