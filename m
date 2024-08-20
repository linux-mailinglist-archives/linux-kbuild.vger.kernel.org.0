Return-Path: <linux-kbuild+bounces-3127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD4958F55
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 22:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3040B2227E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 20:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642B11C3F2B;
	Tue, 20 Aug 2024 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL5AuwZB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2BC166F3D;
	Tue, 20 Aug 2024 20:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187009; cv=none; b=HS4maicovKAsR5e+FCwZgu8nbl3JKMhbWpEJRkLl+mcbezX3vWVWF+Cn0udkjsm9O7HsvbYwYRzcxn1pg0YhWa3lMDmPfDqcW30yHvS/yI/6VnnL7bc0ceyLrbEHAvflhPUIZsYrYI7B4oz+KsAkGXXxMzQuH/jlZOULuQrXr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187009; c=relaxed/simple;
	bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg78Sw3HNUCVJdw34tAiP1APO5/D2qwTrxoUooi5QtTEvhh5YCu45qPu2sr/BWeu8zUzGrFfBlhPtdLbFmApu4FgfpCO4v9AUlYMUG4h0Vn+pP1CNI/aezLy+hj+RXZ7Yt3jJI7vlI7NfE+w3dzdChFTRsJJVi266lInAu372+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dL5AuwZB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530ad984f2dso15046e87.1;
        Tue, 20 Aug 2024 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724187006; x=1724791806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
        b=dL5AuwZB8RU4QehavcoBis5bPUPFgOeAgeeBc+A0147ax5AOt+Ufp8c6zhwaSeQF0H
         zOkVMR0GD1OqaplRlSfWbztNtkEifBlFRJqGdj+7iEFn0oN+69HGtyQbgmLma/HT8S9H
         dCPYpGTPljN1skf99rGVEltbchdyYbSU7XNRUBqp8aBofoeUrNAsM9qg4bac3g5X2mYX
         RGnk3Ckz9swnZzYkJS9r3G/TaBDPIgGw6k8wPiedE5T+AHCVxdN0aUEt1nK7DhcVkYNJ
         4KsFIs4PVafRBpsnE4Ys/hQbqTHsNxItdcuQK23dI8zRUxoHgVmSMKd2AGQfT2dP0GRk
         IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724187006; x=1724791806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzJFd4bvLYVyrRq91pLVKMp6cHYmymXxbjKHf0cCDsY=;
        b=BWcM+yJ8NNTxFItj3eKmz8s8kaN/1wO3uj0WNj1gAEnOYEU2WDbc2ZFTLiHEVTEOFY
         0AoUW2zX/xhB6c4z4kyWgN0REZltlL2Q8mQg0lSLaEyovfYEVcPqL4bTlZGche1QKGc6
         lIqN5L+u5aHC7kz8Et49vrbtRokmCVV3jpdGPUwRlehAGhnLYPzCTnlFFdoovRANTL4P
         A1HnL97jBsrjjHFab+2X03enDq1bf/HkOrLqU1qhYXoVSWWiGkTGbV8mHyK8sbiDGilF
         HHarBligrN5PbsF0ANE0YAx5JJP6oH0OyFwARqNQ6HetvtCUpGNS85pXKK5RcXzGGeRq
         eQUw==
X-Forwarded-Encrypted: i=1; AJvYcCUlQekKllRNtpsfCEwiRfO3FlXfMRT1Oub6j7a6QzDdXpvnNLM1SniO3ClfHaR6qfeNlU1rgYgGBvvi1wtt@vger.kernel.org, AJvYcCX8dJMrN5ghEzm9WiukLIBleXBlt4EkCP3T4cZBCAWh3kzetW00+LcaMZ02X8zkNR/PUM5i5+DanjcDRowxIgs=@vger.kernel.org, AJvYcCXONiRwazbkqAlv9hITyPyDnYLmpEmvAQRuvH1HX3sz2EaVszWvCjPSUoD3Sb2UI+VmIIAdhWrEU8svPK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8/a0i+5P2LVq6DZSr+t2xxsJen/KeDggWHDj/UkQLbTuT/8x
	vHM/yOxBqVVdXhtL+aY1r331k8LbQiwMEfIdeLf3BhPYYCdN8qBlEHN2tTOtBi77fMad/eMft1H
	o1qMEGf7GnZHFRqiFhsjZ3irEzM0=
X-Google-Smtp-Source: AGHT+IF4A2X5DHiMp2y/ISoHY4+FoDb2VARi23ScSmyW+z0nIW9IUdjYL2vjnS5voFYAV9Yn/hORkomSr0zeq2FvaaE=
X-Received: by 2002:a05:6512:b99:b0:52f:c337:4c1f with SMTP id
 2adb3069b0e04-533484ee187mr12476e87.0.1724187005190; Tue, 20 Aug 2024
 13:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
 <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com> <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
In-Reply-To: <CAGSQo03GVik5_yXFmCUnNUnPUwuwk-YFA0kqBd640PUjFOXcGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 22:49:51 +0200
Message-ID: <CANiq72kgw8YA_1yFrCbo-=okFC8Y5R1rc+QGhE0e7pVJ0bV=2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 7:22=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Sorry, I did miss that in the refresh. To respond to a few points
> before I send up a replacement for this patch:

No problem at all -- thanks!

> I expect this to be potentially used for whether you're *allowed* to
> set `RUST=3Dy` - for example, if a particular sanitizer is enabled, you
> may need to probe whether Rust+LLVM supports that sanitizer before
> allowing RUST to be set to y.

Yeah, makes sense if we do the dependency that way.

> I don't think so - I can't think of a case where we'd want to error on
> a warning from an empty crate (though that may be a failure of
> imagination.) Do you have an example of a warning we might trip that
> we'd want to make the build reject an option's availability?

IIRC back then I was thinking about something like the "unknown target
feature forwarded to backend" one, i.e. to identify whether a target
feature was supported or not. However, that is not a warning even
under `-Dwarning`s (https://github.com/rust-lang/rust/issues/91262)
unless something recently changed.

We can add it if/when we need it.

Cheers,
Miguel

