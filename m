Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EB3362B93
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 00:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhDPWp7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 18:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbhDPWp5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 18:45:57 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C140C061574;
        Fri, 16 Apr 2021 15:45:31 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXXD1-005sC3-EJ; Fri, 16 Apr 2021 22:45:07 +0000
Date:   Fri, 16 Apr 2021 22:45:07 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Connor Kuehl <ckuehl@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
Message-ID: <YHoTc+5DGnvwwI0R@zeniv-ca.linux.org.uk>
References: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
 <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com>
 <20210416220416.GA11872@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416220416.GA11872@1wt.eu>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 12:04:16AM +0200, Willy Tarreau wrote:

> Yep but I kept it just to have comparable output code since in C
> you'd simply use "goto leave" and not have this function call to
> do the cleanup.

... or use any number of other technics; the real question was how
much of cleanups would be skipped by that syntax sugar.

IME anything that interacts with flow control should be as explicit
and unambiguous as possible.  _Especially_ concerning how large
a scope are we leaving.

There's a bunch of disciplines that make use of that kind of tools
and do it more or less safely, but they need to be well-specified
and very well understood.  And some tools (C++-style exceptions,
for example) simply need to be taken out and shot, but that's
a separate story^Wflamewar...
