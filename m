Return-Path: <linux-kbuild+bounces-5051-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6049E9E0C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 19:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E42C1887F74
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 18:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801514C59C;
	Mon,  9 Dec 2024 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLbCCM7j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6621364;
	Mon,  9 Dec 2024 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769052; cv=none; b=tmltfSiee2t4JGlwFAe7Z8MmZ3wVMgRsOMtBpcZbDqBwhyo2jriMWbqpL25fDm21FTR6PE+H3kPM8eHv6UEPaQDnz+YfHc9d/E0sYgGpU1qEjiOv6oGIBEgFGxMw7TtxiuuscX7Glh8zeEFUF3xcjTXVS8bccHzjqqW/AXjvi+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769052; c=relaxed/simple;
	bh=UtEoHt2xQyF3sPBxmQA/6pu1gDGg2GJJyyZjJgZ3j3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFU28LdIDRgKmjTQBETI1TLsSte2/cmhfT3tLgg3nWO5hyQpw7Xvh6pd+45K4FiqxOVEd9e9tebuCaDUqJWK70qqu7pwhFc+nTsc+W1ccRttMuHBG2Sjx0yTF4ue3FHBuNP6Gq+RZ+ua8Fh/UNby4cE4t156hCmHLF8FjNsw18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLbCCM7j; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so828832a91.0;
        Mon, 09 Dec 2024 10:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733769050; x=1734373850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZhnISB9e+p8LIlAWs7kKYcT0D8jAeuxPpbppONh4HE=;
        b=HLbCCM7jWMQJZ14/yKcgKl5ODHJ6phu1XtQ8tx71rhgkktpwuuHcJKf3e1mkBCk9RB
         8u7P9xzZbhQ2Uz9d6uyEhBHnf/GBwg9GG/Nhse2J88ByEGlMuhehHmF2HdnOChpcCfb2
         Br0Nj8Z7eO6TsWsSLsp9P1+cIijyqXm/BBsQT780bXjL3rNnpWAbPJJsfBMl2lBPhtus
         8MHfKQs5jgZNbHibvi4Xp4ph7DbAGDbSuF82j5YzArhttH4nGpy3DYfyMNpiIu6IL4zH
         iexSbDV69SuvreJ74wpfTPxvSoHGZCUeNoDBHrXLvZskbW0ycWjO730TRJp5l3KzU4ut
         Lcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769050; x=1734373850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZhnISB9e+p8LIlAWs7kKYcT0D8jAeuxPpbppONh4HE=;
        b=P/ADQ8QfzhXf5ZpbATJA9pfE7RyU+4f77J8uJwfuS+4EQJ5z+8L9oU7690HTk5eq4e
         Lhp2SKIsvw787hGmEdt20VMcRoE6mwus5ZUA8H2q/h1NxPXPWR8GK1Ysex+JChCEYFxL
         OFLY+V+/wSEj8QeU/qyYB9A6Fg+SvHItMlt9nMUwFL8USFlCOmX/3eOASp0pi0wF21BW
         qNsVqm7MO8wO7NDDL361/JPOuuPD4c4q/EWSn/hb+BWd3K1oDsPpNaFUuYMM0rCnLZ/H
         Lp9PMvranadrT/7mIHAYHVI2NQVtQukBdtCP0q9kNerTKLjdEaRlFfHx6lk6dAeQffYy
         syxg==
X-Forwarded-Encrypted: i=1; AJvYcCUTxq69jW0AbyL8gcLbbndOb4P3+L+Soobvpj5+jxDIa1gu4QEKsFmM2w9QwQ+yK5qbxUSCA6a3avqlXftq@vger.kernel.org, AJvYcCUlEX/+ritI9B2lCkoQNyAZz9UDMnlkmGtiVd3LLAHv1iIVknv0cV5vKw6hMj6DVb1Hy++JIiOgJykBGa7hJmc=@vger.kernel.org, AJvYcCVQRiciiqwWSqefdOWbo8U7qUuwxjqsmH6JXH/QZmQzY/nBlO2zVt4KAHMM5XX7bzKiEu6R+ZWEnQquuXSI@vger.kernel.org, AJvYcCWDTkywKfnTX0GZiJ/3rJCYE6/gXPXIu/Ala16t5hPak1aTh/Me1GVUOwGs+KYOQ8YPiTg7tOYQ6vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztU1mWj4xqg5n0PlvYGHCAsE0dQYOV2sgyN4MdotueAY2TF834
	PwYr7lVn9zN2yoNjdllIvIQ1JpWiaFwdlKQmMgKzdSUd5lXoeeA+pzNn9/0nBgqMhE1gy42wgN0
	gjqiehmUK39ao7glppyfFLWyXpZ7Oj21Ga2M=
X-Gm-Gg: ASbGncv6rS4W5UcoDqb0ZWW7A5qzL/nZiVhiCMGBwA8J5yViGhocMbsiEt9N2YDBM+t
	YxqwtNx6mHzQ9y37G61P/DmXtFFCjEKQ=
X-Google-Smtp-Source: AGHT+IHXd62Kq2IM6B/3wDXQaXYXPWyVI2DbKc6JGiQupW7Zabp+03AxeWDUcTymkWmsVdt4rdTUsTHa35eFJAllHQU=
X-Received: by 2002:a17:90b:1e08:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2efd4a1266dmr308170a91.4.1733769050254; Mon, 09 Dec 2024
 10:30:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org>
In-Reply-To: <20241112184455.855133-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Dec 2024 19:30:37 +0100
Message-ID: <CANiq72=BvnriScFay8SpLNe9mNhjvGsBJ9W9UtdzU_6v_i+woA@mail.gmail.com>
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
>   - Removed "additional" from the documentation and commit message,
>     since this actually replaces the other flags, unlike other cases.

Some news regarding this: we asked upstream Rust about supporting
overriding all flags (including e.g. `--edition`, `--target` and
`--sysroot`) and apparently this was already accepted via an MCP
(thanks Oli Scherer for the pointer!):

    https://github.com/rust-lang/compiler-team/issues/731

So, in the future, `rustc` will likely get support for this. Thus it
may be best to go with an "additional" approach (rather than
"replace"), so that this environment variable works the same way as
the rest.

We can do that by simply waiting until `rustc` implements it and we
upgrade the minimum, or by implementing a workaround on our side
meanwhile. For instance, something simple like:

    $(filter-out --target=3D%,$(s)) $(lastword $(filter --target=3D%,$(s)))

would be probably enough to cover Android's use case since we use the
syntax with `=3D` elsewhere rather than with a space -- the equal sign
plays well with Make's string functions. We can also add other flags
if needed.

I will send a v4 unless someone thinks it is a bad idea.

Cheers,
Miguel

