Return-Path: <linux-kbuild+bounces-2750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611D941567
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 17:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A255BB2542D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 15:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781D81A2C33;
	Tue, 30 Jul 2024 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MNdZ2l+Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4C1A2C24
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353094; cv=none; b=UIjHilAJoLtc+zRzvraqaptTBBci/TFBCNw+SXVWDSNjBp42pKyAZRnkCX5nNIqpMGOYCTnxtdjRaqwvH2O+BAm5QT87j8jRN2J6vLFS/dsLWUbJTdDlIif8wlTXBj8Jq1gzVddJZAA7R7FaMJveJOWgusYl3g4TR+KDfZ0/FVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353094; c=relaxed/simple;
	bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auughNQS+NIiD2zE6Bih8Ty6/M9Aie+fjKQRTBJV9OJwwrtj2/wbEkRxEFmLlq0k2qN7K2pUVz6GvMDWlMcmM7CCvsXrXF+8fUR4nEfqtPS16jEAXMytxd9UvhTZEB7Qhd9u4z0z5dEYVYW1oltbCEJnS4QttintXALMHocoli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MNdZ2l+Q; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-49294bbd279so1121803137.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722353092; x=1722957892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
        b=MNdZ2l+Q4AdUSxfF9OoIvo0ieqPRa/q4SrfZFQ17cwaEckVKWbeJZuEKUnGcyv9S22
         qqXtf3llOHuNy26LoFFvEJVSaButALFs1LkyO636fGqVsAdLoTDpWaMwDdRXTnvGyzZj
         VSd/GggKrtf6tZ1yFXe1JBHsmIPOBa2NLVXuIjSIz+OTvFwi9W0C1zjRoYywjNDx2dlr
         dR6qCTyMH0v/Tycp6UFSEL5lePh2w0kDR8KUe3e+FHfu6l3/X7Sq2e8WeWDGD3CNgV4o
         sCcmFq1IsGfPEccOUYsrhSFDppO6OUy869WS3Ckc8ogUmzckpvTGexW4F4A3sPnslfKv
         deig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353092; x=1722957892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8nY+pHNFj9D8pwHCFKbu/ijSROQst+YbZBSOdpMZyM=;
        b=JNN5fkZ8umEtQrxMUQNo+cHsYdfMtpZLlyCJ11qnV/9F1bKX6NzxXzt7g1w315gcU4
         y2wAih5GimSG9vc7z1IrDMCQ97D52SbK5NtrOzE5wC1wsO3blJ+4OOJLdYQ8P7kBwiQW
         fmbdv3bllFkf5vAUrYY2wvlkbyRlPEvLNs6XNj45NDMyyP6LAXR7hItvDuS7GS4GWBKc
         YTqAlZM42por6k7ywfZyqOpj55hKwxq8SGIBRvtNeMpBs/5SpcSZmmL05kHCiwRH0MrI
         vec7Hfmt/vDwYDLPmgx/hZVOo8PQHQgVf4Gy3NEF6UqYmd1Fl1R6bPeydnhycmdxTUM6
         arjg==
X-Forwarded-Encrypted: i=1; AJvYcCVr14rLDi5nIxScQ3n7Onf9CgxdH60+/vUoPnyqw8Itq5y9DLj0hdPW6oaUw8E45YsLy58I4b+G+8nxm0bv1S8aeYgnQ4xlb+L91brO
X-Gm-Message-State: AOJu0YwSmxKDhMI2lnNi+pSU6svtc50RZ/o1Uh5+izkfgr2vngKv4wnB
	nm7xSWZdWWmfUgbU9pR6iKOoyPATLP33ZMtPoGTjAI9NPqCnVPk7NRgUhg/LvpXyUJoQSrNsK3o
	MsKtbXsTsgEz0jKf5ebI60kprvQCsIkMO84AM
X-Google-Smtp-Source: AGHT+IGWZrBHsTNI4EkRkhI8Ci3ZbFoE87iB5xIfey9XkQ8XzTovCnYBXiW5sf7so5OIxkQsEATE0jbmLUe1vkF0BQc=
X-Received: by 2002:a05:6102:c8c:b0:493:d3c6:a59c with SMTP id
 ada2fe7eead31-493fa437516mr15063344137.23.1722353091682; Tue, 30 Jul 2024
 08:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <20240730103236.GK33588@noisy.programming.kicks-ass.net>
In-Reply-To: <20240730103236.GK33588@noisy.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 30 Jul 2024 08:24:15 -0700
Message-ID: <CABCJKuf+=bxrZphtFZ+N_t2whCS0gx2GVHybTzcNmY6TX6c7cw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:32=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Jul 30, 2024 at 09:40:12AM +0000, Alice Ryhl wrote:
> > From: Matthew Maurer <mmaurer@google.com>
> >
> > Make it possible to use the Control Flow Integrity (CFI) sanitizer when
> > Rust is enabled. Enabling CFI with Rust requires that CFI is configured
> > to normalize integer types so that all integer types of the same size
> > and signedness are compatible under CFI.
>
> I am assuming -- because I have to, because you're not actually saying
> anyting -- that this is fully compatible with the C version and all the
> fun and games we play with rewriting the function prologue for FineIBT
> and the like also work?

Rust uses the same LLVM backend for the actual code generation, so it
should be fully compatible.

Sami

