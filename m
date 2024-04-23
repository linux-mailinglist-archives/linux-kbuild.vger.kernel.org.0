Return-Path: <linux-kbuild+bounces-1666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249F8AE1D8
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 12:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1CC82820D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D625FB9B;
	Tue, 23 Apr 2024 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct5L8WbU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF8B54BF7
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713867092; cv=none; b=KNzLKTm213rJkLPYR5iuRnW/Z8NEPvvggvoNwqDDyduHLcIsumcmJhbgtm2uAGSWGCC3ybNCxzifYE40koE5VOoyILZVEF0bqkNqUNmjpYRPadWqhsr9va2T6lDr2LVhQTTlwRMUl7sWN0vr56sKjhF+POmz+uD1fddj+YAYAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713867092; c=relaxed/simple;
	bh=q8kDJETmxDj06ClSix/ZGqioSV3cfAey6tNYDc2GMOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7BK1eCZWClXWu/li3hwNm/LuDCUz370fWQuFjMgAOXMvUeH9UhHqj5PPMGeykmRNARlH2kkobZUKu5z+jF2c3CGVxNePANS9MFFQoIrIAnbKr9/39FK6z98ntPFhD53WDbeeVXkXujHMg0PBSNJOht//aGbPGVs+NKZp2RGLy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct5L8WbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92841C116B1
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713867092;
	bh=q8kDJETmxDj06ClSix/ZGqioSV3cfAey6tNYDc2GMOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ct5L8WbUD14LNXppZsxLB2H1eTNUVkrvUGM5qJW/u7UQoShF2AkBrZpBw3clqXjoY
	 759yhqbVDT005DkHb+EhbHxIlACngB0h/uFKMUDo/MgBsY/1Q3ZhY01DTOa7YCYzqw
	 lf8SXclKyl9TEuE8LxDv1jQRsWj3XJsN6zoaP5I9OzYQQu+a9opyt4Awxnz8eyko9z
	 KFjL7PBJlwTqhQA8zjV3mCcu+AeRzjQPJOWvQv0qQsmFomL5ND6QbPjKVJn6ixM6t+
	 owNwwK8RiUnSGrgRCLYoNSiXA70b2d2Uirk1BvauBNr6/FyZNeu9GWVDX0BM46zKFY
	 24D0aELh2JGVQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso68484871fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 03:11:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YxSdBIC1L+mLMtCEomEzsgbY69RNihdmQMZhr4hVPzBmI10yVsr
	fKTUC1KWeXHdW0SSqH0GjVnQKP+kzU0uq7ZvesrlwITboDR/YND80m4Tqv5cVjv77ezZ480AUqa
	VM4zgOJWqAeivGOOBwVoxFS3Xh5M=
X-Google-Smtp-Source: AGHT+IFvYipu84i/ICfWYti3OFsjG2bQNjSGcqzj43+M7AQWi7rxrZ3PTDgC5ne5J6vnnvi6/kFYXysD661bHR6HSng=
X-Received: by 2002:a2e:7d02:0:b0:2d8:6787:eaeb with SMTP id
 y2-20020a2e7d02000000b002d86787eaebmr7064835ljc.52.1713867091239; Tue, 23 Apr
 2024 03:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
 <668901914.114470.1713335369416@mail.yahoo.com> <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
 <1927988181.1604457.1713852967808@mail.yahoo.com>
In-Reply-To: <1927988181.1604457.1713852967808@mail.yahoo.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 23 Apr 2024 19:10:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com>
Message-ID: <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
To: Prasad Pandit <pj.pandit@yahoo.in>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 3:41=E2=80=AFPM Prasad Pandit <pjp@fedoraproject.or=
g> wrote:
>
> Hi,
>
> On Saturday, 20 April, 2024 at 12:54:59 pm IST, Masahiro Yamada wrote:
> >>Because even config entries ending with an 'EOF' are not flagged as an =
error.
> >Why should it be flagged as an error?
>
> * Kconfig file defines records of config entries, wherein each line start=
s with a keyword. Line there implies an EOL at the end. So when a config en=
try does not end with an EOL, then it is inconsistent with other config rec=
ords, which then requires special handling while parsing. Ex.
>
>    config OPTION-A
>       bool
>       default 1
>
>    config OPTION-B
>       stirng
>       default "Value-B"
>
>    ....
>
>    config OPTION-N
>       int<EOF>
>
> If the last entry was like int<EOL><EOF>, that makes them entries consist=
ent and easier to parse. I don't see much value in allowing such inconsiste=
ncy.



EOL is a statement separator.

There is no ambiguity even if the last statement lacks EOL
because the whole code ends with EOF anyway.



Could you give me an example programming language
that errors out when \n is missing at the end of the
source file?



I do not think requiring EOL at the end of file
would help simplify the lexer/parser.

When the lexer is encountered with EOF, it must
tell the parser to finish the current statement
and go back to the previous source file.
So, EOF implies the end of the statement anyway.



> >Kconfig does not require a new line at the end of file.
> >Same for other languages such as C, Python, etc.
>
> * It's not about EOL at the end of file, but EOL at the end of a config e=
ntry/record.
>
> * C, Python all languages define statements to have fixed format ex. in C=
 statement must end with a semi-colon (;), a function definition has to hav=
e both opening ({) and closing braces (}). Python requires that a condition=
al statement must end with a colon (:) character, Python also requires that=
 indentations are consistent.
>
>     $ python t.py
>     File "/tmp/t.py", line 3
>       if (x =3D=3D 10)
>                 ^
>     SyntaxError: expected ':'
>
> And any such digressions are flagged as an error. IMHO, config entry reco=
rds should have consistent format/syntax.



This is a job of linter or code formatter.


Requiring a new line at the end of a file is a coding style.
Not a grammatical requirement.







>
>
> Thank you.
> ---
>   -Prasad



--=20
Best Regards
Masahiro Yamada

