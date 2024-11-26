Return-Path: <linux-kbuild+bounces-4864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D998C9D9408
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 10:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68964B243EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 09:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E3B126C0A;
	Tue, 26 Nov 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tCEsd9kd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5B10E9;
	Tue, 26 Nov 2024 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612785; cv=none; b=h5SnR67UIK//mcvSQ4i3rp97QuBY39RNiALYaaMCe9aEraGnCSa5TxvEvzvOfYITDXz0Nk81WnvqS6xpp9aa6o68PdZbBUwhJugBd62ptcTEjuf7Di2K6ccLBYxK9Qw48WGglGxctCJ0ZMdLBXS2q3lNyapLlXTCS4LDbih9jPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612785; c=relaxed/simple;
	bh=0wMhNfjuCKn3KFiqtyzjvXNUsEsAl0GjHojhqpYkvQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksAHBuyPux5TZtDnTyszKbMGVOHkUA+snsMcxLJAQgC2wuvA3/3qV2bkWvvWnlpQoVj8aWAbUd6LXUkFKm8JEbx2FmfzTlZVT6BIE7g3CkUNZXwLSnatmwLdnC464xjKCtqXgGTc2jbua15THpDnbd4Hcgxt0e9HzBKmnRoTtEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tCEsd9kd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=20KTCDW3VkmdcqUU6UZT4aexfvWCdFnOYJYEWBp7gtY=; b=tCEsd9kdqE+wBksj3JXO8zSRMG
	lvQOf/xYvKJvodvMWzmcjTSCVYLr1TWGJOBcVLb439SA9Vg0oLSfAPS8lBhbGZqp/1V5lvccH8fph
	p7bbLVVT06eV7xfT1NQm44Vv8yN1IAo5rgpqfV8L/QOmuH26G7iyjQT17Lk2bqkS7vXQYcDd4nDvm
	lNy7eheA0H1mNlTY8SAqEbk6Z7JqXnpuHCddKKDiE0rIr0I0DXpI4cD2BEowDt35xQbKCTIFYXdtc
	I0/DzNI6HovJKO/TC37iR5T3IbQ/JC+L1XUJCZpiYl1DeXiuzUcOT3RWOkS7XgmaTD1l1/UxrDVU2
	P8ohPXbA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrjK-0000000DLTw-0Akr;
	Tue, 26 Nov 2024 09:19:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 861223002A2; Tue, 26 Nov 2024 10:19:34 +0100 (CET)
Date: Tue, 26 Nov 2024 10:19:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	scott.d.constable@intel.com
Subject: Re: [PATCH v2 0/2] Rust KCFI support
Message-ID: <20241126091934.GP39245@noisy.programming.kicks-ass.net>
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>

On Thu, Aug 01, 2024 at 01:35:16PM +0000, Alice Ryhl wrote:
> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.

So about this -- there's a proposal for a modification to kCFI here:

  https://github.com/llvm/llvm-project/pull/117121

And Sami notes that this would break this Rust thing. Assuming all the
relevant crabs are present on this thread, could you please comment?



