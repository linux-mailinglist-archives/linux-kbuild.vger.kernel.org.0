Return-Path: <linux-kbuild+bounces-3664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE797E867
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 11:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF331C210E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 09:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DDB194A40;
	Mon, 23 Sep 2024 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cu0/2Oxt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FFE19415D
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083057; cv=none; b=EbG7zruPSMK+C+91EqApisg13LI+HfHzI6eqRmQZaUgrvEliyKWs4AuHtZPNBGqkjIIFzGB1xUpywtOwEJEM1IHHKuSqr4ppy9fXsCM/IEXqFjbmU1ozCdIaIZPDwspjh0shpsfSPd67ymS2AR3XHqHA2Lza365+NpJAAH6evBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083057; c=relaxed/simple;
	bh=dXtU+p8lSm5203QVSlqw3BD+P2o/6IwPYH/o0HqI2a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8Z+Yu3U3c+Z0Ek5VEz8XcWNE+KEQB4DHLiL6XITZGvCh+G6qR5UUrsOOzEz6dUBjnPwk7m8cntgAZQDVwciq8m4xWQqSGBQZk4uz6KpKZVa4OGQs6RFefpj33JKXF3rqpRylvkfNvOhYcUu6KEV9UdieXPlwp1v5PzQFeE8KWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cu0/2Oxt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-378f90ad32dso2493071f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727083054; x=1727687854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVtSaoR0biX2T9CVpvtypIFchxY0cdh/phffmHsW2PM=;
        b=Cu0/2OxtLAxf0yQk82JJqmZXNnj0Z7R1j99eH4BGHfcIimv1OKbWpkA35JyM2u7iy6
         Qw+wBQ7v+lZl11cq7tbgKwFtgKtC5IBcqUZZRhUWznKh7xDE8EiBdt3H3dvQKqTFT3dh
         sxvPHpRxfy/5ynXvi/edK3ihvtj8MbeW2SQDC7S5NHg8/THM8AxToG6z8D1feOfhySn/
         0wzTkCIz/pYZtw6x+xPqNNukQUI/ZqqaZhxp5OBRpCRFg7LyAnufNHJSKajqOM54UeeQ
         xKhR1sqCwd51/CJoSpPLUTAiMDPiZeGoEcQv5yJfUjtvcj7nhvmb6wl/gSxtSZddlVUD
         RXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083054; x=1727687854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVtSaoR0biX2T9CVpvtypIFchxY0cdh/phffmHsW2PM=;
        b=ct5oVnxge0QUCRg5+JGAAMxfJ1GgKnXUGg3dpuK70Jcisa/Ebcff9zMZvHezpvGfPE
         +NuhmwPx90qpgeM8gCS610EsiWKMUifSjZAJJvXYQ9E6iYZpnaDNy7B1ZT42g15ZX9Xo
         LgiFoxZCp1Zsb5m23rZmLGhHD4/uLKIBiocVXtg+/0fQLQb56+8smDdcBoBRiOyA8bMZ
         Ddb09g4jrTvqM7bP+a5HDmz37dv2+uu6XJn6L5uzwAi2d31msAaFaO9Gey5OThlLz0KM
         8oTCIKTgV6a3X+XDIPa3FHINkSFYfAgaD4al7NHtHLqPJFCamcnsVRUOtQqfQA0Mq1vN
         B9FQ==
X-Gm-Message-State: AOJu0Yxy32r1bJkjq/URZR66W30B3Gwou/kcvhbnmAS4kofAkHTRG9xJ
	CESd1W7Kld8Nnu1ANrY+ernhxXVPZtGiHnwFoRg1Pa6HLc5/BsD3Yc4oZiQ33DojCeX5URWpw8X
	SCGtT4goXsrqngpv2at4vn+dnYhUW/ox46Yly
X-Google-Smtp-Source: AGHT+IHI74AJM69zd78KpzyQE1BtUUEeyU7RmQjBJekSb/384i3CmT5ZOtSPPuGLTObOrptz9khgPTIsTLIdBob0qW8=
X-Received: by 2002:a5d:64c1:0:b0:374:c3e4:d6c5 with SMTP id
 ffacd0b85a97d-37a431a7142mr6905859f8f.57.1727083053706; Mon, 23 Sep 2024
 02:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913180622.1327656-1-masahiroy@kernel.org>
In-Reply-To: <20240913180622.1327656-1-masahiroy@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:17:20 +0200
Message-ID: <CAH5fLghY0TQWX1T2jjxEFQ0kQ9cCVVZ6hHsMFknn8RX8K0X2jA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, Finn Behrens <me@kloenk.de>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> If RUST_LIB_SRC is defined in the top-level Makefile (via an environment
> variable or command line), it is already exported.
>
> The only situation where it is defined but not exported is when the
> top-level Makefile is wrapped by another Makefile (e.g., GNUmakefile).
> I cannot think of any other use cases.
>
> I know some people use this tip to define custom variables. However,
> even in that case, you can export it directly in the wrapper Makefile.
>
> Example GNUmakefile:
>
>     export RUST_LIB_SRC =3D /path/to/your/sysroot/lib/rustlib/src/rust/li=
brary
>     include Makefile
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

