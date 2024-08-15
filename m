Return-Path: <linux-kbuild+bounces-3030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EF953C40
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B8E1F260B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F1214D457;
	Thu, 15 Aug 2024 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kdWibJ47"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A826414901F
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723755505; cv=none; b=MfgFY/x8cHV1ayBgVteDDPpP3yRBjxTubrrJFQbzxoOw/8C69NzbqYPOqvxv7FxMW+KqRso8oZmHXQ1f0m/JUgLhu98ugGhF1v+Bou71diRt4uEaxMIvK7ym7YizF8Bl7/l2aXD41xeRbic60iR9vMTuCBk8AZ5qHrIIzCTNgu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723755505; c=relaxed/simple;
	bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ccobzh2mU/Kf+FSExRGiy7SlfJowuZMPFqifDIMa+RwVPF8nbnUvdtx5VzDcQXrk9N2/gzJVSdXp/2h5lL17J2MNPvG8DU4FD50lxs+ccuuXF72JJ0MtNtQGRjIrzy7p3K7vsoMMoaOZcue/tAcbig1JrP4xwPUPtwBHz8tm6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kdWibJ47; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-49299323d71so507757137.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723755501; x=1724360301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
        b=kdWibJ4771XAaB3oZOmRlOa5RsWRQFeF8l/584zqTw8unzJlIVuFgoNEX1wRfd7xSc
         HysTtKwBEwk3TWG0Eg3QS0m46eomPBZPX/9VVsWTZrQLPrfer8fAyh80s3M5qxAoe++7
         z1c6JcJm1riR4NpBOEdhU1wDWtkZCg0jxh6M2ei9W3LrXCot56gv+rDo/X8xCTyswcwC
         yPkLzJCFsMmXb8OOZeLcK7pbwQkrvB+nm+ac8VlqP5WV/91Ze5pA7T1SsPodpzPxrR8z
         ob9Sc98K/vmu27Q6g5YSwKMVXcsY3pNgd0NbASrl1CAiD37BmpuWKrSIlHzJjojffH2j
         CQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723755501; x=1724360301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wln7XutcBzXNU1G/NmOPbT18PRKrrWwlo2AMVsQdN4=;
        b=JYRbTW+gFZ6kA3J9yjBltusIYsJlRygdUtHoOYRTj4hjwrR0QrcJLyx3MHa+6wu6Hw
         usuObn+Cn6mNBZuCXyXKrsJUohGtI1QXXsimyjDPtFiL3HsmBQJ00TNXLS04JsJmhdsR
         scIrfZKyF7IeNdqGmnP8KFercSl4v8gVV/YbZeqYqyu3g2DJi9FcsFVtqA66FliK7ZjT
         nyXrqPJbUA+N6CcjcXJnLvcX7LTxh7ovyJiiFJkYf41AgtsrnjkpxTolXMSGWzOpKUn0
         +qyLPs9zHFqr3FRS1vFK86L6kNF3n5QM620tbvsh1I7xvddf3lnM5ZQIQ2kppMlRJ7+v
         JE8g==
X-Forwarded-Encrypted: i=1; AJvYcCVr/tCeAKkwoQuWDYb1f3SFxwv7GvWA5jWI7K1mLpsFZDf0oSxCQsvXRfYYvf/2cN3J9sDPKX0ieDiD8oVqWO+ZkdM1VYsmvvX39aY2
X-Gm-Message-State: AOJu0YwflAc0Z85Os52eWU1By4lSSSX3uhsecxOh/4lY6Fw8mbm6d8xO
	Q9IvFMZUD+sEa7+MjWNKmz4ir8T3rGKnqxgz7LBCxZWods5wV1BPwdFBxC77KDx+PzEKI4iKwuJ
	V6V/KvEySK2KuQLMO2ay1ZeBeq05rZQKY9xXH
X-Google-Smtp-Source: AGHT+IFUSrIEqWeN8wUF/yIuZkO3TaOdgNlBO3G3MbEevGKK4ytem985M3RMZ7a3GjfIZFQAPQhKhXURq+gF78oHAOc=
X-Received: by 2002:a05:6102:419e:b0:48f:8e07:1c45 with SMTP id
 ada2fe7eead31-497798d0fa4mr1423973137.1.1723755501362; Thu, 15 Aug 2024
 13:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:57:45 +0000
Message-ID: <CABCJKucPh3UA2JVn72B99T6xyTX+bs2o1G7WRXp__bx_zsecNg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] Extended MODVERSIONS Support
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Aug 6, 2024 at 9:21=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Previously MODVERSIONS + RUST Redux [1]
>
> This patch series is intended for use alongside the Implement
> MODVERSIONS for RUST [2] series as a replacement for the symbol name
> hashing approach used there to enable RUST and MODVERSIONS at the same
> time.
>
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [3], and the previous series came up [4] as a possible
> solution rather than hashing, which some have objected [5] to.
>
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
>
> Currently, this series emits both the extended format and the current
> format on all modules, and prefers the extended format when checking if
> present. I'm open to various other policies via Kconfig knobs, but this
> seemed like a good initial default.
>
> The refactor to MODVERSIONS is prefixed to this series as result of an
> explicit request [6] by Luis in response to the original patchset.
>
> If you are testing this patch alongside RUST by manually removing the
> !MODVERSIONS restriction (this series doesn't remove it, because the
> CRCs don't mean what we'd want them to yet, we need the DWARF patch for
> that) and have kernel hardening enabled, you may need the CPU
> Mitigations [7] series. Without it, the foo.mod.o file produced by the
> C compiler will reference __x86_return_thunk, but foo.o will not.
> This means that the version table will not contain a version for
> __x86_return_thunk, but foo.ko will reference it, which will result
> in a version check failure.

Thanks for reviving this series!

I tested your patches on top of my DWARF modversions series and it
seems to work as expected. I confirmed that Rust modules have
versions, the kernel verifies them correctly, loading the modules
succeeds, and scripts/export_report.pl seems to produce correct output
as well. Here's the tree I used, it includes the prerequisite patch
sets you mentioned:

https://github.com/samitolvanen/linux/commits/rustmodversions/

With the minor comments I had about patch 14 addressed:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami

