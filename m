Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B53F7323A3
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 01:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbjFOX2q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 19:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238918AbjFOX2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 19:28:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBB030D7
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:28:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30af56f5f52so13096f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686871706; x=1689463706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8AslPaZUiq+hIN98pi+tAlCE0dyksCg3cnEphM/C+E=;
        b=oQnVzyKxPYTZf5j3A72cIh85Cmqa16r/F0b7QViHHWhM5EPqj/2AYPF6krsN3F+Q5D
         ZR0cOweyLnBWkuQ9aqTZUserI4ya5rBv7hFeKKz7nMsXKLAheQz8mM1t11lbdrP4LnSu
         e9aHdQCJgcWvmPXbJsnGiEIOSM2NVrtpbN4h2Rn7fpVg3cC0LERTDMLqCFezlqf1yFTb
         TcWxf5vVe1c9i0tQpR6nSUgmkSrdxmQA/zB0881YisKaN6RwFBSvSSwMfCAScvmRx2Uf
         ooMakRXc9/ecHqMFFnJ59loFQOW11/8Vz50I5fSnVQWjNpCw24pXqheBx+3iFxOy30pG
         57JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871706; x=1689463706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8AslPaZUiq+hIN98pi+tAlCE0dyksCg3cnEphM/C+E=;
        b=dE1UXWe6jiAoX/26s+IPzhSSxKmTJg5ECFxmxgGF7InxrdDwfq/NNUw+Y4TTXK7MEQ
         W7GZfKbzLM9eT13kuYi6DvCsEzA6d8anqV6uJvAvLjpzB2GEF1iPj852ryQKJmNIvOa4
         RqIqtFNN1cT5HcVRMwXhHboWXc6c5/UFwqfPoUK8oprxSQ2+0JpTNsts6p7FCGiirt74
         FsdpBofDhSUJWj83co6xDVRWSUTZlayjxa8sWUQFLSQicPTCSJ1EauIUAq4uWmkQJPRm
         9+dvUAq+bLZqnT0Cs5dpHb4txQIA5FM+38nQ3MLDiUlZygS1Wwsx7eRtIbDnJ+Rva/CX
         s0Ow==
X-Gm-Message-State: AC+VfDxJrNNb+OTkCISEZXKeoxulUebHBl3gVhqP+eS9uyqAIbQM6fBu
        OOLoR+uywMwEsHXjz5s9gAtxaHFsclzGxPxy
X-Google-Smtp-Source: ACHHUZ5yrY+FqqTql0SIhWuwdOwHmFvue8qv61xcqpUiOoNZc0xRP6XRFYlNIi6KtVcDLsVvOdtN4g==
X-Received: by 2002:adf:ea04:0:b0:30f:b76f:4980 with SMTP id q4-20020adfea04000000b0030fb76f4980mr186099wrm.6.1686871706293;
        Thu, 15 Jun 2023 16:28:26 -0700 (PDT)
Received: from localhost ([146.70.132.158])
        by smtp.gmail.com with ESMTPSA id r3-20020a056000014300b00307972e46fasm22038065wrx.107.2023.06.15.16.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 16:28:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 16 Jun 2023 01:28:24 +0200
Message-Id: <CTDM433BES1E.1M258MD0FESMK@vincent-arch>
Cc:     <linux-kbuild@vger.kernel.org>, "Roland Kletzing" <devzero@web.de>
Subject: Re: [PATCH v2] script: modpost: emit a warning when the description
 is missing
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Masahiro Yamada" <masahiroy@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
 <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
In-Reply-To: <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, Mar 9, 2023 at 9:01=E2=80=AFPM Vincenzo Palazzo
> <vincenzopalazzodev@gmail.com> wrote:
> >
> > Emit a warning when the mod description is missed and only
> > when the W=3D1 is enabled.
> >
> > Reported-by: Roland Kletzing <devzero@web.de>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > ---
> >  scripts/mod/modpost.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index efff8078e395..433518dfc472 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1824,6 +1824,10 @@ static void read_symbols(const char *modname)
> >                 }
> >         }
> >
> > +#ifdef WARN
> > +       if (!get_modinfo(&info, "description"))
> > +               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> > +#endif
> >         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) =
{
> >                 symname =3D remove_dot(info.strtab + sym->st_name);
>
>
> Sorry for the delay.
>
> Users need to do "make HOSTCFLAGS=3D-DWARN" to make it work,
> but nobody would do it.

Ok coming on this with some more time while my machine is building,
my code should work with the `make W=3D1` (but the kernel do not work with
the warnings enables)

I do not know if you was meaning another thing.

> I did a ground work:
> https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.19=
10369-1-masahiroy@kernel.org/
>
>
>
> Then, you can do like this:
>
>   if (extra_warn && !get_modinfo(&info, "description"))
>            warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>
Preparing the version 3.

Vincent.
