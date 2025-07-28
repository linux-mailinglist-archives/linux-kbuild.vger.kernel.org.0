Return-Path: <linux-kbuild+bounces-8222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E338B134A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 08:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84501898699
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 06:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871BC21FF5F;
	Mon, 28 Jul 2025 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdWF3yP+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624C21CC44;
	Mon, 28 Jul 2025 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682813; cv=none; b=DbnxLhduQwmnAz1Lcq5jeqBt0w7jNJ4HPULTsAYc1bGlX4rvW7E6bJdHZ8a5UnP4tG1Y+MXTrQ9ixvj2iyrgA1iHpJDIrvanu/dqd7uMWiuII+C09fKWAuQjqM8kmi8s+mQ7lOmrdsT//Trra52hvXM4Lcacvb/DV4ae9mUcSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682813; c=relaxed/simple;
	bh=6BuxxmxrMXuD+syryXFAu4e7ozMwiP9HtTVrGgSqrTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILKqKQBSmSwsLXLSB0pfNWjjyDgjR0K/nOPT3r0q09l3s5KVABWBRtXmxsg8RQnWN6y671gs2r9kLl3Dm9CJKj3uZUpJECIwyK2LYZrU3N4P3Ik218KttfbIrlbf2/Q0hXB4hNeGUd1jgp3x1o3p0YULtw+1/mxwvdqm5MOTOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdWF3yP+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23ffd0ec2afso302355ad.2;
        Sun, 27 Jul 2025 23:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682811; x=1754287611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BuxxmxrMXuD+syryXFAu4e7ozMwiP9HtTVrGgSqrTA=;
        b=DdWF3yP+AfyehxYZXxodrNtHs8JIwt9LlwqVzjP7rbQ9wikiC7pGY+MQNHCaDIv6Ny
         RlDIQBRPJO6f3Fsd6ho4Jk7AXEogJdypZIJEW8ATncoKqFtg88NDBeJQC6kC+k1/TS6J
         6ynUwVbr2rkC/QWhNQfQ50XEC0ps/z+qSABCK4wi1e6taOzv+MIgbQuz55IsZwm7O1nd
         m7CHU913jmKhitDch0djhoQ2daY3TAI3l36LAieCD44Uca7MC9cz3aowJRJTEErbvq70
         mSMU4QYjnxQ3pcLnoQTxSnxh25bJWHT04Pb415uq28fRsapRrqfNJX6IEsJUu/KTFXlC
         lbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682811; x=1754287611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BuxxmxrMXuD+syryXFAu4e7ozMwiP9HtTVrGgSqrTA=;
        b=C5h2UmGg3E1c0y6oIfpkS73R979LoxPwbI5zeB2OpwYhs3pbTYQhIyocLBKPuSVpS+
         HRqIkgjfzrTkFAVniDNLBnYVKt0NpBFnOPviPNZihS6h6YN7k4Rd7XBw/mG1YWhj5wWU
         /B4vnW2RyQiH0BrdyjaPzQm+i7Sn1328ZL40sFv55oep3CZzwIyQO8mJGez13+iAc6ww
         TnaDERcvC7marpEXt/jo2zQ1+/qftw3q9+8BcNB5WJi9ZCVEEg1E0N33Kdw0bhKaDT+Y
         fFi8rSoZuZoXCiXYQYQcIUlDdvPDk04iyglr+wpg00/NhuHNTFg+v6cxQx3mGe9iMehG
         eTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWdwNrwKNYjYd0A3LKXkPfNzUUaA6lfPWJ9/BhYIFnbgfQVlCvJQ0TXQExRrNAXHaTVMc2IEzwS99nw/D5j@vger.kernel.org, AJvYcCXWGNpZkezQf5FCtPOnyLblBKxHCFd4qKz+zWdXRmBdTw+fTLHSHHvQZwsDA+EMnqrBjoJKEI8CjglokNM=@vger.kernel.org, AJvYcCXeq3inagD6l2wozqjU+Td6YRWs0lO6ir1cbuPQlIx/n249yNS4qiUYTr3vmzPvU973FCF3c1X60xJ3J79NfJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7K1ZqhjMtRFT1whRjp9hrfRYRy84HiGIKkyRq1ap2YSBue7m
	Wbs5gjTXtbzMNCWPsW3JcMUinjejGLAEalrN/wK0i1nb2NOZeEDQE1sTNNIXNr4m2JXB0joLFI4
	ATppxPJgs3tfj6fda+uDGEXE+if/LqDE=
X-Gm-Gg: ASbGncvkIu8z8CVAVKQzeNHjQAUlTAASO1mZG8TifAkQtxNiEaUnDUlazuqJEJ9Tie3
	w5kIYvmusNwZDLOIrT3m47qi2gTFX4Dm6Z48vd8h1mA2JBOSRyczrgWTZ5RHIc4EGoxdM0QlvR6
	Lqo1ab/UmyyYBzFOygmDmay041VvucL+dvORoMSpXvmptzGWsrhTfB+l0otAV37u4RS4K6Sye6A
	FS3x8b8
X-Google-Smtp-Source: AGHT+IHdhVmKZwChbSTO0ZEh7G/lQCCa1ZWLqXuMsDUl5T7xo9Vns0QP4cG8ipR9HWfcbqvofCO6RnASD0hnrFNm+xE=
X-Received: by 2002:a17:902:e751:b0:240:cb:97bd with SMTP id
 d9443c01a7336-24000cb9c7amr23866415ad.7.1753682811331; Sun, 27 Jul 2025
 23:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727092317.2930617-1-ojeda@kernel.org>
In-Reply-To: <20250727092317.2930617-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Jul 2025 08:06:38 +0200
X-Gm-Features: Ac12FXx2eH1NIUNOlaMWd3xqdYk4d5QjO6acLe_IbBpmXiVXK0DqqgtW8QrHL5k
Message-ID: <CANiq72kYpHzp8ydtkfdb7FN+YjfFNjpSqtgC0Hm1tSy05p4n4A@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `rustdoc` target modifiers bug
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:23=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> The issue has been reported upstream [1] and a fix has been submitted
> [2], including a test similar to the kernel case.

This is now fixed upstream (thanks Guillaume for the quick review), so
it will be fixed in Rust 1.90.0 (expected 2025-09-18).

Cheers,
Miguel

