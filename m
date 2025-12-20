Return-Path: <linux-kbuild+bounces-10304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62020CD2E9C
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 13:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CDC300F8A8
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 12:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B311E4AF;
	Sat, 20 Dec 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhKZBA+m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E63A1E7F
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232936; cv=none; b=rBQ6/z2s8tO2DXWZWMNtUxBYrOumWmpgrZHgr7F0F7IM3L7QiTtPMB12eSGEIyshoIrHtsCnv5FPJzq3x+K+xSElIC9wxIHLGER4nhOaQGAFU+NkKh8l61pCJ2Lp5WiIBpsRwoekn5iWbIgCofA5N80E8AwJpFrZGl7l7PXE6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232936; c=relaxed/simple;
	bh=HT6rGisAzJrATVoHaTjefftalkSsNqwoPak/aLxYEP4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TnveL36t82OwaKceGt8be7fV0VV1s3p9ZLWgy3VSHp4i58RGBYPd6m/+ytMAPFWu6FntWDT47Ww4JH5+azMjviNe21JXdoZyuFCflv+gOABsNe8ye5sNQkR+F0hWZf+RWQx/hdv2vUlJHCSVkonlUszXv5B73HuOeLHwAhXb3lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhKZBA+m; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso18308665e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 04:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766232933; x=1766837733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iELTgggMQoPNj9yF64m2G8T+d+6iv2FEFJAnnAfMx8=;
        b=LhKZBA+mfOiNHh7YwA8FOIk3Zr9nFSSdJZFYAad9KGKDPwQ1BFuzubpoyzxrpgFTfa
         pqaN/UdpxcFgN5zvCUnlV1qncqu27K/hLiohzZ5RxCtn9u76YZL/f1viAyFTj1m08AoY
         0cU3ysT9f0gy1qXrSyqFZzIAiN+pFSptx7qS1s4Q+Z4KAS4wEJjD+EC82lk3loeVRqVZ
         edwdcGyt98yzQMXCFnMCDRGyGDKaU9gUp9aLeiqDsqv68qcEtgAM71Jx723arEInxPD0
         dztNnKjVQD7S0pTRtpMYIW87iDIoKRoH7+ek74fWI00Xq0J6BhAAn40THp7rQPkjq4u7
         7dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766232933; x=1766837733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iELTgggMQoPNj9yF64m2G8T+d+6iv2FEFJAnnAfMx8=;
        b=bz7MnTtRXTVwMSh5cPXT8ohry2Cx+K+2Sp08fn0eEmw+6230KtqKjpuDWSyDNQwxxX
         noe+T1hXE5JTBtlgYns13NoP5lfVtzfE8QqrKvDBGIdeLrBPHQPls0MXuqj6T/ID1l5Z
         kS6698mhNvlY8WWn3hAujltVI+lqJule7U2b/g2DptuYqDSxbzqHPzj9hO4+GpFjQiQB
         Q28S12nPWQXRibP+seWS66ObnBs2RToIwK7cSzCGljL/HZpe6BUEj2fMaUzJNEDHZrcL
         h6kqZymamdbqQdocWIUw9v4I4O2+o8vKBevmnbKZrr0jHx3cc3xpG8ahjQQt5+DM2a8e
         06QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1o4fhAKfSJI6dorPtlYkwuOMZgRz50FssucFykqFezPiaiog0sZc9eUjB5TPIRpidMh8ZeQVmQ6Y1RJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOtX7N1wmhneTL31WBaqa9BrzeR47xXt2N9wjBKAwNBTo1or7
	qBXNddtw9wZyRRh1xa2cn/iIYG/jGrsHsqEGEOJ7ymRCxfgTAZ78Oiof
X-Gm-Gg: AY/fxX5rWB2DJgcXblfnwWJbGKrZsd1tt7groWgwOzkAaprXqgO2al/w572AWVflsMC
	7918Q4E/dR+N4xsKKV+g+5VugJyKVXn9lsTxYL1krNTWvmbkqSy6MC8kMNBr4cWetosW2U6j4Ng
	s6zSxb2oC1/UsotSoBvjc3Tuipqqi7yNZlde3edi2YJVl1LigKa9iQDctsZwXcf1xYePq8UP9C3
	7okv4rxE+P7/8zPRBeB+clO7fEaqfXwFSIAP9qLQtufjCzoiQbaF99xcPMR3uzbWiy9hpp+xJLn
	Oh1OLKS4OKuICaGaGNHpCCdtI7k6DM2aM5s+FLNUllesMiE17+yw23oLLtXWLC8+6Sf6tU32Ohi
	FDc+RPOpP92qhbUZIfovY0oW00JS6p0kSubrz6U/NnZO273sxmddPe9bZ62GF+Ig/PZPF06VUlB
	7WroJrF+X3b23lH5cljUdNQehISVsvY18ePwvtPwf0TY0CWjNkxshhJhJ1B6R7kD0=
X-Google-Smtp-Source: AGHT+IFQoE4QDWQr8T1wZVNOYSd+3Uu6vakq96tn+Zj5GkyDF7taAVFShsYizNWCCMZfEV2IPRwWJA==
X-Received: by 2002:a05:6000:2011:b0:429:cb8b:b58e with SMTP id ffacd0b85a97d-4324e437982mr6834081f8f.28.1766232933035;
        Sat, 20 Dec 2025 04:15:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2bdfsm10477146f8f.32.2025.12.20.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 04:15:32 -0800 (PST)
Date: Sat, 20 Dec 2025 12:15:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Message-ID: <20251220121531.0dae2544@pumpkin>
In-Reply-To: <40f1457c-6e57-4d09-b50e-7133bafa7c3e@app.fastmail.com>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
 <20251219201231.GB1404453@ax162>
 <20251219221827.4efa210c@pumpkin>
 <40f1457c-6e57-4d09-b50e-7133bafa7c3e@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Dec 2025 11:27:13 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, Dec 19, 2025, at 23:18, David Laight wrote:
> > On Fri, 19 Dec 2025 13:12:31 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Somewhere I got confused and must have looked at the wrong email (or just
> > failed to separate two very long warning names).
> > The actual warning was:
> >  
> >>> drivers/gpu/drm/xe/xe_guc.c:639:19: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]    
> >      639 |                 klvs[count++] = 
> > PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);  
> 
> This does seem like a completely sensible warning to me, and it's
> always been enabled by default. I see three patches in the git history
> (all from Nathan), which all make sense as well.
> 
> > Inside FIELD_PREP_CONST(mask, val) there is (with the patch, and if I've
> > typed it correctly):
> > 	BUILD_BUG_ON_ZERO(!(mask) || (mask) & ((mask) + ((mask) & -(mask)))))
> > to check the mask is non-zero and contiguous bits.  
> 
> I think the problem is (as so often) the linux/bitfield.h headers
> making things way too complicated. That condition makes no sense to
> me, and neither would I expect a compiler to make sense of it either.

It is simple really :-)
-mask is (~mask + 1) so its lowest set bit is the same at that of mask.
Adding mask changes the adjacent 1s to zeros.
Anding with mask is then any high bits that are the same in both.
So is non-zero if mask has noncontiguous bits in it.

Adding ' == 0' and ' != 0' would just make the line longer.

> 
> If there is no way to express those conditions more clearly, I would
> prefer removing the BUILD_BUG_ON stuff from the bitfield.h header,
> it keeps causing way more false positives than finding actual bugs
> with the input.

I was just trying to reduce the .i lines line from 18KB for a typical use.

But maybe the whole set of checks is entirely pointless.
The simple FIELD_PREP() is just ((val * (mask & -mask)) & mask).
FIELD_GET() can be (reg & mask)/(mask & -mask) for constants, but that
isn't 'nice' if mask is a variable, (reg & mask) >> ffs(mask) is better.
But you only want to use builtin_ffs() for constants so do need to
select between __ffs() and __ffs64() for variables - three cases.

There is also no point in the u8 and u16 variants (same for GENMASK()).
The values get promoted to 'int' and 'unsigned int' would be better.

Maybe I'll do a 'dump all the crap' commit.

Probably the only useful check is statically_true(hi < lo) in GENMASK.

	David

> 
>      Arnd


