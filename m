Return-Path: <linux-kbuild+bounces-4932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2639E06C3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 200672832D3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F26208988;
	Mon,  2 Dec 2024 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ok0qf+nm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0911D540;
	Mon,  2 Dec 2024 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152539; cv=none; b=n2RvKRwgID6k7FA8kyFaRcp437T3ZlZTvCpvRNu5ZZ0/EswXUcL7SKgoiny8YtmvWKfji++WKD5Vlnam/ShML65cKY3a/MhEUAJyVx7CvIs0SHkW+GJbCtr8jGWv54PBF+OnRr8+wNMcK0XRZLEkg00GGDmcQGFDlMZl8e684DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152539; c=relaxed/simple;
	bh=+VA7j+68QkRTtvPFnGl6oxHs8vl+822Z0+wiXoRUNM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9F6mEqQpwSTx7X919YyIE2Y19PNKnm4WF33LxgcFgN1PgvTDlxiY9u2ZeeT0f13cYcKrw0lQ3i6j4yOzZWEp9zfZueo1r3LX+K0kqTBehzn5T+EvWH9l3broBjdtFfoFDHoMXMBUMskCi5g1nU29qDK1cTrjcgBQoBcD8LrfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ok0qf+nm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h88NC3NFSFUNpfYRvINnwNbkvkeDFh2K/tohZ9JELOA=; b=ok0qf+nm1Sle+0wD28DHOrjnzM
	7WLfOI04o52bqacrLhabXk3ncRQRECeVoXRpx3ejZ+ppOadrsKGykF+YqBvUk7VQ+bC0dXFlvQ0GQ
	1f7U6MankABchDU5KpuQCiU64sZzed7BgwWUixAlBSuFb+W3c/CMzgenW3h4HNS0+EPH1cBKCNhlU
	3+kwEMgwEojTH4V7DBsdx+HZIHLXxo0/2KaUUnLO3diE9mlh3TGCXxfxyKwtm7D9QyPuDY5emKch0
	xjK/cuCLL61BN27Bh28eHvg2IyrO6T74x/3yguuzrJxMhBfVxB1K+9QFaVF9xnxvaBh1ZeA5kDVPS
	9Ee1W0Wg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI896-00000008CkP-28rG;
	Mon, 02 Dec 2024 15:15:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 54014300402; Mon,  2 Dec 2024 16:15:33 +0100 (CET)
Date: Mon, 2 Dec 2024 16:15:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -v2 1/7] module: Convert symbol namespace to string
 literal
Message-ID: <20241202151533.GF8562@noisy.programming.kicks-ass.net>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.048548103@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202150810.048548103@infradead.org>

On Mon, Dec 02, 2024 at 03:59:47PM +0100, Peter Zijlstra wrote:
> Clean up the existing export namespace code along the same lines of
> 33def8498fdd ("treewide: Convert macro and uses of __section(foo) to
> __section("foo")") and for the same reason, it is not desired for the
> namespace argument to be a macro expansion itself.
> 
> git grep -l -e MODULE_IMPORT_NS -e EXPORT_SYMBOL_NS | while read file;
> do
>   awk -i inplace '
>     /^#define EXPORT_SYMBOL_NS/ {
>       gsub(/__stringify\(ns\)/, "ns");
>       print;
>       next;
>     }
>     /^#define MODULE_IMPORT_NS/ {
>       gsub(/__stringify\(ns\)/, "ns");
>       print;
>       next;
>     }
>     /MODULE_IMPORT_NS/ {
>       $0 = gensub(/MODULE_IMPORT_NS\(([^)]*)\)/, "MODULE_IMPORT_NS(\"\\1\")", "g");
>     }
>     /EXPORT_SYMBOL_NS/ {
>       if ($0 ~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+),/) {
> 	if ($0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/ &&
> 	    $0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(\)/ &&
> 	    $0 !~ /^my/) {
> 	  getline line;
> 	  gsub(/[[:space:]]*\\$/, "");
> 	  gsub(/[[:space:]]/, "", line);
> 	  $0 = $0 " " line;
> 	}
> 
> 	$0 = gensub(/(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/,
> 		    "\\1(\\2, \"\\3\")", "g");
>       }
>     }
>     { print }' $file;
> done

Perhaps we can ask Linus to run this now, before -next fills up again ?

> Requested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

