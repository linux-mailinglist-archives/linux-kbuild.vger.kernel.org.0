Return-Path: <linux-kbuild+bounces-2252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA2917A7B
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 10:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77221F21D9C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 08:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888B6364D6;
	Wed, 26 Jun 2024 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vlZRL+2F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E215EFC0
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2024 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389320; cv=none; b=TqgsMyuIzC1hMArSPS5PHDevW489kWmmSMfd3R51C24jIljZ8gvlufb3kdJMid5mSjFlx1LQFK2n8R3umpbFczRBdzutgFJ0C9gfgIzyToBAb9l42bGMJZdhhdurA7CVEWsZQfZI3JuT8gi6MmMrFYngeMhsyaTp+lkgSLhUpdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389320; c=relaxed/simple;
	bh=//jKp5rr5ob/0X3eCJCapeuJ/kSdVmH+XlhxE25IkgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxp3FlNIET43IVJ4olqXlqg0yWrfmlamUMnjwcMz11VPZ0yCdjqHJJ001QBJvIZx5UgsRtSyZMJDL7U9QbPcO4q+pXKD9yeOtha6tt7AdGHQrIHQO3VtET6xiJ/O4UAWUS2Xtcnj75aqQMfYScCnQgkkIapgxBL6n1+ByEvvr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vlZRL+2F; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdebf9f6fso5119235e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2024 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719389317; x=1719994117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOQRgAOcOzzADgONsO90ijwc29fWVelXy7p+hfohj7Q=;
        b=vlZRL+2Fo4xcIndELYfu3QGLLFyq9IMmEvIH0veiMdKoWI7VxqJFd0MD5F8bfw1/qQ
         lwVqLmdXw+G4vM9+AaFJs3FU3Tyigq7EpjxYXiFR57w/G77Vlc+r2yZX1CrIECGmM+Mm
         wXCGQ7v1+ZKh2pqgbMHZ1CUXGg7qg0E+QCBwdCHMiMKtoaKN9RRmBvqqRKswEDxImUTy
         gfBeaxnEMRTguEf1efzLbkuutfr83IBnVEjWcDSyHe75lckV3bqJ9K88taSwAVqGX0Bp
         4eWzNk93SoD3Drm+XwKXLZk5a0uSdb3A6ThRq7kdZL92vmKaB1znja1Zz0l32FJXC5fm
         05Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389317; x=1719994117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOQRgAOcOzzADgONsO90ijwc29fWVelXy7p+hfohj7Q=;
        b=G1CIv/zXjW4zgNeW5R5isYhGJ4WXl+FI4QZZVtiA9plxtJyjnPi8NmOb6QNJPbZFbG
         oEpevxS/gAEw9kVX3l3myVZMs2ic66JohAZ+GuTGngwqY6QpWDeJ7iXSPtEKifKqMbSH
         u6uiK7Qqizsf5J4HGIl55ocXDrVvG085hHs1Sj2Glh/cIsfx80Vli9z+qd06OBgnDEzS
         ec21f3snyedI376sfaEoHKEspe4qKnQN44OB/Nb5rb6eiwbSkv++sblB4kclOnwEktTY
         kgIKlL+1tT/UDPOgAdzlIp6HVDLsuKUWZfFKndG1jer0usYFXezBez2BXmnUoD1OZ0br
         RufA==
X-Forwarded-Encrypted: i=1; AJvYcCXQR54YtcZSsilbUFPDExY0afDnO8Jd23lJaaxdiusFuORZ5cOAi3SUmcmwJAcfUrMnjAb9jFvxWFa7aLpoqdWC3R+1go82Iz9hVLaj
X-Gm-Message-State: AOJu0YxAHsETyLT0KyQg1ebCTwxLikhc1PPuvDWLMBPf7CwFtuZ6XyYF
	y0LDCj34/EYgsFIbo0zUS34Ib5o46HSkTPgdnZC/MnMigrlUNfZ6AQ1rT7GlGCreq2p4bn9gtS3
	YZ39/vDT/2uTqfoHdHrL4M0akuTOJ6R5Z6Wu7
X-Google-Smtp-Source: AGHT+IF9W43Hi+MKr+tZDFS0R7GHDpJgLdL1zQY6UEvv04/XZTsJ+hbblCy872c9Qo9So2eg0XTd6Bep2QafCoJyEUI=
X-Received: by 2002:ac2:5f8b:0:b0:52c:df2c:65fe with SMTP id
 2adb3069b0e04-52ce18350bemr6919055e87.15.1719389316715; Wed, 26 Jun 2024
 01:08:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620205453.81799-1-jhubbard@nvidia.com> <20240620205453.81799-3-jhubbard@nvidia.com>
In-Reply-To: <20240620205453.81799-3-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Jun 2024 10:08:24 +0200
Message-ID: <CAH5fLgizj3RDCXMe0zJ4jjJrtui-R9x65NtHZh=r+vPQaPqN+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:55=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> Replace the cryptic phrase ("IDE support targets") that initially
> appears to be about how to support old hard drives, with a few sentences
> that explain what "make rust-analyzer" provides.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 07308277a6f5..d22491184af6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1967,7 +1967,9 @@ quiet_cmd_tags =3D GEN     $@
>  tags TAGS cscope gtags: FORCE
>         $(call cmd,tags)
>
> -# IDE support targets
> +# Generate rust-project.json, which does for Rust what clangd's
> +# compile_commands.json does for C/C++: provides a symbol browsing datab=
ase for
> +# code editors and IDEs (Integrated Development Environments).

Is "symbol browsing database" the right word here? It's not actually a
list of symbols, but instructions for how to compile the code.

Alice

