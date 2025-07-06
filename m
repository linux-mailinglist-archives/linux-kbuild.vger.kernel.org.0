Return-Path: <linux-kbuild+bounces-7889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A7AFA79B
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Jul 2025 22:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23237189D111
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Jul 2025 20:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014B12BD5BC;
	Sun,  6 Jul 2025 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHObELFw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A42BCF70;
	Sun,  6 Jul 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751832065; cv=none; b=fqE+woIXD39KAijy/7dwrBWE676vUBwXgoEYgAhoeECLdVcbfBNYbkaVwTcS0ytHipCwmhIwCKK4yAoHTR4Rp8muzDOxgT91zaKu7Kb4Si2lzxBF3GE8sQXiRmxmG5/6A4jrdudrNcvZwhTLlZ8wq9lUAaIFhmr1JbQeR6X9bJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751832065; c=relaxed/simple;
	bh=XKbWsh6+0c/j+3Ee8yYRQNiq+fXjdF4zPjnJ/9wrZLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVyRClupkSIWELMTqfrl2wa0ko+9lojalgG7slLczSGxnttgBFlojozbj5ON9JrjBOOFoXJTg/h2tdUkOqeGyp/RrZ243knORa43jiVPHAndTg7mDAUEzRc5I7N1Z+gbDVa2AFA3nRi6F2zFH1Iv3d2wik/Xio2oR/Bg8tgG9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHObELFw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-312a806f002so484209a91.3;
        Sun, 06 Jul 2025 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751832064; x=1752436864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKbWsh6+0c/j+3Ee8yYRQNiq+fXjdF4zPjnJ/9wrZLE=;
        b=BHObELFwIkQBwAg+UeeziFS3MWOcTyYn8gGhxbqJLKlfgjAbVk6yHFgiUKSdyqy5tS
         kGRqblfRXxfOzm7s02cmfndNwJGEtyiC66vlRL9UgjAEtCXkfCA3Xl54lzZk9op9fzr0
         TMUV+a+4YdZSS1BOFcHsT6Mu4AtYWiW82y3BoaxAePi4zBrKWlcJjkOySGVy13hj2j0z
         cjzLOyeQJ81UBBBghY8bi3c6YnABiyukx1vvtQ6XHuZhv11sPNc2GvnTvFNzWiO/2x5r
         VIPYpn2U6/6jO+amxrRnEvTqbhp9zxZYFXYexq6Ws9u2mbDs/kcj1ectGtox11rBbFTL
         sZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751832064; x=1752436864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKbWsh6+0c/j+3Ee8yYRQNiq+fXjdF4zPjnJ/9wrZLE=;
        b=M3ZBv851RciDYRNO7XJj7mEt5xAQpeEkEZo8gqMrOlbK1zZdvksWaUsbpuxMveGkJp
         +a5O3jw7XZ4vn8MUvGOVxFl5YGrAZa2iykCJJIQA0oh226cwAGyGoy6DCJ55EMGuDHxf
         ktfz5EERFpAky6ys5YgKWhfu2h1a/tx0fE1rEpH12RNxJOqTJwi0hM2Ioag/sr1podcL
         Yathz9WNDJvfINrXXCRLV1PBzXjIxaSpZMukp/PhQRrpGFEEX3r5WzCDQQMxexkSy2YJ
         SacQL+rX4STm38g4+XX83afLkSq/Itay0J9ConisL2GAYVA+TissnANgxf/I8R+rlUFs
         Mu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9l6qGmECBaFyEUTDZBKwTGqKmm5/GVhiN5NGJM+Hd67K7LqPP8+12AStH5qwQpCPE4zE7JIfl1ESKSnHwpos=@vger.kernel.org, AJvYcCVi7zFGvgWctsQslBpOUowP0TVsVt/wJPIiG+01b5jFSJGHmTcBHxis9zBwfT0iSm+R2V0ceYeewCcVhTL6cQ==@vger.kernel.org, AJvYcCWalPmCVPpZeoZanp9IUMRJsvfEgiJ81/W4oR1o0SQqWmK+CZ3+yuQ8kq35o225rzRbFQWPzw8EK4WQaHUe@vger.kernel.org, AJvYcCXluGAGXCpQBFNRm33+f4cdLsPECtc1mOIawK3pzWde0KThsNi2lpsMXBmUfr6GoeI1Izdmt5LJoKqlCOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XUTShWmbexyzZVhXYCGLe8qy2yFy5clh2or5Uf1wlKtNTLQi
	Fbu20tRPdQLqZoGe5L+FCPIzcWSbC0r9AiyPuMevzb37zmUPPbc23BaVQu/ei1rAnfF220w6DCS
	wfwsORrZyFkcNPn+go5YPcCLZLPkMiz8=
X-Gm-Gg: ASbGncuXi63Bf4oWpWbj2xDjR3kF6CCXwp8wyt5lGeT5+LZV+L+sh/Dg9j0EzoVt98z
	/Il07875iA+zGY8Xf5f5OM/p4cEt1jT2gCd3+MaBidywk3H3C37TzrvZlQMb+5mm1O1cseR07Je
	7WJGgW0CEURf2nCpZaLsQOghvZA2nOwelh+nBeaZoP+78R
X-Google-Smtp-Source: AGHT+IEx+FxLj3+Jq0qZjgdDOleKi4gj1nVhQ/EsMEOeW2WW/Y1EUb9umr2TPWyV6moDYtw6xdPtuSS9czsfPDQPv3U=
X-Received: by 2002:a17:90a:c105:b0:312:e9d:4001 with SMTP id
 98e67ed59e1d1-31aaccdb82dmr5740695a91.8.1751832063576; Sun, 06 Jul 2025
 13:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org> <dR1azql_mfbkqYH2GgSR3NoChU-VhgRMnWzZg_hWmpVx6P3-fLsrU8M06AwCzQPdrTSyCw0gzxG1bbGr7Wc_Dg==@protonmail.internalid>
 <DB1O6I32IYI4.OFHKKMD9JV40@kernel.org> <87jz4orxh9.fsf@kernel.org>
In-Reply-To: <87jz4orxh9.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 22:00:51 +0200
X-Gm-Features: Ac12FXzLCHMIAhvH08Ro5_kqwe96eI9obFV_WsRVejA5HvmzDAV3HeSyhZ8Y0iE
Message-ID: <CANiq72=p4ciaaGQeB90qgykuLhv5BO-MKT3rfvZ5ni64jsrKBQ@mail.gmail.com>
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> It is an inherited name from way back.

Yeah, that name comes from one of the very first PRs. I think we may
have discussed its name in one of the early calls or maybe I just came
up with the name.

Either way, it is almost 5 years old so I would suggest taking a look
at naming etc. with fresh eyes.

Cheers,
Miguel

