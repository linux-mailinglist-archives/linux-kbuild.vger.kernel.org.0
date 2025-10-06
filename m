Return-Path: <linux-kbuild+bounces-9012-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A5BBEE01
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 20:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CB8F3B1069
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 18:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6512367BA;
	Mon,  6 Oct 2025 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxWeBSvT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F5846F;
	Mon,  6 Oct 2025 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759773727; cv=none; b=b9t8ws8bCnP/zjoigIksPyRUG/md1lk+1JtUJYCBUSjhMB1GKvLA8aD8OT2LoMBZnMVw7p5AmYqPbA+RqcGxSVyIRoH1CXpZDLv+JJ/sL+v7Xs2VgBtSMW+eHgAXLxtxtlvQ14xjiryB/AwoJIwfCi7NS+d+IYt3M9mTmxSHoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759773727; c=relaxed/simple;
	bh=xRbBXhONeXuzLwhSP5S43EWOn1rHmeX8RDcutwtUK/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYrsnPxS7Be8fpLRXSlYJO5dtVhjvCzlaSSIk9M7qAoS/voXQG7SphawoV6gQQSBkxKmLRzPOxtOBMB/9suCvJoTTV18anWuoE4yLVPdVMHR7Eq838Ab+WU0PkBl6j9lYPiQsFRn2pT97M3pS+5V2h7cZzmP0RxVNqSw9gRQifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxWeBSvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13CAC4CEF5;
	Mon,  6 Oct 2025 18:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759773726;
	bh=xRbBXhONeXuzLwhSP5S43EWOn1rHmeX8RDcutwtUK/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxWeBSvTz5Y9qZUjNI6jfe8R7SQRYNju0JOiEQjSNOQBLzbf9iammWAe7L+QOQ/UK
	 ZRljYQlrt9C2dqjh5D5zcB8bqmzq6AVfJIn5lvG+V/CP2Ea/qcQ6yykUJktDIljm8H
	 X/jRfGA7FUmJySL7C01+pJL3UzzPVJqTaPkpxajWxpwCB1G92l00ZfRjsUDovxhQIv
	 6koETrWUjBOWaMuSFWrif1qqX2ykaxNru+hprQJy63uqz2qt/D8Eor8cbbJpl/u2HO
	 iAmeCkCrlZJP0kZn/5u+6U5JhH/QI5ovVfBO/XNkrqI0ugh2rnnX9CnuGCFKNIzUu5
	 /guXOIjlemaGg==
Date: Mon, 6 Oct 2025 11:02:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: uapi: Strip comments before size type check
Message-ID: <20251006180201.GA429708@ax162>
References: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
 <mvm347wjj90.fsf@linux-m68k.org>
 <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdeJ6Bq=zA7QcN82YNaZW3R8ebeXpGzqHus-KPkSj5XA@mail.gmail.com>

Hi Geert,

On Mon, Oct 06, 2025 at 03:20:52PM +0200, Geert Uytterhoeven wrote:
> On Mon, 6 Oct 2025 at 14:40, Andreas Schwab <schwab@linux-m68k.org> wrote:
> > On Okt 06 2025, Geert Uytterhoeven wrote:
> > > --- a/usr/include/headers_check.pl
> > > +++ b/usr/include/headers_check.pl
> > > @@ -155,6 +155,8 @@ sub check_sizetypes
> > >       if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
> > >               check_include_typesh($included);
> > >       }
> > > +     # strip comments (single-line only)
> > > +     $line =~ s@\/\*.*?\*\/@@;
> >
> > I don't think you need to quote the forward slashes in the regexp.
> 
> Thanks, you are right!
> 
> So far for not just following my instinct, but looking for similar functionality
> in other scripts like scripts/kernel-doc.pl...

I will fix this up when applying. I think I am going to adjust the
comment to

  # strip single-line comments, as types may be referenced within them

just to be a little more verbose about why it is being done.

Sorry for the breakage!

Cheers,
Nathan

