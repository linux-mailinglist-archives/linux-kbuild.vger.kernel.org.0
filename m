Return-Path: <linux-kbuild+bounces-6807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BA2AA513F
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D68E3464AA1
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CDC2620D1;
	Wed, 30 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLiWkFfz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A925F7B9;
	Wed, 30 Apr 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029534; cv=none; b=FgIZdaXMWzujBA4oyofEnq/Zdjf6zE+tJHmbJL8bS4JGw1lrgjAsDuYUIi+eSDFjlk65w/wwPomJ4slVcvFkOwkjVMMLCeHDiPes46ITJ0akyOtN2LdAT66mlvwh2E3pKb9PW1uESMvKR37ynIpA1FBZEXnZmAWA2wNHGNQWQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029534; c=relaxed/simple;
	bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOtA5NSI+E48Ut2qnywLt06DwvdMbSfA9JZaMe/Hk5tGqPK8poHGn1Ou6wt2hkfB+c7w/35uoHXnQ7lCdMGbpdtaU/GBg08Q3hLruYl13arGBCu+7Nx9+BNlkFsAv9GqgID0xLyK4PGrL9U/HU+S4NyDFXGg3fmXPeSrAa7JhYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLiWkFfz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30363975406so11457a91.0;
        Wed, 30 Apr 2025 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746029533; x=1746634333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
        b=jLiWkFfzUvkRqZbeh/ntfnbU7AXp8R/BSjgz5P+tfl1p8o7JUa277YVQS5sLsz6UVp
         uvnJ1wk31qhp5qYSRnK5sJVCWrxQtF4ApUYIBY/1eGdp0zM2fT489f/KTCRMNPIVU1Y7
         JmzEsGbuHmoBnWIIwSvaBrYvROYfY0WncRhfGTcxF+r3SbIH5ufXgYMSo292G72eJJx0
         OsYymlNaQMXUdjWjzGJ1nPqquJXxc/SZQcViyMZrl3QBHB5vC0ULwC7ors+tZyrt217B
         wZEBHQWl8uDl+bnrIAzh3muYIoi/zLKGl+BJCEH1eQDr9F7GeuI+L7jqQ6w2ITk6G4VI
         y1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029533; x=1746634333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4mNU2googKmhmlSZf1BhrbHafu+MKvI216e5vmdtsU=;
        b=BmngM6+4Ubc+UdimceN4yxQlKzIC4zFgO/w8dzHFo6y8XpZQ2W6xSG8acmV3MttsAL
         iqO8cpn6s5qtEVuNm332GZkGPeFHbTO4fWeyOQFeXBDUuehDXp+abb70Kt7tZjSLiLPY
         gaLWM7eGOguYIlbU5bRja7sGFT8i1jDP/9CIub4knNWp4cnyPRjLhD9dzxkPH4Ly2qAK
         QAzdFmHWF73BkcqvI/UvPRkTB1Sy7A/1p/bLETzVGZsodwdQBIJ1xraoj9joyUgd0tYW
         ta88ZyXRmaQXQlAaMQHSnlwWvstqfykY08os9iZoAcA2+XrPoveES4m3hu8QZGEvfHiF
         43CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSMjugIgL7TLNzOAyvCSJh8FkGUZpnqOORtJVEytallwrsW2PasCrM2q2e3E4VZOfqzeKEgCM2XaMnIjs=@vger.kernel.org, AJvYcCWrqzw6vmLD6IvIncRPBFkZY/MpVOWxIglf2IG5taZif+qmbw5fKnUAwrp1LhZfhJoXVy9xqYFR+MGb/DDr@vger.kernel.org, AJvYcCXsgLlgwDfudLj2rYTN/XTnfOVo5DEi7bQAV3a30ZPsbuGWbU52thbFqyipuL8Loq5oa6xrSm3ybU67G3MfOwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNGKsuuyHLApdIE4k40PajOCANaHqB5noPBdHsrUn/j7KNFNK
	6Y5Zx2Kd8UIv3DhW+rQpbx75D7X68myUKcEd5QrFNU06tiKdmqAdAOuUgXyoCR+GNRRR+QriZU1
	NzM0wc6e3iEtcWrAvSrdd0VvJpKE=
X-Gm-Gg: ASbGncsvgFyCd9wxuuvNhq8m3C7BbhTn463BeUXG7UHppAjAuM0F230wKD/emVqSnzq
	jMBsQravzDqd96HTlnSdC9A8PPpMnBOEiUjTttbq8kPUZggEiA3LqSY5nz6ggdq1UyoWmk2E40p
	zk1dsudzadGfh0HITJMosZww==
X-Google-Smtp-Source: AGHT+IEbXpICMCZtMlEglv/6u6d9DeHKrHugJiPYxVYKnZgt1+Le0oAHSmnMXEPGZPs5sZ35AafOzpCaejzCGqqC/DI=
X-Received: by 2002:a17:90b:4d92:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-30a3bb7eb00mr654907a91.5.1746029532604; Wed, 30 Apr 2025
 09:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
 <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com> <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
In-Reply-To: <CAGSQo01gLXKWLWcrxSytmCB4YmRnGDX++ZizTws0bEjJ1amWtA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 18:12:00 +0200
X-Gm-Features: ATxdqUFaNOBfPlrz_zIIOgpzIG1_Zn-Ke3TH9fa3F3oDE9TplG5KBv8TWq9-lvI
Message-ID: <CANiq72mazsVZxXaw6RD66CfFXRR-sHWf6eVr3jke1mWxBcrTBA@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Matthew Maurer <mmaurer@google.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:52=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> `kernel.o` I think we should probably keep at least for now, because
> it's kernel-created source that we'd still like proved out. In a
> theoretical world where Rust has become more normalized in a decade,
> we could filter it out to refocus fuzzers on driver code rather than
> bindings, but right now the bindings themselves are worth fuzzing IMO.

Agreed, I think we should definitely keep `kernel` for a while.

Cheers,
Miguel

