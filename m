Return-Path: <linux-kbuild+bounces-3251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42394962073
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 09:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F18792829B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 07:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5DF157494;
	Wed, 28 Aug 2024 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVlmGTDG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696E14D282;
	Wed, 28 Aug 2024 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829341; cv=none; b=d3Lh5RR+pRrwZVlTJgxn8CUkvUq6+NvR+nZkHkAfsPH/2RD2uW8pJoQ31ZBcgoRAqxV+bKJRzRI9bzlmzTK/pTJn2/N/MqcISC/sJuricd/lTwkAnKyoFMPXdcYmqCiPBLD5PLmvBrF5dpZJ7gQTdjBmpzYKqir4HtKKNveVILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829341; c=relaxed/simple;
	bh=NMwwwM1jrp/qrf+hPLfBh9ss0lqgPsdHmYFP+q8ILEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pO5Vbv3+nf+aQSY5+D+9yDfftgBaxZde9+cPr4EihrQVGs2937PMhNyW4+JDspWggg87d2g0j/Sxw4jaaV4Kd7AlpEexQtKREtGz70yO/EY2Qd8LkmXGRAcyjg+ZM9z25o/H4qjgWu5Lz5LsO+pvtbLPG46fEhQUttWgjlKQ0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVlmGTDG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D7FC4FEF3;
	Wed, 28 Aug 2024 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724829341;
	bh=NMwwwM1jrp/qrf+hPLfBh9ss0lqgPsdHmYFP+q8ILEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VVlmGTDGt1DEfNNVnLf2kSpnzzXEBlHUp8QVD2PvvhsRsxGVueSojv1wHXk8U4+9j
	 o8ujGqY7Ff/gj9lfdDTD6Rt/cXc05VHh2shOwrIlrzidG1Sh50O5qBu0tLQaNdhQ0O
	 dbg3h7IrLnhQg9xOY/SB+d0+lTnLucCqZdCXnviGyF/QfJdRmjZdIegu/L8CBcCn7p
	 P1nslkrgOB7jC7BRWCPOdqcXf0WNZA25fYoimT0t2pla9pm7OkxOfXI/fiIs004TcF
	 ET5/tFS9/umfCtgY8PPx76Xodu+zj4M1yU5HTzuo5ZcDtx7E5FMEZ0APVJqRciuhzq
	 YIAHuZjMt0tIg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f4f505118fso54024941fa.3;
        Wed, 28 Aug 2024 00:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg9jdiZ3d4GxnmIbKMi1iBWmP+0IyAYlnhUZD4Ir+KR4inLHDvEhBfdJ4V5PixMeDhsKiVitvzbV94+2I=@vger.kernel.org, AJvYcCWpS7LEhLd0vGXjSMBt4U+L2RSYi4pWi39+Q/B5wW1XiR50tgsZIfLfjg/Bz2zhZ/B5wijYmpTFKODkSWlpuLw=@vger.kernel.org, AJvYcCXHLakEkbP1B9ivRPq5TOAkBDd/CjJhIFanMZjSbnGoEfPZitiOkkl3ug+KcB6qXiXSJLHPdMWoSn8iS/Itcg==@vger.kernel.org, AJvYcCXhD1TZAZeXDMtpEyBHWeE5lcpKKDVLZkhpRWOVwq1A+4kz7Kur6nyiNeCTQc5/QTIM53+sMa4F2K+woxzs@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYJnlzGXSyKuS3OUJawcKM/bnBR/vhqFlyWEwuX75RIr+AumB
	+N3ql1PCAx0iqHp0Nx99g/8DEzhQB1aqYXgTNGWVuffchO4SgwUdkL7EifREKJmABOqYiLbLFq2
	rtf/zIGzWENafpCPUn4T0LX7QDpM=
X-Google-Smtp-Source: AGHT+IGeiHzjppyiOzBEOUZ/0V/PBewgAL1CCGk/uVR+74Z8yFzChu+qKl3qWPdvEuIh5XMH14MHw9544LmMkmjX1ss=
X-Received: by 2002:a05:6512:3195:b0:52e:9f17:841a with SMTP id
 2adb3069b0e04-534387558bdmr10993178e87.6.1724829339571; Wed, 28 Aug 2024
 00:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-25-samitolvanen@google.com> <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
In-Reply-To: <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 28 Aug 2024 16:15:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Message-ID: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 3:50=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > The compiler may choose not to emit type information in DWARF for
> > external symbols. Clang, for example, does this for symbols not
> > defined in the current TU.
> >
> > To provide a way to work around this issue, add support for
> > __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> > the necessary type information in DWARF also for the missing symbols.
> >
> > Example usage:
> >
> >   #define GENDWARFKSYMS_PTR(sym) \
> >       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
> >           __section(".discard.gendwarfksyms") =3D &sym;
> >
> >   extern int external_symbol(void);
> >   GENDWARFKSYMS_PTR(external_symbol);
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
>
>
>
> Commit ddb5cdbafaaad6b99d7007ae1740403124502d03
> had a similar idea; it has a reference to each
> export symbol, including the ones defined in different TUs,
> but in assembly code.
>
> Didn't it suffice your need?
>


Presumably, this is an unfortunate duplication, but I do not have an
idea to avoid it.

The symbol reference in assembly code works in *.S as well as *.c.

The C reference will pull-in the debug info, but it will not work in *.S





--
Best Regards
Masahiro Yamada

