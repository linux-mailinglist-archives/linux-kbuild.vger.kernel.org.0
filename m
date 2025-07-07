Return-Path: <linux-kbuild+bounces-7906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CEFAFB4C5
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE08618922B2
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D761F29B77A;
	Mon,  7 Jul 2025 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgeruFAl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D350288CAE
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Jul 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895554; cv=none; b=YQvhKXUylh6lLUDobo18SO3QmhHIcHym1On0IO50T/M3keKqbP58cJe884kZevHIdYnABCaXRR8+MWEPVluBjP9zzmIpj1Pdga7cN3Jsnxw+xSwLYe2m+5ORgKnmxUccb2zPbkdaJVNdBvgMHTPWejdv0TS/K9cf5pDhFJh3pS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895554; c=relaxed/simple;
	bh=rSVN+37OZ1nxxk0c4XpB4pzH8Koab5xLneDmAWjx9j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQejLkX0DgyPjSEvbIxUGbuDh75EsTYY4VOI3MiKIiM3N/nlxQuj84LCS72PsjMQSB1eRiDsvwZ4bro/UIzqg1/QXnrXjJm8lskIfoxgJ1JgER9Q1RSlBQLL7vkgYazA3GwKGdpDEGbdBSfh7Uih/J2kxH4f+mvPTbDshAq4/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgeruFAl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45348bff79fso34417565e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Jul 2025 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751895551; x=1752500351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FB3akW2uROgcxiqH7umM6G5loDI0rtj9L6/XnUx0ZE=;
        b=cgeruFAlQMbMVDkMS24jz1ZYefPwkPp5X4CLsNx8OB+O1XKw7vxVEQCTLd6RuJZIaf
         BE1oe2FpKlXvodaQy+g9BzGFuTs/qyAhkWBggTZmttg6ivTqHUvDiCWTIvlIcYz8KDAz
         R9qi7kSQOYF79VdbWE1Bhdi05FfOOoLbwrOmZO9BI7SmHUqTeRBdxdvBE1Fje2YIP5KT
         phFvVHEtPA9Zn4V7DeRbzVXCnSQQqttYgewIM/9EvsY7Xu2ZPB5kEFw0Bb2rW47ZwPkF
         SJogtXtIBVw7dr+kQUIXPahibcKERSrLKz5CqUmYQzREzf3Q/8CscVPcTx/vbjjh+kHl
         7FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895551; x=1752500351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FB3akW2uROgcxiqH7umM6G5loDI0rtj9L6/XnUx0ZE=;
        b=irpRRvNXmoxjEtoZxzhLo9Nz7v1wNfeRMG9nF2LqJZ+xEfYtdC/XOkU3HP+YiYltwW
         4UwMacaM0t4TLCw7YvbweBYNwI0wQ7LMJx7Xq4wbYtRmDJASOUJO1935sjNy+5qVbLur
         hONOnh0xEn8OBRmCqbmT9BR9QwZApn46hm3ClbyppDjoRLTno9czrL9zbXv7WGRi/z7D
         NFDNbi/3C2sIddPo5t96zb2mGDvXwPDQFUL+VL3kG5snXulEIZr/KPXZGqXHGNUsvl9Q
         +wIVrSbFsCAlSJTZFAiugMXibD8uDeFkYRDgSbcMLca+S3HzcgeaAdifWKn55fVDNOlF
         0PhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg92fGXeLmzHXxo5wHtDYl+jHbrVx2ph8zRFvbAw5X0F4imtmNVTLm1GEMB/WMTxa+H1pLGeGGW+HGRvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX90d8jdpKXJwfcQpGOwygVy2jNsF7MPEaxLTwck1lMBBccFTU
	zfoTqYKQKqmGyCHdGs/YWk786h4qtqol3I7pBEfh6+wucmG5vYKsKSn3g9JwuVznQxw4Qns6dWZ
	REPc3Oy4fMGyLSGxIlnGqNURgB2brGCErNU8t6h22
X-Gm-Gg: ASbGnctlWOiyZ10Jj46dQDQy+rNs00SDA7zSCuKKJAuVcl8TQUYjFpCu8wkPcTDLyti
	Bis0jk8z1rWZQw9dcYL86u8N/0DQ5rb8ofgMiSH1wH6EpPz7VrtUUjOL6HycKZfipRvBLaS1o3X
	f07UkG22jrM6NhLCxGEV4gC9/SpDyROxk8ABQa18O21KlQMltBsTbTSeF/8wf6atLVX2s6OFTP6
	R24MCSY+w==
X-Google-Smtp-Source: AGHT+IEaUZnenYQLKgYyVo3pyfBJMB9pXTg1TRSCW3BPSEm7LC8Pa9g2F7WOtEqZWQqlTsZ6zPdnN8WIllT+obQvkzc=
X-Received: by 2002:a05:600c:8594:b0:450:cf42:7565 with SMTP id
 5b1f17b1804b1-454b51126afmr73979285e9.23.1751895550535; Mon, 07 Jul 2025
 06:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org> <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Jul 2025 15:38:58 +0200
X-Gm-Features: Ac12FXx_fVjA2nF_nJiYWwsUf6PmudMDj0J-14ydNb016WmDb53IS0-a5p2ihe4
Message-ID: <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Introduce the `SetOnce` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +impl<T> Drop for SetOnce<T> {
> +    fn drop(&mut self) {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> +            // contains a valid value. We have exclusive access, as we h=
old a `mut` reference to
> +            // `self`.
> +            unsafe { drop_in_place(self.value.get()) };

This load does not need to be Acquire. It can be a Relaxed load or
even an unsynchronized one since the access is exclusive.

Alice

