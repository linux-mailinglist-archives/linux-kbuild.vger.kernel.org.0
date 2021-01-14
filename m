Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29B82F6098
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 12:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbhANL5H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 06:57:07 -0500
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:4031 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbhANL5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 06:57:04 -0500
Received: from thorin.petrovitsch.priv.at (80-110-120-15.cgn.dynamic.surfer.at [80.110.120.15])
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id 10EBtQms024298
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
        Thu, 14 Jan 2021 12:55:27 +0100
Message-ID: <53fccf6d59938e94f71a823d704e26903b98fb7d.camel@petrovitsch.priv.at>
Subject: Re: Toolchain-dependent config options
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 14 Jan 2021 12:55:26 +0100
In-Reply-To: <CAK7LNASbYiZ+UVTmUwRDGMMHQXO-oE-3a4RxbEqX+=dCG2U6dw@mail.gmail.com>
References: <20210113222112.ej4rrd5xw2pwegvw@treble>
         <CAK7LNASbYiZ+UVTmUwRDGMMHQXO-oE-3a4RxbEqX+=dCG2U6dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-DCC--Metrics: esgaroth.tuxoid.at 1481; Body=4 Fuz1=4 Fuz2=4
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_05,
        UNPARSEABLE_RELAY autolearn=unavailable version=3.3.1
X-Spam-Report: * -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
        *      [score: 0.0319]
        *  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
        * -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all!

On Thu, 2021-01-14 at 13:56 +0900, Masahiro Yamada wrote:
> On Thu, Jan 14, 2021 at 7:21 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
[...]
> > If I copy a config with CONFIG_GCC_PLUGINS to another system which
> > doesn't have the gcc-plugin-devel package, it gets silently disabled by
> > "make olddefconfig".
> > 
> > I've seen multiple cases lately where this is causing confusion.  I
> > suspect the problem is getting worse with recent added support for a
> > variety of toolchains and toolchain-dependent features.
> > 
> > Would it be possible to have an error (or at least a warning) in this
> > case?
> > 
> > For example, a "depends-error" which triggers an error if its failure
> > would disable a feature?
[...]
> We disable any feature that is unsupported by the compiler in use.
> 
> Conventionally, we did that in the top Makefile
> by using $(call cc-option, ) macro or by running some scripts.
> 
> Recently, we are moving such compiler tests to the Kconfig stage.
> 
> Anyway, we disable unsupported features so any combination
> of CONFIG options builds successfully.
> This will ease randconfg and allmodconfig tests.

For options of $CC, that makes sense since there are different
compilers and lots of versions of them out there.

> A lot of people and CI systems are running allmodconfig tests
> for various architectures and toolchains.

Isn't some kind of defying (or more killing) the usefulness
of regression compile runs if one does `make allmodconfig`
and some (lots?) of stuff gets automatically configured
out just because some
-dev(|el) package is missing?

Aren't there some kernel-build meta packages for various
distributions out there that pull all necessary in?

> Introducing the build breakage is annoying.

Yes, update/install the necessary package to fix it.

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
There is no cloud, just other people computers. - FSFE
                     LUGA : http://www.luga.at


