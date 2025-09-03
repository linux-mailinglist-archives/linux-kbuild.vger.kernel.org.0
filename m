Return-Path: <linux-kbuild+bounces-8699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B9B42D5A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 01:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8328D7B967D
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 23:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8712EACF1;
	Wed,  3 Sep 2025 23:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eop4KtGu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601B27146A;
	Wed,  3 Sep 2025 23:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942039; cv=none; b=NJd3+4lUpRMmlIJHTrrQ9vrT/64DAbGQZuUAbYbjnD9oOdLzy/k5ShS5PPTQXMd4vw0kzRSybOcXahJR7MMqDcbvIgZN6iSkdp6MD329LCZT5ONWbDWNyfrlRxY2bkBEOAT9ZIHEiACy7xpgUkDQhx1kO8QxagKkqpTd1Slw+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942039; c=relaxed/simple;
	bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCJxMXh7YlfAO0sQNoKXpuOCbCVpxC42ORib+LCj8XIrgzK1Tt5AeuL7ZCcBfs4YIlI3M/EmrqcXsXCOTTnwvPRNdive9ezZXI716XQbkukye/gVD+u9IpbIgbuT2cUtlCSHx9z7ZA4d2zOJsyeMAnoZXjCWsd8WwPbO9vElLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eop4KtGu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-248f2da72edso715755ad.2;
        Wed, 03 Sep 2025 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756942036; x=1757546836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=eop4KtGumZHYT8GIYnOX77iqoFnbZZg44Y/ySZ3LHOgba7h23uZXSJYALSX10KB3i8
         KXBbKrCM9zabW3sMI3/6vxjTJadHxIsp65ufvChQ+vb3NMceZK2u+F2D5Ndj1T5ZgpTb
         uvNMLUHMldnhPzr6tgfXzdVcOWLOtUstMNk09MiHT+2OM1RgxTrSTji6c3+M3joNkpX3
         JRpLUlIDoGskI861rYQRH5Cy5F0/AWQP2llLoWQBLNK4DpVyXbBW5UiIAfl27EnNedQq
         +SGA4jIk3B5sMXvdwf+JLAnm/Ccl5QM39mr1L/xIEo3MxOiOSkJ5AbFVlR/c4ZNcQAjz
         JdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942036; x=1757546836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=SfviyHCf5DqIMC5gYyOvLkHpxB0PG+l8sg3L/k6Rtqy1eGhQT78CNpIueXSrgyE1gc
         pmjNy5gV1o7OoAmDCgGTXPVqJznPQ1KyuheGGhJFGetUBv4ncG+kA/SUAhr1YBSQRT4A
         383b7ndFnKhctYggptEh00qNQLaiX6pa2a1QljGkyTpKMLThCYFaQ41fsnFOjOcix9eZ
         q1vtyb399aAK4gioqLLXFbtwS1yihhM0COrmu6v3/jVseDaGeUrv+CqLm4Xpfo6swK/P
         FNDkUbuSOoKYQ/MWtE1/DF9EM3JMNaLL4/nFinU29Ay1PsDI2H9aFg1toClglkORQZN6
         nviw==
X-Forwarded-Encrypted: i=1; AJvYcCUj9INyaBcivVUovcYOZtJLUE06YzjkL3x4nriswKo5hIbN+YHH6yu2UuOOMyv4MrjfOlS6PcDHmdUfbIbTSAE=@vger.kernel.org, AJvYcCVT6OrA1WRR+pdBwPRI+T9AKzRuoOIKCb2dKmYn/1zzs2u1/x0pdWkPuew4W+TxLuLGwPoXHgtVWrY=@vger.kernel.org, AJvYcCWgwSSQ5EpgE2W1mGjQ+j9ozka2vOl6ZyoTagNx56Ojs55dGEIWBclTyGQzFCNz1kaxa7r365YLBWfsUMPm@vger.kernel.org, AJvYcCXsV8q4kQFaZJsrI4WuhCd3mS5bhmTBmBNf5G3w9K3ycIJs2wvIfISchrBLOlJGo8KUYiG73vH0hq0VN0R2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sOb9xThWniDpJ1N7kTM0GgBCXco3Odg1suuuWkdes3i7BS8C
	bXmyGsVbCFVnTs9ta6WbtF80QydrslkxO6mqG4j/zG16fZ0JIte1gBl+VHqz5fBbSkMvOusclAR
	few6wt2lVBOCnel/vPeXNRdPF+veDvvg=
X-Gm-Gg: ASbGncvIo73J97VvqUPn1pBf8mlXUvg4R1JzrgA2mG8i1kKFRQaqp9UjKyHehbLBGwE
	lJ59Z8jxWgt/3VKwBhEHwc6fnmWb6MR13wsdDnAD2bn4mk+Dg4zVFP1qMVsLWEChmXdfUSf9CFo
	DXZg/Lh9VOljnQIzdKW0AdD6Ng/JbsadUcjgWguWqy1CqyADgmnBcau8CGJIigvYvvLkd01b+iv
	wZgbCzEjptVbVZ2Ens1bgBfzX4QSiylRR6NOdBn0nf54FntBFwU+/kJcRNn3JxhwSuqU8im9YjJ
	S6lNGAy1MklAgSPGNRcyq0zGhS7k/sDcp4ze
X-Google-Smtp-Source: AGHT+IHTidnBVrl9x28IZyAbFtRyk1faHWra3cfcqzPBbplLrvafS2wCVDCjldwrmyF+S5C53slJRXjDIWwmfw6CDg4=
X-Received: by 2002:a17:90b:4a8c:b0:329:cc8e:247c with SMTP id
 98e67ed59e1d1-329cc8e278cmr7164799a91.8.1756942035722; Wed, 03 Sep 2025
 16:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-2-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:27:03 +0200
X-Gm-Features: Ac12FXzLAKLE3bvYxnCEro37dgST78_dgCYHlfdxLKDH7Bk_32DLgZHXXdMAE08
Message-ID: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:08=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.
>
> Add a Kconfig non-visible symbol to ensure that all important RISC-V
> specific flags that will be used by GCC can be correctly recognized by
> Rust bindgen's libclang, otherwise config HAVE_RUST will not be
> selected.

I think the commit message should try to explain each the changes here
(or to split them).

e.g. it doesn't mention the other config symbols added, nor the extra
flag skipped, nor the `error` call.

Cc'ing the rust-for-linux list.

Thanks!

Cheers,
Miguel

