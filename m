Return-Path: <linux-kbuild+bounces-9414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6EC34F18
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 10:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FBF4188BCE9
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 09:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E4A2DE1FE;
	Wed,  5 Nov 2025 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aGbBU3P1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9CC20DD52;
	Wed,  5 Nov 2025 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336156; cv=none; b=J3DCClOGWOMzVlGf7Y5d+3/Tpno1r7lj/EZqj6t+qd/OVa9tEuFxWrk7gc14uk1sPOlMYDIXqILRpVzDDGj26vpv/vRIuQ+H+P6X0ymxmxacJETBg/j/vo36HIrE/mJydaA4lNWQ/35dmGv++t2yHCc+A8BMNJhp6FgAMZRUpnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336156; c=relaxed/simple;
	bh=Reu5It3RlS+/8r8crlO1X7bAM7zmrBh5CRdgE1LhJzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAaPAbGX98imJzmMhzqnnitZr5lrYMm/MaiUtiny3eM+gh31WGJAmP/Vp5v/Gm2aaS60wKHJsXAdkJ4eT3CO6TTpOL7sLGxtoAMNb6Gq0Zj2xBebu+GOX1M6MACGjf2PfOlrNRLtJiUQwQ1AUVFtEldcMQDx8+uQZRXEJA8fa98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aGbBU3P1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VNjYaB/7Qyz/laMY60Xq6CnJ63xt/Hi6zUdIPVja5OY=; b=aGbBU3P1jrQQInHliMHCQClqEZ
	6goD/+x2v+pam4p7+caXrTxLYn90Oqao9kSxCyDsvy5ELVWD/KfqgSNSgapzHCqTMQXYgPCXfliWd
	gPxctKum15ikmPsbB+OZGu6RSn/xBr8A3XLvku3m9H3pqCbNvd7QqlslKaPFvJtN1oYaQa3YOv+yZ
	WXv/cybIClK5zOlaBw6T7csuhe06fGPubNvFoAxq0aLIhGbAbwC4esQdnQ760VHiGn6e9OzcLVfiV
	o2BkAYD0k0EiFbvCx4mHjHiBnT/jRX4n2hlWXCNaCJupGQBdwZwCFUMrVY8/oJc67BCphY0ZDjvHK
	4rZNGnOQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZGq-00000001n0e-2umL;
	Wed, 05 Nov 2025 08:53:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EBC10300230; Wed, 05 Nov 2025 10:49:04 +0100 (CET)
Date: Wed, 5 Nov 2025 10:49:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Li Chen <me@linux.beauty>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-hardening <linux-hardening@vger.kernel.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [RFC PATCH 0/2] Add cleanup_plugin for detecting problematic
 cleanup patterns
Message-ID: <20251105094904.GL3245006@noisy.programming.kicks-ass.net>
References: <20251105084733.3598704-1-me@linux.beauty>
 <20251105084733.3598704-5-me@linux.beauty>
 <19a53424397.26d1e5f01471331.8175059524177790573@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19a53424397.26d1e5f01471331.8175059524177790573@linux.beauty>

On Wed, Nov 05, 2025 at 05:04:02PM +0800, Li Chen wrote:
> +Peter, Dan, and Bjorn
> 
> (My apologies for the oversight)
> 
>  ---- On Wed, 05 Nov 2025 16:46:55 +0800  Li Chen <me@linux.beauty> wrote --- 
>  > From: Li Chen <chenl311@chinatelecom.cn>
>  > 
>  > Hello,
>  > 
>  > This patch series introduces a new GCC plugin called cleanup_plugin that
>  > warns developers about problematic patterns when using variables with
>  > __attribute__((cleanup(...))). The plugin addresses concerns documented
>  > in include/linux/cleanup.h regarding resource leaks and interdependency
>  > issues.
>  > 
>  > The cleanup attribute helpers (__free, DEFINE_FREE, etc.) are designed
>  > to automatically clean up resources when variables go out of scope,
>  > following LIFO (last in first out) ordering. However, certain patterns
>  > can lead to subtle bugs:
>  > 
>  > 1. Uninitialized cleanup variables: Variables declared with cleanup
>  >    attributes but not initialized can cause issues when cleanup functions
>  >    are called on undefined values.
>  > 
>  > 2. NULL-initialized cleanup variables: The "__free(...) = NULL" pattern
>  >    at function top can cause interdependency problems, especially when
>  >    combined with guards or multiple cleanup variables, as the cleanup
>  >    may run in unexpected contexts.
>  > 
>  > The plugin detects both of these problematic patterns and provides clear
>  > warnings to developers, helping prevent  incorrect cleanup ordering.
>  > Importantly, the plugin's warnings are not converted
>  > to errors by -Werror, allowing builds to continue while still alerting
>  > developers to potential issues.
>  > 
>  > The plugin is enabled by default as it provides valuable compile-time
>  > feedback without impacting build performance.

IIRC GCC also allow dumb stuff like gotos into the scope of a cleanup
variable, where clang will fail the compile. Does this plugin also fix
this?

