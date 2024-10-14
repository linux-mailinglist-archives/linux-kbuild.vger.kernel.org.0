Return-Path: <linux-kbuild+bounces-4116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C099D988
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 00:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E54A5B2189B
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 22:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140B1D12FE;
	Mon, 14 Oct 2024 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax4k9jyn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8A21D5AA7;
	Mon, 14 Oct 2024 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943223; cv=none; b=i+v/J9pf4+Kley4Zy0MfP3LCit93mg3FiAbcjfvW7nNKUSiA4pHUV9tz2oDS6JdadGeIzEfKRK9HYtmZ0nrdmn5VFRlTDPJRn12ngt7rTxazdqSxwS0rsvxFmnWlE9y/BIttXfLFT4Cxe8JFNK5h7sqgppZAdIRR/D+B0/JlZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943223; c=relaxed/simple;
	bh=Gp5RgJdJshEAveCGQk1gByWsCpQn0wLzkzXvNjNyBzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fxf8Zt4KR5NDS66G4eYpGb6eZUYiVZnJhWaiTFDh6b8CShOkA77/R67KL7x8hpxZ+I9n4PRYaRPNjN1kscb4rkGR/WoZxXXtPGR4GVyyRmo1hXdfbgq7IaKXzlcAlxKgQR1XPyqw386/2+tokE3NwiD6/i7/HrRECzY+zDjFY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax4k9jyn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cf3f68ff2so1089675ad.2;
        Mon, 14 Oct 2024 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943221; x=1729548021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCCpXSt/sHK5vWvEI9GsvUyDJn3ZWOJE7EthE3NdZAI=;
        b=ax4k9jynCOlwHa8SRqX5ANvkVQ6YU4mnk0dYW/BvHLsHZunfrkdMBEAObJSX+euhN6
         2WNqmBES7cgIfQkcdtyPfOXv94m6ZNYf1DAeRcnc//MTrqC49Xy9Y39zpWnhUgnEOGiX
         wQyXjU8WAIF+aBMQzY6gRAHivLzfnXhk1B1de/5z2jfvC5KNjH19gIuVhxvdjZSxrJ8W
         F21AaE5i8NXoN7jw2AZis4biGf7fp+uKKiKTJbEACUnvHAYlorfj/TYN5eh2Oh77cPUu
         H6O4E9MbEeQULIUgYRXeaHQ+QBmEuL5uHCzb170uDzzL2Ji3MLKl4+n1/QkD1fI4kw4g
         F53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943221; x=1729548021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCCpXSt/sHK5vWvEI9GsvUyDJn3ZWOJE7EthE3NdZAI=;
        b=QJe34SMRx3aRNUqhrIMHSar/RNQe8JqzBgPtygeeNsN7mBXm+D/w4EalhC5kfmWjPQ
         k6+U5usgYPRHAuUUuNwv5zNQztQ5R1SdXvlfIz+LLpICy0MBRjCX8TMXXDTeEree/Piu
         bywF1q5F6QExR45J6nGHFfi+iYrOJxfV14D5pvL0eSRWP//hRWlv0JTbk2A45N7kVsFg
         z1jsm5yfOj9f3HN336Njlx1qgxiDZIIWSNujghTY0HKf/BGwS1gdvzN2Lxlo8/exb+Ca
         6+te/KDDGX9t2L5/UWq2DOGVzlF2DF/f6mhoESLc743N/HPj5+AZpxJmTLy/lWjuzOqI
         qnrA==
X-Forwarded-Encrypted: i=1; AJvYcCUOgrMcHYesFiIoaNl3RcrPmT9lzJ9HKtuSUhEjo1weBjSOZ8C9XdjyZSOqaeLb4up8WtzkS1Xt3qWoTpUg@vger.kernel.org, AJvYcCVbbz4IvTT9rZcGILbPmOSuKj7fOBJnN1VdhK+C2gK6O2M9yiZPx7KM6w0OC1W+L33Q5sh69IJRd5y2x6k=@vger.kernel.org, AJvYcCWswrPbW3m7hS2X2AmlaJJ0qvamImMu3YFH/bCNNZi/O4zPDpEWC4ZcLkb+XZY9zRCF7ikDXtCzhWuruJmSCjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hmLv00KpjJMh9oH/KN9iLQXK4M0di0TafZniGXhFdm4YXeqH
	bWxyRW+aY2lTAxbSHWfZ7PhuOD3aB9NECrmPiYhe2vW5gflJJI5DzHgqOEr5rftWJ1/G9I7HzDm
	IiCHtsni/3+Gm37+irSnPc29lwOs=
X-Google-Smtp-Source: AGHT+IHFx6+ZhFBdRRebxHz58VyNJUgrzyNWacOKg9tx+5UniFYMb5gntDXNyLvhYj9SJf4+6Jg/QRtlQqS+CSd9J2Y=
X-Received: by 2002:a17:90a:8c03:b0:2e0:9d55:3784 with SMTP id
 98e67ed59e1d1-2e2f0808125mr6970921a91.0.1728943220902; Mon, 14 Oct 2024
 15:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net>
In-Reply-To: <20241011114040.3900487-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:00:09 +0200
Message-ID: <CANiq72ng9hGcncSr62bqXPq+u4UhQgwh_BvKkv==zkyseXJpiQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Gary Guo <gary@garyguo.net>
Cc: masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
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

On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Each version of Rust supports a range of LLVM versions. There are cases w=
here
> we want to gate a config on the LLVM version instead of the Rust version.
> Normalized cfi integer tags are one example [1].
>
> The invocation of rustc-version is being moved from init/Kconfig to
> scripts/Kconfig.include for consistency with cc-version.
>
> Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-032898=
5cdf33@google.com/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

    [ Added missing `-llvm` to the Usage documentation. - Miguel ]

Cheers,
Miguel

