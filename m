Return-Path: <linux-kbuild+bounces-172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F2C7FA1CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 15:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0BFE280F15
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Nov 2023 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576A530F9E;
	Mon, 27 Nov 2023 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJ3rI29g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9475B2D67
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 05:58:36 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b8672b9482so829387b6e.1
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Nov 2023 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701093516; x=1701698316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmo2BXJt4vu1ubmwTuoFwrhznc8Bcf+/X8CnL/h9xfg=;
        b=gJ3rI29guMBiS0nrH26lQVxYKSFGwlTWO7iS3xkOHel+ytBqgREUsk8h3wM4+l5KOu
         YqVnQMKZSWtn8QFXWPBr7QRJc2l71afnM4wPt2Tr9vQxaPMcseI6Jr4UOQd9TMZDhDv/
         Knc9zmZ1UgMik5MKU60O8Fd9svFzJhtOUtC+Aj2nKKvC5JmF4vlFgJr47hWk7cQaw2Eg
         CKOCr2jCB2p0uI6QZWRZ3SWORd/NXwhfV3unDN3XUsU9JQGRKyBB8QQNcrpweDK/uG4f
         x3FDAZXunD2bBRw23Hbk4Yj7KSJWmNejF+V/dIqY8QN0zDuz3018ydTcLFVbDg1ImxDY
         nqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701093516; x=1701698316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmo2BXJt4vu1ubmwTuoFwrhznc8Bcf+/X8CnL/h9xfg=;
        b=q/F/9sphoeKPsOBWLFyHPGGs7Oxw6QHYLh4AQiHNK7aFWAAKvVCa5WGlQSym3nKqOG
         +Z9ywkcl8Qg2PNzhRUaEfLjNAJZ1M0zn4kHBBnEX+ZDcaWlylwWJcM3D/FAEBU/8uRDk
         j4POAxRDvnqijzeKzvpMUzYIayXgay+/IfuHbHoudrIgOkm+KRRlRcit2Abp0PkLp6q3
         0VE+id2vtqqgstaN0xS7jQ49C8PtewqZDEEKSlUHQp9krdpeLC9uUDh394wfHejtT4oL
         MMRI/tV9FcCRNlqu8V9tVG69bl8zQcKABHwPFidlSwU65YlTC/w+NwwcILjHC9zkxQMy
         HjkA==
X-Gm-Message-State: AOJu0YxmdDRTXTnC+Ai6y4PB18Ja0dwAxGBG6Yfn8PHQazvi5hW8yD4W
	2Fna/MRDZzWOunP5+1hpVPYrf0s/MGzRK/dS8MfMIQ==
X-Google-Smtp-Source: AGHT+IEnf7x9cMjtRYjvssq0P5dcMj4LNZ5XXPtGxMk2IUanH6KXq2dYk3jFHBzAigZNM3g7Zrsr8HcWUx2B2UoYMA0=
X-Received: by 2002:a05:6358:5927:b0:16b:b605:d3da with SMTP id
 g39-20020a056358592700b0016bb605d3damr12692052rwf.28.1701093515725; Mon, 27
 Nov 2023 05:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031201752.1189213-1-mmaurer@google.com>
In-Reply-To: <20231031201752.1189213-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Nov 2023 14:58:25 +0100
Message-ID: <CAH5fLgjFGTfWr-O9LPBtvwkwo5o=jYMByjqS+7gogGoYT4=x3g@mail.gmail.com>
Subject: Re: [PATCH] rust: Suppress searching builtin sysroot
To: Matthew Maurer <mmaurer@google.com>
Cc: Jamie.Cunliffe@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, will@kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 9:18=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> By default, if Rust is passed `--target=3Dfoo` rather than a target.json
> file, it will infer a default sysroot if that component is installed. As
> the proposed aarch64 support uses `aarch64-unknown-none` rather than a
> target.json file, this is needed to prevent rustc from being confused
> between the custom kernel sysroot and the pre-installed one.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I guess these are the only places where we need the sysroot parameter
because the other rustc invocations compile for the host target
instead?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

