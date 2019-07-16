Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B8E6B1C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 00:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbfGPWZY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 18:25:24 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51238 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbfGPWZY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 18:25:24 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hnVsp-0007Sz-HC; Wed, 17 Jul 2019 00:25:16 +0200
Date:   Wed, 17 Jul 2019 00:25:14 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Mike Lothian <mike@fireburn.co.uk>
cc:     Nathan Chancellor <natechancellor@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
In-Reply-To: <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907170015530.1767@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de> <20190716170606.GA38406@archlinux-threadripper> <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de> <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
 <20190716195957.GA38495@archlinux-threadripper> <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
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

Mike,

On Tue, 16 Jul 2019, Mike Lothian wrote:
> On Tue, 16 Jul 2019 at 21:00, Nathan Chancellor wrote
> 
> Would it be possible to force ld.bfd with -fuse-ld=bfd when gold is detected?

It's probably possible but way beyond my kbuild foo.

Adding LD=ld.bfd to the make invocation is the trivial workaround.

> Are there gold bug reports for any of the issues that have been seen
> with gold?

Yes. Some got resolved, some not.

> It's been my default system linker for years and I've had very few issues
> with it and it's a big improvement when linking with LTO

I understand, but the fact that you need to turn off config options in
order to build a kernel and the clear statement that it's not recommended
makes it truly unsuitable and unmaintainable for us.

If the gold people are interested to link a kernel and resolve all issues,
this surely can be revisited. We work with tooling folks and we try to
accomodate different tools, see the ongoing efforts for clang, but that
requires commitment from the tooling side.

Thanks,

	tglx


