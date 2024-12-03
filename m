Return-Path: <linux-kbuild+bounces-4959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE619E1AF1
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 12:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09861B245EC
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16E1E1C0B;
	Tue,  3 Dec 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Cl7oLBQc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E251E1A3C;
	Tue,  3 Dec 2024 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221570; cv=none; b=o+ZPSDLVIZ2UkSmBBB4OpaWMbc8BlJKh3rxI/ySo5xwVULG6duwwO+hfeBbhOSqPiCXYn5NfP6lf/bdsSQmhIejj3705UPADlbnxCjl/oYwNGSaalGib0ROlAY3WpjfNB6v/wxYCYFp9y+nNhHxWwxcSDiqtYPNTJDcTEeR1O8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221570; c=relaxed/simple;
	bh=GFXzxmgfMzrffUuzfdw957QLDTkqoGbHpAkSrRuRskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFynRUnz3UwWSPgLLABrcLGxXC65M2LmtT1E6AZ095T4ASwtzxv5LeqSB6fGs9khUH3AoMtbXkcnANhqVdgHKWt1SeaGjg/OeLyQ4HJ2nrYbpJfQ0OyWegnlo2bhaArWUSanNCJUNE3HWBS2VmQZZqmzyghb6DCmE9u1V/Hzw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Cl7oLBQc; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oXIkTz9ciWzlnuusWnuTBKkcKYQOv3mwjxPCUoX333M=; b=Cl7oLBQcArpZJcoYncilMyfQvy
	cBzLxKiI6Gc7mlnAbr10Mvs7ZCRSiZnRFVEvTezPZQ9k7AqoRDB82/L4HM554Z/EZ94b7b++ixbYM
	EmqB4U6HS7Heypr05Yo07eGEWDE49Na2xSuyriSltCN7bTXGRV8GJ4ZJgREU8zN+hqs/fswTyKana
	OWVvbgZQ506gH9wFkSuAPmuaBvuTFpsqwgd4F+VbsTHxknMgs+IITeCI0m9JyS/pEUyL25+yP3ZwM
	theNQwLTJI/H7MpCutkapFLqfJelvQ8Lzj5VyggUss4boNTZ/5NmMXDemY/KyOMpxgXsbXJiNKo70
	IYMrrGpw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQ6V-00000002Lnd-3giu;
	Tue, 03 Dec 2024 10:26:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5FB243004AF; Tue,  3 Dec 2024 11:26:03 +0100 (CET)
Date: Tue, 3 Dec 2024 11:26:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Maennich <maennich@google.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] module: fixups after module namespace conversion
Message-ID: <20241203102603.GA21636@noisy.programming.kicks-ass.net>
References: <20241203102124.3147478-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203102124.3147478-1-masahiroy@kernel.org>

On Tue, Dec 03, 2024 at 07:21:04PM +0900, Masahiro Yamada wrote:
> 
> [1/3]
> Commit cdd30ebb1b9f added double-quotes to enclose the variable in the
> semantic patch, scripts/coccinelle/misc/add_namespace.cocci.
> Since then, 'make nsdepds' always changes the missing import to silly code:
>    MODULE_IMPORT_NS("ns");
> 
> [2/3]
> MODULE_IMPORT_NS("") is misleading in the context of documentation
> about MODULE_IMPORT_NS() tags in general.
> 
> [3/3]
> Convert DEFAULT_SYMBOL_NAMESPACE from a macro expansion to a string
> literal. There is no good reason to keep inconsistency in the default
> case.
> 
> 
> 
> Masahiro Yamada (3):
>   scripts/nsdeps: get 'make nsdeps' working again
>   doc: module: revert misconversions for MODULE_IMPORT_NS()
>   module: Convert default symbol namespace to string literal

Thanks, I totally missed the DEFAULT_SYMBOL_NAMESPACE thing.

And my coccinelle foo is non-existent, I would've never spotted that.

