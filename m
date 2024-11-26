Return-Path: <linux-kbuild+bounces-4866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC69D9611
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 12:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B457BB25FA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 11:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623F11CD214;
	Tue, 26 Nov 2024 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FjGN19xZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E406FBF;
	Tue, 26 Nov 2024 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732619660; cv=none; b=ieHt3zO21uLpeZfqqRzAlTw3ngKw1MV2D4uXir1teIxwyH+RxQd6sGfapetTBLCrNqb25ErYZGhd03ihstkhUytjuzvlrwiKDmvhXVPPUB/pcohHpo1/Xpm2fUCkSPFr5EBSXRFj+lmyJ0lHvJbXG1CXSfR8u28u5HrEKpOdGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732619660; c=relaxed/simple;
	bh=tTe62G9kzjRm7P8y1MeRTnZ/81FyiRVWZnfsaP8nYqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWnkk7F0fatgL8ANSTzMbBY1ZSuPfSkKDkV7wS6kEVR6+vEekWVgfNQSzoSgdcBW9CCe5V2xlzeNqxue+btCWjb/B/vDGKNsCuSgsHlCJH/qdhpkmEbAQtCuznuT8lgX9X4t6/3vK5TvteTg5GrI9CJkk4pCoBCsPGud7XzQtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FjGN19xZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6f8pASCX3YMZO2HkrOz4zx7oYaQA5EGdeMODBcpzTXw=; b=FjGN19xZujmTaXu+REWzuQ/1n/
	Z9eYYiyXrGaDTfNAWfVLgs9ff69bEQvs9AtiMSvmeJiOIdoerAq895mtKtzqnmUBWuRESovq5vJvW
	eAgmdwL9DziyLf1oM871MxBVCHBWv2NPlarcEplzqdO4+rxx3h0tXlxUxkkvojq1sDHQrEblrnBmA
	vt8t2jPcTHf8F9Gdq04NvvVFoJVGyyp87hxnIF9KGlm6pzItRTTFYeYxPEPpivgstwDm/Rc5Fp55v
	ltpoGuicmvHaQDkdeZfuZThePOITctYeCVchCJCV2qSju3weRqIkfcVBLNvNjyau17rXdL7IyT5ny
	6A9+javA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtW8-0000000DSaL-2WRZ;
	Tue, 26 Nov 2024 11:14:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6821E3002A2; Tue, 26 Nov 2024 12:14:05 +0100 (CET)
Date: Tue, 26 Nov 2024 12:14:05 +0100
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
Message-ID: <20241126111405.GM38837@noisy.programming.kicks-ass.net>
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
 <20241126091934.GP39245@noisy.programming.kicks-ass.net>
 <CAH5fLghmqO8jAuZm5NUOP8Sf1Nzqdk6PXknozSF0oCE00z2pgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghmqO8jAuZm5NUOP8Sf1Nzqdk6PXknozSF0oCE00z2pgw@mail.gmail.com>

On Tue, Nov 26, 2024 at 10:37:13AM +0100, Alice Ryhl wrote:
> On Tue, Nov 26, 2024 at 10:19 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Thu, Aug 01, 2024 at 01:35:16PM +0000, Alice Ryhl wrote:
> > > The control flow integrity (kCFI) sanitizer is an important sanitizer
> > > that is often used in production. This patch series makes it possible to
> > > use kCFI and Rust together.
> >
> > So about this -- there's a proposal for a modification to kCFI here:
> >
> >   https://github.com/llvm/llvm-project/pull/117121
> >
> > And Sami notes that this would break this Rust thing. Assuming all the
> > relevant crabs are present on this thread, could you please comment?
> 
> Thanks for sharing this link. I'll leave a comment.

Thanks!

