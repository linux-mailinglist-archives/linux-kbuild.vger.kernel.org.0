Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CDE364B14
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 22:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239342AbhDSUTF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 16:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhDSUTE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 16:19:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8E6C06174A;
        Mon, 19 Apr 2021 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=L/P0K+YIm3SJ8u0M3dCxev/vLY68xfu2tyMwx4tY10c=; b=KetrrqMHF9BqlpW1rvRwZmk1sd
        CftfB6poj7z6VpGELq1gPo6fhnjxIUBekze6/sFG081hRiMfazhWeKoy9qkWyoMH/pxqD1R9GI5et
        7KdqSC4fl4fTcYC7Io+zsY2VI1VuKYvqXKiefkkyVh6KHUl2tsssZrQ0itmryBgIOlBtkCiTmsWXW
        T+8nmtsLwoB9KW9PGRC+shl0b3jH/T6OXwol5SBQ7Pl411mRDQAca/1Gyy8LDJ85kjkjO1UPISF3U
        +xWDBiGb3ldIhGOY01vuzVqwwyNxUMD7A/8eL6+tcIFqJo1jz2f2YxHdjO4Ohw2OcKQOJpdiF1EAX
        Idvk8rcw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lYaKf-00EEWS-Bz; Mon, 19 Apr 2021 20:17:35 +0000
Date:   Mon, 19 Apr 2021 21:17:21 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     dsterba@suse.cz, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
Message-ID: <20210419201721.GF2531743@casper.infradead.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
 <20210419195850.GV7604@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419195850.GV7604@twin.jikos.cz>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 09:58:51PM +0200, David Sterba wrote:
> On Fri, Apr 16, 2021 at 07:34:51PM +0200, Miguel Ojeda wrote:
> > something like:
> > 
> > [    0.903456]  rust_begin_unwind+0x9/0x10
> > [    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking9panic_fmt+0x29/0x30
> > [    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking5panic+0x44/0x50
> > [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1h+0x1c/0x20
> > [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1g+0x9/0x10
> > [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1f+0x9/0x10
> > [    0.903456]  ?
> > _RNvXCsbDqzXfLQacH_12rust_minimalNtB2_11RustMinimalNtCsbDqzXfLQacH_6kernel12KernelModule4init+0x73/0x80
> > [    0.903456]  ? _RNvXsa_NtCsbDqzXfLQacH_4core3fmtbNtB5_5Debug3fmt+0x30/0x30
> > [    0.903456]  ? __rust_minimal_init+0x11/0x20
> 
> Are there plans to unmangle the symbols when printing stacks? c++filt
> says:
> 
>   rust_begin_unwind+0x9/0x10
>   ? core[8787f43e282added]::panicking::panic_fmt+0x29/0x30
>   ? core[8787f43e282added]::panicking::panic+0x44/0x50
>   ? rust_minimal[8787f43e282added]::h+0x1c/0x20
>   ? rust_minimal[8787f43e282added]::g+0x9/0x10
>   ? rust_minimal[8787f43e282added]::f+0x9/0x10
>   ? <rust_minimal[8787f43e282added]::RustMinimal as kernel[8787f43e282added]::KernelModule>::init+0x73/0x80
>   ? <bool as core[8787f43e282added]::fmt::Debug>::fmt+0x30/0x30
>   ? __rust_minimal_init+0x11/0x20
> 
> for simple functions it's barely parseable but the following is hardly
> readable
> 
> > _RNvXs5_NtCsbDqzXfLQacH_11rust_binder11range_allocNtB5_15DescriptorStateNtNtCsbDqzXfLQacH_4core3fmt5Debug3fmt+0x60/0x60
> 
> translates to
> 
>   <rust_binder[8787f43e282added]::range_alloc::DescriptorState as core[8787f43e282added]::fmt::Debug>::fmt

Yes, I agree, we need a better story for name mangling.
My proposal is that we store a pretty name which matches the source
(eg rust_binder::range_alloc) and a sha1 of the mangled symbol
(40 bytes of uninteresting hex).  Symbol resolution is performed against
the sha1.  Printing is of the pretty name.  It should be obvious from
the stack trace which variant of a function is being called, no?
