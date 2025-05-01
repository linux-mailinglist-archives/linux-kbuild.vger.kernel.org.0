Return-Path: <linux-kbuild+bounces-6833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E72AA5CBF
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 11:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181789834EE
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 09:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADA019E975;
	Thu,  1 May 2025 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0RPdiu7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB73155A4E;
	Thu,  1 May 2025 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746092853; cv=none; b=JxFUoFH+/k6fAEFjN6g6vV7VvnAu2XqEmVAEU9giWv4QVzRTGPGn9r+NUu/iiNhGJcFJKwXHNYzYTwtSYcto6MO23/Xj8YYFYT7wOhU/uLudaVL4S5THi+5k0RoP+UHKp0gQRwAghWG1TlADzKe4cOaBUWDh8wYeR5tOgtanOXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746092853; c=relaxed/simple;
	bh=hRKuolhB1zUftYWN3jwmzDkr5XOnbczclIJqoj9/VVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAHmnQJgDM2RV5tuMt8TRmKZ/JQgVwFGrOTtyccjQ4z0op4kKJQ0/CgSXo1wflIspCbF5UlrbF02Fq7oRNAI3J9TUtuEKtxj9JfEZluJsOM43Eq7khrW62AlrwSoVUgHWhFt5pG4qoVeQV7ONvNblrUGoDGhchl2Lk7potiM+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0RPdiu7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de10eso1524795ad.1;
        Thu, 01 May 2025 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746092851; x=1746697651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqI0gPUkc+GqxzU4hYi7psCHGG3LY42LoszC9MvYK74=;
        b=b0RPdiu7Bw3JffNbMg+hivogLs8Uz6rwlRtWls9/jL3GMbhqZETi5J1sU7VA/j8T5l
         7vvlnt3D0xjZrnS0XaBfAbhbfQSR4kKECCFVlpcxsWyFCbbnz8bie5eK6Or6rRIAZdKM
         9hkQR/QpDd6bXK4YK8tw3IBHSKxwE5tB2xsgGYnowNqnJgiIZTf3UR5LjFrMPtfJsw/z
         WMsiX/KboP7hBD3lVYybLY8veihEUnURiIwaeLVTx5AfstZfCpEdNUfWBCuXRIbjV9Mw
         3yfvwfVlI0uaRN9djFPEy3je/gkW1vPrNZ+xnX3TxpdKIv4aFW2Siad+mdw1/lqAAEib
         nieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746092851; x=1746697651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqI0gPUkc+GqxzU4hYi7psCHGG3LY42LoszC9MvYK74=;
        b=Najwqs8pPJr7W57Epjt9ql41a2sOib5BZIllhMZmO0AP0BSLJvYmLenn77S6fYzPHI
         sCkAu9fHUu5enhStapbIWGi2j/B6XWv1s7Dg+tgjWIEac9qi0kryNFAf3+UDxC0a0tvz
         aL/Mz8kLGTxMfIHFXuHB5Dsi0pt3ZvLhQ8YePg+wbvaO+5AYHvw53MXhNyqUhOihaeLJ
         6JfDLi2R0YhEEz0so+aVlF/LcLFB2IW/vS603wuW78tMZMzO9AnZ48MegrAkHI8mhgrW
         k2GFuwZdgH9ztuoBdPUfqnKTdAYkxSZMNDm2zVl2qQzNFB5YEPY5k9k0khREwLi+gQIC
         WBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMDctPKwJPV0H76g1R8Dw25zG6wvNm6KOwQt709KJq1M0wBHd9285OIwaCIe/kOECiTw8vyVhZVwdXz1E=@vger.kernel.org, AJvYcCUuchYy/hG2FcTZgTBAqbXwsI21a0xhd2jpw7FRENxO/yWIrxDaQ2qff8cNEvkrhyfIQHvQlxVyWIo8rXMa@vger.kernel.org, AJvYcCVmIziPWGFphTP/XAmeO3D4auWVpuV+s3heTrKQZY8zfPgL9YR5mgjVF/s/D0jienQVx1By2iWlYxJiI78i2R8=@vger.kernel.org, AJvYcCW0W/gQIqL93uT9JVGey5hhlCjJFl+wpktRn27y9myS81cxCZxYxpIqzN5fWecdBWWlgHL5ZIOMLMG+ps7yvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoz16mHzF1HEvBjG6GxbFyPzFMlWBeKqeXZ8ZRfcbMnGxVc5um
	G2ijPeZ+NqIyG7BCK9PeyAqmfGBy5WxQGnZC7Wc8qqasF0oVWNAsjPjyu1D7WbS7osuDV7occgj
	c/zMVVDx4nttNRf+Bqdv8bBvPIMY=
X-Gm-Gg: ASbGncsRD4jIRr1BRSI1TqQ+Le2GbzXZQ2pW7fSMqMamuqh8RdewAS4RYFzxxzjFMWd
	wlhYdixm/9+0eX7zOL+Vi+pDTeg9ftl7YvBxtktSNJGkGfc8/sPj8JuaGJsow7uMxI/Ei/rydLj
	p5yjROiiXQLSTVk5xSx8NAoQ==
X-Google-Smtp-Source: AGHT+IEXx0kSSeSYJHLyIvXT1uulEpBF/3kwRrJXnzbNxGZrVmgpdWeuJxtPO6esb5TFIVxd0e/OV+f7KAkBY5x2MMU=
X-Received: by 2002:a17:902:d2cb:b0:224:88c:9253 with SMTP id
 d9443c01a7336-22df578c625mr34721945ad.6.1746092851191; Thu, 01 May 2025
 02:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org> <20250501-module-params-v3-v10-1-4da485d343d5@kernel.org>
In-Reply-To: <20250501-module-params-v3-v10-1-4da485d343d5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 11:47:19 +0200
X-Gm-Features: ATxdqUGUXLPG0IIgmjYwkvDtZbTXlfwbnd-BpsPS8lomYgTKKSQtI3bnTkvdIpM
Message-ID: <CANiq72=_gheZdZmgwoB2q6HSssoXLk4TRkJVagJKjmFTd+LDcQ@mail.gmail.com>
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

On Thu, May 1, 2025 at 9:55=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> +pub mod parse_int {
> +
> +    use crate::prelude::*;

Spurious newline.

> +    use crate::str::BStr;
> +    use core::ops::Deref;

> +    /// # Examples
> +    /// ```

Missing newline.

> +                    // integer. We choose u64 as sufficiently large.

`u64`

(These were all in the range-diff :)

Cheers,
Miguel

