Return-Path: <linux-kbuild+bounces-6574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B7A854A9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 08:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE8A67B586C
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 06:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D410C27D797;
	Fri, 11 Apr 2025 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I3y5txtt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08627D787;
	Fri, 11 Apr 2025 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744354262; cv=none; b=XmpZkO0nQtmr2ICVXEYuEVrohr8vfI+qXh5x+i1VOuw4ohMdCfejGPTJ70TFZACV5oAfE2DEXXyrcCcuKdgl0uKaxTCl4oWfGaWJ+Mv28wuYSALdJfVK/W7lnVC5emoGlyynh4apfd+FFilNWmC3iryPUygCn1nxfsP9UyuVU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744354262; c=relaxed/simple;
	bh=H5M+RwsQOulVvzrUR1rxNWFkr1ScfSx7Ms0AQnVWbPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQnrzT3HymDuY5Rk8kkMvkIOLBmty4wpNXuziEhD8UYiS1hUVsDMfAjB9320cVdct7CGGF67wykPm/KvlXHMymDuTlaS+WyCTr3BKR9dZCQBvVMgTVpNIs51G7tRJdnAMjHzAKowhNDXd5SLwfKC2TKcGqca4pdJ4IjfnI4kvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I3y5txtt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oulxrBhV/GtDVDbQQtRTXKElduFaApaSwW+JQxQ0T5g=; b=I3y5txttoV21DxBgQlAbXPKORi
	eXDnPQ0PQU8BRO8eeknYHyujG0wFjTNPLny0IsNQUT5HqgaWEpQJJEkiu9DuswbwNgiH6xwzrbaAC
	+rWAb4mJTUj9C6XM77SpJPcKymfbgVe01UDGjkTYWJj+/9IVcmEpxwTkvopZDucmboqkFJkdtjTXr
	nIT58gyz9cY1VZC9zkFQhWe6yXeldAnWihG6OItsByFfkPErCeK0Cj3HCb5tvSrcKoH+115iV+15N
	++v0x9nMtGMJfH9L9aNVteALOXWgAfnYd2vRcdByupeBrCt8i9tJdTeZfI1oS0cBvxMyc2rvMWSe1
	1/vv8xqA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38E2-00000003tfC-0WJh;
	Fri, 11 Apr 2025 06:50:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 43E6630057A; Fri, 11 Apr 2025 08:50:54 +0200 (CEST)
Date: Fri, 11 Apr 2025 08:50:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Rae Moar <rmoar@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
	Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>,
	David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Mostafa Saleh <smostafa@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <20250411065054.GM9833@noisy.programming.kicks-ass.net>
References: <20250328112156.2614513-1-arnd@kernel.org>
 <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>

On Tue, Apr 08, 2025 at 06:58:49PM -0700, Josh Poimboeuf wrote:
> On Fri, Mar 28, 2025 at 11:48:19AM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The recently added testcase for overly long symbols triggers when
> > CONFIG_FUNCTION_PADDING_CFI is set:
> > 
> > Symbol __pfx_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n too long for kallsyms (517 >= 512).
> > Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
> > 
> > Change the mksymtab table so the prefixed symbols are not included
> > in kallsyms.
> > 
> > Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm not sure we want to remove the __pfx_ symbols from kallsyms. There
> can be actual code there.
> 
> For example, FineIBT writes code in the __pfx area which can trigger an
> #UD.  And we'd want a sane backtrace for that.

On top of that, clang kcfi builds do a similar thing, they will generate
__cfi_ prefixed symbols.

And yes, those symbols exist for a reason, there is code there under
various circumstances and backtraces look really weird without these
symbols on -- notably the code in the prefix will be attributed to
whatever symbol comes before, most confusing.

So yeah, don't remove these symbols, and fix the kunit test.

