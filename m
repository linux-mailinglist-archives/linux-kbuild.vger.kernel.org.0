Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA78672A6D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 01:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjFIXpi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 19:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjFIXp2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 19:45:28 -0400
X-Greylist: delayed 496 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 16:45:19 PDT
Received: from out-7.mta1.migadu.com (out-7.mta1.migadu.com [95.215.58.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B744135B0
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 16:45:19 -0700 (PDT)
Date:   Fri, 9 Jun 2023 19:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686353819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bzaU8vcxYu0k4jCP90Cpt22w+lR/7oe8G7S9ZtZnmEs=;
        b=eyrZX5BE7XaXqboYgTM8hU6mJDX3j6zFSBotzYwj7f6ZIUtAQVeVIkJ2ld7GFPLZx2hhwa
        xBxf/2x5vaVzg6V0p2BVn/Fqd8MhU28EN86bikv2CJwOMrlFDLllxUheDhmA3HKXwyxrDn
        8WBNuZGy1feedpOegSJa5jw2X/beq30=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Peter Oberparleiter <oberpar@linux.ibm.com>
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIO3leNyqOeJw6u3@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
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

Adding Peter to the cc, because I just realized gcov has a maintainer :)

On Fri, Jun 09, 2023 at 04:12:56PM -0700, Nick Desaulniers wrote:
> On Fri, Jun 9, 2023 at 4:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Fri, Jun 9, 2023 at 3:23 PM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > Hello kbuild maintainers & list,
> > >
> > > Years ago I used to be able to specify additional CFLAGS for a specific
> >
> > Probably cause it's KCFLAGS ;)
> >
> > I used this yesterday, it works.
> >
> > > subdirectory on the command line, which I used for enabling gcov
> 
> Ah, for a specific subdir? No I've not seen that, at least from the
> command line.  Such flags can be specified via Makefile
> `subdir-ccflags-y`.

Sorry, not CFLAGS, I misread my old code - it's just a make variable.

From Documentation/dev-tools/gcov.rst, you enable gcov on a specific
subdirectory by editing that directory's makefile, and adding

GCOV_PROFILE := y

or, for a specific file within that directory,

GCOV_PROFILE_main.o := y

So, if appending a file to GCOV_PROFILE works, why not a path?

This used to work - my old code would pass GCOV_PROFILE_fs_bcachefs=y on
the make command line, but doesn't anymore.

Alas I have nowhere near the make-fu to debug this, and I believe I
tried to bisect this back in the day but got nowhere... :)
