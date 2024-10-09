Return-Path: <linux-kbuild+bounces-3987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B25EA996540
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D71421C23B6E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 09:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9135518FDB4;
	Wed,  9 Oct 2024 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aVpaAOFv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BA718DF83
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Oct 2024 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465816; cv=none; b=eFwYpDeSf1bjoqq4bz9t+Exgs/oHeUnB/MpSlFzNwFgXXbZVz3z8qemXicq1opXPQ8vfm4K0rT8NVNELZ1Fjarb506DlEb1p11jl+MLDb12F3/wX6eu/JVaGQslnEKjstnFXNt8mPYw42S8e7D1EL3GQyEsOfIWwAulASIPKyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465816; c=relaxed/simple;
	bh=ktYsqGkgVwsuQfle+cPdMDGb7cbezbOmKqQ1ireEeHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2bhkEZ3Qa+JtjlebD/+MsfQgi/CMZ4QRMJNYvtUiBZmTDmrwtwxoQAY3Hn42OpX6zysqNkS/YFLpI3eWKaEsgd4NdrBBunB1wvzP4zz4Ajs9b5uH8NhVKSWVsE50Jgp/MPkawBj56ppfcY3c8MQtJ+xWb4n/DWgV7Y4vrAuIXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aVpaAOFv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ccd50faafso4277142f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Oct 2024 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728465813; x=1729070613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ay/Rfo14IiDyH9XXMZY2StDZmjT+izo5uiUwHKG0H1I=;
        b=aVpaAOFvibR7BiHLw6JNCq8uKW6RCaQPH2jUDBKrJTClDVkh7TlNeAVHhWvn9JduuG
         zwqqOhKj/7V65ZaNQyVxa6bMM/G9dJlhsr0yMzsKA96ZCoFZBG2fOv6H8n/rI21KLeyR
         M4T4r7X8fwejr5eM9BOlYmqVOpdDSdtNZAxJdBocIxixWWDNMJuMtzkZJ53BUt1vmp0g
         Cfla+bbvi8+mNZhbbpO08fntMdMDVz4hV+yOK/GPREZ4DZi1Z+x7yijm1CkhsaYe75Hg
         mOersqx3ta1bsditjxeH6m3UXAmYiFglCtEImMIZha8428SD276y/CT0OfdD9dT1WKBO
         ml4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465813; x=1729070613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ay/Rfo14IiDyH9XXMZY2StDZmjT+izo5uiUwHKG0H1I=;
        b=IzTgi3pbfUCtAKnPKgRAja2soo8WPF/8ilCETcw9T9K2uqZfv3PLYf3Uz9l097UinG
         KMSbZ8L9sBtQzbPDpoY8axD48AMxfZ+FHX1kvytBk6v1WuofNIdLokDgfYI6q+A/Z3YF
         cDLDk2lbC9McRdB8r+ZxNg0XnPjA+hMTMqAC655SlH+nMJE+CoDeeBnAOy28Fw4AAHqs
         ssUM+2LKNFJDdti3veoAn7bP2kvy8XVQW/0YqyzWkTMUzA+RECr9JUVCrcwU9yRk+qdh
         ZVo97cH431rilCMY2onT371QjWxkllER4Cf+b58QE5yR3eoAeRSOvVJ+YDBUE93BnAWy
         35BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyoCyXITYjl2ySz6pr1z1IxzLxm6FXTfFOnYoqdT+n+MSU8d44GBDquwTicAcepI3XQQKyLayh6ckgRQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2Gca/BTupVGTqBQt4FPeRkvh70ikoUXMRcN/YLZSJ+rCSgdi
	qzD5T+AXBpo2zrof42tr+qNNyOMLpjYwd9aZaRpSOiQIIk/JAGzphREmQx4MGkcjABCeSgYsN+S
	z3WeWOxr/GJv7Df4pFD3xZCywwYLv6AhUxAqO
X-Google-Smtp-Source: AGHT+IFMsipFkKA3R1p9BIHpiYpH/FISHfmG9Yo5hCqO9uWjv6lPsvIModdpt5eDq3uwgzR6mW7qYTg/6YqHm37a8vU=
X-Received: by 2002:a5d:6a10:0:b0:37c:ccad:733a with SMTP id
 ffacd0b85a97d-37d3aae6013mr978829f8f.59.1728465812972; Wed, 09 Oct 2024
 02:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
 <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
 <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com> <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com>
In-Reply-To: <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 11:23:21 +0200
Message-ID: <CAH5fLgjwuGUpKogOVUL4+fUW0-xWM+3ZQ+WmSQ+J00G6+uR9bQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:53=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 8, 2024 at 10:23=E2=80=AFPM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > In that case we should omit `-o $$TMP`, because `rustc` is emitting a
> > warning that it's ignoring `--out-dir` because `-o` is set.
>
> Yes, we need to omit `-o` or we could use `--out-dir` together with
> one of the `--emit=3DX=3D...` types to be more explicit and avoid buildin=
g
> the `.rlib`, which is what I did in the GitHub issue.

Miguel, can you link this issue? I don't think I saw it.

> IIRC I used `obj` to run most of the compiler stages just in case that
> mattered, but perhaps an even simpler one is good enough, e.g.
> `metadata`.
>
> I think just `--out-dir` should be fine and is simpler for this use
> case. However, apparently outputting to stdout works too, so we could
> do:
>
>     --emit=3Dobj=3D- - >/dev/null
>
> and avoid the output file altogether. We still most likely need the
> `--out-dir` in case temporaries are created.

Masahiro, are you able to clarify how to pass TMPOUT to rustc?

__rustc-option =3D $(call try-run2,\
       $(1) $(2) $(3) --crate-type=3Drlib $(srctree)/rust/probe.rs
--out-dir=3D$(TMPOUT),$(3),$(4))

Should I use $(TMPOUT) or $$TMPOUT for this case? Right now, only TMP
is defined inside try-run. I am assuming that there is a reason for
having TMP be defined in try-run, rather than just using $(TMP)
everywhere. Does the same reason apply to TMPOUT? Should I add a
TMPOUT=3D$(TMPOUT) inside try-run?

Alice

