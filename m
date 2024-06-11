Return-Path: <linux-kbuild+bounces-2058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF839903F16
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 16:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6036A285076
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 14:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479B1B673;
	Tue, 11 Jun 2024 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juGmJXBM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD5BBA34;
	Tue, 11 Jun 2024 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117152; cv=none; b=Ks7u8N7Sa/lK1KpEpgYqpOXx4o3o2Zfsd4VXTyv1OtcxNyhZeW5za5Jp6l/DxzHYVExRFsLgqM4jCUQ1+EcXlWZ2ZOkQ71mEnUWRda3eUBkNV87PNaaDh3j5SFUidMhZpSxi+dXlY9+kjnh5HsYJp+6k3UW5P6+iKTEm0wSaoXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117152; c=relaxed/simple;
	bh=V3zghL8937UdbAnh4MFjMK3vjv6PMWnvoOCbMkWbe1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ft1JKVL6Fw7lmRCC1NtnsdVw9gTAbvFPr/fY7tqYznwe4s2jYoBwSvxuBxSwEkSwJmjorXqds4UEXa0kJojE7+3biDyMx7objJeDbiszCZ134AHil5IA88qnGociHSQB5zX16D7VmTvQam0ekV/uXHRhYHuZetFjoYAxSSTe4tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juGmJXBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28F2C32789;
	Tue, 11 Jun 2024 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718117151;
	bh=V3zghL8937UdbAnh4MFjMK3vjv6PMWnvoOCbMkWbe1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=juGmJXBMyGZXQ/0x55ti+I4UYFcXSeLviZnT+ww10SZAgbmT19fchqxVRSvE7FWls
	 aP3sH6FxjPUK+4byqsD5/Q0AVxPyNh4iwOq5XEaaJvXxzQuDvaJD0j85gWZR3zs5TS
	 8nJ9pQ3fclffSl7Fs1/bnQVtU+Qo+YaQysEF/buMn0y1xmPwhJ4mTnhKB9bBPhphq+
	 36P2a7T6Z5qWl+jSnowHFjXd7ArbsfW+oxc6WG/iNzzCGfixmEnTUZlBAbzRdVvy1V
	 8rPKvQPoH9DoHRbwwfTp4LppIXFJtkr+A2vQDEfoBrT30HFa5PF0b6zslg53StQT/C
	 OHmkDNMHh2JuA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1506948e87.1;
        Tue, 11 Jun 2024 07:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXITQpUVLrF7Ln2FebfLlYIfaYX2ggv4pavUPGQOtBXmJ/GzLAWqX4fuxBSd9s54al/yePPQMWCCpsisimTNwWxgm399tT3NHJdrseVoWrItWy3kAw/4m4xF1/z+4liyoW37h4Wkt6ptFTgwVW2iNyMJQmB5iIo708VjW/6exJwa1MwpSYk9Q==
X-Gm-Message-State: AOJu0Yw6ixV/mxozBrVH64jKT+2ZF9TtKEPyUW+5FdVVZe94tuTKCygE
	R2Ir/CdfE0HQzcVs66OYgM4Bsv6gwulQtM5Etj8aLWf//dSZt37hNMIj56hAlCTwRYT7v4giQov
	xPNPNOzMQW7rdAfrlJgIzYII3O7A=
X-Google-Smtp-Source: AGHT+IEp/gao3GqGPVG3agUDrZC/bx+9rcwsP/3NVeoATZzgw4jCanRBgPt4F03bVMSDqekKU4mOSqOkrmL+rgGhI9k=
X-Received: by 2002:a19:5e44:0:b0:52b:796e:66a5 with SMTP id
 2adb3069b0e04-52bb9fd281cmr6792120e87.66.1718117150327; Tue, 11 Jun 2024
 07:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605094843.4141730-1-wenst@chromium.org> <CAFLszTjX=ixC3pRRGJeaP=ie_yc+KcCRyQ06MBFeSZnBepaXaw@mail.gmail.com>
 <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com>
In-Reply-To: <CAGXv+5EcEYGqXq2C1OCK4J4t1NusV7nWp16zb74P6_tCeLnSGw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Jun 2024 23:45:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7XAGgzhBXQWPFVgqJwdBcO3mF5pmQ3mSsmdrZ0EBL9Q@mail.gmail.com>
Message-ID: <CAK7LNAQ7XAGgzhBXQWPFVgqJwdBcO3mF5pmQ3mSsmdrZ0EBL9Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/make_fit: Support decomposing DTBs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Simon Glass <sjg@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Devicetree List <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 5:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Jun 10, 2024 at 11:16=E2=80=AFPM Simon Glass <sjg@chromium.org> w=
rote:
> >
> > Hi Chen-Yu,
> >
> > On Wed, 5 Jun 2024 at 03:48, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > The kernel tree builds some "composite" DTBs, where the final DTB is =
the
> > > result of applying one or more DTB overlays on top of a base DTB with
> > > fdtoverlay.
> > >
> > > The FIT image specification already supports configurations having on=
e
> > > base DTB and overlays applied on top. It is then up to the bootloader=
 to
> > > apply said overlays and either use or pass on the final result. This
> > > allows the FIT image builder to reuse the same FDT images for multipl=
e
> > > configurations, if such cases exist.
> > >
> > > The decomposition function depends on the kernel build system, readin=
g
> > > back the .cmd files for the to-be-packaged DTB files to check for the
> > > fdtoverlay command being called. This will not work outside the kerne=
l
> > > tree. The function is off by default to keep compatibility with possi=
ble
> > > existing users.
> > >
> > > To facilitate the decomposition and keep the code clean, the model an=
d
> > > compatitble string extraction have been moved out of the output_dtb
> > > function. The FDT image description is replaced with the base file na=
me
> > > of the included image.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > This is a feature I alluded to in my replies to Simon's original
> > > submission of the make_fit.py script [1].
> > >
> > > This is again made a runtime argument as not all firmware out there
> > > that boot FIT images support applying overlays. Like my previous
> > > submission for disabling compression for included FDT images, the
> > > bootloader found in RK3399 and MT8173 Chromebooks do not support
> > > applying overlays. Another case of this is U-boot shipped by developm=
ent
> > > board vendors in binary form (without upstream) in an image or in
> > > SPI flash on the board that were built with OF_LIBFDT_OVERLAY=3Dn.
> > > These would fail to boot FIT images with DT overlays. One such
> > > example is my Hummingboard Pulse. In these cases the firmware is
> > > either not upgradable or very hard to upgrade.
> > >
> > > I believe there is value in supporting these cases. A common script
> > > shipped with the kernel source that can be shared by distros means
> > > the distro people don't have to reimplement this in their downstream
> > > repos or meta-packages. For ChromeOS this means reducing the amount
> > > of package code we have in shell script.
> > >
> > > [1] https://lore.kernel.org/linux-kbuild/20231207142723.GA3187877@goo=
gle.com/
> > > [2]
> > >
> > >  scripts/Makefile.lib |  1 +
> > >  scripts/make_fit.py  | 70 ++++++++++++++++++++++++++++++------------=
--
> > >  2 files changed, 49 insertions(+), 22 deletions(-)
> >
> > This is a clever way to discover the included files. Does it need to
> > rely on the Linux build information, or could this information somehow
> > be in the .dtb files? I had expected some sort of overlay scheme in
>
> (+CC DT folks and mailing list)
>
> I suppose we could make the `fdtoverlay` program embed this data during
> the kernel build. That would keep the information together, while also
> having one source of truth (the kernel Makefiles). Whether it belongs
> in the DTB or not is a separate matter.


Some time ago, I asked a similar question
with a similar motivation.

https://lore.kernel.org/devicetree-compiler/CAK7LNARV8Bo-tBXMdOu55Wg9uZRXvN=
iRdkDJ4LH8PwVMnMp4cA@mail.gmail.com/







>
> > the source, but perhaps people have given up on that?
>
> I wouldn't say given up, since we haven't agreed on anything either.
> Elliot had some concerns when I brought this up earlier [1] though.
>
> ChenYu
>
> [1] https://lore.kernel.org/linux-mediatek/20240314113908471-0700.eberman=
@hu-eberman-lv.qualcomm.com/
>

--
Best Regards
Masahiro Yamada

