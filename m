Return-Path: <linux-kbuild+bounces-9969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5366CA1EEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 00:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A072300A861
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 23:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A655E2EC0A3;
	Wed,  3 Dec 2025 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGIAwTIV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86882DFA2F
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Dec 2025 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804328; cv=none; b=AiEejat5K16HETRBVIIeHjAmSGv5PN5wfVs7HEQCpdd0UL6t172An3TG50Z7LWzUv0F7Z7dNoDKM/KzTkeSQVkaxs8cHHeFSgh6M0NlI9PufcrlCHk9JqFKamy7MK5mpbrGrqj1oSSfTEO3Qe9aR8dM2VUUOmC1+Czl2N2iqbOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804328; c=relaxed/simple;
	bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDPKYTTQyRpDuM9vmhbfL2gTql62i1CgAcpNk8+81CQ/kT3xFjEFuLpEPm43vmvFlJv7n/tuSdJxZ8Xv3LSDoWtWNWR5zubvA7CrAGs2fEuY88c8Qw2zVVOZqVhl18G4+C+boiSQziZcRRexszS6kE8Soz++jqQyC0xKZoyjGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGIAwTIV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso1749a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Dec 2025 15:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764804325; x=1765409125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=EGIAwTIVZ0g0Zf9JpBudMRt6GBFnFPYT+c7lwenqSmGPvpv4jtMgQIhaHNs3xTZMRQ
         d5+lGtakOPA9jpG8VfOIt27YQVduOLmGa5zgJ59rSH13C9TR3fzvYEJ1+RXXdL9itKw0
         uR8BMoanMJWdnv9BEU0zGduIuufOQiSOGEqnlsgckicdV3nAi2fOZN7u7S1P2UMsWJbx
         Js3Sb5GZ+pt0HWTJZ1e4aasThz2CEyVkL6tAuyXxngx81unPu7LFk1vq+cWXUR6X1okZ
         SAmgbVsBHxORmsaHxJtKF6YGNqqqRBc4qRX3f7TV5cbW2uJ+FappvDwLp5lgnJgiqHr9
         xX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764804325; x=1765409125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=lmrRb+d/b14yHEfPX/PPwPrVuwtN3qZnT8EP0t3YWmpN4TS47g6DMtWlbW70pmDui1
         Z8VsZKlk1zmCMc+DsW5Rej7JFG7CjVxYslhDhMKso5AVN2b2P+M3gdKnm/Y1FzSVYY+R
         jw/7qLQSgXOISpGHwDFZKKokaLZlIa4ba4s38ZZQvoQZa3qctwLGzU4suEJG6GuoSL8l
         D0dvNH4cNBPveij6bFrpyG5dpaOViyfO8ckt5sWLzHSrwWd3l7fIeN1dEcIVnTEOOmF0
         0wa6W86fLH723hO0OzeOBpys4SONTGOjXWxRsVQCwlrQjYSiW3hzrudC0FSACd/3SDCi
         V6iw==
X-Forwarded-Encrypted: i=1; AJvYcCXVp+s/LPbaKRez4PUbQSdrjIKi42wU5l+7Z4XiO9EHxAbCkhcAcGkBfHRG+w10Fo4ZZaXpzHFKCSnzDqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzuUhaPFsSNnYed0ZcfMDeoTo9tF5r6ThbkX5tv0Q/zQ5h1hdX
	568/ls/Fv2EHWAYSoNc0MoGiwPxaXSW0yRpxYVpA/930c6jCmHJxBbZCegempdEnsQLOah+zK28
	wmuRlS/h8vxoD99Q9QpqRmqWdp/fNwd7TUAOIpbtg
X-Gm-Gg: ASbGncsFyk3PPQoXH57Ylxg31YD0egt6SwJ0eFr+3XBY1IgThLasVZe3+Vv6b8Y3y7q
	5kaydUwmB/bRkkhX0Fvahh53dLHQysKcyFYwq6RStGRyrJhzzw8dxME6qcsf/8BiHbMuoqwfRgJ
	Eq68mxHbyCxi5V4UeBhPtFS/odVxtLGhaBesCqZ9UKHAPc4WRKMexHVH8uzir6tFpwYIi6F2FZ/
	DMhq/BndaYD1OlgiPFfAR9lFktHhNg+C2cpmmcG+evqXtiHWoiFvj1DaNm4U3C+FjUMY3qMCZys
	iPpSkXEm5LTfoAiiSq0+nixV
X-Google-Smtp-Source: AGHT+IEXEQTgoa3Tuakna4skmZg2pw/mrECwMwVvdW0fQYVmXvi58ZGexwzvZpC2XAuu5b911WZjF7TrDbbogWoEqU4=
X-Received: by 2002:aa7:cf02:0:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-647a7728a14mr14606a12.6.1764804325007; Wed, 03 Dec 2025
 15:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251203212558.GB3060476@ax162>
In-Reply-To: <20251203212558.GB3060476@ax162>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 3 Dec 2025 15:25:13 -0800
X-Gm-Features: AWmQ_bmE-9G2UW0Equri3aRgg0NngGho89_DAwKEs6T1gQOz1p2ws5lgLkHiDf4
Message-ID: <CAGSQo00bG7QF+u2WJQwMTiq6iGATcSfaAurkkppykkn+yTL-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

The main situations where someone would want this off are:
* Not using `clang` (should already be covered in config logic)
* Out of tree module build without the whole kernel build tree (the
`.bc` file produced here would need to be shipped to your out-of-tree
module build environment - it essentially becomes like a header file
for purposes of building an out-of-tree / DKMS Rust module)
* Don't have matching `rustc` and `clang` LLVM (kind of covered in
config logic - if anyone is using a non-release version of LLVM, the
config may indicate them as compatible incorrectly).
* Requires out-of-tree / DKMS Rust modules to build with the same LLVM
revision as the kernel was built with - may be a packaging concern

While the usual inlining tradeoffs apply, all of these functions have
been explicitly marked `static inline`, which indicates those
tradeoffs have already been thought through.

I think that if we had a reliable signal of "`clang` and `rustc` use
compatible bitcode", turning this on by default would be reasonable.
As-is, we have a mostly-reliable signal, so defaulting it to off seems
reasonable so that people don't get surprise miscompilations if they
use a `clang` or `rustc` which are not using precisely a
release-boundary LLVM version. People who know their toolchain story
for x-lang is squared away can turn it on.

>
> Cheers,
> Nathan

