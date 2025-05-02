Return-Path: <linux-kbuild+bounces-6868-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C4AA72AE
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7514A1BC31DF
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF6A2550A9;
	Fri,  2 May 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tt/dLVX7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AF24677A;
	Fri,  2 May 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190613; cv=none; b=ihj9e+OqOT8CK6zwozkjQSjzUqYJTMDe+3KK89WOzunU5JxRnubSw0cvwpqy3b0CFeEkZ0lAL6unjVEu3Sgt0QEWz6p5aoo0i4jqrJesFYcdD+JqsGhG/BeVRRgBv/cGPCiGaDoCoEqy6xNOYi58p8VF17H9j03Vx0ZuKCPhTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190613; c=relaxed/simple;
	bh=gEmQusnT88xq5t6pURHpX9DpFHyqeO2nqVJlJmsxM28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRxMLSZJq7dZbx1yrfssNGRFZb5nSZWfAR7yz3Y0hAZ/LMXMDeW9BybWyJnTfqsGRbSjvJBBB0ca/Mg6mVGMsBaRT+Z5Zh2eRxcF4dTqPvEwCbJopk33r/SBwsWYnu78WQ+xbv0qPzN06nPhpUPa7ThRGLw6V4makAo4LHp5d70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tt/dLVX7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cmqee1HYHBv88eJpBlZDO4RoVAoln7l0mi+JPbL0Qgo=; b=Tt/dLVX7QOmwJNcyglKshiLn6b
	6kbZw0HeV8vnD5itDjIq4XhGOQ1MBB2Xe7QogjpuRx5z4IdbZgdszhjuIw5jgwXE7Q+B8uMFXBBVM
	D15gF3xz+gU8To2WRi1NQJ15T9OfR29DU01PyYsNNQq6T3ksTwJqm7HSvL9kNL3til/KFFv5+J9TL
	82nK+9yPCVOgDudogsCogwxX5lJSFH2ttX4Yts3/amuIewFa+y5/o52zRIvcV/NUBW7bAEn13FCiM
	cFG9EGfa/91CmCibYKK+/JQQYpX7IeOtErjgZqVVE3J5Bch8oNOsGD9K0DvinJPIhWieAkMP994Ia
	C6DtZ+8w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApvf-00000000GSE-1jCB;
	Fri, 02 May 2025 12:55:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F43B30057C; Fri,  2 May 2025 14:55:33 +0200 (CEST)
Date: Fri, 2 May 2025 14:55:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "da.gomez@samsung.com" <da.gomez@samsung.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"hch@infradead.org" <hch@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"nicolas@fjasle.eu" <nicolas@fjasle.eu>,
	"petr.pavlu@suse.com" <petr.pavlu@suse.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH -v2 0/7] module: Strict per-modname namespaces
Message-ID: <20250502125533.GA4198@noisy.programming.kicks-ass.net>
References: <20241202145946.108093528@infradead.org>
 <20250502115553.27803-1-roypat@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502115553.27803-1-roypat@amazon.co.uk>

On Fri, May 02, 2025 at 11:55:54AM +0000, Roy, Patrick wrote:
> Hi Peter,
> 
> Are you still working on this patch series? I'm working on having KVM remove
> virtual machine memory from the kernel's direct map, to harden again
> speculative execution attacks [1]. At David H.'s LSF/MM/BPF task on
> guest_memfd, it was suggested to use per-modname namespaces to export
> set_direct_map_valid() specifically for use in KVM to achieve this.
> 
> Is there anything I can do to help get this across the finish line
> (testing/etc.)?

Hmm, I had more or less forgotten about this.

Let me rebase and address the comments.

