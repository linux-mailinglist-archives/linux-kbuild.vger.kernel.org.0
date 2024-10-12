Return-Path: <linux-kbuild+bounces-4071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719F99B508
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 15:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D121F21FC4
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 13:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59653154BEA;
	Sat, 12 Oct 2024 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QumAgF0i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338D1E495;
	Sat, 12 Oct 2024 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728739055; cv=none; b=XHNL6soUQwmz5D2K8+ZZlwA8D9AjGsTAp4j0rJnxhszlSS4Zpb6iplfCouiweIPcDrYFS5VfVPozIkx+RrvmJeFj5sLvaDcKeIw57weDGHC6khJ07v5oPaiJE2QsatnjjovhHhvouBlhk8GhlZB/HGKzaVxIIj7OvUGRouGOVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728739055; c=relaxed/simple;
	bh=xgZfJNYdhhPDhtjfhoXI7CrZCDHbecxJyWC/998fJZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMNgzYKlFt7/vf8ZL+0MhQTRu3A2jhvqhBSTD/A9DC/dSEmW/uSOKicJVICVsRJFV7P+bJwzoacx+M5IzP6oQN0cz+cK1qL0m5BLeilktrC9+U+3gEdoCmLrgYGfVnSgH9gvBb/CvjzYQoR/gAK5P/O7P1uHINuwWVIwPEw/jJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QumAgF0i; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso500338a91.3;
        Sat, 12 Oct 2024 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728739053; x=1729343853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgZfJNYdhhPDhtjfhoXI7CrZCDHbecxJyWC/998fJZI=;
        b=QumAgF0ihMEXu10ADJ6faM/YjZjJq3LcHXtG/fdxnHzOAQsdPJQI0iPdfmCIZ9YICT
         RUebArL6tTj/Gckjg7dSgvWSYNfkVdJFG3oXV8wZGD1iKb52aymM5hxr/hWRh2VyRSGE
         VOXFG09/8KijyCPGPdf5wjb5xl4qfAxD3V08d2eFptKboomasb6ZAjCrvy34farAmv7d
         FeKneJEZS6l4u9hc1anC4fWIEOCwiy25tPfDOL7sdfFK0lji8qH12sgid7MLrTMRKShz
         GudO2LrQuyTdXf265mpG0uw6/L0N3uh7nPpeNrti4WLQqySKLZt2hRdiiOVnyfGTzhDh
         wfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728739053; x=1729343853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgZfJNYdhhPDhtjfhoXI7CrZCDHbecxJyWC/998fJZI=;
        b=Kk/X8cqh//K7oC6p8Xjwt83J5gEs61eKI8pfYVimJkojNrRO+UW2VbhFA1/EcwX/1u
         atbFDloQKDoTycAVPDBDA883aqu8+xbns+7Tr6/RuoG7qCFhYbJgJw0MTkreNmR7qywU
         cp3V83WG5Yob/rvC7V6lbQC9dgnGDUyhEdVl7SAeDby6CYvzclN1FvVh0SwARArhcwvY
         JsVNUu63npZJpGLgKgKSVkLH3XXg38riXUBut0pysGD5Zaxy+oI8z9NXeQ1enYb2MZuT
         uEUQQ9KWr0UEjW5mhZS+JngqrMxZ8AqbjB0vBreNAW/SRqjLLBl7atzziUdnF5IWR1Js
         oY1g==
X-Forwarded-Encrypted: i=1; AJvYcCWurJJynmuxaE36Bb+SEhxKAQrltgPfnh3hXm0HRw2c0GewfMHhMnC9Vni7lsVhoUK8dZv4FffT/v59oRGq@vger.kernel.org, AJvYcCXY1DduSc/EDoKtHRHfVrRVaghx3tOzzTE1atKN/TAB4pACv1l30wo3FQDVmz9PnX0gZMz5/UHTE6dKx+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuBMXsgCwuNY50Zrty6RCYreyVwulc0eLdRmAfVf6KQ83N52M
	8XmPK8XhKqY/2uvsnhC0WoCEDcc3teh6hLTarfQWUINOMlX9g/j6S6QQ/iZ1PTXagnL6MBxey9y
	NTo0kBkf/7dRmRq9tAu9Mg8Pp6f4=
X-Google-Smtp-Source: AGHT+IEZd/cwSvOoIv+mfTP+GVRyAoSKqDG7m1LDad5T0V+zDZwqhRqb8F4Mdz9mMMcSLh37aodT3DoPys/rDZM8OH0=
X-Received: by 2002:a05:6a20:3946:b0:1cf:3130:9966 with SMTP id
 adf61e73a8af0-1d8bcefaecdmr4034221637.3.1728739053004; Sat, 12 Oct 2024
 06:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
 <CANiq72kM+29COB6vPQPotXqT3acdbrEgdjU2K6FG8gZC0EEhNg@mail.gmail.com> <CAJ-ks9n=Y_FAdRb=YAaCEGT-y8RP=ssOgBiQtb8T7s+LRBBBhg@mail.gmail.com>
In-Reply-To: <CAJ-ks9n=Y_FAdRb=YAaCEGT-y8RP=ssOgBiQtb8T7s+LRBBBhg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Oct 2024 15:17:20 +0200
Message-ID: <CANiq72k=+iUEESsiv8JUYehEFjoK=hUae3kbddyb3+qaJofpAQ@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
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

On Wed, Oct 9, 2024 at 4:48=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Understood. My guess is nobody will care about the process spawn in
> scripts/generate_rust_analyzer.py. Someone might care about the one in
> rust/Makefile, but there are already 4 others. By the way, I notice those=
 are

Yeah, I was referring to the `Makefile` one (the other one, indeed,
does not matter, as you say).

> using $(shell ...) - should I be using that form as well?

Hmm... I assume you tested the patch, but how would the patch work
without it? Or am I confused?

> I guess that's not for me to say. It would be great to have basic automat=
ion.

Generally, when submitting a new feature for upstream, especially one
that requires new testing, it is common that the submitter is asked to
take care of it or help doing so. I guess, in this case, Daniel is the
one handling the macOS support out-of-tree.

Anyway, we may need to use variables for this, so I think it is fine
-- upstream can keep the variable working easily, and out-of-tree can
test the overall macOS support.

> My apologies for the oversight.

No worries, thanks!

Cheers,
Miguel

