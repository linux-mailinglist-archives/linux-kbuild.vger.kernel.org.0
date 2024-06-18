Return-Path: <linux-kbuild+bounces-2211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8B90DCAE
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 21:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB3591C22102
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 19:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0091916CD2F;
	Tue, 18 Jun 2024 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lpPDcgcP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5471F608;
	Tue, 18 Jun 2024 19:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718739776; cv=none; b=g0oB4/9aMD0XUPsLHfBR/PZyUn8h5B6H3iGEtDWV0BhCC+Jh8CV7RTjkCptO4M09qxP0Opv6ay/CkHpA5sv/yPf/Np/rdYtlqgAQJuStBYw8116Li1jpd+jXeN7UiTqNFpS0KM8bKJNrOFR9gMNkQMUlYuhDpD0ys96ITZTk0IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718739776; c=relaxed/simple;
	bh=cTfVGcp5oisQ97iLHoXTO3FMqnUrhZ2g1ht3jkA4/sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mf31MXqQO1Tmry3KmQxhT+T5RJk9JmbffpG6ZYt2k2Sr02xTgF/BFBu6haP0DhCULPxaWqGSQAiq0DM1RNkgGKHWjVz/mIsFEY6VbuG3xJerOGhKbG7hNi9JfR9G0sYAIKFKQ0OTv7vXmvgTDsuhc9Pug/lSQADzaPHWyPyh3ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lpPDcgcP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AOXxWam4jWv5TDUk7B5+QiryvHj1tMRqxDlfrq/BNdw=; b=lpPDcgcPCPO2S/dxWLpFAZieK0
	L7nEWHs6MsAIG9K8vdtonV8wB0yJEYuOFGzkiFgZVa0MLL8qKFa0FAg4iWRIKv6NRm60VTuE2r6jH
	K8m8M7ug0t6DZczKumYrmIG9u8TgrewlyJAdnwPc4alhIuiyNA49d08QwYQKxmhdrdKPh6U4eK+Wi
	7o5IQAFvPEJ/6NcItkR+xZOZKIhAzaNGLPrp3sG5+IeAw7XOGJBR/LQC7NQmBXstu15MrJy6B0DjI
	durGXn96jla8mV3hl5TZtQ/HzWHJBH4OIk8Q7xBbPYD5aUhZa6rbScQqp/jdk1GV39wgUgruXt5rn
	QCYbd07w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJejD-0000000GOA1-28Kh;
	Tue, 18 Jun 2024 19:42:51 +0000
Date: Tue, 18 Jun 2024 12:42:51 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <ZnHjO7x9nszs9pUC@bombadil.infradead.org>
References: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> This series implements CONFIG_MODVERSIONS for Rust, an important
> feature for distributions like Android that want to ship Rust
> kernel modules, and depend on modversions to help ensure module ABI
> compatibility.
> 
> There have been earlier proposals [1][2] that would allow Rust
> modules to coexist with modversions, but none that actually implement
> symbol versioning. Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout for improved performance [3],
> for example, which makes using a source code parser like genksyms
> a non-starter. Based on Matt's suggestion and previous feedback
> from maintainers, this series uses DWARF debugging information for
> computing versions. DWARF is an established and relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off.

OK sure.

> The first 12 patches of this series add a small tool for computing
> symbol versions from DWARF, called gendwarfksyms. When passed a list
> of exported symbols, the tool generates an expanded type string
> for each symbol, and computes symbol CRCs similarly to genksyms.

So this is too word centric Rust, let's think about this generically.
We still ahve a symbol limitation even in the C world then, and this
solution can solve that problem also for other reasons for *whatever*
reason we devise to-come-up-with-in-the-future for augmenting symbols.
Today Rust, tomorrow, who knows.

> gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> because of the existing support for C host tools that use elfutils
> (e.g., objtool).

I agree with Masahiro, that testing this with vmlinux would be eye
opening to what challenges we really have ahead. So, to help with this
let's try to re-think about this  from another perspective.

Yes, old userspace should not break, but you can add yet another option
to let you opt-in to a new world order of how these crc are mapped to
hashed repersentations of the symbols. This would allow us to:

a) Ensure correctness for all users / tools, so that proper plumbing is
   really done. By considering all symbols you increase your scope of
   awareness of anything that could really break.

b) Remove the "Rust" nature about this

c) Rust modules just becomes a *user* of this approach

It gets me wondering, given Kris is also working on allowing traces to
map symbols to module names, how does this fit into that world [0]?

As for a) the reason I'm thinking about having the ability to test a
full real kernel and moules with this is, without that, how are you sure
you have the full scope of the changes needed?

[0] https://lkml.kernel.org/r/20240614171428.968174-3-kris.van.hees@oracle.com

  Luis

