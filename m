Return-Path: <linux-kbuild+bounces-363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D778129D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Dec 2023 08:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2528A1F212C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Dec 2023 07:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1BC14AAC;
	Thu, 14 Dec 2023 07:58:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91497E0;
	Wed, 13 Dec 2023 23:58:05 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbcdfad714aso707894276.3;
        Wed, 13 Dec 2023 23:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540684; x=1703145484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj0NwqxPiof3ml42MbQY4Ahv5ohZXpex6OnUgaYQww8=;
        b=WJi/ohrGdnui+xHmqlYZ0jR7MAZ6XBk6cPmXjaN4qj3dMTl9zN1HGq66RyYnl9rlb5
         xq9TnDWuGyXDdTBzZESIBk4TnVYlRkpYx9xpN6T6wDYc4nT+WlSqycTpXnRIUtaqEyrg
         DFZd7y+IU1d2ZuoSoRIaokqyiW3XC1rDa0GTYbkdGtJXqFoyJHPBKhmwOq7iKRTvyXkA
         albWcAXmUqS7f77l+rLLSbXK/QI5nkzT1lQgGSYuWzOyHrmNE1yhnkKmgG5PObsyUrKi
         bTnM516NcVUyTUSv5wG97bXVLEZeKTc36643sDpnjdyLKU9fIkAGnYjv9E2yiH4X7UMe
         g22A==
X-Gm-Message-State: AOJu0YyGDDPBtyBQYfDNW9LfOF63NF02Cx9OCPP89r8dq5k+OuW75WOI
	4iUxAZ+2MymYyEDLo1TKc5EvynVAw2WHcA==
X-Google-Smtp-Source: AGHT+IGmGY/s839VHzJmmPpAftTdQg4AhG/3K9CTqyyHA24aK6e+tyX6vGcqUdXulWCDFUjA2B9YoQ==
X-Received: by 2002:a25:f45:0:b0:dbc:e89d:659d with SMTP id 66-20020a250f45000000b00dbce89d659dmr75478ybp.50.1702540684524;
        Wed, 13 Dec 2023 23:58:04 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id v139-20020a252f91000000b00dbccadd6dd8sm1265708ybv.59.2023.12.13.23.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 23:58:04 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbcdec51ed9so779788276.0;
        Wed, 13 Dec 2023 23:58:04 -0800 (PST)
X-Received: by 2002:a5b:7cf:0:b0:da0:442f:988e with SMTP id
 t15-20020a5b07cf000000b00da0442f988emr5673057ybq.19.1702540684087; Wed, 13
 Dec 2023 23:58:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202035511.487946-1-sjg@chromium.org> <20231202035511.487946-3-sjg@chromium.org>
 <20231203153401.GV8402@pendragon.ideasonboard.com> <20231207142723.GA3187877@google.com>
 <20231207143814.GD15521@pendragon.ideasonboard.com> <CAGXv+5Go_0pEVAOLQmRCc_a9-YUtZEmBfXtMuBupX_nb9iqwbw@mail.gmail.com>
 <20231209152946.GC13421@pendragon.ideasonboard.com> <CAMuHMdVMZs6mnwWBgFwktO=8o=QzROv60cfZe085MhD6HxQjpQ@mail.gmail.com>
 <CAGXv+5Est3FL-XcEL-vB-6zVNas0mqb2cNYa==Yb7W2SQU9xVQ@mail.gmail.com> <CAK7LNATyD-PeNbaLTjJmU9=koqqE+V6QvFe09c2VrXopWvjpcw@mail.gmail.com>
In-Reply-To: <CAK7LNATyD-PeNbaLTjJmU9=koqqE+V6QvFe09c2VrXopWvjpcw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2023 08:57:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDPSQXNhBH5LCrggfJCWG32v_ZtcRdPfaGRuLj20N+Lg@mail.gmail.com>
Message-ID: <CAMuHMdXDPSQXNhBH5LCrggfJCWG32v_ZtcRdPfaGRuLj20N+Lg@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] arm64: boot: Support Flat Image Tree
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Glass <sjg@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yamada-san,

On Thu, Dec 14, 2023 at 7:12=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> On Thu, Dec 14, 2023 at 1:03=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> > On Sun, Dec 10, 2023 at 1:31=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Sat, Dec 9, 2023 at 4:29=E2=80=AFPM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > On Sat, Dec 09, 2023 at 10:13:59PM +0900, Chen-Yu Tsai wrote:
> > > > > On Thu, Dec 7, 2023 at 11:38=E2=80=AFPM Laurent Pinchart
> > > > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > > > On Thu, Dec 07, 2023 at 10:27:23PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Sun, Dec 03, 2023 at 05:34:01PM +0200, Laurent Pinchart wr=
ote:
> > > > > > > > On Fri, Dec 01, 2023 at 08:54:42PM -0700, Simon Glass wrote=
:
> > > > > > > > > Add a script which produces a Flat Image Tree (FIT), a si=
ngle file
> > > > > > > > > containing the built kernel and associated devicetree fil=
es.
> > > > > > > > > Compression defaults to gzip which gives a good balance o=
f size and
> > > > > > > > > performance.
> > > > > > > > >
> > > > > > > > > The files compress from about 86MB to 24MB using this app=
roach.
> > > > > > > > >
> > > > > > > > > The FIT can be used by bootloaders which support it, such=
 as U-Boot
> > > > > > > > > and Linuxboot. It permits automatic selection of the corr=
ect
> > > > > > > > > devicetree, matching the compatible string of the running=
 board with
> > > > > > > > > the closest compatible string in the FIT. There is no nee=
d for
> > > > > > > > > filenames or other workarounds.
> > > > > > > > >
> > > > > > > > > Add a 'make image.fit' build target for arm64, as well. U=
se
> > > > > > > > > FIT_COMPRESSION to select a different algorithm.
> > > > > > > > >
> > > > > > > > > The FIT can be examined using 'dumpimage -l'.
> > > > > > > > >
> > > > > > > > > This features requires pylibfdt (use 'pip install libfdt'=
). It also
> > > > > > > > > requires compression utilities for the algorithm being us=
ed. Supported
> > > > > > > > > compression options are the same as the Image.xxx files. =
For now there
> > > > > > > > > is no way to change the compression other than by editing=
 the rule for
> > > > > > > > > $(obj)/image.fit
> > > > > > > > >
> > > > > > > > > While FIT supports a ramdisk / initrd, no attempt is made=
 to support
> > > > > > > > > this here, since it must be built separately from the Lin=
ux build.
> > > > > > > >
> > > > > > > > FIT images are very useful, so I think this is a very welco=
me addition
> > > > > > > > to the kernel build system. It can get tricky though: given=
 the
> > > > > > > > versatile nature of FIT images, there can't be any
> > > > > > > > one-size-fits-them-all solution to build them, and striking=
 the right
> > > > > > > > balance between what makes sense for the kernel and the fea=
tures that
> > > > > > > > users may request will probably lead to bikeshedding. As we=
 all love
> > > > > > > > bikeshedding, I thought I would start selfishly, with a per=
sonal use
> > > > > > > > case :-) This isn't a yak-shaving request though, I don't s=
ee any reason
> > > > > > > > to delay merging this series.
> > > > > > > >
> > > > > > > > Have you envisioned building FIT images with a subset of DT=
Bs, or adding
> > > > > > > > DTBOs ? Both would be fairly trivial extensions to this scr=
ipt by
> > > > > > > > extending the supported command line arguments. It would pe=
rhaps be more
> > > > > > > > difficult to integrate in the kernel build system though. T=
his leads me
> > > > > > > > to a second question: would you consider merging extensions=
 to this
> > > > > > > > script if they are not used by the kernel build system, but=
 meant for
> > > > > > > > users who manually invoke the script ? More generally, is t=
he script
> > > > > > >
> > > > > > > We'd also be interested in some customization, though in a di=
fferent way.
> > > > > > > We imagine having a rule file that says X compatible string s=
hould map
> > > > > > > to A base DTB, plus B and C DTBO for the configuration sectio=
n. The base
> > > > > > > DTB would carry all common elements of some device, while the=
 DTBOs
> > > > > > > carry all the possible second source components, like differe=
nt display
> > > > > > > panels or MIPI cameras for instance. This could drastically r=
educe the
> > > > > > > size of FIT images in ChromeOS by deduplicating all the commo=
n stuff.
> > > > > >
> > > > > > Do you envision the "mapping" compatible string mapping to a co=
nfig
> > > > > > section in the FIT image, that would bundle the base DTB and th=
e DTBOs ?
> > > > >
> > > > > That's exactly the idea. The mapping compatible string could be u=
ntied
> > > > > from the base board's compatible string if needed (which we proba=
bly do).
> > > > >
> > > > > So something like:
> > > > >
> > > > > config {
> > > > >     config-1 {
> > > > >         compatible =3D "google,krane-sku0";
> > > > >         fdt =3D "krane-baseboard", "krane-sku0-overlay";
> > > > >     };
> > > > > };
> > > > >
> > > > > With "krane-sku0-overlay" being an overlay that holds the differe=
nces
> > > > > between the SKUs, in this case the display panel and MIPI camera =
(not
> > > > > upstreamed) that applies to SKU0 in particular.
> > > >
> > > > The kernel DT makefiles already contain information on what overlay=
s to
> > > > apply to what base boards, in order to test the overlays and produc=
e
> > > > "full" DTBs. Maybe that information could be leveraged to create th=
e
> > > > configurations in the FIT image ?
> > >
> > > Although the "full" DTBs created may only be a subset of all possible
> > > combinations (I believe Rob just started with creating one "full" DTB
> > > for each overlay, cfr. the additions I made in commit a09c3e105a20858=
0
> > > ("arm64: dts: renesas: Apply overlays to base dtbs")), that could
> > > definitely be a start.
> > >
> > > Now, since the kernel build system already creates "full" DTBs, does
> > > that mean that all of the base DTBs, overlays, and "full" DTBs will
> > > end up in the FIT image?
> >
> > I suppose we could add an option to the packing tool to be able to _not=
_
> > add the "full" DTBs if they can also be assembled with a base DTB and
> > overlays. Think of it as a firmware compatibility option: if the firmwa=
re
> > supports overlays, then you almost always want the deconstructed parts,
> > not the fully assembled ones. Vice versa.
> >
> > If we don't we could end up with two configurations that have the same
> > compatible string?
>
> Right.
>
> We would end up with such situations because applying
> an overlay does not change the compatible string.

That is correct.  Which is one of the reasons for not using overlays
for this, cfr. the details in my reply in the other thread
"Re: Proposal: FIT support for extension boards / overlays"
https://lore.kernel.org/all/CAMuHMdXQdMeXUOAAw5nDO4+q5_HFvUc86Wi8ykMwjUwPex=
6wvQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

