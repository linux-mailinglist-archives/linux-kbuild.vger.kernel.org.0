Return-Path: <linux-kbuild+bounces-2976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBFB9519E7
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 13:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0CC41F23819
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 11:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EF01AED3F;
	Wed, 14 Aug 2024 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwOOf0Eo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C01AED3E;
	Wed, 14 Aug 2024 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635062; cv=none; b=ibWMmd+Uko150Kb+gsX0+zGkOH2VvvVWLcSosFuZty+mu2DMae1mpbhBykfXYrhmKbHLszpeOXQKjmX64P6y+nP48zer/Q/3ESaWpzzWA9t5zM+r3LJvnRFAiaE+PFcVyb1ESC8Bnnhaf89FgGJjSZKXcxM3MEz9mjAimr6Qx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635062; c=relaxed/simple;
	bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acbK2ewCXEauvwPbpEXKUV8+zJOA7e8wmFhlyVxtgy/XXUzNuXCfDKgek0jrlZi/tZs8xlylMIrLdOoRK85Fu/n7zMyQfQdWp0fiATwRs7bWwfj59BmhU0E33Ml+epkmF3hPzin94TPpTYTvS+xXt3hI842D3y/eQKcsoswxbVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwOOf0Eo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso121604a12.0;
        Wed, 14 Aug 2024 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723635060; x=1724239860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
        b=lwOOf0EoXvcYeoHsUu54rT3r4e2h4CDV8zHsvMom3CUzrO67NVFDzmdXqya/K+Sy1Y
         a4YE7BPvZ/22DpGuniasF7lArn1xPwp373OZr3Ij0n7X0Oz8J0ea2fp9jA+iP1RBgXRB
         XkFDVxRhLc+o2lV0VOhYYGzbYQgHfQzaTSMa0Hh7A33XyhGvHkUS+zxXhp+3hvCakHEa
         807OjEAnzHrJuNIAoFMd/Zz/jsAkEhs7sr3P52ot1P+NcaBIVgLOYv856wc5F0wTi+0q
         1F5I1F1wQZTyON35SO6efUP+jr7wLYAyUICn12CwPmWLulo2ILksNPRz5W6Q8G+LSdc2
         sAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635060; x=1724239860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InUtdB5UpKfrtYqYOgnR4uD76Y1IegLDBX2+qnakvBQ=;
        b=JO0ISVJBXMI9/cURjkjAsh1g2La18dgCmdQVNpUzxmC6xFDAOGFGPxXsV14zRpPVqV
         49e/ZFG6T3v+QqPyEyL6fAhVMBBtdW1zgn2tRJiC8grr/fNYRo6UpowkU7TXg314fB4T
         uQHgdwe7EUq+bAL+NiXisLlLidWDYCXy+egibzgvdTJpnmbP6xXeNowxSwCGpQKtaW/F
         qM74M04J6rbEWBYJO8fKT0EOCLeGg2a0Q+PV/Ozb26E9GG8dz/LpRtBmrCEj4ILoVjYF
         3CyMKbpouoSPHrIwtMpSxd78rQIaGDJftbWENwKkxWsejnnfmwF7Gw+AakVQEwm7jy7Z
         JY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5L2QT5lVaYX6NZUJ269lhWgQ8ES2osNo6I4NLqapU3fJjTpXpCV4o6kdnT/IBI+o5UEbwbfOuP4eVglmxlgdBT5lPzuXPuPjisqAFGH7iXU1B4/44FQod6DI01/BBXMALQhDyGnRnocnVpv83kMvQzDTvD6ot/K2boNwHVulEAbcGPFSvEP+fN7o=
X-Gm-Message-State: AOJu0YzDimpI3ZsivUShF9Cts4fVOdim+IWfl5zWBEIkd/nsdLAmhSZA
	+AkWBg1d7/QoCoE15IMMg5zqYQDI2mCvcDNVMFMrv0CDJGytCz697lZgyFk3dtUbKuKnwKabPUZ
	ZJjdZth3ZWtiMZxgaW2kUuQ9X1MgCLAHY4LU=
X-Google-Smtp-Source: AGHT+IGHqVVY7AZWrBMuOmVDEc8fUS5b6xT/BMfprxxksFMS7/qwt/78Na8gyK8oNQBGsC23z/3ZryBjtIb+Fxr04As=
X-Received: by 2002:a17:90b:1196:b0:2d3:b49f:acdd with SMTP id
 98e67ed59e1d1-2d3b49fbaa3mr728717a91.21.1723635060040; Wed, 14 Aug 2024
 04:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-2-mmaurer@google.com>
 <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
In-Reply-To: <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 13:30:47 +0200
Message-ID: <CANiq72mJ75ktX_n8jxALM4cVFcwm-OKVK3e6r8+-0AYbEGHk8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 1:27=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I also had `out-dir` [1] since, if I remember correctly, `rustc` may
> create temporary files in a potentially read-only location even in
> this case.

Ah, wait, you are avoiding `try-run` -- is it because of that? I think
we should try to reuse it, even if we have to add the `TMPOUT`. Or
what is the reason for not reusing it?

Cheers,
Miguel

