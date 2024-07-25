Return-Path: <linux-kbuild+bounces-2654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E24B93BF61
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 11:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EE7B1F21B35
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 09:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CDC13BC3D;
	Thu, 25 Jul 2024 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhzaWYcA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377713AA36;
	Thu, 25 Jul 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901241; cv=none; b=YHEI91GfcGbOaT++PKgrISm0aeDaeRIfJE/DJ/8ZHZPY2iPtZWt56Q/y0mXKIm8lavvblZV21GJU6h0E7z60+ORsB1N3fqczp3SgBR6znu08DS/aHA7Z6d06IxBrH9X9I6+NdKfPUDBsFBFDrSKwwok6+7G2JopHbAfjOBQNhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901241; c=relaxed/simple;
	bh=vSW6nap/LLM1u8M4rcd+ljLXNqWVV429u9e9s/OZH8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPV5VifI0ADEqfPPc1SM+FX31r2juyBmCvail3f7pOQQ7M21A1Dz8SyuEg8X8q3p1ZfgHYkpjWvJRyA+T2Emxn/gryLg+zaJbnCacziRMX3yHGr+sFEFQEnoH6n/I/jPd+14TN2WdJE5vIA1LZ40aEdtAzFzsIOZXIrHQYDHY2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhzaWYcA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d138e06e3so622219b3a.2;
        Thu, 25 Jul 2024 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721901239; x=1722506039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSW6nap/LLM1u8M4rcd+ljLXNqWVV429u9e9s/OZH8w=;
        b=hhzaWYcAEJn00jdJ8sdP4YdQL7NKXcJnEAbMWu7p3xB9QG6ZX7DKATEzfKcZalroYR
         E3r64DgvluL17LWwELCVQRHfoVcozSBZLFA1wuy4KsTH+uKqkHZaVEP1zhkuzcUD5UY/
         jvLIHABUBVCI/1KZWssqMgoq1WT3zKOzAT7NfBTAwXlS24PIbxIER7GATwMNE1dOPsGm
         ugkXJqHex16OXoYRyNzFbLg+gTTOM2BqO54mHM3Dq5Xe2kGJZtMFG6qFqEPWg/37zU5o
         Li3VJyZW1/tMxWPXWyW7qmd4lmlPata6t2WYsdTvuZr3wdLOZzXoxblVI6HgL2Tg0/zQ
         cXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721901239; x=1722506039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSW6nap/LLM1u8M4rcd+ljLXNqWVV429u9e9s/OZH8w=;
        b=BffFH9dEvOLE9lWh6fFknkzoArVcl5eJ74U9wFXN36SzdWmOcZDOwb2SF0ST8sfWhO
         xK5szZMZTuNP/YQXJh1iTvHJnAlGrnY02yqJX0R5fgskB8HHnV5+GSsBt+cMu5KqZZSW
         vT5GVDk9YaJ1vu117CRTpM17shz4yquOdJkdT3I+kKR7gIsmpa5WI+T5V9s+wtsYCNQk
         k9gaLB22PnTAnkApJoe9wculSzv1/AC02fNa7nOXbVsbxGkQjxCewkB2UnPponBuf9hc
         eAOzjfox3Jxfgdtd4crivoMcczSu6E1JG3yFLi2w4muDeZjv4b+d3roLEVFUI8rtq0oU
         HZRw==
X-Forwarded-Encrypted: i=1; AJvYcCVu2g5y4U4EnUx28+b/nd+N0+3yFQhnd1oxRDj+5QywBGDtik4p8mr9aBOmwY09KXrlN09mA6V6krbellNKPlurvc5UumvQT3zSipXuHaZYQto5sHtt6WZBVObj0+jGtpFqnbEN9tGwJ7weKAAHS2hUvmxANsrOZaW13NKhrZzLFOv6SQgPnST6hBI=
X-Gm-Message-State: AOJu0YynOE8QZIXfZiNlBR44DkZf046VzguqQreeofEoQLPRToZ5DZ1P
	zJOp+cZRW7bzVc/4Lqmlpm2gBUURvrGDSpbXAuqeOdyOwTVOodMRjzxJgkCTfnJYRs1K+o1SxsJ
	xNYqdsF0M5voRhT/4XcFj4QrLTK0=
X-Google-Smtp-Source: AGHT+IFbiQ1IXRG1NhZZZm4Tze6bWl7R6efpC801avvuhU8GxSoCB2LAvGFLfv5GxuroQt/KFwaKLZvWVx9chw7uKtY=
X-Received: by 2002:a05:6a00:1ac7:b0:705:97b3:4605 with SMTP id
 d2e1a72fcca58-70eae98fd23mr1499310b3a.25.1721901239298; Thu, 25 Jul 2024
 02:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724161501.1319115-1-ojeda@kernel.org> <20240725083836.GE13387@noisy.programming.kicks-ass.net>
In-Reply-To: <20240725083836.GE13387@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Jul 2024 11:53:47 +0200
Message-ID: <CANiq72nNost2vaCd9Ev5hraFRJvV7ae8aWS0O1q5KGWu1h8yjQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 10:38=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> W00t :-)
>
> Aside from a small niggle about maybe doing a helper function for those
> Rust runtime things, I don't see anything objectionable here.
>
> Thanks!

Thanks for taking a look that quick, Peter, I appreciate it.

Happy to move that to a helper.

Cheers,
Miguel

