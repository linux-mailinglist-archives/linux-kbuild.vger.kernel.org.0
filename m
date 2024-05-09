Return-Path: <linux-kbuild+bounces-1815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E79CF8C1585
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2024 21:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8600F1F22D62
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2024 19:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562807F7FC;
	Thu,  9 May 2024 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5cGNiTm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2086FEED5;
	Thu,  9 May 2024 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715283431; cv=none; b=paSs+GkOim4S2p8p0oL4eGnvgf/gwTMbpoC5/nAhCeX/JH2j7hYR9PXzIP+p8fmuPEYkeV3tZwOS/FTKxtRpHXxWC7XYXcHkhiJ6R/CWSxKu/cCEpul95zEIsTOhBbY40zV+XnDkk+teNbDBKx3Mvh1z7dWeR3b/RGXFf/s2SQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715283431; c=relaxed/simple;
	bh=kFJJ2GCFHMrGsA2nEYZ+N28F2+0s0EpfhS927die1f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+Rk/iHFVvpDvq7xY5wGMSwSELdYZlrhyXdSbOMEkN+mB9BD8/oK2YJTlSF3dfCANr4YiJMI0I/RmlU/l+uk1RTcuf4wyPKjFLNdhys/wAH+L7tQhOatoQvYxNO8IM8MNENWHFkiayi80vBUa6iXUuECVijDVZxobHSMEWGYmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5cGNiTm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A951DC3277B;
	Thu,  9 May 2024 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715283430;
	bh=kFJJ2GCFHMrGsA2nEYZ+N28F2+0s0EpfhS927die1f4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R5cGNiTmAUmmNUAhU3bTVFM8iZdVnTjqtPcPSUUY0nPckjA0KtRcUiOMxuyom2/GR
	 NprYgE5Bk72Y8mEwkbO2jWUJ6ezPZFbrmE3TwSCkP80/LS0VHUSFyiXmrzjufBhtqF
	 aS38pyzMXLUAGIsKZKDN68UCQ9rncjbclgBoXXMOG2spS/RWE+Zj23hfOTzYsYCk1l
	 BOSVPnaPPSmGhRCmGEKSogd6tRODmAsTWfun2eK11K3amJidv1ASMWWbU9f4x4LXwb
	 PXyHmGMl/ARLCmWaHesNIMtJvfjCisDj++t3PH6rrUdYXRcgvD2bb6iL0f4bJVmLZx
	 yBB5SRZoX0afw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52192578b95so1398076e87.2;
        Thu, 09 May 2024 12:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqkV/5V7tEC2xd+3XVOSIuKCvt2rXqEDvmgbAXpMYJOJNjSg0jIIq2Da/TmprMBWvbaBD1DkJtGqRJqCfDT2sQnzYfilMv2B53iBpEZBMfiL5XwtZzoAkqes0lnps44Ea3/+G1HkYwTQ==
X-Gm-Message-State: AOJu0YzaIKSAz7JV6ShH4pLKxioGkID2TyqzqKTPr6TO7OSNrka1kQvA
	PSqauTFFkKiPXWe4mxGMz7wsO74SkQ56c5Yq6a6u5hJDENp3VhicpdKcd4AHsp49Z8uNVjepzcE
	JaeySG0ZpxIJocYdWqgE65BmKSr0=
X-Google-Smtp-Source: AGHT+IHZ6jdC7Nk3Jbul3s2k1wm2lm15bWNNhMuO1aDdAAMZ6KBL8zfm/tYtkWfobT48KAF1zrc9FWI8ue1zJd2ZMdI=
X-Received: by 2002:ac2:41d3:0:b0:51c:fd0a:7e34 with SMTP id
 2adb3069b0e04-5220fb72d61mr303609e87.22.1715283429282; Thu, 09 May 2024
 12:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-5-masahiroy@kernel.org> <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
In-Reply-To: <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 May 2024 04:36:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
Message-ID: <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 5:59=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 27/04/2024 16:55, Masahiro Yamada wrote:
> > Kbuild conventionally uses $(obj)/ for generated files, and $(src)/ for
> > checked-in source files. It is merely a convention without any function=
al
> > difference. In fact, $(obj) and $(src) are exactly the same, as defined
> > in scripts/Makefile.build:
> >
> >     src :=3D $(obj)
> >
> > When the kernel is built in a separate output directory, $(src) does
> > not accurately reflect the source directory location. While Kbuild
> > resolves this discrepancy by specifying VPATH=3D$(srctree) to search fo=
r
> > source files, it does not cover all cases. For example, when adding a
> > header search path for local headers, -I$(srctree)/$(src) is typically
> > passed to the compiler.
> >
> > This introduces inconsistency between upstream and downstream Makefiles
> > because $(src) is used instead of $(srctree)/$(src) for the latter.
> >
> > To address this inconsistency, this commit changes the semantics of
> > $(src) so that it always points to the directory in the source tree.
> >
> > Going forward, the variables used in Makefiles will have the following
> > meanings:
> >
> >   $(obj)     - directory in the object tree
> >   $(src)     - directory in the source tree  (changed by this commit)
> >   $(objtree) - the top of the kernel object tree
> >   $(srctree) - the top of the kernel source tree
> >
> > Consequently, $(srctree)/$(src) in upstream Makefiles need to be replac=
ed
> > with $(src).
> >
>
> This patch, since yesterday's next, causes build issues with my
> (completely) standard and typical workflow:
>
> alias crosc64=3D'CROSS_COMPILE=3D"ccache aarch64-linux-gnu-" ARCH=3Darm64=
 KBUILD_OUTPUT=3Dout/'
> crosc64 make defconfig
> crosc64 make dt_binding_check
>
> Errors:
>
> No rule to make target 'Documentation/devicetree/bindings/i3c/snps,dw-i3c=
-master.example.dtb', needed by 'dt_binding_check'. Stop.
>
> Please revert/drop from next.


Or, fix the code.


Now fixed. Thanks for the report.




--=20
Best Regards
Masahiro Yamada

