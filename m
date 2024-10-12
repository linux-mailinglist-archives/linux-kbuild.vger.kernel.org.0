Return-Path: <linux-kbuild+bounces-4075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543C99B7BD
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Oct 2024 01:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD911F21D0F
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 23:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28225149C4A;
	Sat, 12 Oct 2024 23:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjbjiRke"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F04F8BB;
	Sat, 12 Oct 2024 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728777193; cv=none; b=RsetXex4MyU3nT79oVGDvDXHPmKdOQP0jj5IjHGv395C956wW2pM2Ycr/iaZ5AEHKJJfP197l17ysZX+Zm/GMgKSZmRcYhopHiwZxljO4BG/OgG4Dw48IM4v0S6eArLXUNtqSSAIaxBTa+Vx2N0aDVvdtdvarVQFcZ+NbEPp5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728777193; c=relaxed/simple;
	bh=KuNzdB0cvqLJdx9Zw7fwlvH3UCIdWMu+L7CAvZ6YIXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTgyK5nMAe2cURk68r4iMJ/9xmH+AcaW5rqulu2l2wL9xEja+BNSml5v8oF+qz1/h6ghtfqoAglbSObOw0W4VhADNBA7ouOToUI2htSRxAGqLulBBzOpuTmWhRV8YPdWiGiXmr22FQgMp8DnigoC4ZIliFmdyGao5mx4xPx6HJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjbjiRke; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso30063641fa.3;
        Sat, 12 Oct 2024 16:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728777189; x=1729381989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuNzdB0cvqLJdx9Zw7fwlvH3UCIdWMu+L7CAvZ6YIXg=;
        b=BjbjiRkeXXIgg4aOA8FmU+nO61ovl6XvmQFIK4IJyc/TDtsxAikDKKtllvsj8aOuA0
         fHOJijrRCVOex9dx+t+s/5mtQmvSGsTFmunapJv/YlYgJwEi/GRHkjMPJ/IHBysiKOYx
         wnaWYfkTmk27X/P0B1Zuuix8enT/Os0x3wDyu7o+NBt5cB9Unx0sOLKUGmQD73qC85Yz
         WOFdpDP9Y/A7b4CUt3cWDGyPJArV3GjgCoySGK0fr7UHI0WDqhNKn6NNF1gNslnyDfgy
         nT5u/LoGZbbB/OQN0dtGp6ai4/3dXp+Ae/0Jerm+QWmm0yyOiZjbjvRAyALtbOUt5+bH
         UegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728777189; x=1729381989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuNzdB0cvqLJdx9Zw7fwlvH3UCIdWMu+L7CAvZ6YIXg=;
        b=jOfHlctU0N6dr3E0hoBNPvIIl2b37jZ2amAqU2iTB2BnnmdY77OsxQo7qteuruNiDD
         BSrA/6v3EGGdLzl2ZKK3Hz5rdZTEXFZ1bL9+mo4tLth+oW5iw97wCJe3a4FYiPthsFJM
         dBTSGKR2jampYluxSajUrE4s5Q4eLR1Xt9EnUdJHBuGKJDNnTXiLtaw+xaB+prFrBpQD
         yo5TRPhKVRWKkLyxY3E4OmFfam48ALXZ/NDaj6NTSBuvxenXfIlfoivvMQbqPa0qW9DQ
         S3EOgAqa6Wkqna3P0h6/QMo7pO+dyd4rekXwAbLSnIowvCLN/5jfoIgMUE41pGHOTmFn
         WW/A==
X-Forwarded-Encrypted: i=1; AJvYcCUVZ+Ldb8SFMgz8PW/NlWPGLiZquUU5oBKzLW8s0GhLXOnbVNLrLwo31M5jXB+varbgTYUSV3nNzyi078MY@vger.kernel.org, AJvYcCVJVyLjKLjDredAhX8kpKJmEKvqn6Q/FcS98G64yryp+aAFUl2hB0fz160qnZz+FP7E/iRgOaLTQ6M+7Va2I6Y=@vger.kernel.org, AJvYcCVoHYtOhNQ1Jl4OnKitH3thKvBIhB6G+dqwEjmiuuDiRtnlQRXcD4QoSnr9/n186pJXqVgPAZfUzeGm0/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0iqRW0ayv5h3l2I1ubTLOH9AuilWUViQBhWscqhi5GLXw4H/
	Th4rCSCD7oNuGxTZpSguYpSZSOaqcgPnviqaTM7mUqLc7fVNhzIGgDkFhImhu+6Ls7nkwXJb585
	V8gdn/FcpdO2sSB2m8SdQVxi6PGY=
X-Google-Smtp-Source: AGHT+IHn+C2ySu0U+5Q9KLhAJr4VqYfajR30A2uza06CpeKNKIapyrDVzmOOJwKx+G9vzz9EEtbqQpyfHsBrj67Sn84=
X-Received: by 2002:a05:651c:2120:b0:2f6:5f7b:e5cf with SMTP id
 38308e7fff4ca-2fb32727e42mr29641551fa.14.1728777189113; Sat, 12 Oct 2024
 16:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com> <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
In-Reply-To: <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 12 Oct 2024 19:52:32 -0400
Message-ID: <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 7:37=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> But before we do that, is there a way to force `rustc` to load current
> name (or trick it to do so, say, with a symlink)? i.e. can it be
> reasonably done out-of-tree without changes to the filename?

I think the problem is that rustc produces .dylib on macOS rather than
it _looking_ for .dylib; the path to the .so is fully specified in the
rustc invocation of the targets that depend on it. I don't know of a way
to control the file suffix externally.

A symlink would possibly work (unless rustc refuses to load anything
other than .dylib on macOS for whatever reason), but wouldn't be very
ergonomic; you'd have to create the symlink blind or else run the build
system until it fails, then create the symlink, and then run the build
again.

