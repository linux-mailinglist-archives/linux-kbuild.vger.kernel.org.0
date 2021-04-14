Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4184F35FC5B
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 22:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbhDNUKr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 16:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234185AbhDNUKc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 16:10:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B217C061574;
        Wed, 14 Apr 2021 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RdrSYmxrLKuHAzw6nooCGrkMrEjM1wycFBXE5loudB8=; b=fKsblUD9gH4QeoNAtZQYxJk9jp
        7PoepJNhCBYWifx72f41Epnl6UIylf9hBL4NQmAiZD+Ww/w0pSJpWoKIMBiAHCeO96oUCgTTGoSqf
        NWq1lzxLTDQVJnowksqRP3yxFWIFq3QNV6E8aD1ROaEp6xUdV/qr+04V90Rkg1oW2m0JO+13qZOwW
        hOw7oHI4U6JocyO8vtUXgSfdsCgTGNqhkCBipfqXcdChvkTQzgOhHAe7PPpINnTpWkud0gThW7WUF
        pwBjg02AuEjISX+WmicO8ofOsu4xhc50rN3ik7ELaU3kV9PO7MS6JD9YhFYe1hOix6suu18z2J1QF
        8N5vi6bg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lWlph-007a31-Jo; Wed, 14 Apr 2021 20:09:57 +0000
Date:   Wed, 14 Apr 2021 21:09:53 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210414200953.GX2531743@casper.infradead.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
>   - Manish Goregaokar implemented the fallible `Box`, `Arc`, and `Rc`
>     allocator APIs in Rust's `alloc` standard library for us.

There's a philosophical point to be discussed here which you're skating
right over!  Should rust-in-the-linux-kernel provide the same memory
allocation APIs as the rust-standard-library, or should it provide a Rusty
API to the standard-linux-memory-allocation APIs?  You seem to be doing
both ... there was a wrapper around alloc_pages() in the Binder patches,
and then you talk about Box, Arc and Rc here.

Maybe there's some details about when one can use one kind of API and
when to use another.  But I fear that we'll have Rust code at interrupt
level trying to use allocators which assume that they can sleep, and
things will go badly wrong.

By the way, I don't think that Rust necessarily has to conform to the
current way that Linux works.  If this prompted us to track the current
context (inside spinlock, handling interrupt, performing writeback, etc)
and do away with (some) GFP flags, that's not the end of the world.
We're already moving in that direction to a certain extent with the
scoped memory allocation APIs to replace GFP_NOFS / GFP_NOIO.
