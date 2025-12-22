Return-Path: <linux-kbuild+bounces-10322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912FCD6C85
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 18:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAE6D3016EDC
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Dec 2025 17:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CFB3358CE;
	Mon, 22 Dec 2025 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz0qnyK8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08A32D7E0
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Dec 2025 17:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423704; cv=none; b=gZB9O4B+9AevKZzp78fUb3gPTupr7VsrvAKehuRS8xzEUe2QAWs5P7orzoBc3SAza/fUG7CeYC4PxyB6/2HiDtm3g/YIgbhkhC2lWN0EK4rf6P3Vqw5/TCpwsP5xKx6kO6JSV1DOsCM6gQrmz2q59t0Ae37Nw1hhIVwF/g5HQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423704; c=relaxed/simple;
	bh=CcddaCi3sYjcygd9mvn6PRNkI8gX+uLIVjXxPooFXok=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyazsbG4CvIyCF20y1VMGC9t8P87+3Hhg1GbAclEGeV7/yEUSX5K9KkPsvSbPEV8MFON+7hZ9Eo1MttilvhnsD+EC5dW/DGQIM2T0H8t/OmYicpchQHY+8TiTqeB4U+EpvFeuYwrhTQgagRlCR1PwjxBpKSYiLRZxU8wVZgGo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz0qnyK8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2562151f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Dec 2025 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766423700; x=1767028500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBKBPZnfNYA+sK9uTPKkZCmbZ7hh+vQmMoKO+VyPSj8=;
        b=lz0qnyK8mIeW2XP8nhKsmgmYkXk69VGRSsLz8/sLyQr2dVafcEvCjCqItimA0N94ki
         HyXcGn5IrwdhB0aEljJFG8InL7ccePvtRKAvHo3G/rMCQSpatQZjx7Lvll63ga3ja6xk
         RuBk0B29BXJy7fhNXvcbu9jMVqsXMYDqkPsnAoVhv6MXFw/wtJpLTmpqtgXnh/P4WGPL
         G8J8q7wLMNX/HGbE5cVNhVQDYXPWOYU7WqzGAWqYvRi0z12vyiG9HzB8vE/dI09CUV2f
         cml+GxmZ97BqLKulqBR6VuXaQeeqUsM4MPfP/qLCDQ3r0yzIGXC9A9rlnHoC1iZJ0RF7
         VdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423700; x=1767028500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OBKBPZnfNYA+sK9uTPKkZCmbZ7hh+vQmMoKO+VyPSj8=;
        b=e6r49VK/CDmjxcUBZ3vLJYkQJlR0vh2MEc6R83R8B9U5nKs2gklcG7tSri4dMNYu28
         kHNT03AaX3cerSpDYQyjOxXyK81h3EC3xzOwHpkdNYXOMaNgexwrY9Db82qgxwOGShEz
         ifPWur5oaKp9vCHMbp8daVAG60lzqfTffYkQyboDMYBEHMe46d8ANrzU13bMmUbFjwpW
         0/ux5aDtu5vtrtH394NrTOs2zz9RJNagthcK6R4YK/i4TU257YoLksC859U7njSvHgSm
         8Q3vR2zlkRXawIe+0Kg7EAh4lOyhfq//S9OKtmhepf/CGVL5HdfANs/PHMLM5iQJkCUJ
         Xyaw==
X-Forwarded-Encrypted: i=1; AJvYcCUH1yKD0scYoYGXJI4GqetaDOqhRtVtwL5ou1mD0CvnSqsJxXqNqTr7P6B9zG7Ou2+G0UP6OI64PhUCmcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FMRknSWBo+lPhbWBZtQElNRuzk2HwndL6K1TFym2sP7M90Ap
	QeUguONSpcvihyJfPoaUcbkYQf0tbeLrheIW6i2DnrCUP4GjrZEEgKMxx0V6sA==
X-Gm-Gg: AY/fxX4/7vV98RkOmB4cXoikQV0bSnC6LgglLMMUrh2e0XD/LRhtcOg61DjKKzuOjfg
	NEcBcFLpjRa4VNzL9F2CQzkHczoWBV8z7SUimNd3/ib06gIrKT5cxn9c2jtBAm/9S/f3FivNxzh
	PvqGvLmEmshD06EN/LruwK5BjVqqyfM4QHdyxm7CC0UVUn53xAxsaVgu4wiqwd1fX+V7dieEx7i
	eXiXFAd+8ykDl0pam8mMk7josUZLipvoDQ8zJgVpDnLAlGSvv5SOlWYuvNKDpvvhKz8l6bINMqH
	iNq+UbCPwCZIO105csbQZTj7E7xtgk9FI0KxMVp0UChKqI2ETRndJ3zztIiudEx9HXn/b4BBvdR
	rHzMJVnfv0BY8luegXX0vjjWvBdM7azVYZfkUV1PlzbBd9Z9Jt50DCGtn3JY48VW3sacur+XQc1
	SydusyYIDOJSG4p4G5/mj4JtNfLu7kYpQbAoQ59I7mepha4NaY3Z8=
X-Google-Smtp-Source: AGHT+IHqmVu8BHXU9pdCgT4b7EU6k50REs6s6P1D6OnfjG0mmVrBDLDRTIMm8f/zLC2E1PLF11u1sw==
X-Received: by 2002:a5d:5f46:0:b0:431:9b2:61c4 with SMTP id ffacd0b85a97d-4324e50d540mr14569390f8f.45.1766423699806;
        Mon, 22 Dec 2025 09:14:59 -0800 (PST)
Received: from pumpkin (host-2-103-239-165.as13285.net. [2.103.239.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm23273587f8f.15.2025.12.22.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:14:58 -0800 (PST)
Date: Mon, 22 Dec 2025 17:14:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Message-ID: <20251222171457.0b4848a0@pumpkin>
In-Reply-To: <8b6d335b-d473-4442-a17f-497ae7996165@app.fastmail.com>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
	<20251219201231.GB1404453@ax162>
	<20251219221827.4efa210c@pumpkin>
	<40f1457c-6e57-4d09-b50e-7133bafa7c3e@app.fastmail.com>
	<20251220121531.0dae2544@pumpkin>
	<8b6d335b-d473-4442-a17f-497ae7996165@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Dec 2025 11:20:18 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Sat, Dec 20, 2025, at 13:15, David Laight wrote:
> > On Sat, 20 Dec 2025 11:27:13 +0100  
> >> 
> >> This does seem like a completely sensible warning to me, and it's
> >> always been enabled by default. I see three patches in the git history
> >> (all from Nathan), which all make sense as well.
> >>   
> >> > Inside FIELD_PREP_CONST(mask, val) there is (with the patch, and if I've
> >> > typed it correctly):
> >> > 	BUILD_BUG_ON_ZERO(!(mask) || (mask) & ((mask) + ((mask) & -(mask)))))
> >> > to check the mask is non-zero and contiguous bits.    
> >> 
> >> I think the problem is (as so often) the linux/bitfield.h headers
> >> making things way too complicated. That condition makes no sense to
> >> me, and neither would I expect a compiler to make sense of it either.  
> >
> > It is simple really :-)
> > -mask is (~mask + 1) so its lowest set bit is the same at that of mask.
> > Adding mask changes the adjacent 1s to zeros.
> > Anding with mask is then any high bits that are the same in both.
> > So is non-zero if mask has noncontiguous bits in it.  
> 
> The bit that I find most confusing here is how you have a boolean '||'
> operation of two integers, but then interpret the result as an
> integer again.

I'm not sure what you are getting at.
The BUILD_BUG() macros want a 'boolean' argument.
The _ON_ZERO() is the return value, nothing to do with the argument.
So LHS of the || is 'boolean' and the RHS has the implicit conversion.

> > Adding ' == 0' and ' != 0' would just make the line longer.  
> 
> I don't think we care about the link length here at all.
> Splitting it up into two BUILD_BUG_ON() or BUILD_BUG_ON_ZERO()
> lines would help here as well.

I'm merging them to reduce bloat.....
It's not as though either test fails often enough to need separate
error messages.

> >> If there is no way to express those conditions more clearly, I would
> >> prefer removing the BUILD_BUG_ON stuff from the bitfield.h header,
> >> it keeps causing way more false positives than finding actual bugs
> >> with the input.  
> >
> > I was just trying to reduce the .i lines line from 18KB for a typical use.  
> 
> That seems like a worthwhile goal, but I think the only way to
> make an actual impact here is to reduce the fan-out and evaluate
> 'mask' less than the current five times in that line (plus additional
> evalations. If the 'mask' value is defined using complex macros
> like ilog2() or max3() already, the expansion explodes.

It usually comes from GENMASK() and that is several hundred characters.
Changing type_max(type) to (type)-1 would help that a lot (type is unsigned).
Even changing type_max() to do (2 * (x - 1) + 1) instead of ((x - 1) + x)
saves quite a long expansion.

> Unfortunately the constant version of these macros can't use
> compound statements, otherwise we could use an __auto_type temporary
> here.

Fortunately there aren't that many uses of the _CONST version.
The change to bitmask.h that show this 'bug' used _auto_type
to reduce bloat for the common case.

> 
> > Probably the only useful check is statically_true(hi < lo) in GENMASK.  
> 
> Agreed, that one is clearly worth keeping.
> 
>     Arnd


