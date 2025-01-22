Return-Path: <linux-kbuild+bounces-5542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14FA198C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 19:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30163A8672
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 18:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99CF2153EA;
	Wed, 22 Jan 2025 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IxmTLW9F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362DF215194
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 18:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571692; cv=none; b=QfQp/wS2cY9qre2L5UW6gF5A5HXKwWLKX70fnGWbQFugjaIR53WON7rrnnu19mcHab7QgW3pwfTz0rTjwA9UHn7sanTUtLzifVMbQdO1ePPQWwgXB6xM1mHerSGP+Oiyj4K1OA2b/LZ+ngNb/tl6oYwxrLkKdqnuTmnMwwM45rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571692; c=relaxed/simple;
	bh=l3nganunuTO0I8caZ29KPDKWn49joghDgA/HwxSNAhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6icUW+VMMB3ggjVJ6yyXTOT7nTn9FrRGZG4/0rzGau//nEBZOMaayS6YT6h+QVDHM5hI0M8kMySxV1DS4bSryQrFil3r/K5K/vyaMpxCR/uwEbPWAn9xE5UncFUmReeik16/ZZa5mynAqhz9OtLlyYm9j/qMKY0cEg8kRg5pPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IxmTLW9F; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678c9310afso29561cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 10:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737571690; x=1738176490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKydrizajiZyiDzpM90s5csJ2UY4C/EjmVPrhqEURc8=;
        b=IxmTLW9FiJcQuudT5oBCj9ecXbC4s4w0dQ6+nTpzhGs4UVcfcNYruL7Lco4pqfyFaw
         bgcARwU7RTUZCkOJuZcrfiwn7Ak+RusVn8AEqqq8U/kcvcWtWUNyjlUmlBzlvHCHLImC
         VaEH1vbgzJkhG2wjFkYeg3jdtM49x+f9q6Shjh+0GevGeaHtxsRU0Po5sn7gycXIX67K
         EXD2yG2AqQDiQ0oBPvu70wlsxu6jQJOy5Q/unaSJgs5/k+3FN1pfMaT0zRIoqf3NHS/R
         tthUuf+CWt0pqQ5woHizLMPZW3SkXDeUP3XZaQB7LdAWIox0mySz9A+RCP5wvfMrcYoP
         5kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571690; x=1738176490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKydrizajiZyiDzpM90s5csJ2UY4C/EjmVPrhqEURc8=;
        b=QaBYyoxUY9if34rjcHZWjXlldTNvnppzkY8D1DKPgGgrML5fHbduXWr2BeJxsTqhcO
         eKE88I4XmAxoMmxSzy8aAqmNivn9aMzGX4oLs2tHqXZjdgKFpvCXgUBti6oa9YpgP+XO
         /sZGyFH+tQla2fcLrJOmn8QfMilUedOgdcYLWhSXAxvXGT1vqARnglHTiqENJ/Qgov/a
         mcJPB8XE5ss+UGRdU/aHDQntUjzD/Igw//3MEWKBPjQ+cOdtKGHQuSzXGy6kIW3ea+yI
         5ifuiXyDihKNfpNPoLBlGocSBid0N2LYqUYKpSSbpy5f3JtbFfcldjqreAnNGavTwWVA
         jCBg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Kznh4Q3xcxrfODzzWSzq/ZlB0Da303U1DyLpk3AF8mzLc3+VKtk7JrEaL3muSnlpQEIGUh9iaeoJtM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8zJfkBqyKQd1Wir7msEqnH+sDf/w0ujMgEp+nTwg98YcGzcdU
	INxnltoef+d7hBWe3Kw3FdJMOC/QLAKexfAQu4iKUuC1vsjqAnnZTh+d0J4cvJdGPzbUF4EENET
	OEJa8H0afqlLOjt6XwZhZSL8s1T8tpZ4MaYnaJFtCcbefIqPaQlLS
X-Gm-Gg: ASbGncsljiiJeMKnv7c4O+b+SdEN9OEqz5qEdO+vBj/fXdptmnT3b1nOkKRUsBGvcoX
	NVQ5AnT6ztU0vmC36dqhUTQsmWSv3c6+0CDkB1hQAU4Vz0OiN7KNFuMTjRvFE5qOBg5dbfU189T
	cG4mGX+3cAMDTPd3I7
X-Google-Smtp-Source: AGHT+IHcSKNZCGpPW7UbU8PKxihWgjo1H8ZK9FqkFOttjj+ZTAxgYbApIiufTqEle+NmXwKtaJOVCFj2ZCwtoALKiUE=
X-Received: by 2002:ac8:7f0d:0:b0:46e:2561:e8a9 with SMTP id
 d75a77b69052e-46e5c0fc91bmr118661cf.2.1737571689712; Wed, 22 Jan 2025
 10:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org> <CAF1bQ=QFxE8AvnpOeSjSeL1buxDDACKVNufLjw99cQir0pyS_Q@mail.gmail.com>
 <c5855908-df1f-46be-a8cf-aba066b52585@app.fastmail.com>
In-Reply-To: <c5855908-df1f-46be-a8cf-aba066b52585@app.fastmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 22 Jan 2025 10:47:54 -0800
X-Gm-Features: AbW1kvbLk69MQRckuu9UcPreOF9jS0FZVYh5fU54olNNQd-dqqvtjn73DZA4fRA
Message-ID: <CAF1bQ=SEybO_+UMDqspA+9OecYqJhE56D-zJyxEUiPcj+Af_fA@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 1:18=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Jan 21, 2025, at 18:45, Rong Xu wrote:
> > On Mon, Jan 20, 2025 at 1:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >
> > Yes. The order could be conditional. As a matter of fact, the first
> > version was conditional.
> > I changed it based on the reviewer comments to reduce conditions for
> > more maintainable code.
> > I would like to work from the ld.bfd side to see if we can fix the prob=
lem.
>
> Makes sense. At least once we understand what makes the linker so slow
> and fix future versions, it should also be possible to come up with
> a more effective workaround for the existing linkers that suffer from it.

@Arnd: Can you send me the instructions to reproduce this regression?

I tried my x86-64 machine in v6.13 kernel with the following ld.bfd:
(1) GNU ld (GNU Binutils) 2.36.90.20210703
(2) GNU ld (GNU Binutils) 2.39.90.20221231
(3) GNU ld (GNU Binutils for Debian) 2.42.50.20240625
They all used about ~2s to link vmlinux.o.

The config I used was "make randconfig".

Thanks,

-Rong

>
>      Arnd

