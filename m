Return-Path: <linux-kbuild+bounces-4034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE43998443
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 12:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125531C21B41
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB3A1BF324;
	Thu, 10 Oct 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oyriwGmb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534B1C1723
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728557903; cv=none; b=CHK9+oXQx0aRaSdLEHNq9uTznobir+n2DU/SZBoOVYOYDW+ldOwKlEiCuORS8FlGQL0TmdaborrGhSoqLRNHzx2EOG71/rGNLCciAc2UIJ9sOL3RO3S/ZJ2tNkncEjOCr+4YeixdFeeGyNyfQ/iGDsJrlx1zNQEh8s2XdycwQp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728557903; c=relaxed/simple;
	bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SE3+O0q2dhudRDRPvcKqppLTluwU7er3BUmH8jNH7ycfy5la55U5D2191w+RX/KzGVYdKWczUzG48YGQi4kDQbfaKe3QA0c9zkXB50DFzEboEz6qDEgpGMpncsv5GO3DTlGZk2ydH3ulS1mUPfSfOwSpLXuWSFAXPhjdBNWPVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oyriwGmb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431160cdbd0so4556415e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728557900; x=1729162700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=oyriwGmb0SYdoNYaKJKK0DV/Nsq8B6E5ts/qZXwUjE+eYIRG9iHrBHSm2NuOvEJLT0
         W4vMmx3v0ZAO2pWTMuFsWpnIw7oRzJddO0KaSk03bZ2oEE4/ug8uOQg6ySQL9qWhgnNz
         bi51pKldd10Dr6knemch1BJcSkzRF91IAn/t+nJf28tNTz3PLL39XI1dEodlCTHGxMfE
         i/Od99sw/meHoiux+1nme7YH7cTfuCPa0XXOta1VuO4ivTzBX9aMll/fhALyHLZSQtCE
         rVCO3hGowiG23KJk01F3LlgAsvBAzpR8uuTnEgAVKRjGZpgzNqBMSSFmpSFfLlxnhy6n
         Uf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728557900; x=1729162700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StoaWEIYCCwjnd/+Bfx66/ND8mpJjgF5frrP6tUdr44=;
        b=aapI4hz3BAfV/LN1ph9CodUltUokbLerm72jeQ2i8mZ/C+9omlTWqBiB7zXbHLljUC
         PGWPzoanQokI8ymLvsnpGxTmqVcL/f+nxiaN0nYeAslgnAC5uLvex8NfAEsbYsqiGVyK
         RVPYkCdS9+joZfI12P97rEzdYpFi2MUR0Acv7f8sog+oi7LWXKvNhzZP9Uw53MwbhFKb
         OgF7b9iPucR7QCZH429dpTAy82phk94STvcwpEA+HnJRP+7DEQH0/wVJUZbzmO2J1d7E
         EOBM2P4HpTpuxXMmJjXX/KkgETM6Hv/rnotkLuwQ4fJe6aM1pqVRvTDiKkGS5eBZ/2Gx
         6PLg==
X-Forwarded-Encrypted: i=1; AJvYcCXmFi3o1T9qWPB6oTLKGQVvzAOYffPK/JTZKhXOuF2AxIg2sMdiqlgvMZv6WW/MtE+XJmxdCUKQhXV01z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4E3sg0ikvVAQS3fhZ7VpkG16Hfc8sUn3oJsGcYOAT/2biPJ5R
	+x789SvWto2KKQPdNx81F720rxFcS9WM+LAGnIOLnUIMlbrqSVKehjtxwQOCAYoQmUG2Pf4o7jK
	Ss16996nilxP+FKAM9x2svw72K/aaJAYSg6fZ
X-Google-Smtp-Source: AGHT+IG6zteYy0eiXshByN3a31ubFooYapYA71mK/l2zbvcpHK0YoSgYWnV/kyVCloGT0HPQCGElonWjcU/HzmR4ZZE=
X-Received: by 2002:a5d:4092:0:b0:374:c613:7c58 with SMTP id
 ffacd0b85a97d-37d481d300dmr2263009f8f.29.1728557900384; Thu, 10 Oct 2024
 03:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
In-Reply-To: <CANiq72ndoSmGVzuPR6ikq0HG1kbMp6ADOY8BonD9=ij9tyU=EQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 12:58:07 +0200
Message-ID: <CAH5fLgiqwdKgEux9A-SFAWmhbosW15Ey8j8deKtQa9r336vXZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:55=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > Each version of Rust supports a range of LLVM versions. There are cases=
 where
> > we want to gate a config on the LLVM version instead of the Rust versio=
n.
> > Normalized cfi integer tags are one example [1].
> >
> > For consistency with cc-version and ld-version, the new version number =
is added
> > to the existing rustc-version script, rather than being added to a new =
script.
> >
> > The invocation of rustc-version is being moved from init/Kconfig to
> > scripts/Kconfig.include to avoid invoking rustc-version.sh twice and fo=
r
> > consistency with cc-version.
> >
> > Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328=
985cdf33@google.com/ [1]
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Alice: when I apply this, I will need to add your Signed-off-by here
> (i.e. when handling patches from others, you need to add your SoB
> too).

Oh, sorry I forgot about this.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>

