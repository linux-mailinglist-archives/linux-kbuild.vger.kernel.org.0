Return-Path: <linux-kbuild+bounces-8251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF68B15704
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 03:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C798A16AEC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 01:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CB213AD3F;
	Wed, 30 Jul 2025 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tf4LnWrd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1017BA5
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2025 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753839607; cv=none; b=hhW+lOmfcyBKZE12eAgd/FcQnQm3BQQ4wbxjatsbdiunEvWncraVswEUSSYFxSsYscJyBJwUoQr2wGLuvl/0MFCKXnDTP2LZGrBLXZBD0zXQ/UM5PCuSeoUuDWMFl/zQjLYbPyX+B+raxH+2sBuIYAWXDSAfOG1Sxgr8alinplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753839607; c=relaxed/simple;
	bh=3Nl5M49stLPFGFSqYhO8CvOL5cdk5vdFPTNdgMvrCsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GycUC9LYNy5eGdwFvkg69wgrXhGTBH6fxnLXU65ZXYmiTg/vrrdRPjiM4+wPaUnp6pZ/ZfiFi8Yv2zYnvoDZW9GCoKBPXDtlfMnsEQQZTWi6fWdHBls3RDbaFjBCQ0dkXSE5o9CO5TP47f9WSGEE6ojkcrj2dDIj+ncrbCUG/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tf4LnWrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AF1C4CEF6
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2025 01:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753839605;
	bh=3Nl5M49stLPFGFSqYhO8CvOL5cdk5vdFPTNdgMvrCsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tf4LnWrdUPhm0M06vT9Mr1XzXfuUwhFuMIFzce93deneF/ME+43lyXRPQbBYFXrGD
	 aCSacYm0ziB59N1tjT2ULZ5I80DsGQznV/ms1q2VcD4HvWgEtiEKp+SfHH4KvCYtWl
	 C6y47EP3Hem/lVI4McmAMv+I0deTuv3ox6K8EoMruBKfyveV4fhN2p5kMbWO69rR6w
	 ncE+yL9WpSQKbmh+K042av5rr5LBw7Chc98b/I5LyaPzMJl5NBVpE0tRfaw1ldg8NT
	 pbnfUjq4+lYuAyaEO4HaZ67CXNjDvDG/Y0c6bgzfNt7vztLMiOF76qq0ka5U+XYP7M
	 yjC6WSfgsdBzw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5550dca1241so5630062e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Jul 2025 18:40:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMVA3NXEGQF23bymrm3aXJBawGjIYJ0vuwABffHWEaiCSTZDJB
	RvNuM+VeB0+sKepqqY+QeoRod5bvLEOx9AYke08eDMGARDlKE6qtcIF+HigTkMTHm7QDi4CDdr7
	VvuFXLoUpD6XfRI9TFlxFV9dNeqsY59Q=
X-Google-Smtp-Source: AGHT+IHbdTVqJP1HP+F8rhuZaLrlaHT6Ub3+zBnAF0uuyVB4UeRG8w52eSZw9+BN/HePIxOnvN67WTnqFZQpbfKXxPM=
X-Received: by 2002:a05:6512:3b8a:b0:553:2868:635e with SMTP id
 2adb3069b0e04-55b7c0123c7mr402397e87.23.1753839603710; Tue, 29 Jul 2025
 18:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729220439.421735-1-tytso@mit.edu>
In-Reply-To: <20250729220439.421735-1-tytso@mit.edu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 30 Jul 2025 10:39:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQcjFu7OfB42iAOrh-BZWqFj8Lr=DO24Udw_sjewKMzpQ@mail.gmail.com>
X-Gm-Features: Ac12FXxYibS091qgNCzMZuo0O-fh38OczeNkiw-ikI918u5RL0OBCiiItQH9xiw
Message-ID: <CAK7LNAQcjFu7OfB42iAOrh-BZWqFj8Lr=DO24Udw_sjewKMzpQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: run kunit selftests via the top-level kunit target
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: linux-kbuild@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 7:04=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrote=
:
>
> If we can make kunit tests easier to run (currently, the way to run
> them is via "./tools/testing/kunit/kunit.py run") then it's much more
> likely that people will run the Kernel unit tests as part of their
> normal development workflow.
>
> See the discusion linked below for more details about the rationale
> behind this change.
>
> Link: https://groups.google.com/g/kunit-dev/c/aHnAlT13ayU
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>

There is no reason to grow the top-level Makefile for this
because tools/testing/kunit/kunit.py is an independent script
that does not rely on any Make variables from the top-level Makefile.

If you prefer a shorter command, you can add a simple wrapper.

$ cat tools/kunit
#!/bin/sh
$(dirname $0)/testing/kunit/kunit.py run




> ---
>  Makefile | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 478f2004602d..1d5257240a5d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -295,7 +295,7 @@ no-dot-config-targets :=3D $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccic=
heck \
>                          $(version_h) headers headers_% archheaders archs=
cripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_c=
heck \
> -                        outputmakefile rustavailable rustfmt rustfmtchec=
k
> +                        outputmakefile rustavailable rustfmt rustfmtchec=
k kunit
>  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_si=
gn kernelrelease \
>                           image_name
>  single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
> @@ -2139,6 +2139,15 @@ existing-targets :=3D $(wildcard $(sort $(targets)=
))
>
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>
> +PHONY +=3D kunit
> +kunit:
> +ifeq ($(SRCARCH),x86)
> +       $(Q)$(PYTHON3) $(srctree)/tools/testing/kunit/kunit.py run
> +else
> +       @echo >&2 "Kunit not supported on this architecture: $(ARCH)"
> +       @false
> +endif
> +
>  endif # config-build
>  endif # mixed-build
>  endif # need-sub-make
> --
> 2.47.2
>
>


--=20
Best Regards
Masahiro Yamada

