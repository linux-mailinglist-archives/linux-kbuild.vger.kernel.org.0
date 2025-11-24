Return-Path: <linux-kbuild+bounces-9795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0CC7EC60
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 02:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C19754E1F1B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47E72620DE;
	Mon, 24 Nov 2025 01:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+R7KS+c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FD8239E9A
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948927; cv=none; b=o4wAWdjQTydol3t+w1vcmTlVFmUj004J754lsschCGA8Rqpy1hbcNxj1hjrgYRJ8ZwPdQM+2apStxtKvEjFhjvvcKpB0g+Wsk8OI0VlzI3mrV8W/Ry0wBArRHlDpocatNpu+xmSTuZYRq1ojjjtBAMfdSbKGnY8s1varS5CtRJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948927; c=relaxed/simple;
	bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLC9RC7Q8+nQWmWZYRqsn58ELqluDVN+sYjPRzVi75jX6M8uTIx3f6jtA7Tre/2PERKCG0vHHo+ccf4oibCEXuYqtnjWCLjjtJ9DqFeTln7IGYnKt7WilCHvul4Hyef+1VFatxZrG96HpbFhZFCCJbqQwif0Vii3NGz4LwCTx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+R7KS+c; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bceaaed0514so364295a12.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948925; x=1764553725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=Z+R7KS+cp0DR0Si5CVWNw1LJqMRci2Rw8vcCRU88AxxAFN0VMeXicm2mvXI0DanGB8
         eqL4+6PRMk4mBA60h+Tx8JlEi9hHsc+UV+6dbEciHT0/bYQOrPmGtOO+Xi6bs8DKpOYj
         R6H4XVCUx1YWY5PLFkdVeyEBb9utxEGCYKP6y1N0Eua5LJQSFLNon32Pk/WVdEMdqypK
         VvP5wg6eqIBQ9TWEAgi10Mrb4nJp5FTvzgIP/6elr1ibBfssHy210PKveWa4XupXH4OQ
         jwrWahH+DqA3rjGyzkEKuOgOcoRM9oFW3dRsp/VvCoUoZWYMqH6l98+VLxf09buuxfOw
         NQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948925; x=1764553725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=Tx+Gl7iyv4zINxOta1VDJP/PFuWe75nO4f8S95Re3FllIRJjRRfjPBSkNBUICsQbl4
         Pqojf7bDhJIzi2Ak/wPDrSpdkXgScBF3EcgQxF6YrwCTW5Kijtto9+0eJ44Kf2dBKNEH
         e9mT2vl0BHSRR2ZeUncGe9vD+yIRzqfwwQM3XzKj87IxW5EWFqjVEhr6IFkgPpkO/CjS
         I5H2BH/8bzmVa8N4qRYNLbW4k9/ab5IKN4J6eN0D0tUG/OLp2LWFGkZ98+cCYBv6D2KL
         vTinLQsCdezwccfBlaFs1XfNXoOzZAonR0RrHPdkju57K1epgc176HcFy0X/yeEiMIeT
         I0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZggr0+vFEcILTGUwkUlpDA8ItDjXK5t9pd5vjzfRXWM50rZ53wG+OOfOM2Btmu+4kxUPc9Qrxj5JpoEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzaEd76eeOy2ZvTZlmQq0KHZam2vsS7AfXXRm4ec6+YKOEVAeq
	jJ052TacqKWad2oSXMuTX/oJKAx1/dYkGbVA9hJjbcS153KReeOHIZMuyNPAgZNZXBWNvYp5359
	jSsqZjUrGW9UN1pCsD0WJ6/K1PsfAeS0=
X-Gm-Gg: ASbGncsluW/hj0c1Hgx8NBrSniRZHjlBiFn3TQpSCaCKxNVL8xj1appPzu7TG8RhtEW
	6xEyu0JLsaQUac5Dwtb8UHi+e82xgOwF7AozGuPZh3/ekNppKlGvXnfmxLxzTsoHa7dTqpRT9Qf
	1aWpNkNoeFvR8fm87TOiF13qJjIfniRx0K3SIFMCBgKTqqmR9JjwnTFNTPlbYyA8KjI5TUc4cln
	YLfh7lAri6k5prpEpSEyCPFQOwz3lf19mAb9urnxcJpdD6cwWlMqqNe/WLnYM4TTuNpCYvX87UF
	6YWvFoIrdLbbZEb85TGLo1bpLmc9g3iAL9Zu5iMYuQ9ndCpVMbwuHfnYOtw1pqU9YwOPmVl9hYj
	oW0FnzEq4EGYK2g==
X-Google-Smtp-Source: AGHT+IGn1fQWUtfuo1zOBYncWXTAQy3r5XJCczzktuyTrIF4ISG4pCB6BfmuhKsOzi4ofGGWNC1ayRtxHafCtO0nUC8=
X-Received: by 2002:a05:7300:ea14:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2a7243d9794mr3793745eec.0.1763948925113; Sun, 23 Nov 2025
 17:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:48:32 +0100
X-Gm-Features: AWmQ_bkQhmxLSFViZmcLEfniv1-_q0VIV-sH15dOpedbSpl6O0HvgiWJ0WM7vVU
Message-ID: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
> `--target` option for cross compiling, so that the function can be used
> to test both bindgen options and bindgen backend options.

It seems this explains part of how it works, but not what the commit
adds and why, i.e. could we start with "Add `rustc-bindgen-option`..."
etc.?

By the way, shouldn't this just be called `bindgen-option`? Up to the
Kbuild team.

More importantly, should we just have a separate function for backend
flags? That would be easier and would avoid having to use the
environment variable, if I understand the commit message here
correctly. And, anyway, it is actually the only function we need so
far.

> +# Return y if the Rust bindgen supports <flag>, n otherwise

Maybe just "y if bindgen supports"?

Thanks!

Cheers,
Miguel

