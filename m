Return-Path: <linux-kbuild+bounces-12466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N+7ArzhzGm0XAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12466-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:13:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48E3775A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 11:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C103530DA91D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6903A1A58;
	Wed,  1 Apr 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZtMwKSn/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ACB3BC693;
	Wed,  1 Apr 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034510; cv=none; b=qPAQQ5DeRcvkdrx/9AUZooyE98v4p2mv/5g+GC42n8E6mFkjX7tnQ3az1axW6WX/03b2Bd3hZRdzETy4KmNv3ueDfgivu9Woli23bUgPJF+/t0HElUbsm/NeJ8+vDT5YDMRBb/afRL1uTUII3vFTCi76BCCnqnFtqNV+rD8uvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034510; c=relaxed/simple;
	bh=3LLAPWAYbZO7e389qVAkSxpu6fTCAdD2m4xwSDRe09M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFIb/7JRbJ3bKXSUmyqvDhnUw/wlTb4bEGKmasDyj7nAm06m515Tf4VqRu5GHbQPad8JeEFTUgg70C4MniAuRC0wk2XL2q0n3oqMzEknqh9RCKL91kHR8otR/qbvSniyU8uo6l2Cb6uezONkch5SSgO0tQHF/Lz4JFsEuBgbTz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZtMwKSn/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dy5F2xOgf5sDAMW36PnFeNCX4KH4DzWDRyg/Apw8tTg=; b=ZtMwKSn/uOy7LsxrQ+7UB+C92o
	fvLIHexT3M430ciafifuis2tJqwvmDWA7dvZwlcXBYfMK7kR1tOhQGDv5ifJysG5wz0zwypzPmS6W
	OMWb/BNIjXcWCNJitJfMjHBA9QMIdxbMkFg6bvw5D0JCcLvFh1yT8g7gl2OkZklaUf84oKTIpnN+o
	732DH6p5oDPGzsKsUTC4g3lYb1GiEFwLU8LhvJml292Uv6xWz4Dee6M4fPQe8yiF1vECo9dRTicSw
	MrnLu/QI4r+c68MP89Nxdf9pr8QlISU2JYZmUMIHPx5FBcTOY6zh2QloExnzxIJpOrrvVJBKbBm3A
	Lkr9+BxA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rYm-0000000A6Xt-1LQ0;
	Wed, 01 Apr 2026 09:08:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3FA13032D8; Wed, 01 Apr 2026 11:08:15 +0200 (CEST)
Date: Wed, 1 Apr 2026 11:08:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
Message-ID: <20260401090815.GV3738786@noisy.programming.kicks-ass.net>
References: <20260331163716.work.696-kees@kernel.org>
 <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
 <202603311249.30B44C66@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603311249.30B44C66@keescook>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12466-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:dkim]
X-Rspamd-Queue-Id: 7A48E3775A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:

> I think for this series, __ob_trap/__ob_wrap is what should be used.
> 
> And for other folks, the background here is that we originally wanted
> to use macros for "__trap" and "__wrap", but the powerpc C compiler
> (both Clang and GCC) have a builtin macro named "__trap" already. So
> I switched to just using the Clang-native type qualifier. We can use
> the attribute style too, but there was a lot of confusion during the
> Clang development phases where people kept forgetting this was a type
> qualifier, not an attribute (i.e. the attribute is an internal alias
> for the qualifier, and the qualifier is a new type).

Since you mention qualifiers...

What is the result of __typeof_unqual__(int __ob_trap) ?

