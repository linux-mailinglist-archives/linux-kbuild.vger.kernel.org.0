Return-Path: <linux-kbuild+bounces-3560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCD97985E
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 21:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD17283214
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 19:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F901C8FB1;
	Sun, 15 Sep 2024 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCPbIiO3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CFB38DC7;
	Sun, 15 Sep 2024 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726427759; cv=none; b=gPBoH19t8PCq/d6WCt47hEEpLP/VAPiKwK/CNgtm/4StFzuBEUP8aBdcsTuUAL7O0Qyeo2GX9IatNA0rx6GFFywZh1CuGkIOwU4rsUcMpGwBUVm1rHAukoyleDpCjLkKIcoIAUbKg7/XFvngIwRa8Ivp3QmNWjewak5wqo89niQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726427759; c=relaxed/simple;
	bh=lNRBqTKCLNDFBOpyROD/tyxwIsQ0nHuHbMhbWiuk2+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRHh+BNw7+RXsICuW3xYtQiYF4nb4wg5SZsFNgpmlJ5E7+Qv+GPEVosn8FmPexnt2U9jfuygW5z/zy4de74DULhGfyNO86Oy4TsJKuAkaE1CAytyumO3fBzpmTafRIQRMGrX1axIS78keBC958x1PAMXyb65khNYU0Y6FA92Hoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCPbIiO3; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d50ac2e3f8so578586a12.2;
        Sun, 15 Sep 2024 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726427757; x=1727032557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNRBqTKCLNDFBOpyROD/tyxwIsQ0nHuHbMhbWiuk2+A=;
        b=LCPbIiO3bk0OgaosmQqKm+7kItOkXIjKZsVSBxYicPDPOOLAXeI8XAJT1LLEn4HfAB
         C5ApBhu7g+xqoMm10vtgRZkyb7QVzYMGad+ew4WT4zKrieyc7t4nSSA+pl5+2UQbjKcL
         woJWfl8tteJKCGI5J6G17BJO5Pib23rJS1LsA/G3ydMP2MP9Ns39LLgjijvIJSqQvRSI
         JP4rQTAJ0lyWrudq7DYEUP8yY+iY6C0DSRSOTY1x7ueuDhQRPaENu2d6+N18cyRPxWrg
         ravk50bqLVaeSul9JqL3OgLVVrwZugt8O1Ch4F3goINULIeKBnPfXLwLy/73eDP6za/j
         mAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427757; x=1727032557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNRBqTKCLNDFBOpyROD/tyxwIsQ0nHuHbMhbWiuk2+A=;
        b=fY5JSLlAiCeUHoWC+UDINp32X0P7BoCs09WGOE8IJLm8O6I6EdI/lYlQ1r9zD4Y6aC
         YilfvKgFddTEkkz1yzRZEhMn4NVoMCgRSI3eZTYrhBkOdoZAnVKUyp4TpI3IXZa+cKZ4
         +O966+iElO+PagImro6shMzw3thtJsRfdE0epOhxjDzX+cdNn0GxUQ5CYB37EfghSrns
         y23UpQe3mIRuXpgbhVlKU1h39gjtL62sVoYXIb2NF6TTPG1AjIap2Go6JoCsJWbH24vP
         UvTxAIXt4u+6ks+ubErxTqvbFD3b2fO/vyVTCW/t1RPFLRP1pwgrAMrbhMuAwPTpEztZ
         86JA==
X-Forwarded-Encrypted: i=1; AJvYcCWWn+J4ocIFlMJ4hFk2rY9LVswjPCjluKv1iN8h1hRNgnbPTAcZrveJ6/99JNASU5Fm9PfwBb/HEBD45TdDri4=@vger.kernel.org, AJvYcCX0reMrMG7ajvWJDiwBO3/S4aUmPo0w7LYH3LvMsd2wvn2h0B8eJNPl1UH8OW/1Rv25cALMo0aOABDf39vm@vger.kernel.org, AJvYcCXgi8iQu4EmnsNBrO/NwKecPAf1j5z0mvb0BHOIMtcKIxdrrDe+s4IpQ+LM7ZecquoC2wa2j3w6ydPg4LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUJay6aW3E1h6Q/BWIr4T1c4aQtc7fht8I+VtxpTNG4wSLdFJ
	k0XmC7oVYiRXqc+XlToUK8fiRxs93rUJGGYsQ9ps1bWq/loTLD27+E21ESnulLqEqDDejRCWCbE
	61G6do2xenLHktF7Gchj76VE1YsQ=
X-Google-Smtp-Source: AGHT+IEZEaOGvWfSQ1PMkaaBAWgoGIZZWM1FWt0ex2FWLRyvw9E6qDkHeoNUZf9rNRieQOensoOlHkvZ8E1ihKB6Umk=
X-Received: by 2002:a17:902:ecc1:b0:206:a027:8aa3 with SMTP id
 d9443c01a7336-2076d6141a0mr84892845ad.0.1726427756913; Sun, 15 Sep 2024
 12:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud> <20240914173037.422902b9.gary@garyguo.net>
 <20240914-jitters-barber-a0e51e7b83a8@spud> <20240914-romp-clothing-965a16cb4dd4@spud>
In-Reply-To: <20240914-romp-clothing-965a16cb4dd4@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Sep 2024 21:15:44 +0200
Message-ID: <CANiq72mb7UVbeH9R3t3s7U3tuJHT86FFdsEB=v_x1KKJV9uvgQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Conor Dooley <conor@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 12:15=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> Turned it off, only to find out my board farm is non-functional! Looks
> fine in QEMU however :)

Thanks for checking that -- I have kept the patch in `rust-next`
applied since it is unrelated.

Cheers,
Miguel

