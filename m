Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524B26AF6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 20:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388494AbfGPS7w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 14:59:52 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:50978 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbfGPS7v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:59:51 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hnSfy-0008Cc-3y; Tue, 16 Jul 2019 20:59:46 +0200
Date:   Tue, 16 Jul 2019 20:59:45 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
In-Reply-To: <20190716170606.GA38406@archlinux-threadripper>
Message-ID: <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de> <20190716170606.GA38406@archlinux-threadripper>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 16 Jul 2019, Nathan Chancellor wrote:
> On Tue, Jul 16, 2019 at 02:47:56PM +0200, Thomas Gleixner wrote:
> > The gold linker has known issues of failing the build in random and
> > predictible ways. H.J. stated:
> > 
> >   "Since building a workable kernel for different kernel configurations
> >    isn't a requirement for gold, I don't recommend gold for kernel."
> > 
> > So instead of dealing with attempts to duct tape gold support without
> > understanding the root cause, fail the build when gold is detected.
> > 
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
> > ---
> >  scripts/Kconfig.include |    3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
> >  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> >  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> >  
> > +# Fail if the linker is gold as it's not capable of linking the kernel proper
> > +$(error-if,$(success, command -v $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> 
> Why are there two '-v' flags here? The second one is ignored since
> command -v just prints out the path of the binary that is being used,
> which would work in most cases but not if gold is the default system
> linker.
> 
> $ command -v ld.gold -v
> /usr/bin/ld.gold
> 
> $ command -v ld.gold
> /usr/bin/ld.gold
> 
> $ command ld.gold -v
> GNU gold (GNU Binutils 2.32) 1.16
> 
> Thus, wouldn't it be better to just call $(LD) directly, like
> CC_IS_GCC and CC_IS_CLANG in init/Kconfig?
> 
> $(success, $(LD) -v | grep -q gold)

Right you are. Copy and paste without brain ....
