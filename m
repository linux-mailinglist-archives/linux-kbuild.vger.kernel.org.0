Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8A072EAC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jun 2023 20:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238434AbjFMSWe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jun 2023 14:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235556AbjFMSWd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2023 14:22:33 -0400
Received: from out-5.mta0.migadu.com (out-5.mta0.migadu.com [IPv6:2001:41d0:1004:224b::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D29690
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2023 11:22:32 -0700 (PDT)
Date:   Tue, 13 Jun 2023 14:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686680550;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=unhOU03iLemph2ux0yLYeF6kfjHd4s6aJs+uckSPMh0=;
        b=Je9dMFSqU0b8Di+MuvHMN+GzsFuB6ZSKJeZhmkEQmfszkV7Iaf0D00BjLghNe6ZG2hPUdT
        fnTjsGum5r8gJ3qH7nhLYpLL21XEdtyOrGnWAdeAz/mwKo1d7Qxh6sP9dmpG0AHFjP8FPp
        zyyH62mFxtZssA0V4rpU9pY5dls9Kus=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIiz4WjIB6r8Gz4l@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 12, 2023 at 06:18:35PM +0200, Peter Oberparleiter wrote:
> I'm unaware of any kbuild support for setting GCOV_PROFILE for a
> specific sub-directory from the command line, only from within the
> associated Makefile. I'm not sure how this could have worked in the past
> with the provide sample command line.
> 
> Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):
> 
> ifeq ($(CONFIG_GCOV_KERNEL),y)
> _c_flags += $(if $(patsubst n%,, \
> $(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)),\
> $(CFLAGS_GCOV))
> endif
> 
> This bit of Makefile code determines whether to add the flags needed to
> enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
> current compilation unit (_c_flags) by looking at the concatenation of
> the following variables:
> 
> - GCOV_PROFILE_<target base name>.o
> - GCOV_PROFILE
> - CONFIG_GCOV_PROFILE_ALL
> 
> gcov flags are only added if this concatenation does not start with an
> "n", and at least one of these variables is set to a non-empty value
> other than "n" ("y" typically). The "starts with" part is required to
> enable precedence for the more specific variable, e.g. an "n" in
> GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.
> 
> As you can see, there is no reference to a GCOV_PROFILE variable that is
> named after the sub-directory for which profiling should be enabled.

I've been digging through the git history, and I would swear I
hallucinated the whole thing except I have the code in ktest for driving
gcov and I swear it used to work :)

Anyways - any thoughts on how we might implement this? I really need a
way to specify directories to enable gcov for _without_ monkey patching;
that's not a viable workflow in an automated setup.

It seems like if we can get a list of directory prefixes for a path
(e.g. given fs/bcachefs/btree_iter.o it would return fs, fs/bcachefs) it
should be possible to extend the code you referenced.
