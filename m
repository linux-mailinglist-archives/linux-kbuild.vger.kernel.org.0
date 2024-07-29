Return-Path: <linux-kbuild+bounces-2729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4293FA46
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 18:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C807D1C223D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 16:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EB913BC3F;
	Mon, 29 Jul 2024 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9Bqekoj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C095548F7;
	Mon, 29 Jul 2024 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269270; cv=none; b=dEmQUrx9iG+ju5nxn0u68PqbFSrDlbX95mpHtkgI3b/W4DxD1/bvsL/pl2UKniyPUKQfRsweN6EDScz1VySitUQI2l1ff19DITkorCr69/xLaJtmpdDCe2FJjVTral8a26Grmn4E+4OjudkpV354OUWLr2d9HNiYwhOJxrT1PXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269270; c=relaxed/simple;
	bh=/peOgFMNDrOsEcB5kri/ubhTQSgJS6cO339oucwBi8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbkC7zN76oFGBkXSaGShQvCLY6kJjN7EPk9Q1Ibwxskdu/KBhB8A59oWX0xbsRDibxIkzet8rhwpVRdQYcuSvNTyH6S/tJoJd6LHunxNR4m8uFojnHh9YWIrW4tkzgLHtJIsQoP5C4+ueIHO6F5FWbRlKNsShbLEGFghaCc0aIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9Bqekoj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ab09739287so1938675a12.3;
        Mon, 29 Jul 2024 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722269268; x=1722874068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/peOgFMNDrOsEcB5kri/ubhTQSgJS6cO339oucwBi8c=;
        b=M9BqekojoMgNKPQOOfMcFlMhE6rfPHrC5flvynXXTPEjaA8joKu9Q/9pY/xk7rkZIe
         kRtJIX+ef75DgOs6wFUHA+Px9jMgF5AuywPoLOqf8j4/hxBMaNDBwJW48c1nYbbaCrDr
         33i+AADwri0xITZRrGyFj0SE81+PmiqKhsepjYH36iCoAk8EyetuorQAIY49vYtxWtiD
         bqa1jVHN4bz72Zy0WLOlOTIIfH3t4IyUD4yzMSgOkcXoDIfNbj7lDQVwEgWB+oqzIUy1
         VtVG2oGQrJMVtvl1KwZj0Qea0OV0S+YgVal0kWuW5XQnrwzr1ci2ld8K5Y2ew7UNP7M4
         Hb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722269268; x=1722874068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/peOgFMNDrOsEcB5kri/ubhTQSgJS6cO339oucwBi8c=;
        b=RWZSAly8WAX7ENiqHzUXxW0EWTHhjU4wUW2bXd4SAHk4pt0OvfCDjYKl1ePW9ECpna
         2R/e7T9MYub8Bli31qa7PmOsjAmjxT++JpwPUj2Q1W7sFqspKSj+CBUATEnNRKg3qckD
         Bjs1o1+i+AeDlC+pGsALzlA0G3EdfttylfmspofUEv/jPb4p77q+bXUopSJuIKhtizsO
         nvbo4akAioLEY9kCJwskw+T5GkIIJoTBgmu9XQ9ImzoavMgUcT8zwdcpbeGGbaEXUwCn
         Teobv7I9ym02sY/AeLnW4MJDV1bzoCAFuxNt4CuLbQ28/nilTg6242Km72h3xMKDX0Vr
         dirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqvGFZ9ic5ayNWJ+14YJMGrqif7+f/JLIG6nYUlybFtsDkdIc+24h0AmVtryQdI7vv/8kgCkfnKuGsKQpTmsCcvH/00khLGEJLmHv5Hc6V1lF6Il8Vi9T5+zfSIxUc6YnrDAc++U8jHmbNo5K8TAWIaiPHrTwRo+/PoTeiIQVkjtepi1QdOnZ1bKrzpg+5FC4V7e2PrCJqo+uKUOwOI3au8G8=
X-Gm-Message-State: AOJu0YzpShwf1TK1P89zP2z/YG3pYXXOgBGwfIQG02i9v8n/HNIn/C/s
	3OyrCAet9clY+jeGHtOO5UXF5sZIA8xWuj7sFWywuRwUKH0YkeyJz1FXMLBvehukfKCIlcW/klg
	l5XD2r/xhMVko1YFld+l7zLbIn7A=
X-Google-Smtp-Source: AGHT+IFlW1QjO3th0YkP2kayJuie7hqi1/zzKad+oYCBoRrbunRTnfhrR+JaGmp0TqU+R0wCMVkQRgg6N3rbV6ECPPU=
X-Received: by 2002:a17:90a:6581:b0:2ca:8684:401a with SMTP id
 98e67ed59e1d1-2cf7e5f27a9mr6085451a91.32.1722269268502; Mon, 29 Jul 2024
 09:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com> <20240729-shadow-call-stack-v4-1-2a664b082ea4@google.com>
In-Reply-To: <20240729-shadow-call-stack-v4-1-2a664b082ea4@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jul 2024 18:07:36 +0200
Message-ID: <CANiq72m4Bv+o8kXmgRJcnsLYVOA7t7NWEQ1H-Sip9MXGEh-wbQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: SHADOW_CALL_STACK is incompatible with Rust
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
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When using the shadow call stack sanitizer, all code must be compiled
> with the -ffixed-x18 flag, but this flag is not currently being passed
> to Rust. This results in crashes that are extremely difficult to debug.
>
> To ensure that nobody else has to go through the same debugging session
> that I had to, prevent configurations that enable both SHADOW_CALL_STACK
> and RUST.
>
> It is rather common for people to backport 724a75ac9542 ("arm64: rust:
> Enable Rust support for AArch64"), so I recommend applying this fix all
> the way back to 6.1.

It should not hurt, and it is useful out-of-tree just in case -- if
arm64 is picking it up (which would be ideal):

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, please let us know. Thanks!

Cheers,
Miguel

