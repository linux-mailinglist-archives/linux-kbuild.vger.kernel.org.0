Return-Path: <linux-kbuild+bounces-2730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EA93FA50
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 18:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917701F2328B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 16:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE2715A86D;
	Mon, 29 Jul 2024 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/5E8Wrv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341A15B542;
	Mon, 29 Jul 2024 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269456; cv=none; b=brYVzJO5CSx4+v5lJJY98FHFPbruWOa86COgQvL3n+yo6nssa0YatX3yyYFLZZywNh9ML7uyFAT185EwSn0QtGtezPONAdPrEVlmU3kpvsYZGdhA7DtDNqQFfqrmbYfTLeYq05pW5+VGA/llJQ6Glf/CY7MRRpGiunauH5ANluY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269456; c=relaxed/simple;
	bh=evh56p4nYdqL/AI7hhDGgJ0YUxt5zC+SM06u/yx8Apw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Av28rh7g96R6MDm0J9CcG/+AuiFDfj0mic9Ss6kcGp4FFW79x5FVKBjqNch84JkSkg1zcLjgBhXAUf8D7RpbkchA8kxXBKINh91oyO21G/ECHft2ueFeU1+SHGWNoKi/6X95Pv8VAqr2lxY4QtaxsRUDYnuMUgHeXfkd2Z5uKH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/5E8Wrv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2b27c115so2720564b3a.2;
        Mon, 29 Jul 2024 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722269454; x=1722874254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evh56p4nYdqL/AI7hhDGgJ0YUxt5zC+SM06u/yx8Apw=;
        b=g/5E8WrvHqTkorHT185cxO8fELljvdXCfx7oJ+M9zykjLqndoiQe6Su/4CotNSfjRk
         tfV+qM+02N8NJAyC2uvGAcuU3D5ey5cuLFkk+eNctCkLuUC7XzFd0s6waNw15QWjNMXz
         uHiyf+UNqvYRUDiWjspbJF0AMgLNThTgpGZpan4nizsQz9NEZckZJQUeo67IhDSA5SCP
         sGqgWFGqxaQNNyGfua2X/f+Uk4SCjSePg8GeZWVVos48EwLTT9wCfWD/x7eZW+vwNTx/
         4BnBXQS9IXpOY7b6KeILqbbDb35kllWdA9OrLL6wj9e4n95KE8cz4fK4MEXI24bCeY0h
         90Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722269454; x=1722874254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evh56p4nYdqL/AI7hhDGgJ0YUxt5zC+SM06u/yx8Apw=;
        b=ZNz+hQk2SFB3woeik5EWnhteIQC8TDY/OGfGYWqxhS60FdAksg0RVHIsRL2N2JsrSg
         PKDn7xNSplwE99aFX3wRKOZ8UlKqGD9lUVOGDQF21TAK2K7OwRQouBNk6dN9fz4kCI2t
         VAP2j7pR97WEYNVbruEMFguLEtKqvG0LjmMEQeeuG+7nE39uYY9owLCLNWdPfte7WoTh
         PZodutKLqiOxYdYYHa+XwJZsAVmd59RwjvDeJoCBMHZKazI+zQZFRT/e8kemNTqEzSZD
         2cgOxCrgUgPsYh9OW1UUYoxG8HDIE/QU4ucYBkNbRyvlvAQEG9/fGu030gpvBvVpvciF
         lzRw==
X-Forwarded-Encrypted: i=1; AJvYcCX+FtLW7JNfrOtCJJ8X8Cn4mICjiTajDosMaARTYMSfWOf26lVlNizIuoNqs3JQA64eJTyVsQe/8m/2bEy7oNKvqyo02peECxMks3odBMciKcyFw856+o4OsqylMCUGlxoJX3rlnHg5YCiVQ+XCUIjs5FIF3VN1ohRMmsNh/5xACBEaN7idRyZFnaY=
X-Gm-Message-State: AOJu0YzxfROS5U9IdJG74B+MZVC+wSa3NWMCopyXR0tUgxJD8QpFwcf/
	4A5RzWqk/W5yUpiNhJ31DLE8QMYYX97pmdA7wXVcAxQDBxcVmaGp7/4fV7wHyVysRp6GlfB7fLn
	Yi7sNSSRggnp7Zvubz9M6bX2WBqQ=
X-Google-Smtp-Source: AGHT+IFTFZC1SKQNtMILrQkEM+cJy0MnKYRxraDUVdWIJEcCbZZ7AgaLYgNr97bDuau6cvc5vE+fIio6dXWksbC4D/k=
X-Received: by 2002:a17:90a:8a08:b0:2c9:758b:a278 with SMTP id
 98e67ed59e1d1-2cf7e736ee0mr9134564a91.35.1722269453983; Mon, 29 Jul 2024
 09:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com> <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com>
In-Reply-To: <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jul 2024 18:10:41 +0200
Message-ID: <CANiq72nhd3pUc3aEXVdt5yeof7FS6Nny=OnJx3_JBcCsbxTrvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> To use the shadow call stack sanitizer, you must pass special flags:

Just in case, if arm64 is picking patch #1 as a fix, please do not
pick this one -- it requires another series as mentioned in the cover
letter. We can do this one via `rust-next` if that is easier.

Thanks!

Cheers,
Miguel

