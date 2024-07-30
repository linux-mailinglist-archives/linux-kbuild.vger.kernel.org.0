Return-Path: <linux-kbuild+bounces-2752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3109416EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC70E1F210F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 16:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2372B183CBF;
	Tue, 30 Jul 2024 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WGaC0GG6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB8183CA1;
	Tue, 30 Jul 2024 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355481; cv=none; b=WF3W1ShXpzZeAiw7q2X6MlvFE0aHGE0e5Yr+WkMwRbGnL5r8HOlf0Z7MCstbY32xTTM0uTkVsuK89L/OIl4J1DNXa2ZWDqQi72oKCY20Sg3451z24Q+g7f2td8yekxDJhX5C5wuhYLlvzvI2Jyd0gMkLvbillvPHdpP65BGeXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355481; c=relaxed/simple;
	bh=RZ9Cfjw9iy8nBaaTRJ2nzahYzaSFtZi5MiAfO0Pxhqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/omoFf38dPAiYZTO0QXqALg2AwXtJ80TRZvzBrlOfWvjVzPEpzxqSWrYURHEu4a71EorbQyZyZAbnRIH955JPW0oPZQEutxKqmedqx/mXngN/d5Q692PDhKgXOYWBdwP5DlB1iRIMVhGAfiHw1pnRQZwIcxgxUMx2kVnYo4oKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WGaC0GG6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YGTpec5Jqp97xowkeVStu4tfB1vQqE9/GkgnaOq+ifw=; b=WGaC0GG6Zg1Nq3/xy/0Pu/Y2KN
	l9y/j2TS4vfiFnxE+l5depqWU2J0sh4nqyM8DzFOxMxq5Z8CVtMuWPTeXe/CfUBiCA+OlGyntQjqq
	G1Kbk/6hTTS27587CWi+XkOdVU4Bd/FyT52HMdMR7uUAIHnqOqSDakNKNfAAGvhaI7UgYVBgIbMYQ
	tTF0xuQTMiZO25OGxrUpVGBtO8tlSh+qXdZdSAC/cxG7FgRO6/HmfUagK5mGlX18wv1h0cKXhZE/Y
	+1wg8CqZsiDP7tsS5z4n6GVfkK7PZv60q2ZdJY3RwjYnk/WdZ+ADilvcXgWDBqyoP75i9omKpMJ8P
	ZzI/TbUA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpKz-000000052J2-0hKo;
	Tue, 30 Jul 2024 16:04:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CCAAC3003EA; Tue, 30 Jul 2024 18:04:32 +0200 (CEST)
Date: Tue, 30 Jul 2024 18:04:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
Message-ID: <20240730160432.GQ33588@noisy.programming.kicks-ass.net>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
 <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
 <CABCJKuc8ue1y7WBPo3YRRoDeGUFpRon4at=Wa1rQjrXzOGpt9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKuc8ue1y7WBPo3YRRoDeGUFpRon4at=Wa1rQjrXzOGpt9w@mail.gmail.com>

On Tue, Jul 30, 2024 at 08:19:13AM -0700, Sami Tolvanen wrote:
> On Tue, Jul 30, 2024 at 3:29 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Jul 30, 2024 at 09:40:11AM +0000, Alice Ryhl wrote:
> > > Introduce a Kconfig option for enabling the experimental option to
> > > normalize integer types. This ensures that integer types of the same
> > > size and signedness are considered compatible by the Control Flow
> > > Integrity sanitizer.
> > >
> > > This option exists for compatibility with Rust, as C and Rust do not
> > > have the same set of integer types. There are cases where C has two
> > > different integer types of the same size and alignment, but Rust only
> > > has one integer type of that size and alignment. When Rust calls into
> > > C functions using such types in their signature, this results in CFI
> > > failures.
> > >
> > > This patch introduces a dedicated option for this because it is
> > > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
> >
> > To be clear, any code compiled with this is incompatible with code
> > compiled without this, as the function signatures will differ, right?
> >
> > Specifically, it will map things like 'unsigned long long' and 'unsigned
> > long' -- which are both u64 on LP64 targets to the same 'type', right?
> >
> > I suppose it has been decided the security impact of this change is
> > minimal?
> 
> I looked into this last year, and integer normalization reduced the
> number of unique type hashes in the kernel by ~1%, which should be
> fine.

Right, I didn't actually expect it to matter much either, but it
would've made good Changelog content.

