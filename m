Return-Path: <linux-kbuild+bounces-6265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A16A6AAC6
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 17:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BDFA16EFF5
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80F71E32C3;
	Thu, 20 Mar 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9cPQxK1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D03597C;
	Thu, 20 Mar 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486947; cv=none; b=u7rzBkw/H0HnVG9v8gRs4QU+54Bq2fc1IYnHYjIfOKzGQ5ioJdrHdJoco06VNu66L36nix226E2JO3h5dYGDqP0qSWJbc0EeRIj9FDoTFnKWNr8UmCyGAOzouyjRhK2trOmRp7DURrh/yDK/mmSzXreUT13/CLtVZyX8AovDh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486947; c=relaxed/simple;
	bh=uI4VSOLj9MtMvYDm8+wUvuFnpvZ6CLxib6WZy45R0Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO3neYPM5SXF7P6q/Q0u9KhiVcWe36mawsOhhBVJhLKMlk6vDsalPetee5fYifWWcj1GQHkFdLU+v9u/qamvWAYBj18riTzJ5gCn7+FKDhnZxkR07ndxdUo8tTfijHKZM56F9raYNy0pLTtgwtDwUj0sMD6uhyXgsHAMdqfOfBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9cPQxK1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1E0C4CEED;
	Thu, 20 Mar 2025 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742486947;
	bh=uI4VSOLj9MtMvYDm8+wUvuFnpvZ6CLxib6WZy45R0Js=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F9cPQxK1GTiw+iiJ5B2S4bqmFEC7HfD5Q7Byn26J3hORuvSEdxmoy4V5RFP92W4C/
	 McC54IzVsruR4Y6OZlt2xU4d8gk2mfgaYpZn2RY6947KdgXBm+jOVAtW2En/Go/9I5
	 yNaJU6oF01bKSeOVcR7HRtnXhc8aBIhGKi/r5a19w9TuHFR9ltCaT24q79YGNNqQ2Z
	 xxIUwKJic7n9bgAdftjVwUdp2HRxW9N5TMlBZd7jJ8BsFTfQ7T1+bRJ0M4Q9WvdWf1
	 XEMDRb5g4fTHX168XyVZSsprND/JIMOOqiQna4WCjXXHEIzIpQ+HpFfDVAB/wLgeOJ
	 w1IZ+FZueSJrg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c091b54aaso9610211fa.3;
        Thu, 20 Mar 2025 09:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUszZAi+vXzROojs9MDlBTtyUEyvyKsj3sXCWwM2pGnf/gfVbv2a+yP1nwZ05ms1LvCLUMQ2YnzHT6vFBLS@vger.kernel.org, AJvYcCVBsMKssTqe3vIOXXVQbcyAsY8YbA2/fJa6FSeZrKfLS1amh84CX6X+fNh2iXB+XGfmmaydhV/E9pC/pys=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZslLFgciavOtVZ6B53t6/VuEBubZoL4HNcpsUGACYZA92FCX
	FpBsTDGCyLkG5x7zsZuGV6KMnewmKEbJd68ADOIbMrTaoJ7KEYZ6EhqwOAakH0qrf2iMIrco9Gd
	08ayAbixKKkr8D+AslyDyYUGv8JY=
X-Google-Smtp-Source: AGHT+IG4Bm89LTILz6LgN5z3NeH5i23YID+hPbWTAbPiQMHlhoRRfUAo1GILf2ziWNb/H7wKhrDUj/FP8/pv/BoGagQ=
X-Received: by 2002:a05:6512:130c:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-54acb195bebmr2405191e87.10.1742486945246; Thu, 20 Mar 2025
 09:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com> <CABCJKuc3zZOG4qgoFca_g80GMkzviVRemGLJB8GaA88u27Mt8A@mail.gmail.com>
In-Reply-To: <CABCJKuc3zZOG4qgoFca_g80GMkzviVRemGLJB8GaA88u27Mt8A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 17:08:54 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFZFgYp40xD72s0oMThgxK7J-yyCYUQkkBQjh3xR+fNeQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoWETJ2AGs312xqs1dK1sh23S7Ihg-k_EK5ANtMiDkCf0PmCDuy49WbCbM
Message-ID: <CAMj1kXFZFgYp40xD72s0oMThgxK7J-yyCYUQkkBQjh3xR+fNeQ@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, brgerst@gmail.com, 
	x86@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	linux-kernel@vger.kernel.org, nogikh@google.com, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Mar 2025 at 15:48, Sami Tolvanen <samitolvanen@google.com> wrote=
:
>
> Hi Ard,
>
> On Thu, Mar 20, 2025 at 12:07=E2=80=AFAM Ard Biesheuvel <ardb+git@google.=
com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> > through the compiler to capture the exported symbols. This ensures that
> > exported symbols such as __ref_stack_chk_guard on x86, which is declare=
d
> > conditionally, is visible to the tool.
> >
> > Otherwise, an error such as the below may be raised, breaking the build
> > when CONFIG_GENDWARFKSYMS=3Dy
> >
> >   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_gu=
ard'
> >
> > Cc: Sami Tolvanen <samitolvanen@google.com>
> > Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  scripts/Makefile.build | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 993708d11874..7855cdc4e763 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
> >  getasmexports =3D                                                     =
           \
> >     { echo "\#include <linux/kernel.h>" ;                              =
 \
> >       echo "\#include <linux/string.h>" ;                              =
 \
> > +     echo "\#define  __GENKSYMS__" ;                                  =
 \
> >       echo "\#include <asm/asm-prototypes.h>" ;                        =
 \
> >       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
>
> This works with gendwarfksyms since __GENKSYMS__ is defined after the
> EXPORT_SYMBOL() definition, but I'm now getting warnings with
> genksyms:
>
>   AS      arch/x86/lib/clear_page_64.o
> <stdin>:3:10: warning: "__GENKSYMS__" redefined
> <command-line>: note: this is the location of the previous definition
>

Oops.

Do you think the fix below should be sufficient?

--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -314,7 +314,7 @@
 else
 cmd_gensymtypes_S =3D                                                    \
        $(getasmexports) |                                              \
-       $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+       $(CPP) $(c_flags) -xc - | $(genksyms)
 endif # CONFIG_GENDWARFKSYMS

 quiet_cmd_cpp_s_S =3D CPP $(quiet_modtag) $@

