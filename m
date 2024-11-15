Return-Path: <linux-kbuild+bounces-4690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E139CDEA1
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 13:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9846B229E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 12:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B551BBBD3;
	Fri, 15 Nov 2024 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OXMuuJvb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52618950A;
	Fri, 15 Nov 2024 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731674993; cv=none; b=kCGlUSBBwGXSAAYkBDBydsdrw0ShYSisZW27v0hm56XDJsu/e+EIBbpJl2CKaSw0dyEyulR5dkTRa170lcp9FqZ6vpoZkCGkrcRVA1NkgRzSAGWZKMqxbI8PFxH+fkoxL4ixQqVjiOjrtoAeITkWDmoLV4MImCFlaMndTT+zZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731674993; c=relaxed/simple;
	bh=uzu/Pblpk2vtYYTcF/7Ls3BSspxpAc/IHqnKWoV4MyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6enzqkvbLG6Hl3rcvyf2Ga02VM2w5u9ynMgqSlFB/IxBkqOOG3OqqV0JXDVtljkVptFuyeouojzCMEvsHxJuwOAh/QyRB/S9u0cxg6924z2CLVVB31AekdK5s8mqhZeQU9Vi6oMds+XDeiOpW/fHhvXFjJrLIL15ftk084ac6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OXMuuJvb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d2eOg3ivIVHbIkLcirrH1jOY4rzIlzHyqaFIXvacHh4=; b=OXMuuJvb6UdZEG6FZfNGWrvKvW
	Hf+VScexg3Yl7HVFTSoIzBmr+kTO05PXLQpyeS75/HZJt4nKsjCzHVXwdHHWh+5bk1SMxB7DfarSi
	aqqUPAMBIA7U1EYXVfsjW8bMtqhjv6ZbahZaFczDfjyBDMMi7+H/7tjJsFA2dFt4o7cYqYC6K1nHY
	4iBeD+lCwqJrT7XrmMq5z5be5t+AITTntw1pEodG0rYXMwBiqP5cpwTD/77/G+spfe1XVL2z2o9un
	ncgHRBuh95YOySF/kvpEliELlHfA+1f3IqMgOmqAjZNcHEWQXrax3KGF2QyWLjlcG1iQomE1x0T4O
	d5ob4r9g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvlY-00000000EYb-3jDa;
	Fri, 15 Nov 2024 12:49:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C193030066A; Fri, 15 Nov 2024 13:49:35 +0100 (CET)
Date: Fri, 15 Nov 2024 13:49:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 0/8] module: Strict per-modname namespaces
Message-ID: <20241115124935.GC22801@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <ZzKl-ldUQD9ldjWR@google.com>
 <20241112092023.GL22801@noisy.programming.kicks-ass.net>
 <ZzOWxC4JlCGe_BTe@google.com>
 <20241112195226.GT22801@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112195226.GT22801@noisy.programming.kicks-ass.net>

On Tue, Nov 12, 2024 at 08:52:26PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 12, 2024 at 09:56:20AM -0800, Sean Christopherson wrote:
> 
> > This likely needs to be addressed in whatever chunk of code is enforcing the
> > namespaces.  The s/-/_ behavior (and vice versa!) is *very* baked into the kernel
> > at this point, e.g. parameqn() will happily parse dashes or underscores for every
> > kernel parameter.  As horrific as it is, I think the module namespace needs to do
> > the same, i.e. treat dashes and underscores as one and the same.
> 
> Right, I'll add a s/-/_/g on both ends of the strcmp or somesuch.

https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=module/namespace&id=f2aabf8436348a47037570af139ec2c1de8c5337

My test box seems able to load kvm_intel. I'll let it all sit in that
tree for a few days such that 0day might get a chance to chew on it
before posting.

Thanks!

