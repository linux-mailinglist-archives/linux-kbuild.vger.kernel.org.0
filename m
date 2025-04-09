Return-Path: <linux-kbuild+bounces-6564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0757A833B9
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 23:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1838A61CD
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 21:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAB1217734;
	Wed,  9 Apr 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIpD+3Zs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D304215787;
	Wed,  9 Apr 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235595; cv=none; b=QwPUn6QjrsnPkISjeBmSg3+KPqj0ymm2OEepFZPJMd0o6t9PSktyuUXHqc4XsrhqE/LJqsfkz/TxYNtHEwcJ2nibsMcND/M3T8mMdyh8e2TbqwxaHrqXZTf6S5yQ26oy1p0RArNdm7AnImwC5JvbYDRxQnTCEuN+laZMZqQKQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235595; c=relaxed/simple;
	bh=FDKPD1lNkys1gBdpLGebFxEB5tYdC6/xm01UvetLAMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezyfE45aC8A168pVul1yGTM6Wg6Dogs4kI+SFtCq/GqaBPuUUoOOFu4Zf5quvkYOHJaCOBqiHAqIemX/2lrjSqk77HUx86U6V7Lk9W4Tw+aM2NCBv8OCyNEXvtVOI6RyQ7NX9XqXigq1jyF/qrOyIUkgVhYxjzPzI6UQzeGNh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIpD+3Zs; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so22529a91.2;
        Wed, 09 Apr 2025 14:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744235593; x=1744840393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDKPD1lNkys1gBdpLGebFxEB5tYdC6/xm01UvetLAMQ=;
        b=mIpD+3ZsDu9JXbB2gAqxN2Hv0iOu1B9up1Ap0k1+/zjr3ZSIDpDavsS8sdqDJVDold
         MIpphuruXS7p1V4Ce5dMrgZ/uzWaWTPNojfRtaPukBVLl2EbNVtVzJB8PREq9Yqj6Nv2
         X8u3wgzx/bOkGZPCwGguDqd5itbDPo+zbNyDNfPoob42c8mrbRSm1LGWyd8BuskjJS+u
         5MZ+3QH1/HFZY59wsmRY3sfM6Cvb4vElRUVJ26uFu+meDWT7Q/7vatOG9VCPOWJMRZDH
         qx2NOV9Y6Sxhu6xMf5jzcnGO8QgB3BseP/kVJc47Z3Je2pyDooQ+eqx5F9ykmoTcZBOC
         eUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744235593; x=1744840393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDKPD1lNkys1gBdpLGebFxEB5tYdC6/xm01UvetLAMQ=;
        b=U6dF1X7opZgnw/QRGq6FGtL+qUH+NNg5b4NJhPFhE+Vo0hUZWz/0hsAfszY2H1ccA5
         igQ5Nbm5XS4/DbqWl+vmxo6X5kZFg2bOgmW/qhv9luW9s1muLQQNE09pWF3L89NZRQmZ
         jztts1EIzjkoXoTaEwxzmJ4DhPzgGeDEUQ2ShoVhLSRKjXrvPXx8YI7jtQPWiYILAI9N
         bx01CFb0iPXh6cMP9dtG81FMKVTLFO18KXHi4KhWNiVoQ4r0jTbA01w4Ct4dwHr0GsIb
         NaVjLYcACf9PSRUorKag2JjX6R57M1VUEKUmSUc8weoWGK0UcxveQ89Y2Z/2W8FhXX1E
         AgFw==
X-Forwarded-Encrypted: i=1; AJvYcCU7yn1lNBArXU/QFnJLEsFtoqQPWZaNEueavEgTjr2Sw67T/Rn5ANUz6nX94tBGePFpjyOoKlVATlyWBRJ6@vger.kernel.org, AJvYcCUsJXoYGwL3EcLhY7nOhgP/Tvrok/v/GPuuT63sAAiukmuTjqicxnhsh/f1O47JUzf8ewHtyAIL@vger.kernel.org, AJvYcCXLZV+I+vpYOsJuTkmkWi5sx6+guEU5z0WqAtq9t9a2JnjAhnND72PTKhpfHy8OUX+VLva/+WBOSoY8cpc=@vger.kernel.org, AJvYcCXTI62LxZwWBDw6mBYq0vbN9r20v1+5EKA2S/2If5uegeC3iJgo43ZrG+3pdzilTQ14cQXbwFKHxiYSgesi7qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz34jQuDSSYXMOictVgH5UHG6TNEpZ+t69UBIzNC/1COIk+Zcx
	ryJ50txZ6X9VMNshBhM/RbAIUdllY3aWhj2qxf75WHZ0vSQtrq0tBDwkN1v/6+2455/sTvGAhfj
	0jGwt9OuvVIh+JJcwZ9hnNEqVdWs=
X-Gm-Gg: ASbGncskcwNUM8qMzzq8zao22/wKLVt+jy1cO0Vgpwo+JF5nbwaQWyG7PmCZ/5yX2zD
	fyWeCtvpvN9MLXh8ZmrgmD0jvZMahukha9je3f52tohnamSkgSu77L2n+b0nHh3yFDJixZAqWfv
	ScrXvOkCmMR03igrkKXzWWbQ==
X-Google-Smtp-Source: AGHT+IFiuhaY/Oly3F84cyX5S5R8FUrNDPu5Xzylln3EzIuMjB3WyRn7MtyfEuyKE/ITRvwSR7ZCmrBzmJQr0cXhyI4=
X-Received: by 2002:a17:90b:3b4e:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-306dd32267fmr2318847a91.1.1744235593163; Wed, 09 Apr 2025
 14:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408220311.1033475-1-ojeda@kernel.org> <CAGSQo00QxBbUb8AxwqtRKXy96na_HUVmAG9nWmX=cVvozqwWaA@mail.gmail.com>
In-Reply-To: <CAGSQo00QxBbUb8AxwqtRKXy96na_HUVmAG9nWmX=cVvozqwWaA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 23:53:01 +0200
X-Gm-Features: ATxdqUEHQeM8b7saMWZkuyDOWEJ-eHfp3twazwBDYlb872_Qrhvs9x-AXSKsD9A
Message-ID: <CANiq72niPycmVwHBfqttgD+X1qvg2L_P-=X79YEREUGLitqoaA@mail.gmail.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> The problem with this change is that some `rustc` flags will only be
> valid on some platforms. For example, if we check if a

Indeed -- this limitation is acknowledged in the commit message. The
priority is fixing the issue, not future features/needs, so I went
with this.

In any case, if we need to test a flag that requires the target, it is
likely we can do the check based on the Rust version, the
architecture, the Rust's LLVM version, etc.

As for `target.json`s, the plan is indeed to get rid of them, since
they are permanently unstable. So any features used by the
`target.json`s need to be requested to upstream Rust (e.g. flags) so
that we can do the same without a custom target specification, so that
eventually we can remove all of them (and thus `rustc-option` will
work in all cases again).

Thanks for taking a look!

Cheers,
Miguel

