Return-Path: <linux-kbuild+bounces-4115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 640F299D97B
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 00:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB367B220AC
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 22:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1E61D12FE;
	Mon, 14 Oct 2024 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBHr34kj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DAD155303;
	Mon, 14 Oct 2024 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943219; cv=none; b=MZIv7C4CRqYPvImKRu4nnMeIc/zdQaVfBb1umbSdMPP+4N40cohkHvioUt7Fm7eOwNUfyOcrtun7LJbwZMdo6bktPSmP9CF6uRgStqaLHSoGmtvr0KblBSs/6qzHPTF+kIh6BX8eVbzQQAZWhPfWAISRey8Au6+yRFXUsLJafyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943219; c=relaxed/simple;
	bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3w74yd6AZTHLrJfUYbX6L9USjM+NyD5IuKAFIk8sVF1yEHq0xR9h1uDRhHvgQVLls92tNsG5hQYgMua5PSmkzwdqvnR+E45fDMnc2FWMnxlYoQLPKw/+WGNAE5Y3ZPzpZIWJMfBJN2EfJ14PxxqwIEm5Xe+gZP8PrWK1ElDz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBHr34kj; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so941162a91.0;
        Mon, 14 Oct 2024 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943217; x=1729548017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
        b=fBHr34kjv/KHUOC18LTRKH41rzLO6fqoBjWgd3e23FaG01k++f3nJnZsr4AV3uuyAt
         RiYxXAcPs69Ab0QGJv/rjCYlvDHrHPBt5sJvUm4Cqw2djdiOcTo7Q6pTI6XtvmByzwFK
         cToM6uGFakkWNAgv95ZSPuKvsjlfRJQywi8DjAPbEIbJx4z3Njm+6pls7pY/knxc0lN9
         6VTSQSN9kVH/moY5enbRSj/Olu8LP8HWBHwhiQhFrgJLU/zz/11lP7j2HVdyvoWWGlTZ
         ZQB+VsUsGg65VNej+z1UvOtqR1pR/LsxmtLcihf9SnA9tJwYRj5rcHwPX50CKynuaQIJ
         5/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943217; x=1729548017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
        b=NrRwyoDqPRrHo6SoM45YVKBlGRU5RFMof+iUIzrBERddpverLTYt8ZswtMRJPbPdVQ
         Q961xd21xxXoPwzkSd1T/HgYUoEBpo0pwj7CwG8BpWLSfuO/7WpvsAeMzhQfW4slcIMC
         tQ3mT8i2eQmSelEv/rX7O1qPkJdNbOuBc7NWU7ERzhU9UAtNsdSw+t3W1Px7GNa7MxKO
         uXINgBxOEddZn++tg5b3rn6e5uOm0AKDpAIQiE48Ifwvwmr7+1L+1pw2sdwcpEWVg35D
         gdX9yOgM77oaxGw73UOBy4/gB+fMc+raSMC14HlfmpCAGloejjNtzJ3UyI2ShWOQxhQZ
         0OrA==
X-Forwarded-Encrypted: i=1; AJvYcCU6QQiqQdTS3bfpr2rgfr8UiyKRrD9h9R1S4wDk44CQUj1nfzA0Vwaky2LHmnmHZR9T9L/tJuVCImUOh0PiVi8=@vger.kernel.org, AJvYcCUwcF8kdrP4vhopYfj0lQyO0D/SRty6Pwcswj58Lrx2utWCF+qkfQJnjSLnN1g0VXC6u9AXrcJf8DAEb/Wp@vger.kernel.org, AJvYcCVHr+tRHNoMnabjfWeSeEfAiBoPbQxvsyaxFaYxTkkGwIgCgl+336ieKj12OkOINJmfpCXuvLNKJcwY8HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4HYHJjkX6QGSdIqS8soJqbQhfGwQTO9mHG+xIVud3xBziX4Cz
	nJ+eQgzkP9hAKRUbEmjDH1gJwX4KZAiXF8xzolzz1tOKCdF9rTEyN+41mxFLqaE0vM0bl87Vu9G
	oF6wvlQKv0xN1RcMWzGJo3ofnrYM=
X-Google-Smtp-Source: AGHT+IFAD9elRbupL1oE4+4Cv9+VWLhrGVJYAICeZoc3lw2uIcEONh0kUtsCxjjNqEUqwLG+Qa0DjzHGhVQsOeYstZo=
X-Received: by 2002:a17:90b:1056:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e2f0a2fb66mr6635698a91.1.1728943217079; Mon, 14 Oct 2024
 15:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net> <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
 <20241011130641.4a8419c1@eugeo> <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
In-Reply-To: <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:00:05 +0200
Message-ID: <CANiq72kz6s6Wpm8tw=COO7qAL7oTQivTWxOmchd1WkynhNWjKQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 6:27=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I tend to agree with Muguel.
> The motivation of having cc-version in scripts/Kconfig.include
> is to check the presence of the supported C compiler, as C compiler
> is mandatory (in contrast, Rust compiler is optional).
>
> If you have a reason to have it in scripts/Kconfig.include
> for your future works, it is OK with me, but I cannot judge it.

Thanks Masahiro -- OK, since it seems Gary needs it, and we already
have the patch here, I will take that one.

Cheers,
Miguel

