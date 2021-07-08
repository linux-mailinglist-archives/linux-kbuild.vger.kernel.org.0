Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C143BF32E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 02:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhGHBCI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 21:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhGHBCI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 21:02:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8B3C061574;
        Wed,  7 Jul 2021 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=DQ/ZqedFwNuEbvbxnVdd4B/mfUuq92y0TGsMJ/w3Rb4=; b=jg8IqGl2h31ZNsVMimKoOBaTWJ
        pZJWJyUMrT7KElP4BkLGh18OCcyt7p77lQyct5FNFLYlwDzIOV0i7bppOWOo0IXgIO7oSQQIJislh
        bvleAfjaSE6juQimQJjXA5zU2USOfrJHt/BFkya7zRwfFGtcfxsZ0aTh9LaXXxew0IXJY6s72vtv0
        z/suJRxIyxAKlUwEZA/YAbJKivGXjf1n5cC/ZupOIirSY2ilNI3GY6ntpqSPYa/KFiXVPTw1GilhO
        yfBUWJsM9VJ5AmDiVJ3i0APuSx/EstDtr+nDLY5rwnQ0k8+llG3lCAms1+4+xyQHYJFzMHQdynj+m
        cAtbdG4Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1IN6-00Cxix-4L; Thu, 08 Jul 2021 00:58:34 +0000
Date:   Thu, 8 Jul 2021 01:58:32 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Finn Behrens <finn@kloenk.dev>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOZNuEtNbsLxRM0R@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
 <YOXB7FRqldZik2Xn@kroah.com>
 <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 07, 2021 at 10:56:57PM +0200, Finn Behrens wrote:
> There is a more general use driver (network dummy) still in the making, It is fully operational, just the documentation of the rust bindings are not finished yet, so it is not merged into the rust tree yet, also I have to rebase it.

Why are you so resistant to writing a real driver that deals with actual
hardware?  A simple NVMe driver is less than a thousand lines of C.
I know the one in the kernel now is ridiculously complicated and has
been thoroughly messed up with abstractions to support NVMeoF instead
of having a separate driver, but it's really a simple interface at heart.

