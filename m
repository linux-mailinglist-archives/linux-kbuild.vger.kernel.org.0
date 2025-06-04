Return-Path: <linux-kbuild+bounces-7368-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7FACDC76
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 13:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0523A566E
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 11:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5298728E607;
	Wed,  4 Jun 2025 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljaBft0+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2388A28E5F3;
	Wed,  4 Jun 2025 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036376; cv=none; b=Ly2Yz1K2lUeAivZFsmbLA8BI+79Fvc5gcLfk8RYlCtmNGNIRsp2v83ez85BDlxfD+n1j0cQj1t9W8sP6w3Kgn6VQc8y25COvg/K5BKQ+LjOhfPrvJaZD+iO+l++a2dEo3ai03nRddTk3tUkMxeGklWTzmaw+gMQ/osL/pJMIyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036376; c=relaxed/simple;
	bh=CXvat76UgqTuizaTTXk2cggB6YuXzgU2clBrFmOcy4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUgZ6BHBlLsjifl66+JDTyOCpYHXQXNxvnXlV5ERwQ4N12FunAnRDeYjm3JAKi/cFYfV+Esu1YF+dMAK0bf1Y+sVN8OdHa9dmuE0CeuXleWO6I3XGaxrN1EadEVVjlHUsDpNO8tVpw/Humomo6JWKQ+cvmYW/mLQjlRwshdqyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljaBft0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690BDC4CEEF;
	Wed,  4 Jun 2025 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036375;
	bh=CXvat76UgqTuizaTTXk2cggB6YuXzgU2clBrFmOcy4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljaBft0+5o5l8U7L+cwauxQk9qvCh4kVXGRfdGZVA1ROBRHWH5akSlf/ixTX8QSXv
	 F0F1OoO5/8isOq0Vji3evVVauluzAli766s+7nGCrIPEhMKPwNxIzoKzgXhcAqf96y
	 D1JC1ggNgMtL+MfXpNwBYQJhisyJYHiahUnKOGpCh1u7TThRRsu6rvyaV2npiPdeco
	 igDsVATDmDJvF+z8YPw6R69ufXIxFplUOunXsOcL/aXjZauStbdwcPESMF8c1J2Frk
	 9bLxlCcy9po6Oo2lYXjKorpaLHJmbzRR3l0vWBV8pmWsOPgrpO8FqRWN8pIhJk9FKZ
	 0U+zWQ0/dOtxQ==
Date: Wed, 4 Jun 2025 13:26:09 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Message-ID: <aEAtUc6OTyvu-ThM@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
 <aD1bozP0l67f_wbs@example.org>
 <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
 <aD2vSnZhofEPilcL@example.org>
 <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATfUzCXmCb5kKOJOKOw=CJvk7viGgYtrGLwbSAkq7VtyA@mail.gmail.com>

On Tue, Jun 03, 2025 at 01:18:25AM +0900, Masahiro Yamada wrote:
> > > > Before these patches this was not a problem as non-unique characters are
> > > > in separate object files when the module is compiled separately.
> > > >
> > > > But when the modules are compiled into the kernel, there is a symbol
> > > > conflict when linking vmlinuz. We have modules that export multiple device
> > > > tables from different object files.
> > >
> > > This is because the __mod_device_table__* symbols are global, but
> > > I suspect they do not need to be.
> > >
> > > Let's test this
> > > https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kernel.org/T/#u
> >
> > I tested this patch with the config:
> >
> > make allmodconfig
> > make mod2yesconfig
> >
> > and it works.
> 
> Good.
> Then, __COUNTER__ is unnecessary.

I didn't immediately notice. The patch you suggested works, but these
symbols remain in System.map and it seems in vmlinuz.

-- 
Rgrds, legion


