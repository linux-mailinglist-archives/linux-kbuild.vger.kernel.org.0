Return-Path: <linux-kbuild+bounces-4661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB059C61E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 20:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4460B28321D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 19:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302A42194BD;
	Tue, 12 Nov 2024 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I7lpUHCe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AD21894F;
	Tue, 12 Nov 2024 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731441157; cv=none; b=Lv0DrKmRiftU4YX+fBXpdJU8lOWQXBj6B+4gMPH+5QB2rFWFU/Kko+9w10ZMsqPaER0UfvrmCsl91+1SgXUZRmxrF2pe5Yjm9YczOGC7LLomELIVFmKVXlES9yb8PLULcTkJnk7Mb7pnx8qZn+S5q+O3kFDs96ez5pzbnuM9Uv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731441157; c=relaxed/simple;
	bh=8LQYQjL64jqm1ymbtTmhmB0TwfCZDaWmJUVIyM/DhHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5SImRbsiiv58/3vau6S5vfKkRANzQ1ICcpD1xqimtofr+Ao1VyJYwHiuFHPgREF050PUY4ZmCLM0aAQ9nmF6qdXm1B8xCZBkX9sn6PT2zr6y/Yc6ufuhieZ5IY+yAbdF4/HXYb6jqCbPnj3v643KOcANR46xRuFuv5Sn/mASYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I7lpUHCe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eKCK7X08OarAmefC/MteVkYS2NHZgnlr4eJ6IlPakPE=; b=I7lpUHCenOJG9TgzaTTxGT9KFl
	OrMVsF0G6Rtx+Z7wRkSYHnXpzSeRfkhCgBLwPdUB55x6o6uPSIsxihSlnyxUnlX7ZgJsqRb6tgOj2
	iRHwj7t9Sp66QnHdC63L7zqLM27DR4e+PPoN6RaUbiR3JGUuxl9Hy8oAkgKK9TyVn4tLNZYBMbkuJ
	bnyG0emND0QiN4xH6yICL+cQpMDhcf23hQ50uqhLBkc/d4MBTTT8dtYQznL/uh93HX/BHlllcIwNE
	gh5iopluIFvoo2mp+W4ZXRliQbRCphL6CEZrkQ2sSMMTfDUY1AIi0HD30UWybfmMF05e1Clm7anCY
	qoQi2Uiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tAww7-0000000D8K3-1sOa;
	Tue, 12 Nov 2024 19:52:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A94DA300478; Tue, 12 Nov 2024 20:52:26 +0100 (CET)
Date: Tue, 12 Nov 2024 20:52:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 0/8] module: Strict per-modname namespaces
Message-ID: <20241112195226.GT22801@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <ZzKl-ldUQD9ldjWR@google.com>
 <20241112092023.GL22801@noisy.programming.kicks-ass.net>
 <ZzOWxC4JlCGe_BTe@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzOWxC4JlCGe_BTe@google.com>

On Tue, Nov 12, 2024 at 09:56:20AM -0800, Sean Christopherson wrote:

> This likely needs to be addressed in whatever chunk of code is enforcing the
> namespaces.  The s/-/_ behavior (and vice versa!) is *very* baked into the kernel
> at this point, e.g. parameqn() will happily parse dashes or underscores for every
> kernel parameter.  As horrific as it is, I think the module namespace needs to do
> the same, i.e. treat dashes and underscores as one and the same.

Right, I'll add a s/-/_/g on both ends of the strcmp or somesuch.

