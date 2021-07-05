Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA353BB671
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 06:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhGEEiw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 00:38:52 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:57221 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229447AbhGEEiv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 00:38:51 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 1654ZWv9030978;
        Mon, 5 Jul 2021 06:35:32 +0200
Date:   Mon, 5 Jul 2021 06:35:32 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Gary Guo <gary@garyguo.net>
Cc:     Matthew Wilcox <willy@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <20210705043532.GA30964@1wt.eu>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
 <20210704222043.000026b3@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704222043.000026b3@garyguo.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:20:43PM +0100, Gary Guo wrote:
> On Sun, 4 Jul 2021 22:04:49 +0100
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > On Sun, Jul 04, 2021 at 10:27:40PM +0200, ojeda@kernel.org wrote:
> > > From: Miguel Ojeda <ojeda@kernel.org>
> > > 
> > > Rust symbols can become quite long due to namespacing introduced
> > > by modules, types, traits, generics, etc.
> > > 
> > > Increasing to 255 is not enough in some cases, and therefore
> > > we need to introduce 2-byte lengths to the symbol table. We call
> > > these "big" symbols.
> > > 
> > > In order to avoid increasing all lengths to 2 bytes (since most
> > > of them only require 1 byte, including many Rust ones), we use
> > > length zero to mark "big" symbols in the table.  
> > 
> > What happened to my suggestion from last time of encoding symbols <
> > 128 as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
> > data[1]) ?
> 
> Yeah, I agree ULEB128 or similar encoding scheme would be better than
> using 0 as an escape byte. If ULEB128 is used and we restrict number of
> bytes to 2, it will encode numbers up to 2**14 instead of 2**16 like the
> current scheme, but that should be sufficient anyway.

Actually plenty of variants of such encodings exist. You can split the
first byte on 192 to keep 6 upper bits, 224 for 5, 240 for 4, etc. It
all depends how long the maximum string is expected to be and how often
we expect to see large strings. For example when splitting around 240,
all sizes from 0 to 239 take one byte, and sizes from 240 to 4335 take
two bytes.

But if strings >128 are already extremely rare we don't really care
about the extra byte needed to encode them.

Willy
