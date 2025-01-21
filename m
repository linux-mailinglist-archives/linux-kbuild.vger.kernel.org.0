Return-Path: <linux-kbuild+bounces-5529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E2A187DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 23:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF2017A1556
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C57F1F8912;
	Tue, 21 Jan 2025 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4Y1sYik"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B518AE2;
	Tue, 21 Jan 2025 22:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737499883; cv=none; b=EyiEt/77IYS/nawawLl31YXoEzdWH0hpRs+lngXJ3eMzfosrPDc85Z+8dd8RbWgktlC5Cx9bDqdWDjIBzqD5ibuJb21bfPmXVFRHq+I1gya8LAQlA7X6OTaPXiXPJncQayier25U6WHZLsKNzrxsU0NkcgO/QTT7nd93nuoVm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737499883; c=relaxed/simple;
	bh=sxAo7bCulttA4Zt61Olo02BloQhSK3gg7N18a4OqPuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6LrUEt7JQLiUcwVAE/yR8/ghrNYw9TtWwmufXDQqe1U7kxkNc8ieEXaD2YDJ/7azF/w7PdXkC/ut8Odx/N13pKUfOKIxVMMljkViekG4ExJmefyv1bUnPioyEPJBHWk299xi9rZ+jQ53MBNcb13HwMbOLECYyYlDXopdX6qdh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4Y1sYik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDE2C4CEDF;
	Tue, 21 Jan 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737499880;
	bh=sxAo7bCulttA4Zt61Olo02BloQhSK3gg7N18a4OqPuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4Y1sYikKafbJDtE/SdSfWLv21p0eW9Ou+qazufP42PmHCOKoFrEeWWKRxOJs/laG
	 +TNI+QIPsNh1A1DxmapE9EwE4HFrrVwHNlmo8Zp+hvUq5+CiHDCHIV9odjXmPQZ3zz
	 +WK4MLLN+/H1QMLZfnMnp2KegLbYV1OeDlog0SSvvKz0qdVZvuPD/ruxce06VAQGHo
	 n5+PhCffgJFQxCZgDTDU16o59NVXv+y+GxaVmL4LqOok5yfrva3UQENxsyFIHnb1Xs
	 +pW7/IyuuRRkJex/QRtCzW+lWIsoF22oxIWcNxx3kmMWXXtmxKsdR2/fMeS2PfQtwc
	 Q/VtILdAyF4WQ==
Date: Tue, 21 Jan 2025 15:51:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	arnd@arndb.de, linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20250121225115.GA2560185@ax162>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
 <87r077j1fa.fsf@gentoo.org>
 <20241119044724.GA2246422@thelio-3990X>
 <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
 <202501201615.F606516@keescook>
 <20250121215330.GB1517789@ax162>
 <877c6n24wj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c6n24wj.fsf@gentoo.org>

On Tue, Jan 21, 2025 at 10:11:56PM +0000, Sam James wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
> > On Mon, Jan 20, 2025 at 04:16:30PM -0800, Kees Cook wrote:
> >> On Wed, Nov 20, 2024 at 03:28:35AM +0900, Masahiro Yamada wrote:
> >> > Some Makefile overriding KBUILD_CFLAGS would forget to add
> >> > $(CSTD_FLAG), for the same reason as they would forget to add
> >> > -std=gnu11.
> >> 
> >> But at least we'd have 1 place to change when we changed the std level.
> >> 
> >> FWIW, I just ran into this build failure too testing GCC 15 from their
> >> ToT. Both EFI and compressed Makefiles needed it in my build.
> >
> > Yeah, I suggested the simpler diff in a separate thread, which seems to
> > agree with your testing:
> >
> > https://lore.kernel.org/20250120182048.GA3244701@ax162/
> >
> > I don't mind drafting up a commit message and sending those along if
> > that would be preferrable.
> 
> At this point, I'd like to see the scattered -std= in given it seems
> less objectionable, even if I'd prefer one place, as we already missed
> one release being GCC 15-buildable. Happy to test/ack it if you're willing to send it.

Sounds good, I will get that drafted up and sent along today (if not
tomorrow) with all relevant parties on CC for testing. We can consider
unifying these flags next time we bump the version.

CHeers,
Nathan

