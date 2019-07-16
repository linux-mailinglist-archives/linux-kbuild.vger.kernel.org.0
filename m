Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCDA6AF3E
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 20:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388358AbfGPSwl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 14:52:41 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:39113 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728438AbfGPSwk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:52:40 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com [104.133.0.99] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6GIqIR0030513
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jul 2019 14:52:19 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 81DFE420054; Tue, 16 Jul 2019 14:52:18 -0400 (EDT)
Date:   Tue, 16 Jul 2019 14:52:18 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716185218.GB15080@mit.edu>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com>
 <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
 <20190716181324.GA41555@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716181324.GA41555@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 08:13:24PM +0200, Ingo Molnar wrote:
> 
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > On Tue, 16 Jul 2019, Ingo Molnar wrote:
> > 
> > > 
> > > * Thomas Gleixner <tglx@linutronix.de> wrote:
> > > 
> > > > The gold linker has known issues of failing the build in random and
> > > > predictible ways. H.J. stated:
> > > 
> > > s/predictable/unpredictable?
> > 
> > No. It fails randomly, but also predictable. Enable X32 support on 64bit
> > and it fails the VDSO build. That's been the case for years.
> 
> Then please make this a bit more apparent, such as:
> 
>  "The gold linker has known issues of failing the build in random
>   but also in more predictible ways."

<bikeshedding>
How about:

The gold linker has known issues of failing for certain configurations.

</bikeshedding>

					- Ted
					
