Return-Path: <linux-kbuild+bounces-8698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FAB42D54
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 01:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E07C486290
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 23:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D492E36FD;
	Wed,  3 Sep 2025 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+jiA0C2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383592D24A4
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Sep 2025 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756941877; cv=none; b=EQ5JFFfJ3P7HNzk6xR780HzpQTOViLW7Oo1PuhjnQWZXfi/X6BQhXBFsmgpXPevPsxPPqqT8laTiOzcM4bF5P6N0mkwU4/SGBdPwVN1qUYKoAbmt5G95bU7ehXErfWfL6gGLZ1ccP4yR8wzN7nTCbaVTZ8gh9DlkG4U5lmt/sVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756941877; c=relaxed/simple;
	bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT+lOJU+EeeHGWe7dizqlV60Gk0jkqTrPinimJkWoCV2rFTavJf2Tl/Xc4WTp9SA3L48hwcbYcjM4DsSnWES7k8szEirrrtUHbT7OrAIfvQEgIWZf/1d+8z2fzK5Nat6hlX1P25lcCDiQuAig7RdVUOjJ8uNOxzskjYBtErZhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+jiA0C2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-248e01cd834so895795ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Sep 2025 16:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756941875; x=1757546675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=V+jiA0C2RjwX8ScbZNta7MynuzYXFGc2IIfE+usbgarS91pSVBEJjZWLAeVk1RrdAj
         ur/LCGIFpsBfC1rfQjwn2i9r6ecWVTdN5Kt626i5RQtOiL+hY+I7VuejshT7xFZF72Lq
         +/W6J54km3q7LNcdISOp/AApKmCrAnXUbCfhKIT0as3sq53s7pQzQZjNpfNIXVg7x9cZ
         Xb5rB+XPg32cojUEkc0C2d3i1h5e0HRy3IEGB85i42laQjBfr7Gm8xJxB5Hif6HuKGee
         WLNDnSL7f9dtJvn239arbuM9EX8lJUBbIu3RnoMLhmsEIT/ohek7CnMe+Hpg8XnKuFnY
         JLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756941875; x=1757546675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=bA35x4JOvo1Z8zCzH36ex5xu3laJZj43qltq6E0nvrtDY71DJQBT/GFxeodYBzMrX9
         ZNqSJkoJgCEvi8zwA60OD2CorPkmMb2c3nPpTfx1e0gbcVSPdZBOsVCg5nceJZC3hr4y
         NOnMmNT98V6iI6xKHqFGJ4Znl1UOlBd6cmdzydonvlQQ2zTwDi1LzRYbnP8FcV6EXA62
         cspSRLV3epk1i0KMdzcDM6qsvqvElj3o7+nCZBWBa5bDzGZrOkogI7lKSwd4CqNflMFx
         4J6UDEpdcbWBJcPw2NBfEvAUSRMDDFBUoksqxJ5hgjoqSIYsVisxrxbZRaH+U/3Ya94L
         w0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGFKmbHBzz3zSN0afVUb2DiezzNtFMICEND3cSZnM4Bzdm9tBR8pTTD7DQdq/KOlR46KPxgJXGUWob2XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKO62DVkYuIR7enyY0kk5uDxDcRpkXg/FiRvxHghGUU0omE3FU
	xnrQOKmsFNJiRW9AcHK75fKE1OsuT2bi3L6Hq3flCn5K1RwPNEBLW5YOw13M53cqGy7Q37cDW2L
	O6f3+aptAnw+LnxTHfYQC0lDfW/cd/js=
X-Gm-Gg: ASbGncsP6lVPvaZvN6hz3I+5B9ChbwZ6MvPeQ/xgn1AcFN+RIbNqKuysWgzhXpqYp0z
	8j0OCLhfsVkSiVhtYY4ZAL8dlWufqjwAQZlm4exiuaX8hUCgWhRIb2mbpjZSqMO7h5xVt0dgvtt
	KOz8zpAHvQ/SGEO3pFi+7iLbmIggW5K027ALn/jaeV4jZJhNZ40Rbqak5DeB+FHYyUmN07RzQWG
	KxB84qjmWq3fYlCM5WoyTji8uAY8OeLCI859rjb0BGH+tqOYEf3JAbiVzT2doFrb/TSfDZgjCcy
	qc+aTDThM194dnYhx3Fca3oXCgsf6DXessd7
X-Google-Smtp-Source: AGHT+IEjlWFuPMxhtD/Mq7OZwOStvmczamQHMaG5FsSJXT9epadmoDRef8lNJ29rsmcfdJHBWLObAXkHao0s90DS5wU=
X-Received: by 2002:a17:903:1a70:b0:248:847b:8906 with SMTP id
 d9443c01a7336-2491098b4c3mr158698905ad.11.1756941875488; Wed, 03 Sep 2025
 16:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:24:22 +0200
X-Gm-Features: Ac12FXx5iwHLbaJ0TZ88p_k42OqHbK3bT3Fq9WvwJC3yuhfgjLr0qE6Io-xqWpQ
Message-ID: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:08=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> Decouple the code for getting the version of libclang used by Rust
> bindgen from rust_is_available.sh into a separate script so that we can
> define a symbol for the version in Kconfig that will be used for
> checking in subsequent patches.

Hmm... I am not sure it is a good idea to move that into another
script. Do we really need to intertwine these two scripts? The rename
isn't great either.

Cc'ing the rust-for-linux list too.

Thanks!

Cheers,
Miguel

