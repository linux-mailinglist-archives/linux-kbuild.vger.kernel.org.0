Return-Path: <linux-kbuild+bounces-2749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336594155E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 17:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F051C223A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 15:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46E91A38E5;
	Tue, 30 Jul 2024 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNr9Bg/9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4531A38C2
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352794; cv=none; b=P8F5uWGlN6gobke4nhVcZOn/uyg1rNhdLAAaOM1Qu09w+l+nePk3anN+u6jF22/5GnYXHUiDuXx2C6q7uyTKd2LPHT2T8zzkJQ+ZHgWJ2D6KdgKM2lsZgRoX5SHd1VA5hjo1pmeugJr0OiqC2ug0EGkwxQlK++iGczRiKCWGwww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352794; c=relaxed/simple;
	bh=2B8WwI7Cb180r9Sb7Hq5sHlqUuB8r+N3bxW/DWxf/vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOoXouEOsnEEz+JQsdODUSE0KmU+lkGZNVXH0b0ChIc0yffos7+VvS27z9sJwTdpYFWDu8CSd7aQAWenXzO6aEouZ1NRdU1WBaC954GlbEE6YPEDFb9UTWGhuncQJ779eRizXrLiQGpGpsDnbvZUzKTEK3kV2Vn1ocPKdJ/ZeFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNr9Bg/9; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-825dc62725cso1470695241.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722352792; x=1722957592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B8WwI7Cb180r9Sb7Hq5sHlqUuB8r+N3bxW/DWxf/vU=;
        b=KNr9Bg/9rl79pMS1k1B2JDeNc86fwCxIVYV5+xVYkTVsYmZzaha6SIFRmPeUYGxgyi
         N6h7r5UAd7zW7JMG2oi9PH5xjGAjuvhAuk7VDB5IcvxriDzAPU/Vu/P/k5wdPnhX5o4f
         E6lXshJm8xUslzpUVBr1ZIIjRNV9ysMyqW5uS5JfUtdhk6Qq226VIqnE5LBnE9Xs4CsY
         lq+MGp0OW3L1xnqAlA0B273Y57RoRCT1ukyjFEk9KOaNU2AQCR1cx3Ma0sgoES/XCEb4
         l5YRVd95KrIa2NvrqFXgqBBln1VIONnXAUssxkdHHGxN0y+rDWZf5OP+/s6/2wUSdn5l
         KGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722352792; x=1722957592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B8WwI7Cb180r9Sb7Hq5sHlqUuB8r+N3bxW/DWxf/vU=;
        b=ZBOwM0CqPqpDhEdMtmIbijMD8vV3F7b51fZNWF2QRbStvwEUGoPHtDUO+QBhfVJOZR
         JmeCFZ0pKuhxacpZMVpo6LIGyY+iTip/WdRuXC4tloOW8sqMPMZxE8xzTE7aeuz2vQZ6
         AH4XqfRjgGZaHSgFHfLZjEsA5hWT+HKdTZlc2huCgw5QJARyq7rtT0L0I6lhTWo/A91x
         xHSiOuxqShGaW2ogV+4pLUV5PrKXqDGlyUexXj/+T5TNHWoH8IELNpPM+wjk7g1CL5YK
         42lNrOBHTLT/pVsR3xyX4BJw7V/29iDGW+GcuzNycuGu+K41GrnO8bZ/cxi3Db6mQUdX
         J9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZY1fOl2a/B3EdZsa8JC2ORCTxE18ELLjdbgRP49QViqLdF9IeRwQUu9dOyNxl9nB/B9np2UEelvQ+LaMC7h4vuoCE/0jKg0lIvl6b
X-Gm-Message-State: AOJu0Yw43zfSN+/BZPjp5R6qxWUEy2nQZWjhu00CwTPeHepQq+VjnXio
	+GQomUjDRxp/HJuqPwT0HWl9B/zLjNjicQlGUWlU6NiTrPh2syPHRZXINkdMXhL+oTQU60Tr0yp
	lud1/EmUW8/dU2nyD3N4vIEl4sRKpsne6GJ2j
X-Google-Smtp-Source: AGHT+IFYWl0B6ozqGp9/4MappOQC0WeCJttsu9HV93WtvH7H37A+U1SNe41tpi9Z7+Ch7vETcUsz4gucQAkyakUjzhY=
X-Received: by 2002:a05:6122:1828:b0:4f5:27ac:ce6e with SMTP id
 71dfb90a1353d-4f6e68ef18bmr12317085e0c.7.1722352791754; Tue, 30 Jul 2024
 08:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240730102856.GJ33588@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 30 Jul 2024 08:19:13 -0700
Message-ID: <CABCJKuc8ue1y7WBPo3YRRoDeGUFpRon4at=Wa1rQjrXzOGpt9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:29=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Jul 30, 2024 at 09:40:11AM +0000, Alice Ryhl wrote:
> > Introduce a Kconfig option for enabling the experimental option to
> > normalize integer types. This ensures that integer types of the same
> > size and signedness are considered compatible by the Control Flow
> > Integrity sanitizer.
> >
> > This option exists for compatibility with Rust, as C and Rust do not
> > have the same set of integer types. There are cases where C has two
> > different integer types of the same size and alignment, but Rust only
> > has one integer type of that size and alignment. When Rust calls into
> > C functions using such types in their signature, this results in CFI
> > failures.
> >
> > This patch introduces a dedicated option for this because it is
> > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
>
> To be clear, any code compiled with this is incompatible with code
> compiled without this, as the function signatures will differ, right?
>
> Specifically, it will map things like 'unsigned long long' and 'unsigned
> long' -- which are both u64 on LP64 targets to the same 'type', right?
>
> I suppose it has been decided the security impact of this change is
> minimal?

I looked into this last year, and integer normalization reduced the
number of unique type hashes in the kernel by ~1%, which should be
fine.

Sami

