Return-Path: <linux-kbuild+bounces-6874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6FAA7422
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 15:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14AF14C037B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621C014286;
	Fri,  2 May 2025 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLckHg55"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A51474DA;
	Fri,  2 May 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193659; cv=none; b=oVbuHeTXRv7AajG93WexDCTsYAru59ygR8DpW+M1wwNGLijv14C7DSisuInlG5D2kIMAg+BW69LjWHS6cnZ5YAEShqpVBmYpTsiomfm4Ed6N0wTQSTQ6yv3oM+q1t4poEHgsv0e7JUod6dKaG9flC+g51phorws+q70TZ2X0QpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193659; c=relaxed/simple;
	bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=foN2BiBH01lImjVtlJLzDdfpWp+nhGa4r0V7/aryAjYMyF/OBBGZRCoty9+VKdqSXPJ0DK37UgZ5O+LCi9SYSb9JdaHBYghJeXe4hy5elqvbEkXLwZcsw6ny5WAgbFH/wQraIrVT5DE8thxNaiqr/la5pEJu8yNJXHJ9m0M7bgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLckHg55; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227c7e4d5feso3809165ad.2;
        Fri, 02 May 2025 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746193657; x=1746798457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
        b=RLckHg55rgdES5VRUp0FSLpuP/AecSQWFUXxtjBvJDVmx6kfylcLhsAZb0zxhhMp9H
         UvYnSnQPvrV4h2htjyAt6Mumy101ST5mLg9kbwndPbBUZCAutw1l7HX4ukYIUU1kTfCa
         lQAVC43e40WIGwyuj7/1AgNTkhuZO5Tn2kT/jXpL/qPEitwnSsbkuhaImO9JYzfPdjEX
         EHMwoWUvuqs+LKdP7aOOhw4ictNpQ0SPOUc+43jeiinMLyaN9TsgPbBBrnqc2grI3lbD
         dsvjz7NanzjXy+EvfgH0zOfjeCZ4sCbdkaLi953aoGws26mfqt9UyY5iJAlrsDJfBSHm
         tuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746193657; x=1746798457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO7DeRcZqOkyyJp/N9tF4f54dRAU+mGMvwJb68kNOUs=;
        b=PKLCWfKlLvYlmc+Xjpwy67fBEVtbupRdruLL1lHQIZWsIFVay0x33LAMBK07lS91sS
         kjxjcA/1/TishlU9GT7dpspFfuJDwAvUwB9SouiNi4R7gNTKSUoY08Xuo2WHEQ0cmKxT
         jKhRzaBykchfB+Qx2VLHo4nCs4R/g7FUeK1QMGdbH0QCZ0eVm2eDDGIRFci0iFLhRLMV
         TS1ltLBI95DlGfjq42NZrbgHDkTRjhLx/slmesR8vXpaAy41bKdKvOVx6f0rV3Odo7o7
         goCNHzvzn8gDA0XSVYh87JC5Fj8BK0f4446O3Rp7wPB5Rs5Q2ZemOxFnK9XreHgfE/Y0
         NrjA==
X-Forwarded-Encrypted: i=1; AJvYcCU+8KwHAH4tvpwyXP+6fMpxKFEulUmHsgWBro0fqaktXgNjit758UpRoAxE0bH9T37/kLI9YHKMBd5JJEGzRws=@vger.kernel.org, AJvYcCWEByFZcunIhSSFEMsgex2G/TZ5WCAALIUXvaV5Ebt1nYcAqoX9wc5tPaSsoVllp84M8eWgT2HSKzOSA0xf@vger.kernel.org, AJvYcCWMVzvS4I8c8rv1BHC6RBWxBwXxkM8RwflxzwEabgssfrPJbYzn5AkonKh/iBHSQVpyGW+qVvmsyPDadrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwalXbz7V5vVzYRDf0UzUXoNNOT0r2Vfj3OqjewlT82N0JcBWbE
	F2Qt0UExwjKNL4ncUQQW2/WpkUIAqs8cT/r+Kh0EApl4s2t34ZaV1loRWLhyVY3hmP0uMD4rBon
	55VxztM2pacQJNS2U/ChqgyFB3M8=
X-Gm-Gg: ASbGncvwqRaVvo0PzTBDttUwHJklhc/LjFV6cOIoleetFq+zJBXKwVSFiO5vwzs+H4V
	gLmi4jkVgORT5uSYz2Ctfl7UkeltEUDZ5une8AA3J0VDBV8Jxyq5xevbfDPvbp2umDeMbtdZfFr
	JBtn1iCvv//ieL5jK80k9UnA==
X-Google-Smtp-Source: AGHT+IGvS8ysehRTmkpn/MLH73wWVl8uhQ2dVyiEZQB9+BX+Cc/I214Nibn1sSJ0p2PSB3EHImIX9TR/DCb1IZQeD1I=
X-Received: by 2002:a17:903:2f45:b0:22c:336f:cb5c with SMTP id
 d9443c01a7336-22e1031f5a7mr16755265ad.6.1746193657040; Fri, 02 May 2025
 06:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com> <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
In-Reply-To: <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 May 2025 15:47:24 +0200
X-Gm-Features: ATxdqUHPzjJxM4ztTNooAwhiGBxmesfG9DnCr-xy_d1ASwZ94NEytM0G2eVkbK0
Message-ID: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.com>=
 wrote:
>
> Thanks for incorporating the core.o change!
> I've tested the v2 patch on my local setup and it works well.
>
> Tested-by: Aleksandr Nogikh <nogikh@google.com>

Thanks for testing, very much appreciated.

Dmitry/Andrey: I guess you may want this to go through your tree
(although I don't see a `M:` there), but if not, please let me know:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

