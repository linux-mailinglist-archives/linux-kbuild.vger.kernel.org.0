Return-Path: <linux-kbuild+bounces-9759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10572C7B599
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1663A510C
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 18:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8BE22E406;
	Fri, 21 Nov 2025 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgPwc5T4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FCA824BD;
	Fri, 21 Nov 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749930; cv=none; b=omnM20ng/ORrmiDdkW5VvMdDuJi6mhSdALryRsXckj5v1DI42O6B6svYvtj1gk5W3e3YZ/oENS7lNmhaOy7o2kct0i7OKPNaJrwcq/ehMVvc9T9hpfTRoSh1Ivued5agwYKyyJi6MnXNZmRASFtamxf83w2ullVwrV8ckJKa44A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749930; c=relaxed/simple;
	bh=TEEid0BTj44D8bNrA5BaiVdfS+mkOgrjLHIWm4cgxUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRQYx9mdO/QvTSN4HTH1p1wAfOLvOK9jzTzAYtcN20IWXwGkSFxowI9QFrYQpH6mWgTrL0LC8yiK+gPvVtd3P41Nnl9GNgKD3vOK1ZHUyhd+a7X/c7qVFmI/rgM1fByFT/lVxU2kVy40Eeg4z95+wXI9ts+HC0ucZLK4bSVcEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgPwc5T4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660ECC4CEF1;
	Fri, 21 Nov 2025 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749930;
	bh=TEEid0BTj44D8bNrA5BaiVdfS+mkOgrjLHIWm4cgxUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgPwc5T4Bvmv9g5/Ih37FdzyGK85hGyrXkZIV2+HZIOQsLa5zATrBf2d23kGdydlj
	 npJW37udHskz8RsVlWaqrbFU+iR4rNymTZinBKND493NFxoUUzf4qmYcnO1SiFzFev
	 77FhvnT06lFUBGA5hC8HZgsbBVtxskwYRUtCXIvRRGtIybFnc+FWYJV8qIJxk8ETZ2
	 tb1JX0VncYGLPyG1iUG8OMIqWy4pw20i8Vpjoft1WyFrMYl2WW7YmEFZLCRzYrw/hs
	 CbvK9gWBLptKqoYWBZ9nkdcx81j5I7qZb6VT09ULovQ5mzJXI+UR+XsSt0Fr+Xz2rZ
	 ziohBPc+X/G7Q==
Date: Fri, 21 Nov 2025 10:32:09 -0800
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable GCC diagnostic context for value-tracking
 warnings
Message-ID: <202511211030.87A256197A@keescook>
References: <20251119224426.work.380-kees@kernel.org>
 <CANiq72=tzUPrDd2=GBnqxm_PmjF9nT3iVJ5ZT6AiZQqkjvdH_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=tzUPrDd2=GBnqxm_PmjF9nT3iVJ5ZT6AiZQqkjvdH_g@mail.gmail.com>

On Thu, Nov 20, 2025 at 09:17:16AM +0100, Miguel Ojeda wrote:
> On Wed, Nov 19, 2025 at 11:44 PM Kees Cook <kees@kernel.org> wrote:
> >
> > Enable GCC 16's coming "-fdiagnostics-show-context=2" option[1] to
> > provide enhanced diagnostic information for value-tracking warnings, which
> > displays the control flow chain leading to the diagnostic. This covers our
> 
> > existing use of -Wrestrict and -Wstringop-overread, and gets us closer to
> > enabling -Warray-bounds, -Wstringop-overflow, and -Wstringop-truncation.
> 
> I am probably missing some context, but in what sense gets us closer?
> Do you mean it will make it easier to understand those when we enable
> them? i.e. we still can't enable them until the minimum is upgraded,
> right?

Right -- we've been tracking down -Warray-bounds warnings for several
years now and it has been quite difficult to determine which are "real"
and which are false positives. This option makes the "real" cases much
more obvious.

I will improve the commit log.

> Apart from that, it looks like a nice improvement on the output from
> the PR examples -- I didn't test it, but the patch itself looks fine
> of course:
> 
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook

