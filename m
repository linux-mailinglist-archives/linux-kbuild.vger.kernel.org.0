Return-Path: <linux-kbuild+bounces-4642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE69C3EFE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 14:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D971128311F
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE0F19F117;
	Mon, 11 Nov 2024 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WnULSqMW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140A19F115;
	Mon, 11 Nov 2024 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329737; cv=none; b=cowIcHBXPZaQc3Yz1eQhy1V2cm4iYoLlqlKkoqQehk4h0OGv2uKfdTA4wU8DhyB0+Ea7i7AozEtF+78GyqAvO/2x1JIsxgODQpLdJSWSs10UCDnQ+1Fy2yEVqHZcvtGsnWYdrVA1bXyr6/vefQAFIasR88yS7Bd8IP6JnHfdWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329737; c=relaxed/simple;
	bh=ACqJW+Dv2r1izoBTSGmwVYJZ4/uZ989CLEhAmXXKpiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TivqOfwuLTImK9wZQ/Zd7RQzrVcfehNIMccr/p9Fhk40hDKVL+Kb69gc//h6YTWglsApwjf2Oe9bsLjcf1+tF5fxBm3nmuM9gOuYXhl+k30oC+O5rxcyGS1ku+rgGd4TJvSuI3nAJnplcnMxZinxrQJ786z5UsY2F9oUoC1v49w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WnULSqMW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T5UP7GuDQvQJR85C2aqyJRkB6kHFOZ5WkMvZvaIB7QM=; b=WnULSqMWb8nHiAa/Z+etNqZBzx
	Gw02A7PaJcp3VHVpgOqVx4ChWWe+vYUr+bxZt+YbUwfBEZivRpgS9PY8pMSubRK7xOFnwXjn23Gfu
	aFAPWuUAbqb8Jp+A2aWbtFBhqtnJgfCMEQiJrIk+gi+ogXrEjwmpYtRYaURXquyR4XkMUrjGBVzX4
	xL4eIbyuBxAmAJD245zrBzmkygA7YakF3Vu9LQNQFSO61xyaiiqF+Z9MVXtt1wyDfcZkmxL2/4zWT
	oCRpu6uhJt3cp8WiKH6SRXSLc3xsEZWFRS6MLQu1NFioE6E2xWDGzgjKrYkXFzlNsyJwhJHzKeGve
	guYlc6UA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tATx4-0000000CooV-1oOY;
	Mon, 11 Nov 2024 12:55:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E3BD830042E; Mon, 11 Nov 2024 13:55:29 +0100 (CET)
Date: Mon, 11 Nov 2024 13:55:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 1/8] module: Prepare for script
Message-ID: <20241111125529.GF22801@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <20241111111816.912388412@infradead.org>
 <ZzHsOTLCZlUBN7iW@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzHsOTLCZlUBN7iW@infradead.org>

On Mon, Nov 11, 2024 at 03:36:25AM -0800, Christoph Hellwig wrote:
> On Mon, Nov 11, 2024 at 11:54:31AM +0100, Peter Zijlstra wrote:
> > Since sed doesn't like multi-line make sure all EXPORT_SYMBOL_NS
> > things are a single line.
> 
> Eww.  Just use coccinelle or another tool not so simplistic.

Feel free to do so. I've never managed to get coccinelle to do anything.

