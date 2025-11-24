Return-Path: <linux-kbuild+bounces-9793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411DC7EBD8
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 02:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 564714E1C49
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAF623ED5E;
	Mon, 24 Nov 2025 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm7BDSRZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C2E23BCEE
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947486; cv=none; b=TdZa7b2Xb6shh66koDMxAsOe0Xj2HgdpV9nKcX6s+yvE9fV+kIA6sJcUderXxwaNytE9tJNhNS8kBCglwddYrbR0+jmNG+icqaHawhRWnw1KWqQQBtuJnCL/hJupMU4x5qwIM48IpzsEl6QEHwrQ4n3lp14Zq88YP8Bnnjp7KSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947486; c=relaxed/simple;
	bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFBtJIqxMupB9kZsylw7yVySnYAP1Mj7oxBNSA895XYptUaey0vV3UwUHkSjvdc84Inr+U2m+SX+iJgdvpJIIdDWw6vz00oGPqg1CewKK7GqDYYmEN0SfbZadgROo8BriiNDyOkTMPxHG7Iv3IVSRNc7jBGwHBZo2k5ZhMCNC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm7BDSRZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b90db89b09so371997b3a.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947484; x=1764552284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=Nm7BDSRZdRmYLOHm2fsf27q0XdaiVxNvLCYyMaUHcr5vm/oHvUj8SaAmt+Te1OHsMX
         UDlm0MskGrTf94kJD59rJomz0IotbvAKECv8L84Du6fjioXyKfXC3qbHTBXiLrFKsp9u
         vECIwhg2EhjxVMb17cYGUuKnpY7BnYaluLd/ebCyX12eBhGLYjmR6XfAoyiHi0smiy3f
         /MbhesJV2o5NkUzVX8uBK0vbIcuPZbUndIM+sytRBHpKxSPLE9FCjs68LGCZyRZSED82
         AzQuZI/lhXcUj1IjBBZHKg8Z/dJ47ND1qHwVEqgFrKRuNKLBwRN5p7vfZ9GzSnoO+9gg
         PFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947484; x=1764552284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=aivrXZyguQuGA7NDlFmZIicgomhVdVh0rUlxZfQwVFBFZ11ZNjldWUdHH4ETiOasz0
         QJTTaGkyTlr6+s9pNYr6ERXm0mQxxB7sgXo9aohaL2NAH6B0Lc2RbdsS50nn16s3/F57
         KTl2MJVWP9Hs7MHehn8Ws2WO6oI3EC33hBQVxUHCtiHL59r5SW8uY3Da68sHzVPffkSm
         9NuID8otDpiZBFqUK8lRqINMhvjXrNsUpTBu5WJl+W890kTdjwdgwAZSrvSH/lIL+bMK
         X0pclKXMCOhiROveUzHL/k2sWE5sLUAPJ6s5q5x+x/XUZRrA+backUBYab2jrjZk8Wzj
         EYug==
X-Forwarded-Encrypted: i=1; AJvYcCUR36y9SEtp3LJFOC3ms7B28JFiZ8a2Picy5l9pVrq5f/AWA/B22XbQ6He05R+4Jgxe66ZkTwI7rX0z+9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJF1JgmC2Z6jb5IwsJn7ZWRLwbUo4Ashm90stqDaIVSsGqWIKZ
	hemRxyaTXXqtE9oFx5AUICGue3tWWwXjtksFtotTipVo9F4K5Lka5Ht2kqx3KemZCl44/wGCngs
	fxgW8JTNr+hLd3Zi4045H6maHdMKFn10=
X-Gm-Gg: ASbGncuCIH8LZptHiBacX01xQiJ6IBTRLpPMd/FaXtBIjy1JlqA5z9YhMM4lKwWtfq6
	T9/aCDa75th/3YM+d5FFwuWeloNsejv+FMkwFL+XMFGf8tVV18LZ2ZjBuh72grL3dEVQc+wRYXa
	Qe+FbEaD5JkdQWp03K6mRCcfolO7tQEyVjK7DODtPQVqt1d1v9VW1zNwhcOlUNfsWvU2QFzXHzx
	tTCbBaMtOOv5IcmFpOR7m2ciIfS7i1cQbGCWODtXH++eYwYRF1A/kF0Z0g+FGWyms18mlpI57px
	Y1ojVREoiu0f+S0Br/T6Djy/pIS2r+YLIb/2EaanJno4IAgauSqpOkroS48quC0Q0nGWAufC3Bd
	XbMGc/M0BLkB58w==
X-Google-Smtp-Source: AGHT+IE/FDIBNqUZA/G/+nKiTfBaSa9copxgf7FlXf8Svbk+fth/f6d611m28X3uKTN8JNKPOU1LrwubVCZnNZk0CiM=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr5377066eec.2.1763947483691; Sun, 23 Nov 2025
 17:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:24:31 +0100
X-Gm-Features: AWmQ_blKJN1cEm5aJqBoq0agAeCfqxj6IncPPqpzjooJxt-eYO2MrWfk7cdiYl0
Message-ID: <CANiq72mJqN09FvfjDeo+WBN=Pht74iidRxoU_JcMfXV6oMmKEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is undefined
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.

I normally suggest putting in the log the errors in case someone
searches for them and for future reference etc.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

