Return-Path: <linux-kbuild+bounces-2462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5992CDDB
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 11:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64427281786
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1CA18EFDC;
	Wed, 10 Jul 2024 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3l4VhBK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18583A17;
	Wed, 10 Jul 2024 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720602293; cv=none; b=HmeYxsBFWAZEYod9eHAblptXM1IEOZbP81+8QTizbwyCxZTM3Hao3UZjm1jXvDakOB314CisakyvJT1mS0xZmfjcoAIcCKQru4R4ZYP1f/UdDY21ZRrAlAysn8h2E4wUrP4vYgF3TTCWcCPHgk+K+ldqv1h87Z3lfEX0adyCjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720602293; c=relaxed/simple;
	bh=DLL1xT0k5HfjitQkuRMZipxTQ7kPrbtJ5x/exRvIFJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yz+GS3Q1rw1yBwba2EkK2pN6jBy+Svc/HiEQ/ghWSg26TNkdcD2k2tBWoPHfLtHdNAQoRhhQTxakdZpyevYBMh/lNn5LOaMNWm17/EpbwFHDzUzFann5DDXT23tZfOU8pWCV3kS1dLRs5RhtMARp9otxgAHBBm5nmb+EO6XQ4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3l4VhBK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-75fe9e62048so3329630a12.0;
        Wed, 10 Jul 2024 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720602292; x=1721207092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLL1xT0k5HfjitQkuRMZipxTQ7kPrbtJ5x/exRvIFJE=;
        b=T3l4VhBKP2VaFnNQkBAV2kGcT+x1IzYV1siWfb+Ojyqk2yNkve8u3vUW9RXfnh8HU9
         LTvXHikvkRVPl7Gx8poRMrM4qFF9tufbutit3UD5Yl1RkHQLYU5ay42XQrB2r13J2byL
         VGlR8TFXZyg6+cVNb3EVstd2u2Evqpg/zrj1lhj4WQEP6wM6wqJcpulGbqLRbXMhoHL+
         D5dGqvt9BNP4nhHygHjUEfjvOe7XX03RWo/btaB5e+t8H1e02D0kjfxd7m1x5k/hQ4Xr
         vbejDSgv3ZE2N8y+JnZWkhce1d/omV2Ff99brC1AfR4264gVxJhRIbRFV/bTvN3dzcBO
         /ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720602292; x=1721207092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLL1xT0k5HfjitQkuRMZipxTQ7kPrbtJ5x/exRvIFJE=;
        b=q+4LeuLKtReZpqLLfSbjlIqloLm4V6SqEodxPGmBjhTyCeB+OOpfm+nG27fgaaWa66
         jlmnj+r2K2n6PtXbW5TCoEGBQwOoQ779wE+5pauIjm+ZtiJQ/UcuTA4sG1iG3WjRApF+
         cB+kdTgK/8UBZFdrv/W0KqjXSLzzdRQyVDPuSiBQcIj4EgCz+XZTIinRwlCZThlPhV1K
         YE7m5OOtL05Sy6jJRs+GqmRSChbPwMwWOBvXXCLs9GIZtfbs4rlQi4bDzGU0o6TPN4PV
         WtDh8ZhTB/SC9c4nMHHrDzPeGCxGR3iLen1GAlCkM0QQ6svkE4NBchvk0cGOiD2zbEMj
         +d6w==
X-Forwarded-Encrypted: i=1; AJvYcCXHlrvq6ML4vfZZgkuoobhy1s9hH5qXOzNm+Az3BJOak+Uoc+EoYhMgv9IZRdJc3XThGv3zbKuQQtaBTXh68Vy/CXTfAKOV1MEKDfyAMHao3FDkPXPban5TuB2KRelhokwFy05ipoYytkhCJnP+bi8ZgI2nP13NqptrA1z0oXYZSvv97KJbT8We+s6s2eSoBCW908/Ztnpq29YNf53DhQm7RqZsY7xZDyqFyXrXZLUcX0Bz0/YV3Z4FKPMKefzdv1U=
X-Gm-Message-State: AOJu0Yz0OwyKjNTSv21Y6mU23TXJQNWHwLr23xkPg9Q7Due9ov9YRFLh
	SbjXqq4Zq4beUWtAFj7599L/uYZZQhafoM2pyCLuxsMM/49YAhRKnmow7lL2Z/0vQidfODHqpMd
	04MormovuVfaUGA2k0o2uFnYLQwc=
X-Google-Smtp-Source: AGHT+IGd/ocnQeH814AHjmzEOnDp2IpB57VMlUlLakN67CAmTn7bF++fqYN7Y9GbomXoia+gsVx4qX4rLya4UThHdk0=
X-Received: by 2002:a05:6a21:3285:b0:1be:cea:d381 with SMTP id
 adf61e73a8af0-1c298226c3amr5645713637.18.1720602291779; Wed, 10 Jul 2024
 02:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709160615.998336-1-ojeda@kernel.org>
In-Reply-To: <20240709160615.998336-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jul 2024 11:04:39 +0200
Message-ID: <CANiq72k9C2NY4nYyRQ_KKPbNsDvdaSG7vPQ-fzo+2J1x_-prLg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Support several Rust toolchain versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> A few things improved here and there, and rebased on top of `rust-next`.
>
> The changelog is attached to each patch.
>
> I kept the `Tested-by`s since most of the changes are on documentation
> or comments, though I did remove them on the patch that changed the most
> just in case (even for that one, I think Benno's and Andreas' setup
> would not have made a difference).
>
> I plan to put this series into `rust-next` very soon so that it goes
> into the merge window.

Applied into `rust-next` -- thanks everyone!

Cheers,
Miguel

