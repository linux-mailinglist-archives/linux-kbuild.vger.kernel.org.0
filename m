Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CAE364AE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 22:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhDSUBl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 16:01:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:56016 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230160AbhDSUBl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 16:01:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BAA0DB020;
        Mon, 19 Apr 2021 20:01:09 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 2309EDA732; Mon, 19 Apr 2021 21:58:51 +0200 (CEST)
Date:   Mon, 19 Apr 2021 21:58:51 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20210419195850.GV7604@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>, Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 07:34:51PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 16, 2021 at 3:38 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > So if I read all this right, rust compiles to .o and, like any other .o
> > file is then fed into objtool (for x86_64). Did you have any problems
> > with objtool? Does it generate correct ORC unwind information?
> 
> I opened an issue a while ago to take a closer look at the ORC
> unwinder etc., so it is in my radar (thanks for raising it up,
> nevertheless!).
> 
> Currently, causing a panic in a nested non-inlined function (f -> g ->
> h) in one of the samples with the ORC unwinder enabled gives me
> something like:
> 
> [    0.903456]  rust_begin_unwind+0x9/0x10
> [    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking9panic_fmt+0x29/0x30
> [    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking5panic+0x44/0x50
> [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1h+0x1c/0x20
> [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1g+0x9/0x10
> [    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1f+0x9/0x10
> [    0.903456]  ?
> _RNvXCsbDqzXfLQacH_12rust_minimalNtB2_11RustMinimalNtCsbDqzXfLQacH_6kernel12KernelModule4init+0x73/0x80
> [    0.903456]  ? _RNvXsa_NtCsbDqzXfLQacH_4core3fmtbNtB5_5Debug3fmt+0x30/0x30
> [    0.903456]  ? __rust_minimal_init+0x11/0x20

Are there plans to unmangle the symbols when printing stacks? c++filt
says:

  rust_begin_unwind+0x9/0x10
  ? core[8787f43e282added]::panicking::panic_fmt+0x29/0x30
  ? core[8787f43e282added]::panicking::panic+0x44/0x50
  ? rust_minimal[8787f43e282added]::h+0x1c/0x20
  ? rust_minimal[8787f43e282added]::g+0x9/0x10
  ? rust_minimal[8787f43e282added]::f+0x9/0x10
  ? <rust_minimal[8787f43e282added]::RustMinimal as kernel[8787f43e282added]::KernelModule>::init+0x73/0x80
  ? <bool as core[8787f43e282added]::fmt::Debug>::fmt+0x30/0x30
  ? __rust_minimal_init+0x11/0x20

for simple functions it's barely parseable but the following is hardly
readable

> _RNvXs5_NtCsbDqzXfLQacH_11rust_binder11range_allocNtB5_15DescriptorStateNtNtCsbDqzXfLQacH_4core3fmt5Debug3fmt+0x60/0x60

translates to

  <rust_binder[8787f43e282added]::range_alloc::DescriptorState as core[8787f43e282added]::fmt::Debug>::fmt
