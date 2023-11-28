Return-Path: <linux-kbuild+bounces-188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 660187FC973
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 23:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865E11C20CFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 22:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378D50249;
	Tue, 28 Nov 2023 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm81GYhQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3904244366;
	Tue, 28 Nov 2023 22:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0965C433AD;
	Tue, 28 Nov 2023 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701210344;
	bh=xw0jvipvintPrN+TgSa50fPhSr/OQ4+PLz58lH+HcbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jm81GYhQKdtghqZzcibJps70VcRXNVXYv83wu50oGnscBqTrRc/YtqxTp7E7cuE/6
	 NRtc0GGIDU1bI0MyNKDuFDCKQ3kZsEU6iskMiWTMYb47Sas28ml6p2C7WuDCa7ELxO
	 hvOBXHoJDFIrncf8lWiN0ssSqT3s1B6AdpdM02wtvE8DiCCElHXjSIBepJ+06NwGMf
	 H+Cy8uxOmMfNP5eSAoB87/JM0Refr5wwxVmXtgsVTtanzxTxI/alFcRPXGLRtNomUG
	 UVg2asGdOH/+adDowrri+E8+XK4W0HhI5LNyHdJAwEuWNo8vXHLOxRRRqxHGIJlBmn
	 0cz0ceMXh2McA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bc21821a1so872212e87.0;
        Tue, 28 Nov 2023 14:25:44 -0800 (PST)
X-Gm-Message-State: AOJu0YzNf2XAPPoZin4D+iCchkZVXyHSYb3SCl+RpjcbSc7+AFTAhrZu
	dWkLVu3Aw+p3qjeS9ULRnX1mE/CkliPLawJg9A==
X-Google-Smtp-Source: AGHT+IGnIgBpTrIKTkP3WlvgS+ZB8HvzDAmJkPSscfGKFyVApWHtyV/uoYFyVwHsgH3F68YSqBbNeCx6OMJVUk8qodo=
X-Received: by 2002:a05:6512:4d1:b0:50b:a806:966b with SMTP id
 w17-20020a05651204d100b0050ba806966bmr7526326lfq.23.1701210342779; Tue, 28
 Nov 2023 14:25:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
 <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com> <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
In-Reply-To: <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Nov 2023 16:25:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
Message-ID: <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:03=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Mon, Nov 27, 2023 at 11:03=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Thu, Nov 23, 2023 at 1:39=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Nov 23, 2023 at 7:12=E2=80=AFAM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > This series adds support to set the dtc extra warning level on a pe=
r
> > > > arch or per platform (directory really) basis.
> > > >
> > > > The first version of this was just a simple per directory override =
for
> > > > Samsung platforms, but Conor asked to be able to do this for all of
> > > > riscv.
> > > >
> > > > For merging, either I can take the whole thing or the riscv and sam=
sung
> > > > patches can go via their normal trees. The added variable will have=
 no
> > > > effect until merged with patch 2.
> > > >
> > > > v1:
> > > >  - https://lore.kernel.org/all/20231116211739.3228239-1-robh@kernel=
.org/
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > >
> > >
> > > There were some attempts in the past to enable W=3D1 in particular su=
bsystems,
> > > so here is a similar comment.
> > >
> > > Adding a new warning flag to W=3D1 is always safe without doing any c=
ompile test.
> > >
> > > With this series, it would not be true any more because a new warning=
 in W=3D1
> > > would potentially break riscv/samsung platforms.
> >
> > The difference here is the people potentially adding warnings are also
> > the ones ensuring no warnings.
> >
> > > Linus requires a clean build (i.e. zero warning) when W=3D option is =
not given.
> >
> > Linus doesn't build any of this AFAICT. We are not always warning free
> > for W=3D0 with dtbs.
>
>
>
> Does it mean, you can enable all warnings by default?

No, Linus might not care, but others (me) do. The whole point of not
allowing warnings is the same. Get to zero warnings so any new
warnings stand out. We now have some subset of platforms which are
warning free and want warnings enabled by default to keep them that
way. How do you suggest we do that?

I understand your point on W=3D1 in general, but I think it just doesn't
apply in this case. In general,
someone may be testing a new compiler and there's some new warning to
enable, so they add it to W=3D1. They are working independently of any
subsystem (and Linus) and introducing new warnings would be a burden
to fix and a problem to leave. For DT, it is a bit different as adding
new warnings, updating dtc version, and selecting warnings to enable
are pretty much all done together. Plus, schema warnings have pretty
much superseded dtc warnings. If we do add new warnings which can't be
fixed up front, then we could still only enable the warning for W=3D1
from the command line. Something like this on top of this series:

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 53a74e53e0ca..41307c6e1fee 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -341,6 +341,10 @@ quiet_cmd_gzip =3D GZIP    $@
 # ------------------------------------------------------------------------=
---
 DTC ?=3D $(objtree)/scripts/dtc/dtc

+ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
+DTC_FLAGS +=3D -Wno-some_new_warning_we_need_off_globally
+endif
+
 KBUILD_EXTRA_WARN_DTC +=3D $(KBUILD_EXTRA_WARN)

 # Disable noisy checks by default

