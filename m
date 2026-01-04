Return-Path: <linux-kbuild+bounces-10413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271DCF14C1
	for <lists+linux-kbuild@lfdr.de>; Sun, 04 Jan 2026 21:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2583009F80
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jan 2026 20:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17532E8E07;
	Sun,  4 Jan 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn5YfUlS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A492C2364
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Jan 2026 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767560020; cv=none; b=nr9rD36P41YXOYlqrh1TocRfU/YMQv3j2GKTR1f1smasX19pnj7w0doMZ/LhutvRN4UmAco9CLivqLm9lu+2GRlBks1lPK29wV85csfre4uMCWoLDHxyiZ2nRESqqo+LLqMbABE3rmieckIhFNadGuPh3C30fLOcGqOdpoOBtCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767560020; c=relaxed/simple;
	bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHB1ufjH4CB+sAd5TwM9QhKpSwuKcajNCywVjRRFitNGXVcE00MfNFDF+Gk0pOFhu7HjBFEjmuqGiuD2E6bxXBtGnDZfKe5Oqeqok/l0o6fctgWD/HPEyXoT20euLY8tOsch6zioOtSqWWNj/cEfil58fNXWTKFtl+vz+KPi2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn5YfUlS; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c1e0e7f21dfso278134a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jan 2026 12:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767560018; x=1768164818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=Gn5YfUlSE/MZYy058WhEIaVWq7NaQKUZD8l3Aux6Pl0aC6r9507k50CKLswafbHRpN
         tKzmyO0F9R6LHvkZMPSXPupYBsOmydl0bDSAzZqktg3da3wVzExGlc+TVtilZwPKHgpM
         V1dQvqFgOpaYwXFkbQ5yTX3RvKxOMwblQghyYFqT+krfjRa5GGYc05WrHvkssxgpoC0q
         u/0kTjfXGXdcOg5LiS5GlXrLldJa3sS9of6oy19Bkw1CkROhS+PKzzVtLzJx0qOTpc9Z
         GU+WDfyyN+Tkr7Ui+5LmyVH0DkMSii0bN8LFAt6ZsnYSlTZG/Dc4D+uP/0Ec2fmahWfV
         Lm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767560018; x=1768164818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=XEKdKo7SWetUFdx3IQkjzsgC0lNcLiMKt92dXotXLr4dHsLE2EXGFuXffGlHCMOPJV
         WvVgpTGWxxrX5H7V7P8oNWgeEY1+sMU0b4NqpWfXCzvh3htxKUCL3iOytfhpOh0GWq2S
         VY3CIA+AY0YA6Ki9+YqTf12SRkFottLqICBcOQlRVrd2w6QLH26SfZQWJwtpPKglsir8
         IXH1Do3K/2KONgUFqRJksGic1OwUj5HqCDlqRakoXMQ5gcOYN4BT41ICDY5gw3YoH1pv
         +yCzk3W3hmgNmB4LBLzsolVweTzPvdwhbaIctYb72DyiGdetcYlyY8b9PJ3zGl7LAKtF
         j30w==
X-Forwarded-Encrypted: i=1; AJvYcCWPboWmGxnbyRa7fyPqXtDQvlEbKSM8vznzfcKmaSdfKRxO5OiNbOxzHiLJ+aM6mowHV2WpkBVL5JDvrtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCsi5Vg3+0fVMulazKtrjUtH3x5CIzKqZFBSDPb+TLTFGFDApN
	S+IwJtNf84uskaPwO92PLIxC3xLF+4/q8bLR62lHaeJUwfTuStgk9O3z9j6XqtTLZDDZ0r6wYIQ
	nBkvc4SZ7d5RyqKA52Koz64vlWM/SWjE=
X-Gm-Gg: AY/fxX6VAI2IJtZRZLkExQDSp/o03azp4sqYb2yUkDlr2MI5hhkmSvivJOkb4oK2phJ
	Gz2G0TZ3xXvVaDqkeMTi9OMBz51hctugakLsy/fg7YmArSpzl7Qr7HmqIC73ewiIr5J6ZDdXYYI
	C0Azd7T5dPRjeb7+crdu1et2Jzv40YIMSnsVWWtq6J2xRu9Rn6KtKYuXtbfyKAfS2FJWadY4TQ5
	X8kstW3XS+OieEBFPAHSTxjADAJxrQxz8FdrnPnBZNgBlAYBedggHY2vd+BvFRX9UgmlnR+62Fo
	Nj32iJz1dfPrAzsuivwGITf4OnBOiQ3pxjGmXcHzzpCystNDiP1wz/JFY1WJi/uR/KPak9tgRvw
	xDYezoqGAwP2j
X-Google-Smtp-Source: AGHT+IEY5WU8qdT2x4W9RhyaoUAIxe/Revt/XcUhrg0fBmvqp9LK2uRUv+DpO1/rHFugYJh7v9P+cWIgLbf4IU/ffNQ=
X-Received: by 2002:a05:7300:e9ce:20b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b05ec6b143mr17044785eec.7.1767560018452; Sun, 04 Jan 2026
 12:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217150010.665153-1-siddhesh@gotplt.org> <20251217224050.1186896-1-siddhesh@gotplt.org>
In-Reply-To: <20251217224050.1186896-1-siddhesh@gotplt.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 21:53:25 +0100
X-Gm-Features: AQt7F2qb1EDeyLmlG9hUTUI1fBPD9sLv7nfHHvfBJvOJxdTKvQkzrqD3Rmnu53k
Message-ID: <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
To: Siddhesh Poyarekar <siddhesh@gotplt.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, stable@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:41=E2=80=AFPM Siddhesh Poyarekar <siddhesh@gotpl=
t.org> wrote:
>
> but clang does not have this option, so avoid passing it to bindgen.

This looks indeed correct, although it is not yet in a released GCC
(testing quickly in Compiler Explorer, GCC 15.2 doesn't have it, but
GCC trunk has).

I will apply it -- Cc'ing ClangBuiltLinux and Kbuild so that they are aware=
.

Thanks!

Cheers,
Miguel

