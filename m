Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6BD3BAF61
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 00:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhGDWpR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 18:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGDWpR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 18:45:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77389C061574;
        Sun,  4 Jul 2021 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xtcuflbG6V/1JlvW4xdoIPk6pojTTMLLnJIHQJBxuHE=; b=HnU0Im7UY/ke3GadqxbisGQBDi
        U+u4YSYiXdknjeVfND/u0mTNVX3iHt+We8TLUrsrtdkTFTS/wMBU1c2MedcwfHaKNrmdI2IUu/eMZ
        1TzbprAYDesMnwMi94W1v17kRw8pvOL10M5boKLAqU3P3MqJxdw7OBnrhWXr1Ma/4pBSE2HZyaLQ1
        AoJY4ovXZtHReBRX3e60YmV61SOZDeTdWJM3IQBd6MzGTgXT9fvug7g+DZoYd+o7k6+B6SiMwvk5Y
        pXPf1wjkjxHD+B5XAHFj7xz/cCiVh9+e0JGoko535HXO0VxFR0QV7g8Vf/Gl0kcvA2C3qwWS3GJ74
        7iuORfGg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m0AoO-009eDv-00; Sun, 04 Jul 2021 22:42:13 +0000
Date:   Sun, 4 Jul 2021 23:42:03 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <YOI5O6/RpaN1P6mM@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
 <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
 <YOIpM3iFT5roz69i@casper.infradead.org>
 <20210704232007.0000357e@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704232007.0000357e@garyguo.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 11:20:07PM +0100, Gary Guo wrote:
> This is big endian.

Fundamentally, it doesn't matter whether it's encoded as top-7 +
bottom-8 or bottom-7 + top-8.  It could just as well be:

        if (len >= 128) {
                len -= 128;
                len += *data * 256;
                data++;
        }

It doesn't matter whether it's compatible with some other encoding.
This encoding has one producer and one consumer.  As long as they agree,
it's fine.  If you want to make an argument about extensibiity, then
I'm going to suggest that wanting a symbol name more than 32kB in size
is a sign you've done something else very, very wrong.

At that point, you should probably switch to comparing hashes of the
symbol instead of the symbol.  Indeed, I think we're already there at
300 byte symbols; we should probably SipHash the full, unmangled symbol
[1].  At 33k symbols in the current kernel, the risk of a collision of
a 64-bit value is negligible, and almost every kernel symbol is longer
than 7 bytes (thankfully).

[1] ie SipHash("void unlock_page(struct page *)")
