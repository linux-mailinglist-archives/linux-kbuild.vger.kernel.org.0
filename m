Return-Path: <linux-kbuild+bounces-4933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 391939E06E7
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30102809E2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72230205E1A;
	Mon,  2 Dec 2024 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cbQ0pgMp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF8205E07;
	Mon,  2 Dec 2024 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152925; cv=none; b=fsTlqY5RNfkp6YgTiUtscwPiEblTgcJc1O6e1mDVMgjuZcj2u617NqpP1lC6qDtaEIbeh0kovEzo97lqcuxJ6I43GXT5F4Q9MElXhfsQd90voolNELXPUtuEblWfBaP2lekhHB0Pom2MDdXVlypEClJUxoCTQfbofA1TU/X8o6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152925; c=relaxed/simple;
	bh=ajcpJpyti0aQL0v1/bGQWQU0qdNR2xB+eWbhmxF711g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBtUDwGnj0pXkNxMFwPqdQgr1ge3fO4VlJMfJM+jVkKXkwLVmXQDE/abdMA0Ngh5jyoQQVg/P5jqqc85Am3Phklr2aa5nc/S5ShY+r5X+grpFbJjqVldbVLzn2yBcSWoHOCOy8X1rdhNLJTaxOd9eQn3Lk0EPA2XhWSTztUONk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cbQ0pgMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDF8C4CED1;
	Mon,  2 Dec 2024 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733152924;
	bh=ajcpJpyti0aQL0v1/bGQWQU0qdNR2xB+eWbhmxF711g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbQ0pgMpMtp8/RzZB1DhDD/TbZODAQHOcbsw3CNgs6oV97bqgPsS/yfwRWJ+9qjGS
	 dDpONl3AO1gj2pu1giW5X4caS3efncUHgVBnpnCNAxbDcb7F19fMmymV15DjZxdU0Z
	 XgnJfX4lGC7oDvgMk3ZLnbUXwTmMNB8d/gQ8jsl0=
Date: Mon, 2 Dec 2024 16:22:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
	x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org
Subject: Re: [PATCH -v2 1/7] module: Convert symbol namespace to string
 literal
Message-ID: <2024120249-octane-whenever-ee1f@gregkh>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.048548103@infradead.org>
 <20241202151533.GF8562@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202151533.GF8562@noisy.programming.kicks-ass.net>

On Mon, Dec 02, 2024 at 04:15:33PM +0100, Peter Zijlstra wrote:
> On Mon, Dec 02, 2024 at 03:59:47PM +0100, Peter Zijlstra wrote:
> > Clean up the existing export namespace code along the same lines of
> > 33def8498fdd ("treewide: Convert macro and uses of __section(foo) to
> > __section("foo")") and for the same reason, it is not desired for the
> > namespace argument to be a macro expansion itself.
> > 
> > git grep -l -e MODULE_IMPORT_NS -e EXPORT_SYMBOL_NS | while read file;
> > do
> >   awk -i inplace '
> >     /^#define EXPORT_SYMBOL_NS/ {
> >       gsub(/__stringify\(ns\)/, "ns");
> >       print;
> >       next;
> >     }
> >     /^#define MODULE_IMPORT_NS/ {
> >       gsub(/__stringify\(ns\)/, "ns");
> >       print;
> >       next;
> >     }
> >     /MODULE_IMPORT_NS/ {
> >       $0 = gensub(/MODULE_IMPORT_NS\(([^)]*)\)/, "MODULE_IMPORT_NS(\"\\1\")", "g");
> >     }
> >     /EXPORT_SYMBOL_NS/ {
> >       if ($0 ~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+),/) {
> > 	if ($0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/ &&
> > 	    $0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(\)/ &&
> > 	    $0 !~ /^my/) {
> > 	  getline line;
> > 	  gsub(/[[:space:]]*\\$/, "");
> > 	  gsub(/[[:space:]]/, "", line);
> > 	  $0 = $0 " " line;
> > 	}
> > 
> > 	$0 = gensub(/(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/,
> > 		    "\\1(\\2, \"\\3\")", "g");
> >       }
> >     }
> >     { print }' $file;
> > done
> 
> Perhaps we can ask Linus to run this now, before -next fills up again ?

Yes please!

