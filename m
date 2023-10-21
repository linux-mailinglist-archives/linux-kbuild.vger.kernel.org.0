Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512E17D1F19
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Oct 2023 21:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUTdZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Oct 2023 15:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUTdY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Oct 2023 15:33:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E2611B;
        Sat, 21 Oct 2023 12:33:19 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9c41e95efcbso282077866b.3;
        Sat, 21 Oct 2023 12:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697916798; x=1698521598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhKBvEwFp6dPng7EMHTDKwHw0rg8boPI6MAVBy/sUeQ=;
        b=aH2uS3cZctLbvBQCh1MKnA6x2ecVIVqLUhQ4lJhmM20tz+l8sTTVL4hpZRja+XgfQG
         h09YVgbXdYSH1pdORA6n3JizFLdW7dg7X6EwNPQdZc4zpg5QwCN/YvoFjJBDAJBP6Afs
         NAj6emWrK3yFYUTo0UsL3rl2wwWw3D8SqfJ4bIt6dMEwgEFPJMT5q/46YOIK8IidWEqs
         v0ZWU2uFrbgrpOnjQorCA6sUs4S6kVQYkZ1l3mTOdbV+JjcjIfttpwIg0ZySYs79thEL
         GL6qdwi+qBlL64Hi9KwyR2vnSerzGRpy9Z48aatCQbsClw6HDvoXDftT3QHAMFgcFHnY
         wqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697916798; x=1698521598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhKBvEwFp6dPng7EMHTDKwHw0rg8boPI6MAVBy/sUeQ=;
        b=G4KRJvTYoFi3rm4rXIj3DJG1DcpJEGTJhLr3joii548Yyqh9qbqbtJI70iZCCEtIMX
         PAV87dCNEG7SxX8OlZTdtdmcvUFDlsJlTCB36zBzNtg46tmEPwaDgVQu1MgOG4t6Mxf2
         C88JVs6IQznmAsE1886Z1+WlocUK1bPLQWljj0hPrGYteAMowrFjMcu9F0GON9TApPTD
         y9ZxmH9SHR7CPIYGTkh8SjN8C+UmztNdyfED60WoZHpdBpbWEI8OISCuwfpLBX2YdraE
         tqewwBoDZHX/wJPgXuKDpOGMVlL658myQhzTs8RXveZYnCw1K6aK0f+cVKpuaZAKOzJT
         3dng==
X-Gm-Message-State: AOJu0YwarXgVXDITlaUipT6nkS5+30hntNlRnaS+GXTI1SKsnt3R6f77
        zYSJfs73kCUXEX6+nFtiSvtqLsKD7Cd1V/VWDDU=
X-Google-Smtp-Source: AGHT+IE5k3rQI3rL00mfGqc4OaA80pAQZr1jIxpO6M2c1lCkOomkJXj0Nd0XChSfc6S694CUjwuDf1zcU6RY1/9TctY=
X-Received: by 2002:a17:906:dc89:b0:9bf:ad86:ece8 with SMTP id
 cs9-20020a170906dc8900b009bfad86ece8mr4252656ejc.25.1697916797534; Sat, 21
 Oct 2023 12:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231018151950.205265-1-masahiroy@kernel.org> <20231018151950.205265-4-masahiroy@kernel.org>
 <ZTDlrkTXnkVN1cff@krava> <CAEf4BzZm4h4q6k9ZhuT5qiWC9PYA+c7XwVFd68iAq4mtMJ-qhw@mail.gmail.com>
 <CAK7LNAR2kKwbzdFxfVXDxsy8pfyQDCR-BN=zpbcZg0JS9RpsKQ@mail.gmail.com>
 <CAEf4BzbYwEFSNTFjJyhYmOOK5iwHjFAdcArkUbcQz5ntRvOOvA@mail.gmail.com> <CAK7LNAQxFgOpuCBYPSx5Z6aw5MtKzPL39XLUvZuUBSyRGnOZUg@mail.gmail.com>
In-Reply-To: <CAK7LNAQxFgOpuCBYPSx5Z6aw5MtKzPL39XLUvZuUBSyRGnOZUg@mail.gmail.com>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Sat, 21 Oct 2023 12:33:05 -0700
Message-ID: <CAEf4BzZqpqo3j33FkH3QJwezbJwarr1dXs4fCsp5So12_5MmTg@mail.gmail.com>
Subject: Re: [bpf-next PATCH v2 4/4] kbuild: refactor module BTF rule
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jiri Olsa <olsajiri@gmail.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 21, 2023 at 4:38=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Oct 21, 2023 at 5:52=E2=80=AFAM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Fri, Oct 20, 2023 at 12:03=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Fri, Oct 20, 2023 at 7:55=E2=80=AFAM Andrii Nakryiko
> > > <andrii.nakryiko@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 19, 2023 at 1:15=E2=80=AFAM Jiri Olsa <olsajiri@gmail.c=
om> wrote:
> > > > >
> > > > > On Thu, Oct 19, 2023 at 12:19:50AM +0900, Masahiro Yamada wrote:
> > > > > > newer_prereqs_except and if_changed_except are ugly hacks of th=
e
> > > > > > newer-prereqs and if_changed in scripts/Kbuild.include.
> > > > > >
> > > > > > Remove.
> > > > > >
> > > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > > ---
> > > > > >
> > > > > > Changes in v2:
> > > > > >   - Fix if_changed_except to if_changed
> > > > > >
> > > > > >  scripts/Makefile.modfinal | 25 ++++++-------------------
> > > > > >  1 file changed, 6 insertions(+), 19 deletions(-)
> > > > > >
> > > > > > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfi=
nal
> > > > > > index 9fd7a26e4fe9..fc07854bb7b9 100644
> > > > > > --- a/scripts/Makefile.modfinal
> > > > > > +++ b/scripts/Makefile.modfinal
> > > > > > @@ -19,6 +19,9 @@ vmlinux :=3D
> > > > > >  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> > > > > >  ifneq ($(wildcard vmlinux),)
> > > > > >  vmlinux :=3D vmlinux
> > > > > > +cmd_btf =3D ; \
> > > > > > +     LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) =
--btf_base vmlinux $@; \
> > > > > > +     $(RESOLVE_BTFIDS) -b vmlinux $@
> > > > > >  else
> > > > > >  $(warning Skipping BTF generation due to unavailability of vml=
inux)
> > > > > >  endif
> > > > > > @@ -41,27 +44,11 @@ quiet_cmd_ld_ko_o =3D LD [M]  $@
> > > > > >        cmd_ld_ko_o +=3D                                        =
         \
> > > > > >       $(LD) -r $(KBUILD_LDFLAGS)                               =
       \
> > > > > >               $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)       =
       \
> > > > > > -             -T scripts/module.lds -o $@ $(filter %.o, $^)
> > > > > > +             -T scripts/module.lds -o $@ $(filter %.o, $^)    =
       \
> > > > > > +     $(cmd_btf)
> > > > > >
> > > > > > -quiet_cmd_btf_ko =3D BTF [M] $@
> > > > >
> > > > > nit not sure it's intentional but we no longer display 'BTF [M] .=
..ko' lines,
> > > > > I don't mind not displaying that, but we should mention that in c=
hangelog
> > > > >
> > > >
> > > > Thanks for spotting this! I think those messages are useful and
> > > > important to keep. Masahiro, is it possible to preserve them?
> > >
> > >
> > >
> > > No, I do not think so.
> > >
> >
> > That's too bad, I think it's a useful one.
>
>
>
> I prioritize that the code is correct.
>

Could you please also prioritize not regressing informativeness of a
build log? With your changes it's not clear now if BTF was generated
or not for a kernel module, while previously it was obvious and was
easy to spot if for some reason BTF was not generated. I'd like to
preserve this
property, thank you.

E.g, can we still have BTF generation as a separate command and do a
separate $(call if_changed,btf_ko)? Or something along those lines.
Would that work?

>
>
> >
> > > Your code is wrong.
> > >
> >
> > Could be, but note the comment you are removing:
> >
> > # Re-generate module BTFs if either module's .ko or vmlinux changed
> >
> > BTF has to be re-generated not just when module .ko is regenerated,
> > but also when the vmlinux image itself changes.
> >
> > I don't see where this is done with your changes. Can you please point
> > it out explicitly?
>
>
>
> That is too obvious; %.ko depends on $(vmlinux).

Thank you for your gracious answer. We used to not rebuild module's
.ko's when vmlinux didn't change (but we did regen BTFs), and that's
why I was confused. Now we forcefully recompile modules, which is a
change in behavior which would be nice to call out in the commit
message.


>
>
>
> %.ko: %.o %.mod.o scripts/module.lds $(vmlinux) FORCE
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
