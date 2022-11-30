Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF16063E570
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Dec 2022 00:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiK3X3Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Nov 2022 18:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbiK3X3A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2022 18:29:00 -0500
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E709AE1F
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Nov 2022 15:19:29 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 2AUNIcLL009715
        for <linux-kbuild@vger.kernel.org>; Thu, 1 Dec 2022 08:18:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2AUNIcLL009715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669850319;
        bh=pvF1Bll3XznK09lVgFuwumgtxvMDN6A+8fCyPzBVOc0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J/pxrg0H/Tempf+Ief8I1KF03bXv2Y08lqzLVjyS2YQ+vvMvqxNhaMlf78U1pD/+s
         r806wpCqBK3Lj3QWykIM10oYqFxxnzWXbzxyPvTwmbH0SXRvuchNo0UWb7qTWsNyAn
         fR/vQC5Y9QJtXXBGeAMzqP/yujY+XJw4LpJ2DFfRHQ9y1vZASS6EwHDpGtVV707NJ2
         fFWoHTulrrp5cJbf+QS9yA3rQ21HhnSj3jH9jg/bqxxBoUwLsUTqCSf/++wMIkEn2z
         ydDZHoM4rfHM9aavjmCGZGY1rgEd/rU+NQz0VWpimYAJwWSQKQUt0c98PxSB+O2V4K
         JEc0H9TdUs6xQ==
X-Nifty-SrcIP: [209.85.210.53]
Received: by mail-ot1-f53.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso12233164otq.11
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Nov 2022 15:18:38 -0800 (PST)
X-Gm-Message-State: ANoB5pnmmb213HB0Vxevy2aRTNgK7Pa4fedgscTyynqZTs0QLqQtBRXi
        Etjpzz01OKXxlLkfsq7Vd9gHox+zx8PXIwESkQg=
X-Google-Smtp-Source: AA0mqf5CYXDB/GfE5Ub+IGfDw22gm2C7bhuSHY+/5WwIUIMSlzLu8G2Lx/SI/hMktqH8enrvSwgy8ZW0GUsdQVecV0o=
X-Received: by 2002:a9d:282:0:b0:66c:794e:f8c6 with SMTP id
 2-20020a9d0282000000b0066c794ef8c6mr32366801otl.343.1669850317716; Wed, 30
 Nov 2022 15:18:37 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
In-Reply-To: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 1 Dec 2022 08:18:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
Message-ID: <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
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

On Wed, Nov 30, 2022 at 2:10 AM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> Port silent mode detection to the future (post make-4.4) versions of gnu =
make.
>
> Makefile contains the following piece of make code to detect if option -s=
 is
> specified on the command line.
>
> ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>
>
> This code is executed by make at parse time and assumes that MAKEFLAGS
> does not contain command line variable definitions.
> Currently if the user defines a=3Ds on the command line, then at build on=
ly
> time MAKEFLAGS contains " -- a=3Ds".
> However, starting with commit dc2d963989b96161472b2cd38cef5d1f4851ea34
> MAKEFLAGS contains command line definitions at both parse time and
> build time.
>
> This '-s' detection code then confuses a command line variable
> definition which contains letter 's' with option -s.
>
> E.g.
> $ # old make
> $ make net/wireless/ocb.o a=3Ds
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
> $ # this a new make which defines makeflags at parse time
> $ ~/src/gmake/make/l64/make net/wireless/ocb.o a=3Ds
> $
>
> We can see here that the letter 's' from 'a=3Ds' was confused with -s.
>
> This patch checks for presence of -s using a method recommended by the
> make manual here
> https://www.gnu.org/software/make/manual/make.html#Testing-Flags.




The GNU Make manual is written with the latest Make version in mind.


"Recall that MAKEFLAGS will put all single-letter options (such as =E2=80=
=98-t=E2=80=99)
into the first word, and that word will be empty if no single-letter
options were given."

This statement is not true for GNU Make 3.82, which the kbuild supports.




$ git show 6f0fa58
commit 6f0fa58e459642b16901521cc58ac474b787ec5b
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri May 19 20:42:30 2017 +0900

    kbuild: simplify silent build (-s) detection


[snip]

    Test cases:

    [1] command line input:    make --silent
         -> MAKEFLAGS for Make 3.8x:    s
         -> MAKEFLAGS for Make 4.x :    s

    [2] command line input:    make -srR
         -> MAKEFLAGS for Make 3.8x:    sRr
         -> MAKEFLAGS for Make 4.x :    rRs

    [3] command line input:    make -s -rR --warn-undefined-variables
         -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
         -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables








As this commit description says, Make 3.8x puts long
options before the collection of single letter options.

So, this patch does not work for Make 3.82.





--=20
Best Regards
Masahiro Yamada
