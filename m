Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37932458DF
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Aug 2020 19:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgHPRxW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 13:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgHPRxV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 13:53:21 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADF7C061786;
        Sun, 16 Aug 2020 10:53:20 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k7Mq7-00GvCw-2t; Sun, 16 Aug 2020 17:53:03 +0000
Date:   Sun, 16 Aug 2020 18:53:03 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Michael Witten <mfwitten@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
Message-ID: <20200816175303.GB1236603@ZenIV.linux.org.uk>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 16, 2020 at 04:35:00PM -0000, Michael Witten wrote:
> This is not just a matter of style; this is a matter of semantics,
> especially with regard to:
> 
>   * const Correctness.
>     A const-declared variable must be initialized when defined.
> 
>   * Conditional Compilation.
>     When there is complex interaction between compile-time
>     configuration options, it's essential to be able to
>     make declarations where needed; otherwise unnecessary
>     gymnastics are required to silence the compiler.
> 
> Gentleman... Just let people say exactly what they mean to say.
> 
> Requiring every declaration to be at the top of a block is an
> antiquated, vestigial naivete from a time when C was just a
> glorified abstraction over conventional patterns in assembly
> programming.
> 
> We are not just programming anymore. We are now encoding our
> very thoughts, and thus we need this expressiveness in order
> to capture those thoughts with sufficient clarity.

You obviously need every bit of help in that task, judging by the amount
of clarity (or thoughts, for that matter) visible in the spew above...

NAK.  And as for letting people say exactly what they mean to say...
I am tempted to take you on that invitation, but that would be cruel
to gregkh - he would have to reply to inevitable screeds about
CoC-violating postings on l-k.
