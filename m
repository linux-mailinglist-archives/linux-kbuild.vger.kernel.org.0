Return-Path: <linux-kbuild+bounces-5646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09625A2AC16
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 16:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40FE53A3F82
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 15:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC851A5B9B;
	Thu,  6 Feb 2025 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcdR53XE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7B236420
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Feb 2025 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738854315; cv=none; b=sG6CtqnsYLjqTpP33/QXAiwS90r20P4y1yLM/fHlt4zyzI54ak41sGpCpFad6DC+/M9HiUWgjuu//5Eqk49aibls4ZqS+2U0gRvUwuMcY1XCAXVEhjSG2415lNnSSlo3kHPaTKBjxoKmNT5wn2rSbkmGLev2tUGtNzMUqBoEmjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738854315; c=relaxed/simple;
	bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ih4A5Vk/Oqd+0wAW0t/tbzsO2nv4sAX6rbLt1CpkpCg5BKCak30a4dTAEdWUkWIF2cy4dojf1CZ2I82cHfOlAg2emGhi9edn+wdKwRxXzDfrvoE1ya92afFPbBbV8XI2coi7gtr7r5ATos128gUpVdLtbwSToW/fWf50kNzQdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NcdR53XE; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4679b5c66d0so40111cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Feb 2025 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738854313; x=1739459113; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
        b=NcdR53XEdhjPZIjtDHDUavBxP5MQp92qialmmHMqo7QGCEGvirzOSEiZtjMitv2BnI
         fT0FzYsoZ77f2ERfbdXyhq4RnstHQNUUzqlUx3jDyXl/o6XCaHAmmvVSvOkM1f7jxUHj
         TncBoUwEL6L+FRoYSRuR1kV6qKQJeWf1HVMANzyipqzDpG4TdyjIEswWse706jOQXHO+
         lZvtrz99dYi3TAy3hFmG3ddLViFiV14vQlbnm/fr6FRTQbjOaVx0Yb1eqQtvGbGUKxHh
         mJ/kpGXAMW/MhOb5bNCFpDFSLyxp/BwhsPT7bs3PnxOtjiwqDj8UVbF0i8vy2kO5d3OQ
         dD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854313; x=1739459113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
        b=eQmmXTZZOpRjH51OTCWPgricP6IbSAPe7lqMckf8rukYYKL4pb9il0Pvstdctlq2AJ
         1I36QKks4JqEi4Fo4EXsVKpUY3vLVVNLjtUyhjsOTL9AoWzrTR+z7bRfpsO3QngrdedS
         eq+mqB0CBCVL9huOy+H/p1Vkx6yrsjoBBTpFk3U2oZJKnRUy9cKGWQ9sOD8oOBPe6qil
         1F+NXtCFrruatOe9Ndq3f9ueoWJuAwvlusvNER6QMuQ/z9sBFtFojd5FdcvYWwvwzTJU
         Orwe2RwBw7Mc6wDwKxflEMAsN0w/KAtrDIyPRrW657SNYur1MmjUv1jPNztBXDXZt5vZ
         p3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVsA7ZwoXFkwX/m6Gz2hYxB90eOiB42ru0pD8Q1AlZkgdicE6PH3qKaHMVML7SLfPFCQjkJ8d1NVo6WKQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2j0Rj0qrt7ntA0bzEqGoAdY+ArEc5JhH2bM1kGaGnzQkrYd1F
	I8K2z0OwexW3qOR44LYAQf+lVzdClFSEWpQL0d8t3YeiHaz6Z4T59AjL8HH/8ltEIQ1oInlr0/3
	Ysi+eD4sUIWz3pvqTuZJaniNPlgxpWFO8TGNR
X-Gm-Gg: ASbGncuvjBQoxdwREMGyGOMW5DaVssDfF6LsoNCmM1taRpvNAM3DzqVXwVkD6CJcsAI
	pIYbK50z1sHu8Nw8vAmnKsarr8LF6RPYVAY/SugD1D7uxbYcHq5H0Hxrgs42rvIJMHUeWEQE4uF
	CKLdwPSak4xNK3x9Eg3nXDyhQNBCk=
X-Google-Smtp-Source: AGHT+IHmNYFb+KpFj1K1sY+xMUMyXhvudqbqsfAwqKTTOOsS4XwCtufELw97J6XPp5V6Xs0jbvW2D0z8QzALFoy4HLY=
X-Received: by 2002:ac8:7e84:0:b0:463:95e2:71f8 with SMTP id
 d75a77b69052e-47165addc61mr318871cf.15.1738854312746; Thu, 06 Feb 2025
 07:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162> <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162>
In-Reply-To: <20250131204920.GA1974131@ax162>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 6 Feb 2025 16:05:01 +0100
X-Gm-Features: AWEUYZlQG1QNiSuRQV58qR_DOfSbU9LJ7SSXyKt5r-mzphkFPcuwXownjcLke68
Message-ID: <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

OK, it would be interesting to spend a couple of hours staring at
these errors and see if I can get a feel for the overal picture..

Also, now that I think about it I'm a bit embarrassed I didn't try
building allmodconfig before sending this series (maybe I had
forgotten it exists?)! Sorry about that :)

On Fri, 31 Jan 2025 at 21:49, Nathan Chancellor <nathan@kernel.org> wrote:
> > But I can also envisage a world where that creates exactly as much
> > work for you, just introducing Kconfig hackery for no reason!
>
> Such is the nature of such changes. It is not that big of a deal for us
> to work around in the short term but it would still need to be addressed
> pretty quickly at that point.

I can't quite parse what you're getting at here - is this an opinion
about the idea to depend on !COMPILE_TEST, and if so are you in favour
of it? My thinking is that if it defaults n and isn't in allmodconfig,
the only people who will turn it on are those who actively care about
clean objtool for their build. Which.. isn't really what we want long
term, but it's better than not having the option at all and is already
a step in the direction of something that can act as a "ratchet".

If not, I'll go ahead with the OBJTOOL_FLAGS thing. (Which is still a
nice step in that direction).

