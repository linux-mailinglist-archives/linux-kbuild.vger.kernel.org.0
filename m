Return-Path: <linux-kbuild+bounces-6862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14421AA715B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1D31BA6CAE
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25F1189513;
	Fri,  2 May 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXEBB6WV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9E91DFE8;
	Fri,  2 May 2025 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188120; cv=none; b=VHdfnFtLTsgRuWMnjQWkGLOBh5ySb0XIKh9ubE2DtxXg5S8GuV9Ii0q3rMuzoh33HkRTFzBwEFnpzhPkNORtVzjgk6d8I8a/FuKjgdQVu2D2oZ1D0cnkSbJUilwvDYP4DNEVB9/I35pGTuIvNLVH/rItddDFSJ9hF1ZMkch22xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188120; c=relaxed/simple;
	bh=6E9fT5n2FTxpyr0ZTa2VRQ/6t6bNbfw2Lp15Cc2PmGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSQyAmNHhSb16xouTwbEsvUo19ppzzgWa0hxkinnEfNqPP5/Pj910g/w2DVlYXxMVfpld474WoTZZhK0m99lFJJsf+0m9GE7GBF4ckGmYMYVAmtrR3LIhWilzrPhz+q7yZLZj9sR1XhacoyxSHIezTekUOesL/AmgYwrVwGInCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXEBB6WV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so197861a91.3;
        Fri, 02 May 2025 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746188119; x=1746792919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E9fT5n2FTxpyr0ZTa2VRQ/6t6bNbfw2Lp15Cc2PmGQ=;
        b=jXEBB6WVpgct7/2FppXjZPFE8Cu1vURAb6iMaHC5iwyd8fYfWHtbm8QEDg1XyXMC51
         MTyDWefm25AsGx+CRiaiSNoeZj5mgfQ6mvWdbDFCaIeGFxXsaKM8K2cIbllmI5mplqmj
         aCBN0GbmaOvDelNxaElp3eU2yJuu2fSCgI3LehQ8jYT0GVX12gZnHH1Uwvt6cMyv8IIv
         AhQpwcXjxs7ijmkmxd5MX4IAI0W3E9fzqbfWyp/AOJd851lfnRsuvx4Iy/+ulAuiCOfF
         O/x6jG09OhcYOZq6N5baPXTaathk2R1p8euBm7ilUOi2eCHMGGLHlwr5RahKRCMJi0w3
         3sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188119; x=1746792919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6E9fT5n2FTxpyr0ZTa2VRQ/6t6bNbfw2Lp15Cc2PmGQ=;
        b=k0sxB8zmV8BcalFNdXe33DwrwUSO7+pImqyEvAgY88voMt84+BpXlzWEfS+jL/lGNt
         rKJX4XZ74D/TQumju1wWjxYza/m3iMlZRIn0Godu+yiZuTONcT4cO7qxjC6lWeW+aDKg
         m+J2gI97mtZrAZ9gGS3KSJDjVemWO8xRiZfcJh1SujPcn8CAtEQxSoIOeJopyEj6qTWt
         WzYNy/AwEeBMGA+aXsfonVeafNv7DcuRRuTfVUM0WOxXB2l5bX5A2kRAoEZIr+mDeTok
         P8uoeCjObTzqadeVHNf8KsjpnTH4p7dbK2RbRRfwuimrC+aQERnV5HZ7257iOs+2iPXM
         467A==
X-Forwarded-Encrypted: i=1; AJvYcCVUWkv1FMS8SE+OzWJmgmqHb0gwmnbqMY3+4tIp/Z7sia4Ez5HElfLY/hNf1f7lQQU4qyGwI464VppwCiKY@vger.kernel.org, AJvYcCVk5GwcsS3t96GZFq8ESgMyGYp/paum3an41j3O7C3gu1OmxCnxK0eoLrAcPvUMPKpRFLbox6zCjLI5NtZliQ==@vger.kernel.org, AJvYcCX9u0UzIA+azvt6HrISm6I5/HWW9+9TzOT/hNj3HtkV/JrcdS6tpST3kDTWjZpNGIDdxTc0uHPZmB+VR6w=@vger.kernel.org, AJvYcCXNNV5EBU1/HMHPgi4P0semT9yvFQ7XQJX9g8Sm4n39LRvOnZHorzKrevCdy7EfQFdpBRbG1CR6gcE5SwHRv8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5z4TBKAX5tHbHAJE+JL4qsbh16i3y7b9GLSodaNqTnUNz+E3Z
	vweRkDieuni73yQBFdv/XE+/AFdy2FL5TE3GnXFhB5KttFq1WVX986jiNjxvZourc/Rfs0OHAKh
	qiRM9DSqFgVvDna3+aHq3yrycM6k=
X-Gm-Gg: ASbGnctLuGJUgsmA+AjNhrwcyj2Y8FmDphsQUl1VLcazlnBjfYAijqj5mJ9eip6uu6T
	lAEzHHTMx4k3QOT2eoUYCgKSBYP04+bnBZ9+3UYn5oLHhs2Bw6prfDjri3RBy6W40yaITbA82hX
	7obOUZDJwJ7rD4pUn8hnaQKgeqfe/DihFY
X-Google-Smtp-Source: AGHT+IEBv0Z+ylh+Zx3OSITvJhfZvFYpA8NX0GvgNrAFWGQPk3PNMU3L8ZB3qYWvy1j9vJ9XPEUmNakzZRM1GQmei+o=
X-Received: by 2002:a17:90b:3b47:b0:2fe:b2ea:30f0 with SMTP id
 98e67ed59e1d1-30a4e6a2665mr1595858a91.4.1746188118568; Fri, 02 May 2025
 05:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
 <20250501-module-params-v3-v10-1-4da485d343d5@kernel.org> <GV-3iFXmYRNq0drIsxo5B7gSpLXpEb4FH6lqd_TVr7tcpFcHLuersTVISYWomKIeV3xSZ0P1HFbRBNzD_ZSXFg==@protonmail.internalid>
 <CANiq72=_gheZdZmgwoB2q6HSssoXLk4TRkJVagJKjmFTd+LDcQ@mail.gmail.com> <87v7qjxlix.fsf@kernel.org>
In-Reply-To: <87v7qjxlix.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 May 2025 14:15:05 +0200
X-Gm-Features: ATxdqUFMKExCDFdEPWkS6hux6FipyypDtth837JzQ1154T13fuBsv-PdWkw7oe0
Message-ID: <CANiq72niZcHBc1SM6X=Gs5Kc8_ANPoYTLGjMkLCU4_NWVhj0nQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] rust: str: add radix prefixed integer parsing functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, May 2, 2025 at 2:08=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> And I don't have the same built-in linter in my mind as you have =F0=9F=
=98=85

I am not sure having one is a good or a bad thing, to be honest! :)

Cheers,
Miguel

