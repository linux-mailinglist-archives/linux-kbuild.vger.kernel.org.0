Return-Path: <linux-kbuild+bounces-2217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D467C90DFE3
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 01:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3ABE1C230F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F6C15EFAF;
	Tue, 18 Jun 2024 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="thbMP0qS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C75041C89;
	Tue, 18 Jun 2024 23:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753562; cv=none; b=lcpjSCCPZYW8g686lpF2KQa1pZ0Z0RLKJ8qi+6qDA2b3K3IeoLFheDq7utB9NShS9Oq3siAXtP4ce8iRcozHfvCMeQiuIdhjGxsReA5aZXIQ9c/jqsjpy/VjMskFk6JeSiJUIraip93+LM4kAXMR56kpd7ij9R2/xHDbg5YEy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753562; c=relaxed/simple;
	bh=walKVEKz+Zj22h1N8Hw8n9DlaB77GOsfhPdfZ0a8tuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnZ+IO5fOGIwpjkeCH2TWx0WYbzN1UEFJPXkxIqQ4yJmsDC0bfAvK9H1+H3hOpJnxQewmuo3EGVSDn2panJFjUIkD5UwWo5rStbie0TzyyZwaj8uvPTyb+3FafLvgUDvYkgzny5Zv/uF0AaKwMnE/iEjAOVv84cIcaCGWNhyYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=thbMP0qS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9774CxJsQPgyITFMZ8T1g4uP39SEz0rWfqyfj/UUrAA=; b=thbMP0qSlfb+Kh385zZ3qeslyo
	d5cUmhjaFUBGnKOX73bGywVz0n+OZFLOpT6jbN3dT8yf/ozhLDjIZEK5TPKVPR6MleDmjUcTqvN+f
	LWqeDW3Rzart2Stark1d15Qz8ZVuWiRtAClfwWk7xVNy0hr1JJnrmdZv/SntKdSn1nDyPiMaI1xFc
	ZIti85ahh9IxJ13xuRLZIYpPncxPsF3/NbDIYDq2TB+FuC2uSeTuJKQ4ArivSYnUkpwVFPnM837z5
	q9+rvP7zO06wImJyxYXEvN+fZE370nWKtS/Ttl7EYK0EHGuYoCWIlptl69HLKjUaHRGDNnyGis+Sz
	/bH6MX/w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJiJW-0000000GtaB-3On8;
	Tue, 18 Jun 2024 23:32:34 +0000
Date: Tue, 18 Jun 2024 16:32:34 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Message-ID: <ZnIZEtkkQWEIGf9n@bombadil.infradead.org>
References: <20240617175818.58219-17-samitolvanen@google.com>
 <ZnHjO7x9nszs9pUC@bombadil.infradead.org>
 <20240618211947.GD1611012@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618211947.GD1611012@google.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Tue, Jun 18, 2024 at 02:19:47PM -0700, Sami Tolvanen wrote:
> Hi Luis,
> 
> On Tue, Jun 18, 2024 at 12:42:51PM -0700, Luis Chamberlain wrote:
> > a) Ensure correctness for all users / tools, so that proper plumbing is
> >    really done. By considering all symbols you increase your scope of
> >    awareness of anything that could really break.
> > 
> > b) Remove the "Rust" nature about this
> > 
> > c) Rust modules just becomes a *user* of this approach
> 
> I believe the only Rust nature here is the last patch that enables
> gendwarfksyms only for Rust. Otherwise, there shouldn't be anything
> strictly Rust specific.

Right now the check for length is generic, and assumes a hash may exist
without considering that check is moot for non-rust modules. So the
inverse is true, but doesn't provide a solution or proper architecture
for it.

> > It gets me wondering, given Kris is also working on allowing traces to
> > map symbols to module names, how does this fit into that world [0]?
> 
> AFAIK long symbol names are only a problem for struct modversion_info,
> which uses a relatively short name buffer, so I'm hoping other efforts
> won't be affected.

We'll see!

> > As for a) the reason I'm thinking about having the ability to test a
> > full real kernel and moules with this is, without that, how are you sure
> > you have the full scope of the changes needed?
> 
> Sure, I can look into hooking this up for the entire kernel and seeing
> what breaks, in addition the issues Masahiro pointed out, of course.

:) should be fun!

I think once its revised as a "generic" strategy and not a Rust one, the
proper architecture will be considered. Right now, it just looks like a
cheap band aid for Rust.

  Luis

