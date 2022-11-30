Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A76863E5A2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Dec 2022 00:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiK3XlK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Nov 2022 18:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiK3XlJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2022 18:41:09 -0500
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAF14AF36
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Nov 2022 15:41:05 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2AUNekMu030366
        for <linux-kbuild@vger.kernel.org>; Thu, 1 Dec 2022 08:40:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2AUNekMu030366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669851647;
        bh=4Xpo6CIyQo2L6sRpZOxoD9oFPjRlFoqqgjGreWWbKyc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ltYXf3lTNs6rz1pxrLKYRuFB69wr9GLavmpquDQiQ2qG/Xi1wrVLEnkLsuz+w3qO5
         dywwc1aS85ePjoImJgNu5OEvg6Hev7oW/3iL4r04a3Rbxc945ee3G24Yrjt5MtgiqK
         JaU5RjK4IGRyME3cbU1VFZ5ZrLtrmw2IgorBQYTZSliX2bCQ0nk/DO8XO3udkbmZsy
         Ty3vDp+ridNKLnXPIx2VgsUllZZq+pET1+pYYlUhlXcxvsZoum7KjSrGGE0YWiPW9V
         41a/fW6gQtaPqNE4rXWU01QD98w7HSoxvlXTSq+sgRFTn2Tm2uUKNVhYqJT5abdGKm
         v6l8z4/RPBXDQ==
X-Nifty-SrcIP: [209.85.167.175]
Received: by mail-oi1-f175.google.com with SMTP id e205so286446oif.11
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Nov 2022 15:40:47 -0800 (PST)
X-Gm-Message-State: ANoB5pmTZ+R30Px5NlfMYygZZ1SzQ4a3KG/Lak/MKH/L4OckwaW9E+D+
        M7JPUisvIK0chVXMVuY0YEzBpCNcu4/IN5Lvfa0=
X-Google-Smtp-Source: AA0mqf4nJk9LIlxt5k1MhWvrG8B8sImBLHIvbNciUcQBwQgLhRsrdnrJ06V46LRqqPc4DuxG5sCtcC1wHQTOPsbPsNw=
X-Received: by 2002:a05:6808:3009:b0:354:94a6:a721 with SMTP id
 ay9-20020a056808300900b0035494a6a721mr21898121oib.194.1669851646014; Wed, 30
 Nov 2022 15:40:46 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
In-Reply-To: <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 1 Dec 2022 08:40:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
Message-ID: <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
Subject: Re: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Dmitry Goncharov <dgoncharov@users.sf.net>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 1, 2022 at 8:18 AM Masahiro Yamada <masahiroy@kernel.org> wrote=
:
>
> On Wed, Nov 30, 2022 at 2:10 AM Dmitry Goncharov
> <dgoncharov@users.sf.net> wrote:
> >
> > Port silent mode detection to the future (post make-4.4) versions of gn=
u make.
> >
> > Makefile contains the following piece of make code to detect if option =
-s is
> > specified on the command line.
> >
> > ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> >
> >
> > This code is executed by make at parse time and assumes that MAKEFLAGS
> > does not contain command line variable definitions.
> > Currently if the user defines a=3Ds on the command line, then at build =
only
> > time MAKEFLAGS contains " -- a=3Ds".
> > However, starting with commit dc2d963989b96161472b2cd38cef5d1f4851ea34
> > MAKEFLAGS contains command line definitions at both parse time and
> > build time.
> >
> > This '-s' detection code then confuses a command line variable
> > definition which contains letter 's' with option -s.
> >
> > E.g.
> > $ # old make
> > $ make net/wireless/ocb.o a=3Ds
> >   CALL    scripts/checksyscalls.sh
> >   DESCEND objtool
> > $ # this a new make which defines makeflags at parse time
> > $ ~/src/gmake/make/l64/make net/wireless/ocb.o a=3Ds
> > $
> >
> > We can see here that the letter 's' from 'a=3Ds' was confused with -s.
> >
> > This patch checks for presence of -s using a method recommended by the
> > make manual here
> > https://www.gnu.org/software/make/manual/make.html#Testing-Flags.
>
>
>
>
> The GNU Make manual is written with the latest Make version in mind.
>
>
> "Recall that MAKEFLAGS will put all single-letter options (such as =E2=80=
=98-t=E2=80=99)
> into the first word, and that word will be empty if no single-letter
> options were given."
>
> This statement is not true for GNU Make 3.82, which the kbuild supports.
>
>
>
>
> $ git show 6f0fa58
> commit 6f0fa58e459642b16901521cc58ac474b787ec5b
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Fri May 19 20:42:30 2017 +0900
>
>     kbuild: simplify silent build (-s) detection
>
>
> [snip]
>
>     Test cases:
>
>     [1] command line input:    make --silent
>          -> MAKEFLAGS for Make 3.8x:    s
>          -> MAKEFLAGS for Make 4.x :    s
>
>     [2] command line input:    make -srR
>          -> MAKEFLAGS for Make 3.8x:    sRr
>          -> MAKEFLAGS for Make 4.x :    rRs
>
>     [3] command line input:    make -s -rR --warn-undefined-variables
>          -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
>          -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables
>
>
>
>
>
>
>
>
> As this commit description says, Make 3.8x puts long
> options before the collection of single letter options.
>
> So, this patch does not work for Make 3.82.
>








I think the following code will work
for 3.82, 4.x, and future releases.






diff --git a/Makefile b/Makefile
index 78525ebea876..58dfd7475448 100644
--- a/Makefile
+++ b/Makefile
@@ -94,7 +94,7 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands

-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS)))),)
   quiet=3Dsilent_
   KBUILD_VERBOSE =3D 0
 endif









--=20
Best Regards
Masahiro Yamada
