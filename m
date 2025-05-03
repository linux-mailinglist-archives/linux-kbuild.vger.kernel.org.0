Return-Path: <linux-kbuild+bounces-6910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165EAA8189
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646823B3C2C
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 16:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D581E1C84DD;
	Sat,  3 May 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEk5bTkT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFB1A704B;
	Sat,  3 May 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746288104; cv=none; b=CRZHnLN9/6uJOyWyhQC4otoYVub9hhHj9vvkykEVc3eAvM+Q048xYgl2I5huXr++sqEUCasBwdoVjPsX0X08iKvXT0SbcvoSoClBY9mZz+NmnSsG5h+yl1oONGYHZvFLv9ERiH2Sq2FkkdGXD/0105S8bK5Vkr17C7VRTX1udBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746288104; c=relaxed/simple;
	bh=T3xhUt0kg/A3i3GrfehzEXjZkOb3WIjWQfFzVpGNbJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJI+UxKkOPm3JC/yeq1CXGHLibsNvfZL37VhkKQ0BS9+yisnjpzzBe8yY3JF2kH89pgzcD68bSiXj0yujoW/1dbi4LLU93YT1DOgXU35z9OBXRANP8nIDN2HAEe8YS6BH5DJuIK9Z/JEcX0uVW4rnW+Z4UWLP3QWhQdGwjslkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEk5bTkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B1EC4AF0B;
	Sat,  3 May 2025 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746288104;
	bh=T3xhUt0kg/A3i3GrfehzEXjZkOb3WIjWQfFzVpGNbJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UEk5bTkTn+Y0ZmB62xIHEGGKmsjExMw0cGKB4xehquY32KIGuw9H0xVJmSffP+pSK
	 OcGMchWg0ORDIhSaGeg2SIk8+9n5dfmSpaUido0qp3fKGkG102pAX1dMeAeYnsElKL
	 PUH33MwLkNG3vHwu9LiY11Bwr9pO19mXXpaWyRYLLCnS9x7Cg7JhWJfJBnUFNj5PDp
	 J9zJTlcQoJ8FtvcHl4g9GT8rsM9gVOwRfqbEaZ65We4U8nDmxpl7SbR89tdpGKRJr/
	 DD/H9Z35eGcy7JPLwlu0FCmEP8W/uo+y939Obf5smli7z8+XB0A5TJqmOk0deVIUAL
	 LGGXiu9ngw44g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bc464dso26531951fa.0;
        Sat, 03 May 2025 09:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe5JFk8yQ8uT/YOZ0yq3ek7GpwZ6Wd56E2xbHlNMpYp0d+W/GMAWRM8UIVkM8XRlXMP1v5Jtmjhiq54IY=@vger.kernel.org, AJvYcCXQBVUDXAT5446QvmwiAeXozaINsRFqpz4XsiCOejqh91wIudYHEQv2ya0nCQV3Eg5Yspqw65MRbLsATcuywkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq0bPIAYHWdshAXs61rHEy1QDYk/8DT18lef4Iw8SYwpNJk3j3
	Md2iIbuXx+FQlM1/LNSF/De/twacA//EDFM2Qsm3pgwAUsaNCOXSit+5/zF8sEmlAaVRDl45aom
	tklo5sEgcGvbQXQvCf/Eelq1VErg=
X-Google-Smtp-Source: AGHT+IE1k2njXlrJVwx5wy0BaMqq8VrYSRX6eObRLAgRA0UXd8FU1sIFugB+B0oEBM4JwiTmry+C9yKYFVlh2fsn1qk=
X-Received: by 2002:a05:651c:19a5:b0:30b:efa3:b105 with SMTP id
 38308e7fff4ca-321db694cdamr9994841fa.19.1746288102837; Sat, 03 May 2025
 09:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426030815.1310875-1-rdunlap@infradead.org>
In-Reply-To: <20250426030815.1310875-1-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 4 May 2025 01:01:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
X-Gm-Features: ATxdqUFVz1PuN6NjNtYZqjGYBrlw_r1_IMNCejsbhZmx44ZvOo_z9HHNtUCST4I
Message-ID: <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:08=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
> bpf_perf_event.h for arch/openrisc/.
>
> Fixes a build error:
> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incompl=
ete type



Where can I get openrisc compiler that enables CONFIG_CC_CAN_LINK?




> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
>  usr/include/Makefile |    4 ++++
>  1 file changed, 4 insertions(+)
>
> --- linux-next-20250424.orig/usr/include/Makefile
> +++ linux-next-20250424/usr/include/Makefile
> @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
>  no-header-test +=3D linux/bpf_perf_event.h
>  endif
>
> +ifeq ($(SRCARCH),openrisc)
> +no-header-test +=3D linux/bpf_perf_event.h
> +endif
> +
>  ifeq ($(SRCARCH),powerpc)
>  no-header-test +=3D linux/bpf_perf_event.h
>  endif



--=20
Best Regards
Masahiro Yamada

