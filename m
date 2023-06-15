Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B850E731598
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jun 2023 12:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjFOKkN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 06:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244885AbjFOKjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 06:39:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9621BC
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 03:39:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFF2860CA4
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 10:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55374C433C8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686825585;
        bh=IKiJt09LGGXMMtPg7/hUpa3hsgYZ9Vrkk3C88cL2Tbc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NIt7mtWE3thS3Iy/DeeTLlVVh5GqAtc3uFG6NQYAq+ARnujixOY+0YGe0WkraVw1W
         vszKMlXWz3yI2MKkmUo9LED3BN8CsqnTtZs1E/q1/x3a8KcBBk+lxfJcoc4ZVkRwpi
         HsV1bFSWRQKizRhFCtb05KaP+GJE68nkR7gjdhhQNRX28VjcYeb3jmhSBWiIPOfCq1
         EKoFOxs4xDshUOtShKP99qFqwY85qmYhSFqhCkkTuLNFg1dr6FLp61hJidN/42ATbG
         4X1r/6SKUhMhYVNFa7cdJ6dC3gFoHz+V0t6FreYPblVlZM/IMt9hubKfvRwMKtiAAF
         KwFXYFvwfy2JA==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-558a79941c6so1297004eaf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 03:39:45 -0700 (PDT)
X-Gm-Message-State: AC+VfDzJH4mCfHdq5z0ApnMzskMK4stiMLeWvC6HVm9VjtrXWU50G52t
        6g7ocD3Q0vtEqqJQAMKXZgON6mdrokZ9m4Zqp+I=
X-Google-Smtp-Source: ACHHUZ55jlaUvAPXu1+FKETMPcxPzGFipBK5s8Y1rix8CuguUjK+fHZK56PfFkWhfr8YDownS6AtzPQROzihADY4fcE=
X-Received: by 2002:a4a:b4c2:0:b0:558:b60d:edfd with SMTP id
 g2-20020a4ab4c2000000b00558b60dedfdmr12669399ooo.3.1686825584582; Thu, 15 Jun
 2023 03:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <ZIOmUkXlegycIExQ@moria.home.lan> <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan> <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan> <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
In-Reply-To: <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Jun 2023 19:39:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
Message-ID: <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
Subject: Re: Specifying CFLAGS for a directory on the command line
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 15, 2023 at 6:54=E2=80=AFPM Peter Oberparleiter
<oberpar@linux.ibm.com> wrote:
>
> On 13.06.2023 20:22, Kent Overstreet wrote:
> > On Mon, Jun 12, 2023 at 06:18:35PM +0200, Peter Oberparleiter wrote:
> >> I'm unaware of any kbuild support for setting GCOV_PROFILE for a
> >> specific sub-directory from the command line, only from within the
> >> associated Makefile. I'm not sure how this could have worked in the pa=
st
> >> with the provide sample command line.
> >>
> >> Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):
> >>
> >> ifeq ($(CONFIG_GCOV_KERNEL),y)
> >> _c_flags +=3D $(if $(patsubst n%,, \
> >> $(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_AL=
L)),\
> >> $(CFLAGS_GCOV))
> >> endif
> >>
> >> This bit of Makefile code determines whether to add the flags needed t=
o
> >> enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
> >> current compilation unit (_c_flags) by looking at the concatenation of
> >> the following variables:
> >>
> >> - GCOV_PROFILE_<target base name>.o
> >> - GCOV_PROFILE
> >> - CONFIG_GCOV_PROFILE_ALL
> >>
> >> gcov flags are only added if this concatenation does not start with an
> >> "n", and at least one of these variables is set to a non-empty value
> >> other than "n" ("y" typically). The "starts with" part is required to
> >> enable precedence for the more specific variable, e.g. an "n" in
> >> GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.
> >>
> >> As you can see, there is no reference to a GCOV_PROFILE variable that =
is
> >> named after the sub-directory for which profiling should be enabled.
> >
> > I've been digging through the git history, and I would swear I
> > hallucinated the whole thing except I have the code in ktest for drivin=
g
> > gcov and I swear it used to work :)
> >
> > Anyways - any thoughts on how we might implement this? I really need a
> > way to specify directories to enable gcov for _without_ monkey patching=
;
> > that's not a viable workflow in an automated setup.
> >
> > It seems like if we can get a list of directory prefixes for a path
> > (e.g. given fs/bcachefs/btree_iter.o it would return fs, fs/bcachefs) i=
t
> > should be possible to extend the code you referenced.
>
> I'll likely not be able to implement this myself, but if you or anyone
> else wants to go that route, here are my thoughts: $(src) should have
> the relative source code path that is needed, so here's what needs to be
> done:
>
> 1. Determine how to handle non-letter/digit/underscore characters in the
>    variable name:
>
>    a) GCOV_PROFILE_fs/bcachefs =3D> supported by GNU make [1], though
>       discouraged due to possible side-effects
>    b) GCOV_PROFILE_fs_bcachefs =3D> might cause overlays, e.g. a/b/c and
>       a/b_c both have the same a_b_c suffix
>
>    Personally I'd prefer option b)
>
> 2. Define a new Makefile variable that contains $(src) with required
>    character replacements (scripts/Kbuild.include might be a good place)
>
> 3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
>    (scripts/Makefile.lib)
>
> 4. Document the use of this new Makefile variable in kernel/gcov/Kconfig
>    and Documentation/dev-tools/gcov.rst
>
> Since this new path-suffix version would be the first
> GCOV_PROFILE-variable that is primarily intended to be specified on the
> make command line and not added to a Makefile, it should probably take
> precedence over all other versions. To achieve that it would need to be
> specified first in the $(patsubst) statement.
>
> Once implemented, one might also consider extending this new support to
> other variables like KASAN_SANITIZE or KCOV_INSTRUMENT, since all of
> these are implemented the same way. I don't know whether that's useful
> in all cases though.
>
> [1] https://www.gnu.org/software/make/manual/make.html#Using-Variables
>
> --
> Peter Oberparleiter
> Linux on IBM Z Development - IBM Germany R&D
>


I do not think it is a sensible proposal.

Another idea could be something like
CONFIG_GCOV_PROFILE_PATH=3Dfs/bcachefs
or isn't it possible to filter dynamically?
I think ftrace can change filtering dynamically.
I do not know if it is possible for GCOV because I do not use it.

But, the best would be to not implement it at all
until we know that it is a wide demand.
The upstream is not a place to cater to every feature request.



--=20
Best Regards
Masahiro Yamada
