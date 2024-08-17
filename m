Return-Path: <linux-kbuild+bounces-3067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA495581F
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40FA1F2176F
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE7B14EC60;
	Sat, 17 Aug 2024 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIizHmPp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6D757FC;
	Sat, 17 Aug 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723901804; cv=none; b=BVmVy6XP15rFEZeEneseNf9BSSbLYDdJ5EQQ1BE6mbAzxLwlptCso7zrV+NqAdixdLzJvB0AwJhatWeZlUPzXVy+MRMkE4lEH+0zeAQPHWk+Dr44Pi0g2xr5yP3pGPa1FNpZC4lF6x/2uUAf0CzDHDToSJijhhGpb0Xlp9NJ1OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723901804; c=relaxed/simple;
	bh=sy0AB5iz17nq7kNmhns+GwjqlSVrmhHMr067N4apBBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0ccxOYczSVSRosDYdJ7UKK3ddbtY98AMKqU867kx/Zd5YQV8VKRV6NcZz/cZDqktivn9pPmr+Bmx19x+h6cQvY61uhnF6yMS/4Nzn+uHASTpiNlnoDGq/Wre+lw+1EucMEOvVy3pTgR3mflZ3J7lGLIPHKxkB8cKR+v4E84/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIizHmPp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71275436546so2550247b3a.1;
        Sat, 17 Aug 2024 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723901802; x=1724506602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy0AB5iz17nq7kNmhns+GwjqlSVrmhHMr067N4apBBQ=;
        b=WIizHmPpa03aWFWHmnIxu3bP7UGXlgPGTrrex8uAMMGN9lClH19+fqntjLQNM/w3JR
         n8bqqHUKSiO77HP1jXs2N8SCD/lmS8N0b/xBkIz78L/5GrXoKnhKs4wrdMUrY1uXBt2/
         3IYE80qqowGy7dua21Y1CfsIqMuyVW6iMnFkcTmP0Ew0o4dNnq85DcfHwVCBL6poAqMg
         Qs7/7YpNEoQnqC+tl/PVS06hcxbsaXsoib6tUGZaBzWCatmSINsXG9oO+nfbR4RsuYg4
         2Yvr1RPEcyPFS9p2+UKA6E+7A1SAuqXxios1WDAA5tOjz9LNeGbmou8Cl1MUrfcw4r/2
         BX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723901802; x=1724506602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sy0AB5iz17nq7kNmhns+GwjqlSVrmhHMr067N4apBBQ=;
        b=HoedN4y5Qn8Z/3LbvD9Jzexum4esoe9/nG6X5j0RmczobWNfXP2YSpiOv6/VFNT30L
         fxw/DzQ70biCrOm+kYvWtOX6HY6pIOKiF6fqpFYd/WeR8x5T0i37w1M1/sri54jyuJfs
         TBTSZgHATj3e3f88DvwhcbnGkVzDPF/MEMTOe6MHJ8oU4Ktu7uzlbIdHaSSf8Unb8gUK
         01jtjV25DpRvWUSz7Bx6juw2yCa7BDuIfuUaMCDT8KSvgt9julM7ckEYlkKn6ZMLwngd
         sGopmsfswQFH1zRCUyOXfqK4bKiJWcGruIyVyoN/g9N9W1XHbaGdcvfFfZXoPyTAo0as
         UdmA==
X-Forwarded-Encrypted: i=1; AJvYcCU1nAt0vuNwIh54ED77ZNxfby7fbOs96WKu172JfX45RaFSmckAARzsoDnE6UXBJFSAJSSlui9ifIhAwsysMkZqV6d29FEgDT0/cFbDPIi0rmAsbfuXBNMidY7a8plQpKArQ0qgxwkRXv5Q2GSuLyoaag+aAl18Y4XwYJJw0ky4TcApqajErUpcSBQ=
X-Gm-Message-State: AOJu0YygvmaUm1wTCK5/U8VjGiUwxzm/H5oeZMfuM2sfjKX0YMDB2p2w
	V2dDsf83supyIf2MH0s76/vIaGweotcrpII+4SfbTbFRJ3ejWDVooAEqjYJ2UPKnT467xep+qkA
	v4bAqVYMjnUvy1XmWl2Z09mAxJOJcroBCWSo=
X-Google-Smtp-Source: AGHT+IH/hAp1t7BLkopNdMC3iXYCzXWGKQyV4QJtUVk6UoW9M5nliQEfLvAArDP6hc6F2iZYvVyk4QhK2eWdtQtYbpo=
X-Received: by 2002:a05:6a20:c88a:b0:1c8:92ed:7c5c with SMTP id
 adf61e73a8af0-1c905027bafmr7184681637.35.1723901801891; Sat, 17 Aug 2024
 06:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-5-ojeda@kernel.org>
 <20240817-cute-doberman-from-shambhala-6f42db@lindesnes>
In-Reply-To: <20240817-cute-doberman-from-shambhala-6f42db@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Aug 2024 15:36:30 +0200
Message-ID: <CANiq72nkBoiLUDQjBZi57OYwMpnH8D5Q4wR7XKWMry+mdwFOHw@mail.gmail.com>
Subject: Re: [PATCH 4/6] kbuild: rust: rebuild if the version text changes
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 3:04=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> Looks good to me, but I'd prefer something like the suggestion from
> Masahiro:
> https://lore.kernel.org/linux-kbuild/CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1R=
jYaqRJ1OxmLm6xA@mail.gmail.com/

Do you mean for `core` (here), or for `macros` (in the next commit)?
(if you mean for `core`, please see my reply to Masahiro there).

Thanks for taking a look!

Cheers,
Miguel

