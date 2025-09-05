Return-Path: <linux-kbuild+bounces-8744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D5B45E0C
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 18:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FB3EA62013
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70994306B00;
	Fri,  5 Sep 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsxHbpbD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6F1F461D;
	Fri,  5 Sep 2025 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089436; cv=none; b=gfEJPMhN+0oTmaK62zfXUkfNjEB7NI4ncFdmh3QS4uOI7sYqbYdSbnz905vQ4WhaIkOLiggZkVubqBj6k5CQi5t7aVZnlp9jFIaSXL0T9JXFX/lMQ4pyOpF5mGjPqGHGa7QuWmHMlV/8muwVVlFEsfv93/zqjTy+U++KkFS6DbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089436; c=relaxed/simple;
	bh=aLW/Gi8Ao8e/NwZIojKBxkDr9L5HAznf5EyLgbwPeu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiwr5wjykwwgdh6hapWgT7LczS6mFsqDLa624HV82qtFTVokLZbjpT4E8tby7Li3hPJcFQAxc5sllghOJj10nXwNHaXhRB5ky2A5JlRVXOj21c0nBOiNULVtCWZgLI1+4lSGe03lZ7ZmwbQ81e2ggpGFVfuyG6v3YVNJkhtuf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsxHbpbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B620BC4CEF1;
	Fri,  5 Sep 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757089435;
	bh=aLW/Gi8Ao8e/NwZIojKBxkDr9L5HAznf5EyLgbwPeu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TsxHbpbDTLdqcOZwr89L/vJGWDrCGvW2D8UXz5u3zDlC8ql+TRwYbJiKl47Yx2afT
	 ixeTokBZ0HlWpbiG6fE1gzI7avxB8vDRL8AoArnH5iYTeDU3IyF6Z6YwRPB6JGORjQ
	 9v37duEUBKj57IgA5nbkTasu+xMebak5R3SPc2JpQVMahEhomcC1Lu8FUeEXgKbqV/
	 S54W/C7nPI9uBUB+cD5JEnDeCRAD45kTEKQmJjmMw2FRG56ce3sT7wGId717RIvRn/
	 HphK52nnG2vVh0Q0aVDnb9m7cBe0AEEXAMuqh9q/HbIUes6lrtdBjOGrQvSLcPp0vf
	 LZ8HlYXNgKs9A==
Date: Fri, 5 Sep 2025 09:23:55 -0700
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <202509050921.2398728EE2@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
 <202509031949.375138FB13@keescook>
 <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>

On Thu, Sep 04, 2025 at 07:03:56PM +0200, Vegard Nossum wrote:
> 
> On 04/09/2025 04:51, Kees Cook wrote:
> > On Mon, Sep 01, 2025 at 08:44:56PM +0200, Vegard Nossum wrote:
> > > If you change sym_calc_visibility() to always return 'yes' for
> > > transitional values then I don't think you need to touch
> > > sym_calc_value() at all.
> > 
> > Hm, it looks like sym_calc_visibility() doesn't strictly just look at
> > visibility. And visibility seems to "last"? And I think the "tri" still
> > can't just be "yes", don't we need the other stuff handled?
> > 
> > Do you see a way to do it how you're suggesting? And now I wrote the
> > regression tests so we can test any alternatives! ;)
> 
> Here's what I had in mind (on top of your kcfi patchset), see the
> attachment.
> 
> It basically undoes all your additions to sym_calc_value() in favour of
> two straightforward additions:
> 
> @@ -214,6 +214,11 @@ static void sym_calc_visibility(struct symbol *sym)
>         struct property *prop;
>         tristate tri;
> 
> +       if (sym->flags & SYMBOL_HIDDEN) {
> +               sym->visible = yes;
> +               return;
> +       }
> +

If this doesn't break "m" choices and the config doesn't show up in
menuconfig, then yeah, I can do this.

I'll give it a spin!

-- 
Kees Cook

