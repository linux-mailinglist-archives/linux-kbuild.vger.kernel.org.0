Return-Path: <linux-kbuild+bounces-8392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1606B224F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 12:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00EFB1B64D86
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 10:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512ED2EB5C3;
	Tue, 12 Aug 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHk6JMo5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D2265284;
	Tue, 12 Aug 2025 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995858; cv=none; b=A6wqHdGLiN1u8yeNBuawhiy7PuArq7GIQAArb9utoLhbeOucBa8dySnALgBF8CEpD2YvWSeui35KoSu6FmwqEdmqnlm0xwyh3Gjzz0TcdzhEEEf00M3OuQg2AI7LROo8TbVrQ9X6dgmaU4cYFIsSFyhhWTjc/UAUWx9zJDUkusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995858; c=relaxed/simple;
	bh=PgjLJToPUsIAh8kaJnnDeCaEPa/nPbMiXacaiKJxH5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ar+rpEoO1CUkiEyFk2O/PpbwukLBtWo8HdfYbcI7b6GxJpFBgr/RyFsQV2fVpzQjpkVnx3i0pauzK/WC7eVn0DwbCN31eO6N5PJjSWVRkBrxTBQd7lFGO5GAgdMqaW48dJx2xtlThUwQOJFljJvw8WlYZACkMXHgAXCdl8i7d1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHk6JMo5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24050da1b9eso4548725ad.3;
        Tue, 12 Aug 2025 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754995856; x=1755600656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgjLJToPUsIAh8kaJnnDeCaEPa/nPbMiXacaiKJxH5c=;
        b=PHk6JMo5e0klSPEKQBrCNCjz1VrKuQUBdA/tC9n3bGN3yaT+O7u1PBz+/3bJIZEvSQ
         QyVIthHTgQXw0ohFYe2DE/58043kWg8d6ZYQYVfOJY46P4rJPeOyMfn3vMqj6fLJ63a7
         HL0EycYEqRGUQcSxZj6M5DGLW5avwSGpzb3G1rw9vY2JcplriQxDNPw6kv3igfKmUBWk
         Kfws0na0gHHIBnIyzNpvFr2vPM+vaDc03Xp72WYcah4YP73InJSQQHX75qEE7sPRQcyy
         JISPS1UMYLJymUVK7ZC3TeMypAISyHbwQWiyZEb34ysW4xFmsQascmU2Rayev8lyN3sJ
         cP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995856; x=1755600656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgjLJToPUsIAh8kaJnnDeCaEPa/nPbMiXacaiKJxH5c=;
        b=fDOWX/LIgdR2Y7/GAmDO9YX/BlUN0qAPNYP4x/u1/yyxcB7/j6apDT1FyJmK/xVDKV
         Si7GnLUbhfRSY+mhjx54F6UFkd+Vho+xkgpyhEKDPnNBXe7b6WzCqJOeeRgsEtaZlsZp
         fYYX0N3cMgtf/MXarFKHSx6XEbIpVXOYPvxubX6eipEGKx+ygW1A6Y5xqjfyMkKn7FHn
         3O+4f7xxvJuOcRAiA802SKU3+XOCP06vHylLDX67LWPA1L4KSUqJuOLiqj+kVCbUKUTG
         OAeyLI3HdUrpYhNsqTUsxqbqfzbMZPnFhCTa8pB2NLcuOhdoKjI6oqd8twGccRGvnIVA
         sYMg==
X-Forwarded-Encrypted: i=1; AJvYcCU0l7mSsDruJrAYkxHIrdtgh5ehZt+fudS0vbwJzzv8tkltvfvGTTs2CSIu1A7FIXIx4WON92cRqysPSXpq@vger.kernel.org, AJvYcCWCeIBu78IaG3SCH5sSkiL0cwRUU/4cCsBxznToAYYASmXCtJ/oh1YxmUHva0HFaANfJWrDVAROkKc2dMQjYcg=@vger.kernel.org, AJvYcCWYXDbAWTo+3mIeL3Kl7ed7nsm6J5bYMoIWN1V5x5d/qfItlpueGDePG2OqN1Sf25zVw9yYk05Ef9O3Lro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSahl7FLwXbxQGYirvuzerbnN+I1iHvEG+RTusRgWH2KCZcMcc
	+NhwjlbyFqB2PwqIIeraYc1I6prY/aah+o/Zo+onkDlpJ3wIZ/VHG9WTcDeFleyrZ2SuaO1ZYNP
	nKP5k4Fnbe8lbqrXc1apzIoCG9G3WxgE=
X-Gm-Gg: ASbGncteaMgaUarcyRkdT0lXuQTaxroWTEuA3tQ4aUl08N3sRFjiFBBoc8xomsEd3WY
	ayXwWdgqsnZaaUIO4yIOGA5zw5MLhzjgZuLQdgpGxWUsdl0Vf2Z1n6rj+7YlF4BE6qOuiQzWoLy
	hpOrh3ukPPfeauMEtG++eyqfnhgQashSBBGUIk2ghaywqfPZ51HGOxDlVaAkgJw2aRLqjOWa0jj
	7EFjOiuUPX72pBOvCOF1AhkEbV1zg==
X-Google-Smtp-Source: AGHT+IGIxeycyU9RxJgHU27yAWSyJ1NgsBaHmmOr+bcCfweWTUVijyX631qHYR0CdouRJsf7q71JKnIU1kG4QjVALlg=
X-Received: by 2002:a17:903:2441:b0:234:a734:4abe with SMTP id
 d9443c01a7336-2430692228emr4429225ad.1.1754995855969; Tue, 12 Aug 2025
 03:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
 <CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com> <20250812121545-f00f588b-2239-4d96-baeb-55cbf4914556@linutronix.de>
In-Reply-To: <20250812121545-f00f588b-2239-4d96-baeb-55cbf4914556@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 12:50:44 +0200
X-Gm-Features: Ac12FXxI_uQM2q00WnTTb0wjIfOv_AFSXYDfYt9RgK9gR6mnnzSxuaM5x_IgXOg
Message-ID: <CANiq72=rhY_k1RRJoTzsY8PnEW5D=m2Org9m0v3erJsWxW4HkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: enable CONFIG_WERROR for more build steps
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 12:25=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The users will still pass -Werror explicitly, we can't filter that out.

You mean the user passing them when calling `make`, right? I guess we
could perhaps try to be smart there, but yeah, it gets annoying.

Another option could be to have a new `NOCONFIGCC` that gets used only
for Kconfig and that defaults to `HOSTCC`.

> Let's skip hostprogs for now.

Sounds good, thanks!

> Another possibility would be to use -Werror
> for hostprogs unconditionally. Various tools/ are doing that for example.

Not sure what Kbuild thinks about that -- we have a small risk of
breaking things with newer compilers, but that may be not too bad for
just hostprogs (unlike when it was attempted to make it default `y`).

(For Rust, the rate of new releases is very high compared to GCC or
LLVM, but on the other hand it is easy to test them in advance, and
what I have done so far for other things is just clean them as they
appear -- so that should be fine, but it does make it way more urgent
if they are errors every time, though, since it blocks other testing
too).

Cheers,
Miguel

