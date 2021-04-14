Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EFF35FBDE
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353492AbhDNTue (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238322AbhDNTud (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:50:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66895C061574;
        Wed, 14 Apr 2021 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9x8ZktEIhCV4MzTWeStYBsK6n6m34DEopr5z7vUMvHw=; b=MTSZcQCacVdZrR1zQHVjZ2cPxi
        lmKJXhSHXifSlLX98ydPQNQ27BfOPFgV80+gbeoCIZ3Qu8mQ2vy4qrnd9sLq8KrIwRXr2VY8NHAtv
        WoufI/4CPmS47JD5+VgkLaz9WGtneiKoRk6eVhX3qqhvvlHTJP04fU7m8MLh/7GBJ/2b1mwmqgXRB
        NHVubNIEqM580OPz6Qvqy0tzyN3h+kQ+t0xrQdO7WuGPXCzkb5mdzd3I9Yz1sU4LfZzSJHN/nCjOY
        XaMY4ZyW5QHWcvCU8Js3VDtZfgKDwjkvuXbdGHiRuCiF9ufZb7661gyOQmsWcEJXIug/D7M1pmZy7
        vkZE7uzA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lWlWE-007YZ2-36; Wed, 14 Apr 2021 19:49:52 +0000
Date:   Wed, 14 Apr 2021 20:49:46 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
Message-ID: <20210414194946.GW2531743@casper.infradead.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CANiq72mpjQh01QovUPCjdHDS-zVHroxymet67GOHvotW8wGdVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mpjQh01QovUPCjdHDS-zVHroxymet67GOHvotW8wGdVg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 09:42:26PM +0200, Miguel Ojeda wrote:
> On Wed, Apr 14, 2021 at 9:34 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Honestly, I'd like to see a real example. This is fine for testing,
> > but I'd like to see something a bit more real, and a bit less special
> > than the Android "binder" WIP that comes a few patches later.
> >
> > Would there be some kind of real driver or something that people could
> > use as a example of a real piece of code that actually does something
> > meaningful?
> 
> Yeah, we are planning to write a couple of drivers that talk to actual
> hardware. Not sure which ones we will do, but we will have them
> written.

I'd suggest NVMe as a target.  It's readily available, both as real
hardware and in (eg) qemu.  The spec is freely available, and most devices
come pretty close to conforming to the spec until you start to push hard
at the edges.  Also then you can do performance tests and see where you
might want to focus performance efforts.
