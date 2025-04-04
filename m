Return-Path: <linux-kbuild+bounces-6433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC38A7C17C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 18:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C0203A5F6B
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B018520ADD1;
	Fri,  4 Apr 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F8n8v1x4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F0209F5D;
	Fri,  4 Apr 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783878; cv=none; b=IzKwML0bIVWXoHwVGpp+eJGeFkqbSzzY5Uf8tw/qusvT9ko948czLwv38F7hVkq0VEpnQrs9XXmlPy35Se7J6SxEO2SbMYV6eu08LeEFs14VvjGAP4HIQStrWjSLjPiXP0n63bRRyzbmVsYyA+PUERrilu0lfM7PqrboTV1x7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783878; c=relaxed/simple;
	bh=rmAXbeL39KcgujpR7v+ECJwqUp5fyRbRVOREMgRk6Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMvZzVKqJAC4w95H7JzNaIi4zsGk82dW5RZhVeMofJozUp/tJcm2t4vFay0klDU+JqChUGzK6FNO6AYjgDslC3CbrbPPG6e2rz5cZe7PBZzsxPiWW8ZC3Zc4zerTgeXWGcKioouSGKlj0+vDQnDGZR5oSbDBVCg+baofEn4w0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F8n8v1x4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743783874;
	bh=rmAXbeL39KcgujpR7v+ECJwqUp5fyRbRVOREMgRk6Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8n8v1x4Erm6xVCeoU3Al3ZneYj/AXdDULwzuyz6bwUgqoPNafFzSf8EFnXUwU3mS
	 5SE31Gxi6XaLhVzwT8Uligtxyod/AAHQTqtW3890vc/YTdnPZ1c9tHzgphejkNs0jV
	 h3A0S+Ia8pTsnZNJtbOu/hgQtrjhZdho+6Tk8NZegfHLBrE7soiKGsg+7Eez50YXlm
	 T/SbTPma+UrzB6e5sxIulQAp74SMC52n+jWKGb1qJZPF0DTZnbuX4MqLAyt45uyGya
	 7xyuqK9dVhwfeNsM6cleyPgvS8y5RCQoK7UJeVUgN8z5ORC2vqP2CPbFZnOpsFmkzv
	 dPlKhQ7DCX+XA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6066B17E1017;
	Fri,  4 Apr 2025 18:24:32 +0200 (CEST)
Date: Fri, 4 Apr 2025 12:24:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>, kernel@collabora.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 0/2] Add Kconfig pages and cross-references to
 Documentation
Message-ID: <6b019d76-1a8f-4e8d-8b9b-05094a014689@notapiano>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
 <8734eogfqw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734eogfqw.fsf@trenco.lwn.net>

On Fri, Apr 04, 2025 at 08:31:35AM -0600, Jonathan Corbet wrote:
> Nícolas F. R. A. Prado <nfraprado@collabora.com> writes:
> 
> > This series adds Kconfig pages (patch 1) to the Documentation, and
> > automarkups CONFIG_* text as cross-references to those pages (patch 2).
> >
> > There is a huge change in build time with this series, so we'd either
> > have to so some optimization and/or put this behind a flag in make so it
> > is only generated when desired (for instance for the online
> > documentation):
> >
> >   (On an XPS 13 9300)
> >   
> >   Before:
> >   
> >   real	6m43.576s
> >   user	23m32.611s
> >   sys	1m48.220s
> >   
> >   After:
> >   
> >   real	11m56.845s
> >   user	47m40.528s
> >   sys	2m27.382s
> >
> > There are also some issues that were solved in ad-hoc ways (eg the
> > sphinx warnings due to repeated Kconfigs, by embedding the list of
> > repeated configs in the script). Hence the RFC.
> 
> I'm still digging out from LSFMM, so have only glanced at this ... I can
> see the appeal of doing this, but nearly doubling the docs build time
> really isn't going to fly.  Have you looked to see what is taking all of
> that time?  The idea that it takes as long to process KConfig entries as
> it does to build the entire rest of the docs seems ... a bit wrong.

I have not yet. Thought I'd get some feedback before looking into the
performance. But I agree with the sentiment.

> 
> I wonder what it would take to create a Sphinx extension that would
> simply walk the source tree and slurp up the KConfig entries directly?
> That would be nicer than adding a separate script in any case.

That is what is currently done for the ABI, AFAIK, so definitely seems doable.

The key difference between the ABI approach and this here, is that my goal was
to reflect the Kconfig file hierarchy in the Documentation. So each Kconfig
file gets its own documentation page, while the ABI approach collects the
contents of all ABI files into just a few documentation pages (stable, testing,
etc). (So there's a non-constant number of .rst files, which means they have to
be generated and can't be a sphinx plugin in this approach).

I went for this approach because the filesystem hierarchy seemed the most
logical way to group the Kconfig symbols. Also Kconfig files have directives like
'menu' that should be present in the documentation in the same order they appear
in the file to fully describe dependencies of the symbols, and having all of
that in the same page seems like it would be confusing. But given the potential
benefits it's worth a try for sure.

Now that I think about it, seems quite likely that a lot of the time spent comes
from creating a subshell and running the script for every Kconfig file. So
making a single script or sphinx extension that itself handles iterating over
all the files would likely greatly reduce the run time. I'll test that.

Thanks,
Nícolas

> 
> I'll try to look closer, but I'll remain a bit distracted for a little
> while yet.
> 
> Thanks,
> 
> jon

