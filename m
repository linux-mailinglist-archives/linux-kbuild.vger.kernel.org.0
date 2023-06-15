Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21C6731B2E
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jun 2023 16:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238918AbjFOOW0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 10:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240015AbjFOOWZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 10:22:25 -0400
Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com [IPv6:2001:41d0:1004:224b::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCE72704
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 07:22:23 -0700 (PDT)
Date:   Thu, 15 Jun 2023 10:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686838939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TH3v/y8CUSUfU9mKHZ7rwbY7Qjs6vrJ3/gkBpBRwQ4o=;
        b=MFJqmsikITKUSLnnLStSeVxQ1QZw7DZsmYaaWSHd6bxCDzBPzkVbpet2HtDmJfkPGKhTfD
        11KK4IBn7LjwLjD4YR2XTxAACACl+JCSfxqSaR1MLsEATylwanla2oCazNCJs3Qh0I1di8
        ZOgT5+TOnGjAc4U1arbx/4vrhAH1UZ0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Peter Oberparleiter <oberpar@linux.ibm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIsek6ChkwkTHf2+@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 15, 2023 at 07:39:08PM +0900, Masahiro Yamada wrote:
> On Thu, Jun 15, 2023 at 6:54 PM Peter Oberparleiter
> <oberpar@linux.ibm.com> wrote:
> >
> > On 13.06.2023 20:22, Kent Overstreet wrote:
> > > On Mon, Jun 12, 2023 at 06:18:35PM +0200, Peter Oberparleiter wrote:
> > >> I'm unaware of any kbuild support for setting GCOV_PROFILE for a
> > >> specific sub-directory from the command line, only from within the
> > >> associated Makefile. I'm not sure how this could have worked in the past
> > >> with the provide sample command line.
> > >>
> > >> Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):
> > >>
> > >> ifeq ($(CONFIG_GCOV_KERNEL),y)
> > >> _c_flags += $(if $(patsubst n%,, \
> > >> $(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)),\
> > >> $(CFLAGS_GCOV))
> > >> endif
> > >>
> > >> This bit of Makefile code determines whether to add the flags needed to
> > >> enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
> > >> current compilation unit (_c_flags) by looking at the concatenation of
> > >> the following variables:
> > >>
> > >> - GCOV_PROFILE_<target base name>.o
> > >> - GCOV_PROFILE
> > >> - CONFIG_GCOV_PROFILE_ALL
> > >>
> > >> gcov flags are only added if this concatenation does not start with an
> > >> "n", and at least one of these variables is set to a non-empty value
> > >> other than "n" ("y" typically). The "starts with" part is required to
> > >> enable precedence for the more specific variable, e.g. an "n" in
> > >> GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.
> > >>
> > >> As you can see, there is no reference to a GCOV_PROFILE variable that is
> > >> named after the sub-directory for which profiling should be enabled.
> > >
> > > I've been digging through the git history, and I would swear I
> > > hallucinated the whole thing except I have the code in ktest for driving
> > > gcov and I swear it used to work :)
> > >
> > > Anyways - any thoughts on how we might implement this? I really need a
> > > way to specify directories to enable gcov for _without_ monkey patching;
> > > that's not a viable workflow in an automated setup.
> > >
> > > It seems like if we can get a list of directory prefixes for a path
> > > (e.g. given fs/bcachefs/btree_iter.o it would return fs, fs/bcachefs) it
> > > should be possible to extend the code you referenced.
> >
> > I'll likely not be able to implement this myself, but if you or anyone
> > else wants to go that route, here are my thoughts: $(src) should have
> > the relative source code path that is needed, so here's what needs to be
> > done:
> >
> > 1. Determine how to handle non-letter/digit/underscore characters in the
> >    variable name:
> >
> >    a) GCOV_PROFILE_fs/bcachefs => supported by GNU make [1], though
> >       discouraged due to possible side-effects
> >    b) GCOV_PROFILE_fs_bcachefs => might cause overlays, e.g. a/b/c and
> >       a/b_c both have the same a_b_c suffix
> >
> >    Personally I'd prefer option b)
> >
> > 2. Define a new Makefile variable that contains $(src) with required
> >    character replacements (scripts/Kbuild.include might be a good place)
> >
> > 3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
> >    (scripts/Makefile.lib)
> >
> > 4. Document the use of this new Makefile variable in kernel/gcov/Kconfig
> >    and Documentation/dev-tools/gcov.rst
> >
> > Since this new path-suffix version would be the first
> > GCOV_PROFILE-variable that is primarily intended to be specified on the
> > make command line and not added to a Makefile, it should probably take
> > precedence over all other versions. To achieve that it would need to be
> > specified first in the $(patsubst) statement.
> >
> > Once implemented, one might also consider extending this new support to
> > other variables like KASAN_SANITIZE or KCOV_INSTRUMENT, since all of
> > these are implemented the same way. I don't know whether that's useful
> > in all cases though.
> >
> > [1] https://www.gnu.org/software/make/manual/make.html#Using-Variables
> >
> > --
> > Peter Oberparleiter
> > Linux on IBM Z Development - IBM Germany R&D
> >
> 
> 
> I do not think it is a sensible proposal.
> 
> Another idea could be something like
> CONFIG_GCOV_PROFILE_PATH=fs/bcachefs

With that it would only be possible to enable profiling for a single
subdirectory, and that's not going to be enough; when doing code
coverage analysis of a module we may want to profile library code/other
modules it depends on.

> or isn't it possible to filter dynamically?
> I think ftrace can change filtering dynamically.
> I do not know if it is possible for GCOV because I do not use it.

gcov requires different build flags, so no, not possible.
