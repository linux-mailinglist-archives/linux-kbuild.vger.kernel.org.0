Return-Path: <linux-kbuild+bounces-1914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE128CBFBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 12:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C054D1F2380B
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 10:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7985D82C63;
	Wed, 22 May 2024 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOMOKJyU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FA82899;
	Wed, 22 May 2024 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375145; cv=none; b=KF/39C1+2MMyVq9nFtwQiEoy0zHsXyIHu8J66BIxX97UimqRP9ULkUnahSMpx1hwIR9YAjPUCohk7mbrxhcqqg04xk2MdRiyFfxXXXDQ3CkIYyLZsPkLBfrO7YcFNpR9FAYJDNpRUAYwFabiUvEj+WWtsoFs1+gbzXwb7ZdfS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375145; c=relaxed/simple;
	bh=0Y93dPhHvn01+Vtk2BQihtxVDdioBUNBOZ0XK/IR2XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDTFIyMe/KAaa6XDLsnAbC3XQGj5iOavBJe3kFdl/59bWt95+b+lPzI0UH2AmimaZUw7qOAItlhHGkTm7AxmL+eVWY7uwW1rF/7Te6rgAgcy5ToStSrbKDXFtiPFHBcZ2JEkAlrWZPSdlPWAJ5UsDhIXDmV4+oMCQ8rMaGOQ5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOMOKJyU; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-23dd94111cfso2964392fac.2;
        Wed, 22 May 2024 03:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716375143; x=1716979943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y93dPhHvn01+Vtk2BQihtxVDdioBUNBOZ0XK/IR2XE=;
        b=XOMOKJyU+y0pRvwEvDzRIjRzXwPBQoJ0G3Uhj0tVqURysJK7YjuOjALbFpqjYXpQSz
         kDyqRXpE79uvK27tBUx50QlCg3U4tSCmHtbmSg0rK8xNgqz6vEHui46f1h2AUYgsOud6
         9mEBh0w+jIVbjF9dwfMHgqDfJAJBIEMmMzFSPnFoCmu+h7Tc3xvnmtvmOoBWp29WMjrb
         EL8h84l4mSXLBE1mLCSFSPuTK9oKQrz81Qaq6teNeRw+QX/c+pX0OcGH8PHeOb5hgkSG
         85LRk5P+NJXrmyVfy6g4+tfySK3yLr1Czmpx0sXyVCN0+jhAev1IZJss6wSJcZEV9QZP
         bPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375143; x=1716979943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y93dPhHvn01+Vtk2BQihtxVDdioBUNBOZ0XK/IR2XE=;
        b=Qevq2+BRRnrg9TEgtxardxvv3+znjdOI3e8KI4Ae310Zr0ZzN1IrmSRIgVSVUCnGE1
         9yJ27EnQixOOVlobz/U/4ObmEUztRvmQVyf9W3Qezk1BPRRWqMtYLau7eQh0VroXC2uf
         wpe0AcaU5nlnwHXRz96PJO0jyKcHKLCQLbIySsgaremhCL/KlprpEuToL5U3qUiv/wri
         pfrRcxDamO1+NhAUYtj0lfPjKuAXHX8GdxGNArocakL61CunSUdZ5wH3qoILEQlManNW
         PT2X9vclFVbECcOs9NL6qrPtWIKt/WipynA3AqbsYT4NtZ9U8iGJlrJZAZpo7y3hm/j2
         qu+w==
X-Forwarded-Encrypted: i=1; AJvYcCVPTj0GWqVPnPOxWi/makaZtl6nFezr8/ycEhRHx2XB62Wz7P92ITMb98BGiuhFVvlIUAmTgNrPW4jIJQMoOetVsgT5HE7KdaZds4M1dM3xuie6Fxsc4vGmFYAsy7tlMIWnAtQWZA5NPLRHOJwJdyk77x9mx4YQHoNMbdccV3RzIq6wGIHfGC4mf+Q=
X-Gm-Message-State: AOJu0YyWSPtbphxoTwEasQEWk/rCtvhAH/MJhVoBGERTDul9jIaKYfTH
	Ibu+ayIzErpFSWqkAmK/B/Uc42efUN2GIZADV7EMGeEUvYUzFBWBp6XZuC7VIGHXqYpFVKos4n9
	BZq2LUVeTK72njTof/KHwhvTb3ns=
X-Google-Smtp-Source: AGHT+IG/AS4kJMzfIgzw3AMuTS/nlyyPXYuhXOPvLaLt3mE1VVgwbiK0gwIGfRoZ7lTb+QeX9+yvLRcXGPalXpvNf7Y=
X-Received: by 2002:a05:6870:e253:b0:24c:5018:e6a5 with SMTP id
 586e51a60fabf-24c68aebcb5mr1986514fac.5.1716375143007; Wed, 22 May 2024
 03:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
 <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
 <CANiq72mcdtNie=t=HHhZnjQa7gQiDZin+TYP_7Rgi4kL83H2BA@mail.gmail.com> <CAK7LNASYYYsiZUaA1StD9kWO0WBC0PBPtfY7u32g94WtOPFZgw@mail.gmail.com>
In-Reply-To: <CAK7LNASYYYsiZUaA1StD9kWO0WBC0PBPtfY7u32g94WtOPFZgw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 May 2024 12:52:09 +0200
Message-ID: <CANiq72mzTaKYJqNcv1qT3nXEbh_t7CwaAqxCuYNcx9eHOZf7wQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 12:14=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> What does "everything else" mean exactly?

Everything but the host programs. Or as many targets as possible, if
you think there are other cases that we should avoid.

> Why is the .config required for generating documentation?

`rustdoc` sees the code in a similar way as the compiler (it uses
parts of the compiler); in particular, it processes conditional
compilation like the compiler. So we need a given configuration to
generate it.

Cheers,
Miguel

