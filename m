Return-Path: <linux-kbuild+bounces-4104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBD99D706
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 21:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE7C2838DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 19:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2E1CB336;
	Mon, 14 Oct 2024 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCZDFyLO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5D20323;
	Mon, 14 Oct 2024 19:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932952; cv=none; b=Eicf+gYu5/siiaaPPZ/B7yK+TRmBjWh/sXS5BwKEx2UN2lcWzvIa0wOX66HiA/Fu/olITqelz95KJCSJL1II39IkSQpDUEZfgxsemDRVqixJ6FXh+0baAeP3SA0AJOpk4sVU0a+mHtZ9fB3jAAARvrbjYK5ypSLbiBeX4D22gAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932952; c=relaxed/simple;
	bh=3pvO1LZVU1YaxMovJ4az+6Y16JrWH/5UT3MSdDpJ4dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioXSRcBmcxtgJ5jTssUSnopJ5GswIb/lNN5YObLKeVF4qE8XTGldO7lSJMiNtqTs7yqCAJsvi3jISVJQ+LiUtlu0YuZMIMFzEpjJmGyj6LViIgX0CEeRm13jRh2TAu7XC/bAcu7VjRXkw3olQRpLurbO87YQx1f09Uso24t8TK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCZDFyLO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7dafb321dbcso202064a12.1;
        Mon, 14 Oct 2024 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728932951; x=1729537751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q60RaXz2nFoV/SB0SpsusqvRdIF4ug3FUDcLDSRiYN4=;
        b=fCZDFyLOKvXHhcXY8mT/ZCgec8o45oyHz/WMDTnwuIih1YNgjNIxh+OJcVY+wHlgxu
         02dMYdVm32jio9GVrlNRK1oxqukPS/D4PWWi6MOFF4TxgPsfsu0UbTAqpAFyWDozE6Ja
         lp5F44nCxVKL7E5FxVkw3VT7Wz9GeNnQ3flMa0t7ThRJFjkaDaEFWZiM8cfXpPr6NpNX
         0PR3pz+WkOgGxpRN8Vv6+m9sIpwb6kEVBi5rGdYbw6qm+LeI2fxy3zRKfd/a7H3Qy6Le
         hS1e/IJ531aqYUMn9XJZqy5GCLIMEuPFNabYw7kfF91wzdIIuEw4AMSzhtagSVWlhhnw
         8Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728932951; x=1729537751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q60RaXz2nFoV/SB0SpsusqvRdIF4ug3FUDcLDSRiYN4=;
        b=pGW4ks+46i80cUQM6s/yLgN3QaH/eOaDFO3YUhu1grRGS6HdBydlntMykNQS3JhjmQ
         BOKt+1brlSV4veKKjFpKA0IcOaMi82JgDZGrU9DyMwmnilH7rVU7ba8H8T7tAS5nSYI1
         xfdIaYXNcweYV9llr/LgykLZMnSN/v1XRSlSaRc8L7AL4Y0w2nQjiIx/8df3ZPrbCCRg
         tpbSQ0PC4yX0x6CWQnYRH5xmnJASfEWru0mYkRU02EBGgJuN+2Ns9Cp7d2XXuUG9mk0t
         d6VDyrGIPKtciOkILoktuD51i4BPEZHf+J+bP0J3XlVllC/CJVS3JRl2ing8QkHX8lD8
         W+hg==
X-Forwarded-Encrypted: i=1; AJvYcCVKfA+EessCto913gAOcD/CwT+tasBQ+2fzBJXzNVGLUFbYgVXyDyeGqG5n21xHwmI7ohVZ5kHpcf4VzZKS@vger.kernel.org, AJvYcCVlFT1iOMPtLI5FUaLzHX8coD5rXTIPK4vfaiGtc0q+ITcrk1e879Ls0E8Vf/ePX8HbqINDPvzKb6+kn+Epvp8=@vger.kernel.org, AJvYcCW7JMasGDiXsUSRWDKByrI8qihE9STkF/gFWfV+IJSvYWFeGtuGIr4hfs000MdFMMBiidDGV5y+tESRCbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqZdT17Tp6qkTGL7rVzpa4X4oyAOfVrJe6vMlbM9AgGUjxuQv
	cdSl7GGU+9FF4h0J84hxGm/Jkw6iijBTeL1aett70rEZBX1aw2m9Xe0YBE3NJq1Ztnves1IunLl
	um9OGo8R75e3gJqch6ZMlgR5r+SQ=
X-Google-Smtp-Source: AGHT+IFcs1hnOVWkbU7W7pL3lVTs1S62xOh5BV54q3Qfo2wQlCQL+HMQFd4NIwesXuvcVpHMey4ivxNCGKyR+LbguDU=
X-Received: by 2002:a17:902:ce89:b0:20c:da9a:d5b9 with SMTP id
 d9443c01a7336-20cda9ad822mr34560025ad.5.1728932950545; Mon, 14 Oct 2024
 12:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
 <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com> <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
In-Reply-To: <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Oct 2024 21:08:58 +0200
Message-ID: <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Daniel Gomez <da.gomez@samsung.com>, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 8:46=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> rustc ignores --emit=3Dlink=3Drust/libmacro.so
> and produces rust/libmacro.dylib.
>
> Is this a bug in rustc?

Hmm... From a quick test in Linux and macOS (in a GitHub runner):

    uname
    echo | rustc --crate-type=3Dproc-macro --emit=3Dlink=3Da.so -
    echo | rustc --crate-type=3Dproc-macro --emit=3Dlink=3Db.dylib -
    file a.so
    file b.dylib

gives:

    Darwin
    a.so: Mach-O 64-bit dynamically linked shared library arm64
    b.dylib: Mach-O 64-bit dynamically linked shared library arm64

    Linux
    a.so: ELF 64-bit LSB shared object, x86-64, version 1...
    b.dylib: ELF 64-bit LSB shared object, x86-64, version 1...

Cheers,
Miguel

