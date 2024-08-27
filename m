Return-Path: <linux-kbuild+bounces-3244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042C960B1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09635284DE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 12:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13BA1BA875;
	Tue, 27 Aug 2024 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyzz/G8j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA11BC08A;
	Tue, 27 Aug 2024 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763164; cv=none; b=Rm0Zu+R7gb8TWW241z1SKDl3N0zNimc2gA77pHflExm6Pq7yCrx+tGa4AAozi5lBb/CJdiqRsnaA4XhOU0oYDJ+C/1pulej1XqL2XMA8KP7VDvLP1LcTmH2GrfCLdFNwlQnrL0c01wJ8o7u6tZiGhT+cta1rkveoRZM6IbY2V8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763164; c=relaxed/simple;
	bh=B3AHkdO/Ia9CdBwBWdFR002fMiLHyOtxvksi1uktpNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdk82WzRXpvoZIHcSffLEd5JjfRgTEY2UPmjFXrNsk5WuVSb3Ukur91APxpQqOTUHq7PnEd7IA0mupRpolUJMIcxaEgYo1QNT4ZsrEtCJzjftNtx8hN9xARSUlUgA1YFOOpWIwn2+h00aisPHFz1VeEbDgeuxzS0iOOEBgxH2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyzz/G8j; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d3d486d8bdso1042778a91.3;
        Tue, 27 Aug 2024 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724763162; x=1725367962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3AHkdO/Ia9CdBwBWdFR002fMiLHyOtxvksi1uktpNM=;
        b=Yyzz/G8j4RFS3hilq22uOVZawtAJyub+lvf9eFObFnoenUSi94VRjSxLj/uRhSE3s7
         UVEWY1uD8zilNg0c0vQb1/AJco785MdSyZlFya7U9H3oDitLghx7UinXE8jwqadCyAKd
         VkhEVr9Iv3zSSKExpwinlxbVfMOKtLMS1GOwCdmB3ECyi2KNJb/xyWQGqA0FBfK64+8/
         T+8KGADHZFNL2PfRoz9YZ/xmuY6C+7jr1kglLSP+rsdVoKOGfeoRrgU/fHnJpm7brIxj
         ULq1ps0xA6h+26vdcaZvPjPtEhfWaGexwJnYGiS6pph+5Q9EBWj2NSrWcToueu5T39XX
         nQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763162; x=1725367962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3AHkdO/Ia9CdBwBWdFR002fMiLHyOtxvksi1uktpNM=;
        b=V1IVu4uoZLy+7ii15US+LzADs3UYJe+buG0LstrBPZ2twh+JA08PKjJLryQAju/E3i
         pVy4SO/b4U2vTCAxFLQ6WhJ/s+8PmQnAmTLEFwzci+Y3gHH80AtHz0Mw1NJp+ky5XpdB
         0M8tU090Nji95M5ekA69SasUUS3lkuHFX5G/LKi2h8wUUudCx5mtSNtUrIth6k+pEeMm
         OHRUVUoSVidkWTcs+nuH9TK858prQRB19w3ouB5Jz2BGNOG49581WoM2OL2v4ZBJ7v0x
         xZ+xPIo6vSX7NYlAB+ERjsXmca3AuCdQJ5N3Uw5gE0S4mrCz+6LrO/U7oE+PepPaj67j
         so5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYaodPDuQkizKNLHL+2b/hIDbF6QgphCy2qihSXwlRpmSimqSx8FTa4RLYrw+uDOKdOn6X42HXuVrNwMOCQCY=@vger.kernel.org, AJvYcCVanfISMo8Fb/frYo+vtb2ei6IX1EJUsxFGL//ryENCHsB8KnieDDIC1vEGguOW6s4mGOM9wOOVzWsxODQ=@vger.kernel.org, AJvYcCW3PLxzUjvVxrUTC0z5Y0M22cQFd0ve8aXm6zt0qx95gTZkVX+8P7YMGlOwwC5tUdPKUlzL2AEI9zaZUlAA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oAMPcKYM418wG2A1LJ4GRGcYNIJvXpzFRq2tYITafKIsxVOq
	sWcHOLhDJAFcO3w5jT0+0aSaLAcSvylFgIkgu+hSuiCqc3XVVPEWT2b2XlGX6ZIM1RzdTf5hWPS
	wlvA0j/n+cPDvBiMEpXluGNTm8BY=
X-Google-Smtp-Source: AGHT+IGnXFPB4r0YHAF7u2MXfiFNWBarYhpBc5LV1Ghu+NYYxlihRc8ghsVVqb5JCXAz3jT1B40isS2w1vJZ50g9Bu0=
X-Received: by 2002:a17:90a:c002:b0:2c9:36d3:8934 with SMTP id
 98e67ed59e1d1-2d646b913d8mr9063982a91.1.1724763162503; Tue, 27 Aug 2024
 05:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com> <20240827125037.GC4772@willie-the-truck>
In-Reply-To: <20240827125037.GC4772@willie-the-truck>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Aug 2024 14:52:30 +0200
Message-ID: <CANiq72kAS9yYS1EJvmwL9LXk_k3nVQ=ShE=k6_Baa7vuBNgnqA@mail.gmail.com>
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
To: Will Deacon <will@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 2:50=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> For the arm64 parts:
>
> Acked-by: Will Deacon <will@kernel.org>
>
> In which tree do you plan to merge this?

If it goes in this cycle, and that is OK with you, then I think it
would be easiest to put it into Rust, since it depends on
`RUSTC_VERSION` which we will want to put there too since other things
will be placed on top too.

Thanks!

Cheers,
Miguel

