Return-Path: <linux-kbuild+bounces-4689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D99CDDBA
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 12:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F85280B95
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 11:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C266F1BA89C;
	Fri, 15 Nov 2024 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QsbfJqxz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46071B86F6;
	Fri, 15 Nov 2024 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671382; cv=none; b=PO8FlVolEg96zV85WT1i/VqzzZj+QSsgMo08rZ7u0d1/G12nD5wBhjx5e9lGCX9Dg5+fxBFb5p+hg22I97WGggYlGY0m2p1rL0fRiC5NPz2+Hb9XskirOlng9kUDrb0Y3a7sQy3rDUXhp1qPiqJ6OrXtTS9RUwhPLGmiZD49y0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671382; c=relaxed/simple;
	bh=MnBOKQ/+1AjbtPfmzW5O5Ib7vgDNVKV7lus2CXVLKWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKzlnGAzHyFbpyAHAvPBLK7c4Z2RTy2OuAMYa0VsvczA8QMH1iNicv0+03d7YhluhkZJGai16Sk+3EBlC8YFxf92v94A9cItmBsWsIcxbUFc1yY6vp3qgQ+Cfa8N6WcM0gzo6XXesAKNMCZNThRT928gD2dn4jJoDWDOUb8zqdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QsbfJqxz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D+xKiB8GWNnGuEpcIIELTeU/fw+jvTZ+eMA0hDrzAVw=; b=QsbfJqxzC1INeY0T215hijNnkV
	cRtX0AQ5QFVKgcEIRfZ+k/U1II6iO/Rqu4YoH9aZ2X2mK5KMi265n81xUK5P9EG9LwaYTLtTbTLDq
	uv043Iov+exZdtcYjRv7uRemm6MeY1+fZykY+qIi/Yi7YwkkU6yCs7s0QX1CaxjXcPVcxTIxHD5Ar
	p0EloHF1pChjkNp2CSb/4FcqZgACMcVSj79cltilph9wlcYfeWRCwu1hTkRPUmm3n0/xMO/C376Po
	4echqSnoTj6CTRJVnX4P3C+HSaFnRQv47+lQkOacgJyMFUFMYA8Xt4bxC88jojOBnvPFCpWYT7rXQ
	iJRr/CRA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBupM-00000001MIw-2WeB;
	Fri, 15 Nov 2024 11:49:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D2F1530066A; Fri, 15 Nov 2024 12:49:26 +0100 (CET)
Date: Fri, 15 Nov 2024 12:49:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 1/8] module: Prepare for script
Message-ID: <20241115114926.GH38972@noisy.programming.kicks-ass.net>
References: <20241111105430.575636482@infradead.org>
 <20241111111816.912388412@infradead.org>
 <ZzHsOTLCZlUBN7iW@infradead.org>
 <20241111125529.GF22801@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111125529.GF22801@noisy.programming.kicks-ass.net>

On Mon, Nov 11, 2024 at 01:55:29PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 11, 2024 at 03:36:25AM -0800, Christoph Hellwig wrote:
> > On Mon, Nov 11, 2024 at 11:54:31AM +0100, Peter Zijlstra wrote:
> > > Since sed doesn't like multi-line make sure all EXPORT_SYMBOL_NS
> > > things are a single line.
> > 
> > Eww.  Just use coccinelle or another tool not so simplistic.
> 
> Feel free to do so. I've never managed to get coccinelle to do anything.

So I put a little more effort in and got you this (awk needs to be
gawk>=4.1)

git grep -l -e MODULE_IMPORT_NS -e EXPORT_SYMBOL_NS | while read file;
do
  awk -i inplace '
    /^#define EXPORT_SYMBOL_NS/ {
      gsub(/__stringify\(ns\)/, "ns");
      print;
      next;
    }
    /^#define MODULE_IMPORT_NS/ {
      gsub(/__stringify\(ns\)/, "ns");
      print;
      next;
    }
    /MODULE_IMPORT_NS/ {
      $0 = gensub(/MODULE_IMPORT_NS\(([^)]*)\)/, "MODULE_IMPORT_NS(\"\\1\")", "g");
    }
    /EXPORT_SYMBOL_NS/ {
      if ($0 ~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+),/) {
        if ($0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/ &&
            $0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(\)/ &&
            $0 !~ /^my/) {
          getline line;
          gsub(/[[:space:]]*\\$/, "");
          gsub(/[[:space:]]/, "", line);
          $0 = $0 " " line;
        }

        $0 = gensub(/(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/,
                    "\\1(\\2, \"\\3\")", "g");
      }
    }
    { print }' $file;
done


I'm sure that wasn't worth the time I spend on it though :/

