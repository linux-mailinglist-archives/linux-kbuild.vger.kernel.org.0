Return-Path: <linux-kbuild+bounces-4057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B998699A303
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 13:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FEF3285223
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 11:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F84216449;
	Fri, 11 Oct 2024 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHJIdOCB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F33216432;
	Fri, 11 Oct 2024 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647642; cv=none; b=aXSlI4qNvJ1FZmMPzuGVmnbu/wmN1RlTjcF2C0ivIfr/idnNfOXtC1Irn0hKQ2hvVn+utrplZx25xi5MqeY9s1paFsfqaBTau6nJECU4/QRZyoaZvVA5IWm9BOCNyUAOZ4FNSMLw5iiHHVkdcYvZikHiZ7iN8KH8sEXiZAPleB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647642; c=relaxed/simple;
	bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4iCeQDtgNNEt3l4WXWoh8tX0YTe7CgLeJJ4NrP5A4erSBMEjXGbSuDy4CA5xlbcfdAJAXzdpB7Tf0e56V/n+cFnUYXW88lDgz/W8y/PcTkKeLQyYxCOwmxeKhy2XwMQTMk00OGAXi5mx+OKO19ZxgEN6jPXLO33nVpHvvazIGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHJIdOCB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db61fd92a1so62048a12.3;
        Fri, 11 Oct 2024 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728647640; x=1729252440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
        b=PHJIdOCBr95CE7lk3Gdz80EyK45UTRuTVAzaMqW/Si5Uhi0SsRk4k//ejCoqbRrDv3
         7Ra8fsOj044MQInttQ4nr0PPzy2rwebqDZE06zZTFr90tEhIE3kLFKc7kA/kCaom/DiE
         NiAe4FZW8tDNSARUmXyC4kp9O17oiZTlVqLdXUVxjCfSWOKLhk1rv0nBHbEDwntrzRtV
         UBLpSfdu1EqSwCIJf9gArcA/eKqdWJHzRHuEUDXdQRbGr7oPbli3nLB+fhFzM0FGFBqc
         MZxzcgY9PL7xlQ10Xb1QaXcrJy1uFmy9hpE7HLqL9jSeozI/d5FSUNTLB4dzziIh6bHb
         tsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647640; x=1729252440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPK6c2GAoBBXdan9Km9M5WuJLVPVEFl8rnDe//urjWY=;
        b=XF8d2cZEi1oM/uQrOVl/7pSeFXgSBLQvEzcu6RChpufWglStBbj/9qTpF7PPppMy5W
         znXc6t74e0WyKaLGaOUvafX+D0zDVAx3F8vhxg7aURgLOcIh86NapeDhRdqRVPKJ469S
         QHzr+wj5KafQe5DUhsDK4GmmfHzBnen3jAtsCR7ZLMgkY8cOG89FVWisCFXx//K433sd
         QgLjt7KyiE2augptk5vy4fVMNFeIn/f5YE9I3g5tnsU8l4SjlsT7QjRwgTJ9XTYeawQo
         AIzZu9GIhF6QykBDNFhtXmWY9fQSPRQOlHAo3lLz/p1MD6Tz43D5SZIqyhrjD5F9Pt+O
         Xl5A==
X-Forwarded-Encrypted: i=1; AJvYcCU1QZ43q2iuOXRj1SJAI8lQU1OwIA78qw7K/fyGtpzqdtsE5N5Ne+kwP/Tvj5qGByS9uU4h7kNSOJlaDMV+gFQ=@vger.kernel.org, AJvYcCVqVNF7Wsx8Ai1+S+a65AjyFHlrZVJ0JPhj1d7ZqEyoas+tUgyjiLBR3s/lhU+JBsft4vMVFNDlXPyZWwdR@vger.kernel.org, AJvYcCWmM5Td1qAyHXHIWx9+VxoToVuXpzZauyhGcG3rR9Vp37l4irysrn15lkMwdzUgIvFkeELMiF+MuhpU7mE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/YXeWvNc6CecvP7U4Zty0I4JclkIEmBt2TD3zQ2NUrEDizBZ
	yNX/fQD/eDgUzNgjBTrWPCRkt2XEAHZmyBM2HVU+FnybD//0uYJiHQX21EVmLmt2d16Ov6fXhdt
	9GxQkJp/CIz20xhZ7p8CiN5LHpUc=
X-Google-Smtp-Source: AGHT+IG6mdYSQEBCdNPomgnZ5qhOSdJ27W22RJLc7pOXm6QMfyY2DvNJ+8gPgure2Y2WOI5rcCP9gbXFeGoIxKRb3d4=
X-Received: by 2002:a05:6a00:2d09:b0:717:8b4e:98ad with SMTP id
 d2e1a72fcca58-71e37c4fccamr1660879b3a.0.1728647639851; Fri, 11 Oct 2024
 04:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net>
In-Reply-To: <20241011114040.3900487-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 13:53:47 +0200
Message-ID: <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Gary Guo <gary@garyguo.net>
Cc: masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include for consistency with cc-version.

Yeah, I am ambivalent. Dropping them would minimize changes and avoid
introducing something only used once, which would be nice too. Happy
either way.

> +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); then

Similarly, I wonder if we should use '^LLVM version: ' here or similar
to minimize the chances the "LLVM" string appears elsewhere in the
future (perhaps in a custom string a vendor adds, though I would
expect them to add it lowercase). We are relying on having a $3 when
splitting anyway.

Depending on what Masahiro prefers, I will take this one or the
one-invocation-only one.

Thanks Gary!

Cheers,
Miguel

