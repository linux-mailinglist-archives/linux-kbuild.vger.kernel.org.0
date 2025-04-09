Return-Path: <linux-kbuild+bounces-6562-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4053EA832F4
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 23:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128EE188FE46
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 21:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FD91BD9D3;
	Wed,  9 Apr 2025 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9F1D6vH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB21E5710;
	Wed,  9 Apr 2025 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232774; cv=none; b=eFTXJlLJmpav7DMMAtmdveeFNQSR1nSbc7lKD4vvicdp40Y/tvDWQsHujXq64sNKveiNB4gLk7rv82D9TJzScbMSMeByFpT2WFYPkAz7XNrItNhjZsuohH9tWPFwB9HBBcyVv9udHzDCX64sdZdWxkDYvtCResgGfg2bb/WWGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232774; c=relaxed/simple;
	bh=pkDCmCK9naL6Vl+XyjNyUFQmEvtkQBSbpV648xlXr0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqjpgTPxRqGyq9YG1rQFpS502PCkg3BsJJypu2TyoJDPu22/FfJOhn4mNde7XaAXMu4kQxqnCXLeBh1SkfcIHaZDRIELRQK5rfLJI0oi6ptGscquesBJzCzjOCYfLeDtrepRaf5W3gFcffdDKbIcIe3gkDMEGLF9g/2/j345x7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9F1D6vH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so14972a91.3;
        Wed, 09 Apr 2025 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744232771; x=1744837571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baX+5Zv78I8HcbkYxjdZe3p8ly9kiBXGfznkMkDjWzg=;
        b=M9F1D6vHJYlVZqvEWz3qAfOD53AOqy6XgUOUGN4/ArRdsjcbRc9WW6Y9dhRslyNAo+
         jjgqPAzQHuhWED4FycqiAzQCEXpWGPe2nwtT5ooaAxunlpZfbmk5b0qQEo5WaYF65uZc
         Y85Jd8HRwVPYycvnXuoG5a8n5mSXQoyHR7CK15gDW0+fpg5u37ngotbIqcTvLs5Mh69Q
         Uv08Sz/Y2EEm4XYA4XZ7JcPDzDunNjXM4t1PObH7Dv2h9epB2Ui1S/79GJuLG5QWWVUx
         83yu0sa+NHG1NbleXy2kwICveU1YxDNyymMS15tTJlDTrNqWPL/7F/rWYEvBZtgQoMu2
         NjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744232771; x=1744837571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baX+5Zv78I8HcbkYxjdZe3p8ly9kiBXGfznkMkDjWzg=;
        b=bp8uuOL7Ih50XkzPzHdpM2Rw8nLZTt183DuUfObeXEocUI60phIIGsLQdKo6CQinv1
         a7DAE6rqD6kyFxEtO0VnKI0NlbgkT+YXdAcsahnAnQzAFQ69OqK3ejuKv+xCDzVOX12O
         qAOUp+DibdEU53eoWhSrqmdBgYO+4v/iv1zgoTJlAYDImQJ3YJjI42Q9SpHnDvWHtJ4f
         JLVzokN+pGCrVVU+d/Hm2+hODW2W8BNjx4u1ihsX+YacbrdOSykQVSlzUQFGdmE0hFl2
         NG3rO3VVdf9MqEWkUkqgBD6URRvXAnmDMD1g7wOF/V7Y0H+e1nitJf97U8PXekBmDvij
         k1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWziqWBLjk3q37FSmfni4e6P+c1zjqtiFDizIl5HuJYG9JDADcAf4NE9TbVsrSDhO9orE5IupETc9L6Hx9d@vger.kernel.org, AJvYcCXfsnRP3o2T3tDESH9GD6ZXFtq3vIFg3/E1eFRp8Jf0N17Y6InuECtPAr5x+ld99ISEdj7hk6R82jp0Fe4=@vger.kernel.org, AJvYcCXu1pYED2iATFj0SHGN6LmL2RGvNMTKddipHgkPQUjco5rEdLeUbLfjzfpD8vlUaQ3ovLjNDtH4kTR8MqCg8mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIif63/HT2qsuizQ+phwhkViZNV/0po1D96C0S/b0z2ZMc+1T
	zQrna2rmn4KS24+Yv2IAWSLiQcM433N6gxI5521JRdPnHZD8VMtLBROCvLRmPFHHkkIXQ0cIG6I
	WxfCkkt20M5NqEGn42BKfxuQ4K5c=
X-Gm-Gg: ASbGncuRcJgTavkO8P2mrMGyDZU6eYOefdnUmDldZuhxmAbeam5ErwG0ypjC/NT5Gw+
	yFNTl7H3wk8cSyvntNIcsLNmLhmF9V0fd4UQQGGfGfzNQBwr+bKEQy0prwuvSbYhqlVwSUlwVYQ
	X48RwPrak1RZR9gzIEVGeGEQ==
X-Google-Smtp-Source: AGHT+IEcwDh/QwcSZtRQOzKah6xPPVYt/1iFh55+JUvOEm1cvdiPe9fW6FPzdzfP2biO4dCnvITs8MuazzC6KAo/zjk=
X-Received: by 2002:a17:90b:1652:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-306dd581f05mr2145032a91.5.1744232770925; Wed, 09 Apr 2025
 14:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
 <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com> <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
In-Reply-To: <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 23:05:58 +0200
X-Gm-Features: ATxdqUGFPJhGsGn_8xddyJe62tWSPbE-L2b1BLMkL1zCms_O0XOzjnRwcZGO-U4
Message-ID: <CANiq72mMJLNq8PctLwXX=QM6EtoqV7EOgwv62W9tgkWv1A=quw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In addition, from what we discussed in the call, it would be nice to
> have some performance numbers compared to not enabling it, as well as
> compared to cross-language LTO.
>
> It would also help to know which users out there need/want to have this.

A couple more points, if we end up landing this:

  - We discussed that we may want this behind `EXPERT`.

  - We should probably mention in the config description that using an
exact LLVM version is recommended even if matching just the major
"should" work.

    By the way, here is the link that we sometimes mentioned in the
past: https://doc.rust-lang.org/rustc/linker-plugin-lto.html#toolchain-comp=
atibility

  - We may want to mention that one needs `llvm-link` and `llvm-as` in
the config description.

    It should not be a big deal, since they typically are available in
the usual `llvm` package of distributions (e.g. Fedora and Ubuntu),
and the kernel.org combined Rust+LLVM toolchains have them already
since June thanks to Nathan.

Cheers,
Miguel

