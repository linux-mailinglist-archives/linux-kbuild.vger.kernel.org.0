Return-Path: <linux-kbuild+bounces-4656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AB9C51C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 10:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F911F221EB
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3E220BB44;
	Tue, 12 Nov 2024 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OL4ZTXdE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7681A263F;
	Tue, 12 Nov 2024 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403231; cv=none; b=I39LQWITbvqhsXj65VXrxnHhraLkamoF2R4/W8dWpKcghAmOeijH6MAE0dmj01qG79ZxCkCDFI7ZwUjXc5gGWSiBmHBTXGNOP+dZz0NjFllR6mzEbFYsf4Ph51SHjFjaA0kppAs47GCk0dITbM3yLCHB//PSWlchZoc2ZKR4ZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403231; c=relaxed/simple;
	bh=c6pi5dXdP/h8/7/JDNS0siQZ6Lpa3Z3M9QxtKCvhodM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXFCBvznZB5y0onWHLtscry5nzD5IX14ql17Pk5I9r9kHGBapTUbjh4dWoTcV2kidjg3idhuCYg44s4V14ozdhWKVglweS4/Z+gcAC3k80Y1LPWN1e6CdzFvb0l7iL7KMx2yXTvZ+C5setGx4htMTfrXH8Cw55dnxc1mZUZbRxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OL4ZTXdE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f7JKtmmxys2g54UGX0YQKfhOKEwyTmRr83oofBasEK8=; b=OL4ZTXdEuBfE4ndU3QMek5I+rP
	WW+ZBqIRkNjuT+7HTANWhhp3C/nDelw8jKhFaYgHhKumZUg2IBpcI2VwhW+9hshxtDEZU1gaAUut6
	Txz3xm5f8EWNWHt4dtDF/0G1qm4/J1sj8WdnLnrQJOJau1TSmjSSKIR9KdUJM1EDXyGzqHNir9BKD
	b0cXZKGOGoZVE2jgBrD/GRtnazBrHrCvQb6woQuSb716n9iKF4ZmSqiIBRjVggEjaCVPl9r2SFdjG
	tIKm6wBlAChwxAn/WvjuLFhGYn0sNaO2u7CRd0tAUOzscsDfrRnRHWuzLv0xb29qTrt8BDbwb3c39
	qDRVduhg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn4S-0000000E9o2-1Fft;
	Tue, 12 Nov 2024 09:20:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EB74F300478; Tue, 12 Nov 2024 10:20:23 +0100 (CET)
Date: Tue, 12 Nov 2024 10:20:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 0/8] module: Strict per-modname namespaces
Message-ID: <20241112092023.GL22801@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <ZzKl-ldUQD9ldjWR@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzKl-ldUQD9ldjWR@google.com>

On Mon, Nov 11, 2024 at 04:48:58PM -0800, Sean Christopherson wrote:
> On Mon, Nov 11, 2024, Peter Zijlstra wrote:
> > Hi!
> > 
> > Implement a means for exports to be available only to an explicit list of named
> > modules. By explicitly limiting the usage of certain exports, the abuse
> > potential/risk is greatly reduced.
> > 
> > The first three 'patches' clean up the existing export namespace code along the
> > same lines of 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
> > to __section("foo")") and for the same reason, it is not desired for the
> > namespace argument to be a macro expansion itself.
> > 
> > In fact, the second patch is really only a script, because sending the output
> > to the list is a giant waste of bandwidth. Whoever eventually commits this to a
> > git tree should squash these first three patches.
> > 
> > The remainder of the patches introduce the special "MODULE_<modname-list>"
> > namespace, which shall be forbidden from being explicitly imported. A module
> > that matches the simple modname-list will get an implicit import.
> > 
> > Lightly tested with something like:
> > 
> > git grep -l EXPORT_SYMBOL arch/x86/kvm/ | while read file;
> > do
> >   sed -i -e 's/EXPORT_SYMBOL_GPL(\(.[^)]*\))/EXPORT_SYMBOL_GPL_FOR(\1, "kvm,kvm-intel,kvm-amd")/g' $file;
> > done
> 
> Heh, darn modules.  This will compile just fine, but if the module contains a
> dash, loading the module will fail because scripts/Makefile.lib replaces the dash
> with an underscore the build name.  E.g. "kvm-intel" at compile time generates
> kvm-intel.ko, but the actual name of the module as seen by the kernel is kvm_intel.

I was wondering about that...  WTH is kvm doing that? I mean, I suppose
you can do: "kvm-intel,kvm_intel" but that's somewhat tedious.



