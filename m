Return-Path: <linux-kbuild+bounces-539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF61582CA5C
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 08:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657481F23B24
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 07:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3C81A5B7;
	Sat, 13 Jan 2024 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFNCJpby"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8D1A29C;
	Sat, 13 Jan 2024 07:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0783CC43394;
	Sat, 13 Jan 2024 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705129937;
	bh=rFvVei4t/+C8XZuuE9/e6kJP7xx3vyRVtZCphMPagVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DFNCJpbyoUZiYq+997Is3j9DIObTphY6egbUlh8Tpt/OpyD6B3ADY9h2H62e/JDj/
	 j7b8okVx0Bfg3ICxp4z9NXx3IR23TY5LDcnIQinnJu5NJuBNAnhz+3tEvjIBtxZx5x
	 hupNwEUyZ2IkCwj1TL856+vEypJG78o1g/1OhmVYOTSc1dQG6gfeEUHU0KAu/wM7YH
	 Fp3NiZMIFKckxHcB+KxbhTnI5JceUgOwA9Kge8PhdUuwYFo4HM4jYY3yC9ujVwBGCR
	 0rxU5nUM+xzjonloLRHhCP/BHb5XfrnuMToCAfQlwC6EiUpL9Crq10GULlT7D7ckXD
	 MxNca09mxbQsQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-20451bc39b1so4377810fac.1;
        Fri, 12 Jan 2024 23:12:16 -0800 (PST)
X-Gm-Message-State: AOJu0YyxQw8B5OdyTyJmSAa/4TKzWQgMZxD5r2zhnvN1CREIcduTP7Do
	jauMDg//7w7GNeqIdnOVfVcVZ+FwT1BkkgzmPu0=
X-Google-Smtp-Source: AGHT+IGoMj0EJb3VpuPKwjRgjXjlS4/7aWkNkLdlaFJqOTadaeP+55slSxK97AeSwdAMrlv5InPDTOi3mm4AQ4UL6fg=
X-Received: by 2002:a05:6870:c352:b0:205:f549:9aac with SMTP id
 e18-20020a056870c35200b00205f5499aacmr3162178oak.115.1705129936387; Fri, 12
 Jan 2024 23:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112120910.3751062-1-vegard.nossum@oracle.com>
In-Reply-To: <20240112120910.3751062-1-vegard.nossum@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 13 Jan 2024 16:11:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwXwWJE240Z7jvprkNs-cYDE5N_640w0r6u85_Cs2tBg@mail.gmail.com>
Message-ID: <CAK7LNAQwXwWJE240Z7jvprkNs-cYDE5N_640w0r6u85_Cs2tBg@mail.gmail.com>
Subject: Re: [PATCH] docs: media: rename gen_rst -> cmd_parse_headers
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 9:09=E2=80=AFPM Vegard Nossum <vegard.nossum@oracle=
.com> wrote:
>
> All other commands in the kernel use the format "cmd_" followed by some
> variation of the program name. This is also the format documented in
> Documentation/kbuild/makefiles.rst.


This rule is only applicable to Makefiles that follow Kbuild.


The doc subsystem maintainers ignored Kbuild and
started whatever they wanted.
Presumably it is an unfortunate thing.





>
> Therefore, rename "gen_rst" to "cmd_parse_headers".


Just renaming is meaningless.


The reason for "cmd_" prefixing is to
use the macros in scripts/Kbuild.include


In Kbuild, the rule looks like
$(call cmd,parse_headers)








>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/userspace-api/media/Makefile | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/u=
serspace-api/media/Makefile
> index 3d8aaf5c253b..bfb90fa2b3fc 100644
> --- a/Documentation/userspace-api/media/Makefile
> +++ b/Documentation/userspace-api/media/Makefile
> @@ -12,38 +12,38 @@ FILES =3D ca.h.rst dmx.h.rst frontend.h.rst net.h.rst=
 \
>
>  TARGETS :=3D $(addprefix $(BUILDDIR)/, $(FILES))
>
> -gen_rst =3D \
> +cmd_parse_headers =3D \
>         echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
>         ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>
> -quiet_gen_rst =3D echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
> +quiet_cmd_parse_headers =3D echo '  PARSE   $(patsubst $(srctree)/%,%,$<=
)'; \
>         ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
>
> -silent_gen_rst =3D ${gen_rst}
> +silent_cmd_parse_headers =3D ${cmd_parse_headers}
>
>  $(BUILDDIR)/ca.h.rst: ${UAPI}/dvb/ca.h ${PARSER} $(SRC_DIR)/ca.h.rst.exc=
eptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/dmx.h.rst: ${UAPI}/dvb/dmx.h ${PARSER} $(SRC_DIR)/dmx.h.rst.=
exceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/frontend.h.rst: ${UAPI}/dvb/frontend.h ${PARSER} $(SRC_DIR)/=
frontend.h.rst.exceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/net.h.rst: ${UAPI}/dvb/net.h ${PARSER} $(SRC_DIR)/net.h.rst.=
exceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/videodev2.h.rst: ${UAPI}/videodev2.h ${PARSER} $(SRC_DIR)/vi=
deodev2.h.rst.exceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/media.h.rst: ${UAPI}/media.h ${PARSER} $(SRC_DIR)/media.h.rs=
t.exceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/cec.h.rst: ${UAPI}/cec.h ${PARSER} $(SRC_DIR)/cec.h.rst.exce=
ptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.e=
xceptions
> -       @$($(quiet)gen_rst)
> +       @$($(quiet)cmd_parse_headers)
>
>  # Media build rules
>
> --
> 2.34.1
>


--
Best Regards
Masahiro Yamada

