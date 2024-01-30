Return-Path: <linux-kbuild+bounces-725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC118425FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 14:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D23701F27BBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 13:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA116D1A8;
	Tue, 30 Jan 2024 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLBa0zWq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4C6D1A2;
	Tue, 30 Jan 2024 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706620576; cv=none; b=DkXzTI90jjU7apgOc6KTiyar8EMBS/Kn91Z2PKW3RPTWYYKdAusFWEdrOo8xvLtzRVmh16FUdIgW6oLzvusjTbAF/i0TY6KW6N4kad6Pv12uFyc6o5Ol2hIvqzyreRS2486+WxI0N+3mscDtKBTvSaFFsmVSr4UEpbEmCBP7M+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706620576; c=relaxed/simple;
	bh=jRzjCLDb/0atRPzlAVeh/A8UabCjn3/OUg4jCrnn7pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1mF4tTrCAIb3IPdDLYn+yRsr19zrJKQ0Pkn6deFZCb80DhIXAbLRGQc8XWictaHz4XcFRxUVJkXlnkegaiH5hct/wsquHaiOe1RIpvzSXGTC3TDC5IHsehF74VxLMI3EVx6Z2rG/chDh4/AgGjY68TzP0GoIHplvqt1OAi3IeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLBa0zWq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00B2C43143;
	Tue, 30 Jan 2024 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706620575;
	bh=jRzjCLDb/0atRPzlAVeh/A8UabCjn3/OUg4jCrnn7pM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OLBa0zWqeww5EZFBUoHSQG3EYCDTvpY+GAFjJQfEhGRzh3rB4Y+uRUwXs+rPTrk+v
	 ELtTaMQIOQcTSFy2ZEVZUW8R0wWfXNbr8SrgMmRSjA0uQ8jwDvbVMz8cxUGXswa1ik
	 ZAsflnQwy6D/0IxLGywnicsxOIyz4lrRvl6ph8abTFlFusDeqRhOaS05aRl1hetFvT
	 x9kK5t4aQ6Pxdt4FW6DETaiaRb0YngNocs3sGQKBzcC4TFXCiTJui3FMXUToH4/Ogr
	 lpWJcnHzWAHUWED1jxrtSXUhDEWZO0G5ORvzGo9Ql5yA+h/xFxgr1IU+89w3CvRLh7
	 11KuvXll/fzDg==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-21433afcc53so2123590fac.3;
        Tue, 30 Jan 2024 05:16:15 -0800 (PST)
X-Gm-Message-State: AOJu0YzmIN4s6KkL3gtM3MCk4/00An+geL6L3GGYUatW31QQcQuHJ/Pl
	jbEgOihqMr/dMUzfGSu9qT7xjQ5IRB2xRnXYMRFH69RwaPJyka72HkD99ihmIwWfC+WKd0GAI63
	CDAO5cMq13Fo6sT8MhCSXSvagTWs=
X-Google-Smtp-Source: AGHT+IH0QKKzJW8xp+4nnQDbAa1mwu9E2R4b/6ilaCz62C2DDiOxDRG8B3m8HReXobVLIV7LvELXlNZY67ilVEKMsDA=
X-Received: by 2002:a05:6870:b90a:b0:214:c782:8acd with SMTP id
 gx10-20020a056870b90a00b00214c7828acdmr6716987oab.8.1706620575029; Tue, 30
 Jan 2024 05:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
 <20240129-unripe-pleading-d2753b766e88@spud>
In-Reply-To: <20240129-unripe-pleading-d2753b766e88@spud>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jan 2024 22:15:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-sKNf9mCxZakeW_zzXiRYxbTaLqC7Z-+M7xYVMRw55Q@mail.gmail.com>
Message-ID: <CAK7LNAT-sKNf9mCxZakeW_zzXiRYxbTaLqC7Z-+M7xYVMRw55Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
To: Conor Dooley <conor@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nicolas@fjasle.eu, andy.chiu@sifive.com, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:34=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> > Hi all,
> >
> > Eric reported that builds of LLVM with [1] (close to tip of tree) have
> > CONFIG_AS_HAS_OPTION_ARCH=3Dn because the test for expected failure on
> > invalid input has started succeeding.
> >
> > This Kconfig test was added because '.option arch' only causes an
> > assembler warning when it is unsupported, rather than a hard error,
> > which is what users of as-instr expect when something is unsupported.
> >
> > This can be resolved by turning assembler warnings into errors with
> > '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> > which is what the first patch does. The second patch removes the invali=
d
> > test, as the valid test is good enough with fatal warnings.
> >
> > I have diffed several configurations for the different architectures
> > that use as-instr and I have found no issues.
> >
> > I think this could go in through either the kbuild or RISC-V tree with
> > sufficient acks but I will let them fight over who takes it :)
>
> I think RISC-V would be good, since building the vector crypto stuff
> also needs this fix.


OK, then I will give ack instead of applying this series.


Acked-by: Masahiro Yamada <masahiroy@kernel.org>






> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>









--=20
Best Regards
Masahiro Yamada

