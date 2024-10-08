Return-Path: <linux-kbuild+bounces-3979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A2995819
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FF2EB22AA3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D49213EC9;
	Tue,  8 Oct 2024 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx05XM1T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3BA20CCF7;
	Tue,  8 Oct 2024 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728417961; cv=none; b=rgXQy8Jvg3wKFh+k97xNzvkqWaxuEGWw7TlUC6rUmL7ojnNgarcqCLzNS1J0W+z2xZOvWd5UIdiP9h3MWTJZp/j7gn4ubUkTNrRuXBtaVGkNNNL3l+uV3BVPmc5OQF49a+DuskM6w9oPp+Kfef65ueq+LfH7YHO/IukHTSK08WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728417961; c=relaxed/simple;
	bh=/2LRT6rx/fg7HOwvg68EGsALMws7VjpMk4XSbWJJpqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOHByh+YMbu24vfY33TSonAiFA4RlzYgiQVIVIgoPsLwVA8G7g1R5aiTLB9OxcuBS5cqbd/IYczsYCxgUuvklSsfUYgHttByPJqeo8luDbcwZVrvN6uPOgemRuj2B5LChfdxvvhYSzgmE6s1Xs9X2+fNiRD27221ffUPP/z2px0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx05XM1T; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71dec222033so555551b3a.0;
        Tue, 08 Oct 2024 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728417959; x=1729022759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNLhV/obBfV40j9AIYreSsSZrsBabbm+koEaj8DEnPg=;
        b=Lx05XM1TgXQVlbLarb0TcQRBYcnZ/NuTHkDQr2mSAYZW0Itv2jfKsdwpzIubEvcYpt
         vGJHBInQj6JiCEGpAIIXu/LClmYQn+axAMbAxHD1dlDzGdRRY6G0M/iZlJghHafA3PZc
         h6KycaXRAymBpiYUHw/980N+b21OnyNo6PFDD9oQ9E/K6N81EOYA322TDV94pJZB3Y0E
         9H7DTsetAu16F8Lzk/LedjgCdxBpFIJtHBlAZxPfQouv5vVx0D6LO3do+9hmOEyU8hGf
         xlA28jmrrVavXDKFTdjwSYGZ3yN5S5J2yRTaOziHgT+15Yi5B+jddoaiJvlchKYrHml9
         F96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728417959; x=1729022759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNLhV/obBfV40j9AIYreSsSZrsBabbm+koEaj8DEnPg=;
        b=MEzB459mnY8EJVe+cbrU5DPUkCZKelJgJthq9j9NP/3L/rn6zapuxNf+wPEwN1iA1I
         VPxkaXOoqOvFG9P1jHmFph27Cldpkt4EykddAAgrBKC9uD+mpH2mBVFwF6FaaSQI+6cc
         Fh4MdX2yc4lvbWEEaCZivZiyPlnop5AIgO+v47rtTKKiuRnR32j8Cos9lJjHZuEccctT
         JqaFRqGzbJe4m4r1FoMvDzlsS40/jCl1mxncBfjnd0VsWJ/MkwQXHZ6+RHV3k0Bz9UIf
         QlVbqi/k19gmCfr8Lf14A2gkdB4dfTSanbQGVeS5Qc14lJivFT21cI5eBkIzXs5cyvSg
         wFkA==
X-Forwarded-Encrypted: i=1; AJvYcCVUjFSrq6X5BUGQD1A2rW9BQfg5kAUnRws6W8Iwvrg3+WULBPXH2K0iNecRQYn3MC3eI/t+X4xoBvhgj8KSIl8=@vger.kernel.org, AJvYcCWMCSciGGHvumG/jufH/dBuKHI6KNsZ3dcLsp9K0TpbaThZJDd/tymhUhhYfcfWhgsoZxmBQaq2c568mmeK@vger.kernel.org, AJvYcCXCurrSw94J+q7+xPnjLXgwvHvRduwAgE09QRI3QWxUfsAyd/DzOJ2d101HcweypjFvjjF04YwOjx7wx6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+NBdQVwAid/58yEm8ePLnoYWzCqTR2HXXW/Qnke7rFNaWQkV
	boFZTCLUfrhXmMUujjtkTqTrTLSoRwtVJPA4y9EXTLYUPxapVKgnxj93KWTcEj2hKJqI4Jj1eHv
	BViBoDM/jzdOozapJemiejG8joFA=
X-Google-Smtp-Source: AGHT+IFJuqOSZA7x4j93VIfPJHv4wC9JoTNS9GyZG8yUMsy8M1eJjTt8R9XiQgwCfMHSHPLUeZjQ5XLSX+lYJF1zKeU=
X-Received: by 2002:a05:6a00:3e28:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e1db6491amr31019b3a.1.1728417958992; Tue, 08 Oct 2024
 13:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
 <CANiq72k-Z88A+Bk6q4M5dnVW74L7u85Bqdo0ptSdvVaD6BR3_A@mail.gmail.com> <CAK7LNAQU8m=QrEXS2h_0Q8UNqqTmkud18zc8RM6LVPsKYM5z3w@mail.gmail.com>
In-Reply-To: <CAK7LNAQU8m=QrEXS2h_0Q8UNqqTmkud18zc8RM6LVPsKYM5z3w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 22:05:46 +0200
Message-ID: <CANiq72mCuqCE3fA2jgaaA4fyj1kNzYm61C2600vAf0CT5=JP0A@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: add RUSTC_BOOTSTRAP to rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 8:45=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Really?
>
> $(shell ...) inherits env variables in my understanding.

I mean the Make-exported variables (not the external environment),
i.e. `RUSTC_BOOTSTRAP=3D1` that we export in the main `Makefile`. Those
are not exported into the `shell` function.

However, it turns out this changes in GNU Make 4.4 in commit
98da874c4303 ("[SV 10593] Export variables to $(shell ...) commands"):

    * WARNING: Backward-incompatibility!
      Previously makefile variables marked as export were not exported
to commands
      started by the $(shell ...) function.  Now, all exported variables ar=
e
      exported to $(shell ...).  If this leads to recursion during
expansion, then
      for backward-compatibility the value from the original
environment is used.
      To detect this change search for 'shell-export' in the .FEATURES vari=
able.

And indeed:

    export A :=3D .PHONY: a
    $(shell echo $$A)
    a: ; @echo exported

Gives:

    $ make-4.3
    make: 'a' is up to date.

    $ make-4.4.1
    exported

Cheers,
Miguel

