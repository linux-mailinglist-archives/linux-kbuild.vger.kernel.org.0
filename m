Return-Path: <linux-kbuild+bounces-4914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F439DEF9F
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 10:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D6D1630B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB4B4087C;
	Sat, 30 Nov 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESgqSE/k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212829A0;
	Sat, 30 Nov 2024 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732959711; cv=none; b=DSV2a1ScI7L/NqfmE9/Q4tufZns1BhrR299CfsPnwdrVpQnDvYAZUT7rPF5dyE5q4H8anki17vCkKgidlf3HnGlUulE52SOEJf4Oiwwx6h2gW7iODhZpTJVeHv6gbVS9TjQgJ0nvJlDXz0D7W6iz7BTGynNGuyZJxGwSijHU5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732959711; c=relaxed/simple;
	bh=b3Cn9OADpfYM9TykmqE6t+awP7J/1DjwXMd5WafSOrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djjzOoJFQuf8TzRNTrrVuvKFQ/7sWjeGqdt3ZLfT2x1HYRcQUBIOEs6isdp5wPoo0Ax/Z9FfhTyHZQVn6OleZ1MM9l50gvxZE8wr28VV7zqVTnk+N1KrYEAee5D8n+o8poWihpdim3ICknzhJpUmWB7XIO416+5hE6eguAVaQQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESgqSE/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BDCC4CECC;
	Sat, 30 Nov 2024 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732959710;
	bh=b3Cn9OADpfYM9TykmqE6t+awP7J/1DjwXMd5WafSOrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ESgqSE/kqikW8V7uNJ6/1Ibv0yU4qwMVtFEOrwh0qlF3fFZg3py1x4Sq/l+RTA90j
	 DsOOkMZuoE9fT56KayybWk4+dw4m8WH5vh7teppoijNwZvex0wuwSbxJ6IYf6VX68P
	 HprCMTI6AlvaHBIPZs9OzmaklR/7fxKZFsjPPfhGy7b+6JEOqCxxltPl2pUQB2BdvK
	 cEdQ5qDkYKDlLr9uKHtSM5+kfQpF7Mv/bIEsNgC3QAgOvVVLD/Ay+4nI3pOK+6z3Cl
	 uTkZVgoUcy4fiDkG1THW+m7hJ9RTnTxbu9Mt6VMRPbZALHpoRcZokSFSR14O2KNqoW
	 PompB0uROIWqQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2614239e87.3;
        Sat, 30 Nov 2024 01:41:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVT1HrCpRDgA5NqPb2FzoXwh9ZhFrouceuV6wobqhJ0SYb0z2F0TpQ20Cggh4QG9QoHYN+85ea1tI0sl1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdX26bWwHwTMZzs/f6W/09Yx1+05nq67TG7/gy0Zfy1movRlXw
	Q+dTgPfJU0weyL3YE5KFZM8T5jygz0F5kPqMn5E74fR51BQYQpTWTGpbFOtWhr4o3do/eQEVREg
	kh+iF6hD6XWgtDXenLMH1x9nMKHY=
X-Google-Smtp-Source: AGHT+IEw/ZPznzF/7J5qZU4q5NBlncMKiKWpBcJvAqQp+pLiflYA7vB9T3FzxhFvwg2hiI4ySmzYt3rM8vekLpZgvf4=
X-Received: by 2002:a05:6512:b15:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53df00de3a9mr9577563e87.28.1732959709166; Sat, 30 Nov 2024
 01:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-6-david.hunter.linux@gmail.com> <CAK7LNAQmV=CGzEyJtBRSfz+YW6yTfWza7mf1dPXEiaJDT7z5xQ@mail.gmail.com>
 <fe9de0fe-b069-49b8-b7a3-cfb81c82199a@gmail.com>
In-Reply-To: <fe9de0fe-b069-49b8-b7a3-cfb81c82199a@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 30 Nov 2024 18:41:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARv+2r1v8t8HwjzQVQqz4M+-WUn52XL+jb1=0OgHqOY5A@mail.gmail.com>
Message-ID: <CAK7LNARv+2r1v8t8HwjzQVQqz4M+-WUn52XL+jb1=0OgHqOY5A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] streamline_config.pl: fix: implement choice for kconfigs
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:18=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> On 11/5/24 18:33, Masahiro Yamada wrote:
> > I previously suggested checking how the 'if' statement is handled.
> > https://lore.kernel.org/lkml/CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4=
J-vCZZN=3Dg@mail.gmail.com/
> >
> I think I understand now what you were saying. I misunderstood what you
> were saying because I thought that you were saying that the "if" blocks
> were not implemented.
>
> To paraphrase, I believe that you are saying that the "choice" blocks
> should have a similar style to the "if" blocks.
>
> I will take a look at the patch that you sent and figure out how it
> would work. I would like some clarification on the information in the
> choice blocks that are not "depends." Should those also have the same
> style as the "if" block?
>

I am not sure if I understood your question correctly, but I guess you are
referring to the similarity between the following two constructs:


[1]
choice
      prompt "choice"
      depends on X

     [ code block]

endchoice



[2]
if X

   [code block]

endif



choice  ...  endchoice
if    ...   endif
are similar in the sense that they both define a code block.


The if ... endif construct is always associated with a dependency.

The choice ... endchoice construct can optionally have a 'depends on'
statement. If it does, the dependency is applied to the entire code block
within choice ... endchoice.






> I am not sure if you saw this email:
> https://lore.kernel.org/all/994efba2-2829-4874-b5fa-9f5317f6ea6b@gmail.co=
m/
>
> There are lots of information, specifically "prompts" and "defaults"
> that are distributed to each of the config options in the "choice" blocks=
.

- A choice entry cannot have a 'select' property.

- A choice entry should always have 'prompt', otherwise
   the choice statement is non-sense.

- A choice entry can optionally have 'default'.
 If 'default' is not explicitly specified, the first CONFIG option within
  the choice block is the default.

- A choice entry can optionally have 'depends on'.








> >
> > BTW, 'menu' also can have 'depends on'.
> >
> >
> > menu "menu"
> >           depends on FOO
> > config A
> >             bool "A"
> > config B
> >             bool "B"
> > endmenu
> >
> >
> > This is not implemented, either.
> >
> > I am not sure how much effort should be invested in this script, though=
.
> >
> >
> I will look into distributing the "menu" information.



--=20
Best Regards
Masahiro Yamada

