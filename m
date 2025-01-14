Return-Path: <linux-kbuild+bounces-5486-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14217A114F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 00:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B07A18898FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 23:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7492144A8;
	Tue, 14 Jan 2025 23:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0BT0GWP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE120E00F;
	Tue, 14 Jan 2025 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736895959; cv=none; b=BEBo47U4oXoWGJshk2lcHVXY6rDUjss2V1jjr5I6fXXgiq5gcMXklAMopDcFefWeOl2mFCXjQAP4QoB1sDSlrbQ7tsVRiRGBnGf/VjUVTuaS6OLSwYzBPFLdd0fCYjETyzRiAC6EQS7D9SjdgY/uN8qpHRL6+5zOwKjbSDhaqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736895959; c=relaxed/simple;
	bh=jGONpBpb6F9TljeHsIjaB5ReH725348vqOqeKbCOuPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiGOojKIeP4LYFHBKfZ+xksGyuizm9r9Byb2tslNV50c+7w5cjqpEsakwa7vSASZpDrfLnkYlIoQJwhFfo9Xn/GCAofaFFfY3Bspnwya6r5fpl3eZdHW24BBJp8afHu+dtOGBI3bOGYtDCeQpoeSwy09mdpwxqP2pqlJY6GjJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0BT0GWP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21644db9f3cso11102295ad.2;
        Tue, 14 Jan 2025 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736895957; x=1737500757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGONpBpb6F9TljeHsIjaB5ReH725348vqOqeKbCOuPw=;
        b=S0BT0GWPLVbKsOfDljJJm8fsA/sflr7c+5pRan7931fktx8KAXtQ5i8VSfnEX04fl9
         RbyGvKZm2zMlvwO+ReeCzibDoqhk9iuEoaj7Fhu4ILOmj3P2mgypz6/0pI8o4ht4tJa3
         9X2wxf+/8DWwKvHIl1K1/XCArW/azJR3A3ymrMDKrYqo2NpQs3Bb1mC627CLorYPhu42
         7tuVDoMXysTYKjutqZgklNpxxmXpio6uDIsT9UWFXuazFGfAtwHC/9ux2e9WYwhVpriX
         F2rIfv3oZfR6Ojz6jh9Nzs6n2d+ukBSjFe5WCSEdS7P3aI/FMVnj8ce0aixjoi9+P5n/
         OCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895957; x=1737500757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGONpBpb6F9TljeHsIjaB5ReH725348vqOqeKbCOuPw=;
        b=FQnlPXlqe3Zfc0DW5ke+/hV7mfURcnEJjmOYHSMqnXQ6QwWS2XOlIjlZXlEu1bSkR3
         kQZlYLl41ZzBbWMbl7hcbzkWzU28WjgAh26242u3f06iDnoSm51fN28LbDcy82Uwx7Xx
         n5ak/0EBu6y2dSwEsijjBZrpAYhk0bL3pkeCHWG4u3KiPYyv4lh49OcF744sYW09ZAfa
         wJEpXeo0C9iiDODn8p0MuCVgAONfrmhV0gTKY7E0YbTLnwM3zXFButDimJFZjyZZLr9i
         bvBalmUZP5m4KiNSJNpd0rfeBkUhVDuttndvzXY2uiU0tie5Qxkag72ly+2KuKpOdYKV
         6s4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFJNZ7enNUL7GARyVXlR0Z101gSej/h8LLPMDovATjNfgDil2cTBTSE62JGhl3V70KYPSIFQtgEewD91ST@vger.kernel.org, AJvYcCUuV40WKti9olAj/KTC6jQMjKunzNrXQccHiT5aNmcN+m23qu/vbcBeIHvC67OzEvtLv32N/juVAsg=@vger.kernel.org, AJvYcCV1e/0idhI+VUCealp2kjwM1k5zAl7ChgUgae10H6Aveu98KaxQ8txgxCbF11mOoUCPbJC3L7PeVygfJ1yt5jk=@vger.kernel.org, AJvYcCXV764oMk10P8THwCWNpki1Hv8eTxHvj6NBwcjLp9m46XZKocVd5k+wDode0QVq8o3lYrrhk94aVztxfn86@vger.kernel.org
X-Gm-Message-State: AOJu0YxE6Jls0YQj9UHYOkh8+jdLVA8F/9/Yj9DVS6RUqg09pB3WpZDF
	ntHgESNgnzFPFdMS0EvUCgnEPercBOdbSpz50Xw7Yp4bLofkxNNN2JMkA8KihTheKfpHe70yhRf
	yMBCT+wpAxFXjY52xPEG52S4N8gDdcEAp
X-Gm-Gg: ASbGncuGl+yww4/Bhdg+xYMCbBVuwC1AaXHtIk09Wnmreom8YrGvGIe/bf7nKcQ5ivR
	BGxK5RpjSWmyLHjZRVWtrke+7xirbu/dXWR/OFQ==
X-Google-Smtp-Source: AGHT+IFw7qEmnSUSBN15L+/rlki7LwsWRww8bHcfKqUXNQn0Pn9u6VHx1zgibAEJ3jsF9xzVfr5SDELRI8wCRUezTn0=
X-Received: by 2002:a17:902:e5c2:b0:215:a97a:c6bc with SMTP id
 d9443c01a7336-21a83da2ae3mr150920595ad.0.1736895957174; Tue, 14 Jan 2025
 15:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org>
In-Reply-To: <20241112184455.855133-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jan 2025 00:05:45 +0100
X-Gm-Features: AbW1kvafypkAPrC-F6af1-zFvD-4hiQ71FiqfbF1PE_YNJTaf0k1myhzOh-09ko
Message-ID: <CANiq72m+k07miKu=vHfp1-A+nu092R+khau5b95Ugq8M8sksFQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, HONG Yifan <elsk@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 7:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> To distinguish between the two, introduce this new variable to stand
> out from KBUILD_HOSTLDFLAGS used to link other host progs.

Applied to `rust-next` -- thanks everyone!

Masahiro: if you wanted to pick this up through Kbuild or to give an
Acked-by, please let me know!

Cheers,
Miguel

