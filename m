Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479246B271
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 01:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388972AbfGPXha (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 19:37:30 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:39465 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387623AbfGPXha (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 19:37:30 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com [104.133.0.99] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6GNb898019260
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jul 2019 19:37:09 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id A0775420054; Tue, 16 Jul 2019 19:37:08 -0400 (EDT)
Date:   Tue, 16 Jul 2019 19:37:08 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Mike Lothian <mike@fireburn.co.uk>,
        Nathan Chancellor <natechancellor@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
Message-ID: <20190716233708.GA11824@mit.edu>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Lothian <mike@fireburn.co.uk>,
        Nathan Chancellor <natechancellor@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716170606.GA38406@archlinux-threadripper>
 <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
 <20190716195957.GA38495@archlinux-threadripper>
 <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
 <alpine.DEB.2.21.1907170015530.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907170015530.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 12:25:14AM +0200, Thomas Gleixner wrote:
> > It's been my default system linker for years and I've had very few issues
> > with it and it's a big improvement when linking with LTO
> 
> I understand, but the fact that you need to turn off config options in
> order to build a kernel and the clear statement that it's not recommended
> makes it truly unsuitable and unmaintainable for us.

Or if you work for a cloud company who is willing to make the gold
linker work for your specific use case and configuration (and ideally,
have gold toolchain experts on staff who will work with you), then it
might be OK, but just for that particular use case.  (Just as Android
kernels worked with Clang when Clang was still miscompiling kernel on
different architectures and configurations.)  In those cases, you can
just carry a patch to force the gold linker to work.

The point though is the teams that were using alternative,
not-always-reliable toolchains, were big boys and girls, and they
weren't asking the upstream kernel devs for support.  And they only
cared about a few specific configurations, and not something that
would work for all or even most configurations and hardware platforms.

	      	       	      	   	- Ted
