Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C42C2E0A3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 14:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgLVNEQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 08:04:16 -0500
Received: from codesynthesis.com ([188.40.148.39]:49464 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgLVNEQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 08:04:16 -0500
Received: from brak.codesynthesis.com (unknown [102.68.73.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id C7A015F159;
        Tue, 22 Dec 2020 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1608642214;
        bh=qznzZQegaF7HntZLKKTYq7vuEt2v7POEfBAM8S6jyoA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=wXGRGFbn4Mtg9DiLpkMv37fb3qMWrenxBpryLGP4aGuHu6Pcw3AWLAT10QjYiJu5h
         kmiB9By2L7aKmaEgdwvb9SydS2mzfW42kqrewkChobOSnE9QOf8/f12QL/ziXiKwCi
         RF77KFLlBTn+QZ8TQEXrYf8hazZoUrxBDrg08QIni/rsUqJtiRVdeUFO33b51SdLdS
         Mxlpbv+P2TEbBNKZQAlVJIjVzjniQLazEQ64MzfQ5CMuQMAfivYQRVul1MVyGXz87r
         z+ZysAZuX3QNyPSoFalobQvUN8QCIczr1UyqwQwaAxTAuvaxoEWQWcjk0bKvrfQ3KC
         BTX/zbjW9U+3Q==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 79FE31A800C4; Tue, 22 Dec 2020 15:03:29 +0200 (SAST)
Date:   Tue, 22 Dec 2020 15:03:29 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: kconfig: diagnostics cleanups
Message-ID: <boris.20201222143845@codesynthesis.com>
References: <boris.20201125161355@codesynthesis.com>
 <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
 <boris.20201202094405@codesynthesis.com>
 <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
 <boris.20201221152859@codesynthesis.com>
 <CAK7LNASr46SwexEigXutmA=jVpFqbi9QDQ_zom+HV5XynrrBOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASr46SwexEigXutmA=jVpFqbi9QDQ_zom+HV5XynrrBOQ@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Mon, Dec 21, 2020 at 11:05 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
> 
> > If you want this ability, then let's find a way do it properly
> > rather than spreading further hacks. For example, in the build
> > system I am working on, we have suport for multi-line diagnostics
> > records that to the user look like this:
> >
> > Makefile:3: error: This is the first line
> >   This is the second line
> >   This is the last line
> 
> I also thought about this possibility.
> 
> define newline
> 
> 
> endef
> 
> 
> $(warning This is first line$(newline) \
>   This is the second line$(newline) \
>   This is the last line\
> )

Or we could extend these functions to accept additional lines of
diagnostics as additional arguments:

$(warning This is first line,\
This is the second line,\
This is the last line)


> > How is me (as a user) redirecting stderr to a location of
> > my choosing and only ending up with half of the diagnostics
> > there (with the other half silently overridden by the GUI)
> > not problematic?
> 
> This is a hypothetical argument since we have no user of $(info).
> $(info) is not a warning.
> The change is unneeded.

There is no use in the Linux kernel but there could be in other
projects that re-use the kconfig machinery. By narrowly focusing
only on the kernel's needs to the point of ignoring bugs that are
not triggered, you leave such projects no choice but to fork. While
this attitude means less work for you in the short term, it also
makes authors of such projects less interested in contributing
anything back. For example, I have a fix for SIGSEGV sitting in
my branch that I have very little incentive to try to upstream
since I will now be maintaining other fixes out of tree and one
more doesn't really make any difference.
