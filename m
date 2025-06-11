Return-Path: <linux-kbuild+bounces-7454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05734AD55C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 14:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB26E3A3583
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 12:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AF327BF85;
	Wed, 11 Jun 2025 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPV5R1dT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90723253F08;
	Wed, 11 Jun 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645585; cv=none; b=eMUZ6E+Jzp0ZW+105PIHecJBhGu6cHqljjCUfrYA5+8MIixBToOpuQvS0PRndMCDUEyWcfTCvPrDKmtXxxwRTEk8ib52kaagaaLQsT736LJEIPa0STUy+P/dc0aJYtX7hq98ayYDNXd40IfVJ08o/2dextEjnoeufSK+SDsRGsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645585; c=relaxed/simple;
	bh=x4MivqVOz+jtZ681vyuC1Ele+akf1aAotf2Sx94R0ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFNd/l1AmkvRWFxH0hbPdTOi+/ywjqCumzGDYKVQSwPIRGT8MwJhlfRSRqgzQDhlVVgqkQhFAI8muiTX0uUqsJfE/pDuJIfN+TIZk+wM8vOmNAKTNU1MfBhUU98xCG8xOpDmN6VFbjxdjX6Tj7t1JfsaWdMyB5E9RcfEX4wsXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPV5R1dT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313290ea247so50287a91.3;
        Wed, 11 Jun 2025 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749645584; x=1750250384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPptyJtkdt3bR0imyRTv5uUbfy/9H4Z05Yj4r4qt7Zo=;
        b=CPV5R1dTdI6knDTrMfBPECgoCZRGvCpzHQiZa7qx/UtLl6MalZ/Evlz8JIC+otslk2
         5FmUUzZi5DzOn33l7dBZ4+81VBAvgqEHOCC6rAuSJ6VVhR717QrEBbhApvna7brvblNs
         TdR4aiecSovvwef+FF4afFGZBUNRIY2BVMq1xdJYHJhX/GfOR13mbhZ7yIC95U4m/1ah
         uHtBzG23pNtmlyXyk6dGPTrCGKGl5+a38ent2SiXMAeEj1IVcgeF9IwazLBC9Q92THR1
         TwhkV6AtEY9izF6I8tiRQu59OFUiq0YIn15cDe3AlJ3mMZESNfwcDE+X0jyyh3CKI8JD
         DKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645584; x=1750250384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPptyJtkdt3bR0imyRTv5uUbfy/9H4Z05Yj4r4qt7Zo=;
        b=gB6wAE9DUjhSEaLZ7Xmi6Bt3SgJgkvFMWhi6GZ6HjJCQTlS0IYAEMwGb1O5nfNbafl
         jzk7GPsRETlgy6J0fcwxZ94/v7CQXIislofufNISw3g6EgqjhKomqw8Z47+zzo/YRkHi
         K5UOfq83IdMVut7FXJniibT5A/IGVPZJIzQHw50wzB4lraLJB6/clxEWh0evhy4lmy/n
         QF6JULsFkO28vehtd6JwGeoMB03HmwT37H2jWMCcPzC7bbvcmUOqfLJldCUc3vdC8hKi
         +HZT9nP7UYbcNCtrrEQyOioYFuSceaR5uj3bwWs8pWP9YFFAR89y2v22WXhMVk2OSgse
         O00A==
X-Forwarded-Encrypted: i=1; AJvYcCUz0btZXvJ2QIIVfcFQ804YugqxJsvwRBMnR68m1PHshbZcXNVsZUJAXQmz2BI6o2hpaR1oyDUd8VoYVmXF@vger.kernel.org, AJvYcCVxP9GjFa4eo1ZUvBCTjAwOh637Xnag3txe2BGEF2P4BeLByRz9UKVnAc2muQK+Gt9o3zvU8xV5Fx7Yy7lfwA==@vger.kernel.org, AJvYcCWQUbF/7Db3zPw5Hp8/UU0Tz9Pv5SeHbbqg08nxhzPBbREMuLbbQKXsNRq1FCuY2zkmBaYLUb/xGeDtSIKZRHo=@vger.kernel.org, AJvYcCXBAeG/msltYkYEKzbNBWDZc+Fxwc6IkPhNI74cQSIpXEaOAJCkx5ROL2E9dk9CzSUKTcaUobg1ulZo7l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZAJC79La1mXJoARuEqTwIpMO3pgqIVCFSPG8PmFAKq4Q/89j
	thZ48SRqsVqWHeqSfKsEYYyWmcwqA7tCMAz9bdAWNtFD1MrcP3lBv9UXLSHEVzSfTXP3pg0fGFY
	XCf0YN7Mu3AxzlR6eSwFPp7rLXFJaVUs=
X-Gm-Gg: ASbGncsKSmKdwJO1O4IDvXajvjxmecOLgS9R6VfKK02PLbEvwE12Yj4sDH7lJv3fgi6
	9mSt4mAGwW7gjpFwXFA2/cmjoUL7IhxxNxMmQZGR9qYKGl7SvPichUhwdoUlRmfaGhIBWe3gGBo
	C94ZEsrd0H8XVJYt7Rh9ZY6oAB2u7olPSmgDuJNP8E4QA=
X-Google-Smtp-Source: AGHT+IH+bQyEyq6sDsXwbDZZg89F+RW6fj++1an3yE4uvHwTMd4PMVVY6ZhYj3V5tERWpXQvQ0G9A/5t5fijdnpQRdk=
X-Received: by 2002:a17:90b:3ec5:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-313af1a5f6dmr1615584a91.3.1749645583832; Wed, 11 Jun 2025
 05:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org> <D9PW1NI2S6FV.8LA53J87VCML@kernel.org>
In-Reply-To: <D9PW1NI2S6FV.8LA53J87VCML@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Jun 2025 14:39:31 +0200
X-Gm-Features: AX0GCFsVvNoeNo5dJVKQqiHYIICApoPQ7dENSopl4E8cSOlBnUT1aSNuB4syId4
Message-ID: <CANiq72kwj9f8EZJocJx=ZtV4otaexbu1_vgDdTU_oy812yAJAg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!` macro
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 1:23=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> > +unsafe extern "C" fn set_param<T>(
> > +    val: *const kernel::ffi::c_char,
> > +    param: *const crate::bindings::kernel_param,
> > +) -> core::ffi::c_int

New instance of `core::ffi::` (and both these `c_*` should be unqualified).

Cheers,
Miguel

