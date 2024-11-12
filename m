Return-Path: <linux-kbuild+bounces-4655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59229C51D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 10:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C04C4B2B03A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 09:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732B820ADDF;
	Tue, 12 Nov 2024 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yq6zxBZ7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033B20B7F6;
	Tue, 12 Nov 2024 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403097; cv=none; b=udmR/WX2PatXrcNtHu42XqhGw4EBi2T3c4QrRIh8Cn4DKY4VgMboyA0PzAHmyY5Lp+9hOjeBVrJTzCy5qz/K24Hn9YV6SNSIwoYJnAhyWJZ9HXQRUXdp1fVPG9UB6RqKtnJXoK2rA5pgYyYvKWPIIy4cZH6emwEVwGyZRQrM2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403097; c=relaxed/simple;
	bh=d7LRLeleKBJNLeaCkKW1HQm8RnR9zz/m96lCfZYH5mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIroMQxnyTCzrOARBSKfWRV2vKiDWyL6w+7Zi9BPFNgsCIeLYCdjbwCc0xaWMaWbSD5hYWPDmCfkrCHLPJApQdn6cAYz03lgUAd/imltvdJ3YDcXbnf+K6CQEX+nfM3JUGGe6fhBwPXKps2YKmrNpYQCrC6HIL85jC/ySZq6Cvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yq6zxBZ7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IkCB7aXie0X2lteb9SnZ+pJfCw+/s3CnKH62qTcBcg8=; b=Yq6zxBZ721Js12th8E0mq+R8d4
	GGuT3rM9XFUsgBGvoY4yUuS3bOm8x1rIVDSeLDvfMPo675KNh2eEX0ZIF0+sNqhLZIrqShKwTAGmD
	1GvLfdyygCzjvCMCnqWDg6eD8H5AJ8ydr73fClGwFWuNLJTyw73O+1ht6iHvaHbWaL4SYQy2C1GE6
	F+jCehhHpIwqVCedwLCq2tpZKeeBtFYP8tVETP3xDUlw9WmCQSoGOhSkWgX1xvs71WiF/H0IB40Wy
	Bhg5m0nv5WCUVJ+/sgNRXDdCoKuvVNL8AsltlcdokII6QcJff6Ee6iWHGi9jdNKGNJIsnXBJSPVdk
	e/wNFcfA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn2A-0000000E9gq-33ih;
	Tue, 12 Nov 2024 09:18:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D8D40300478; Tue, 12 Nov 2024 10:18:01 +0100 (CET)
Date: Tue, 12 Nov 2024 10:18:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, mcgrof@kernel.org,
	x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 6/8] module: Add module specific symbol namespace
 support
Message-ID: <20241112091801.GK22801@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <20241111111817.532312508@infradead.org>
 <ZzHsZoYlwYpNx9A5@infradead.org>
 <ZzJOoFFPjrzYzKir@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzJOoFFPjrzYzKir@google.com>

On Mon, Nov 11, 2024 at 10:36:16AM -0800, Sean Christopherson wrote:
> E.g. for x86, something like:
> 
> #if IS_MODULE(CONFIG_KVM_AMD) && IS_MODULE(CONFIG_KVM_INTEL)
> #define KVM_VENDOR_MODULES kvm-amd,kvm-intel
> #elif IS_MODULE(CONFIG_KVM_AMD)
> #define KVM_VENDOR_MODULES kvm-amd
> #elif IS_MODULE(CONFIG_KVM_INTEL)
> #define KVM_VENDOR_MODULES kvm-intel
> #else
> #undef KVM_VENDOR_MODULES
> #endif
> 
> #ifdef KVM_VENDOR_MODULES
> static_assert(IS_MODULE(CONFIG_KVM_X86));
> 
> #define EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol) \
> 	EXPORT_SYMBOL_GPL_FOR(symbol, __stringify(KVM_VENDOR_MODULES))
> #define EXPORT_SYMBOL_GPL_FOR_KVM(symbol) \
> 	EXPORT_SYMBOL_GPL_FOR(symbol, "kvm," __stringify(KVM_VENDOR_MODULES))
> #else
> EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol)
> EXPORT_SYMBOL_GPL_FOR_KVM(symbol)
> #endif

I see no problem with KVM doing something like this on top of whatever
we end up with.

