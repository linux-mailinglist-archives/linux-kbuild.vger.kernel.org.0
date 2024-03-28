Return-Path: <linux-kbuild+bounces-1233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21C87B728
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Mar 2024 05:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E684282D10
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Mar 2024 04:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5F72F44;
	Thu, 14 Mar 2024 04:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ToLs/mxC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6EE611A
	for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2024 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710391485; cv=none; b=RxMzb5ISfkjI/TcrWQ+Xf/vGw2omXE0JCq4PtsWHfARNXZyj7eV85xLyNCHI2+mM3qFb3ooiCsouiROr1HkqmIGpu65Qwka6kH/TvQc08uD/6tQhfHeUSynqZMgXg43gAuqL7ulod9ecJTR6avwa814/fwkpOgSbyVyqysyQtJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710391485; c=relaxed/simple;
	bh=XskETTLWV7TnIHSvLX9K4J/y2DGu2PBJ/cuUbPV7jY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=km2BsFGbvMfnPN+/G7KmP2zDiUBrN3Se36V8k+L/LLJr/WKToVHSkV75sbF7i8LZva6NRRbZu+Lvm2kiwaSZJq1W7bLvMOu7X432BeNEedgJuxDPKE+SQbLNTtEVxT0ISYvootCVSwn2XII/BUd1wceY7GP0UuIU1sUPaHsYBrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ToLs/mxC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5131316693cso764726e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2024 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710391482; x=1710996282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAMqPOmmcWbDaUCKh7SkBHCxzai8nsrUJqHpj8z7jcA=;
        b=ToLs/mxCRP9U2WOwW9wfrO9OBNNLniAqLnPTmxqcBE5rgk+KixJ6TvIPrNAdg8r3pE
         5E3MT0LhL4Ad1agPByPMEYngt8Cj++y93Sp0qa84ICvWdMKFNXeggD/etqq2lsPGmYsa
         giq+b5wmU+WLV/weeK/r8zWRRI5Nus4F6T3P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710391482; x=1710996282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAMqPOmmcWbDaUCKh7SkBHCxzai8nsrUJqHpj8z7jcA=;
        b=fkOddDxDq+iu0bsG6jjvgeWDYTuy/o7w41K5WdzOLcFa3jRaccV7Lws2N9msyGN/aK
         0RwmS80FTST9VgPiaBOd1y4fU4Y/VX3JxjkdNiIC/Tq2iiDHqmQKKsPNLycDjM8JipYb
         zl2BfljTyhpr3BD54nGR4kclsJkpIWyB9JyS0tFiJ4Fq9GHXwo6M5QnEDY+Dcdoy62+P
         brNsANm4Na0l8hROyMjP8bExJ6Tlc88txmBvWGWPphdNTE2DCBuXaoXTMmOR788iCOcX
         CiEdNASUl2rlikBkmo639trDgwM7fZ0DcSgn4/2cyfjCqKe5r15YB6IjF+Ejw/4l/J0P
         cUag==
X-Forwarded-Encrypted: i=1; AJvYcCUU97RY2tzI8zKB4ylDKhooo9dWroQ93cp+B4EnAZV2N+on+sc+mmoy6jr63sNkItWG2Nlezt4qWgU858H+pjQG40KNvzNt4R8pgn2/
X-Gm-Message-State: AOJu0YxOvSVxgsrKF3xZk7rjeJeOcPsKM5tS/GPgeEjYtEJTGJHN7kls
	BT5Rb16rmlPy6zfYaoZMInr19P21taa4hV9vOqigRlBqis4vU5aLIeSMJxbhwlyazrMcOKANUl+
	d3wYFgTvH2ksaMXfG8GhGtYkcK8kRIMWJQPNwJdgt9WiN2bo=
X-Google-Smtp-Source: AGHT+IHW25SfNhsNOlR7CD+AsIhHAwtxydc8T7RmhuONErZ/c+wsqd8z+DtBhztSpOLACmpNgJBcZYznr1HLfAXjyh4=
X-Received: by 2002:a05:6512:4844:b0:513:cbde:8764 with SMTP id
 ep4-20020a056512484400b00513cbde8764mr341080lfb.57.1710391481241; Wed, 13 Mar
 2024 21:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223092338.2433632-1-wenst@chromium.org> <CAK7LNAQmvyftnFJaByyjH+f4nxcNUKpjkDXwebEH5AhMF6U0Kw@mail.gmail.com>
 <CAGXv+5GmkZdqpNZDFN4dcTyZ-qVS0TjrrqBrBAei6DP+eXLnJg@mail.gmail.com>
 <CAK7LNAS8tLuHYcPTb5pJZixn5Hb0yjo0nmbrfSUr5Cd_pc+WMg@mail.gmail.com>
 <CAGXv+5HB7gXJ0x1uVdgbWaRWS8+rN6FwEgyGLObxr_cfyLty6A@mail.gmail.com> <CAK7LNARADnpCHvNWHLqb9acVNqzwDRuLiKbKe4XZwM4_Ts+ypg@mail.gmail.com>
In-Reply-To: <CAK7LNARADnpCHvNWHLqb9acVNqzwDRuLiKbKe4XZwM4_Ts+ypg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Mar 2024 12:44:29 +0800
Message-ID: <CAGXv+5E+P0fFTjqs64CU8z6ON4LkzMQsXzH9Dra7roKvXO0fTw@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: create a list of all built DTB files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 12:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Mon, Mar 4, 2024 at 1:37=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > On Thu, Feb 29, 2024 at 11:35=E2=80=AFPM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Thu, Feb 29, 2024 at 11:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium=
.org> wrote:
> > > >
> > > > On Sun, Feb 25, 2024 at 4:21=E2=80=AFPM Masahiro Yamada <masahiroy@=
kernel.org> wrote:
> > > > >
> > > > > On Fri, Feb 23, 2024 at 6:23=E2=80=AFPM Chen-Yu Tsai <wenst@chrom=
ium.org> wrote:
> > > > > >
> > > > > > It is useful to have a list of all composite *.dtb files, along=
 with
> > > > > > their individual components, generated from the current build.
> > > > > >
> > > > > > With this commit, 'make dtbs' creates arch/*/boot/dts/dtbs-comp=
onents,
> > > > > > which lists the composite dtb files created in the current buil=
d. It
> > > > > > maintains the order of the dtb-y additions in Makefiles althoug=
h the
> > > > > > order is not important for DTBs.
> > > > > >
> > > > > > This compliments the list of all *.dtb and *.dtbo files in dtbs=
-list,
> > > > > > which only includes the files directly added to dtb-y.
> > > > > >
> > > > > > For example, consider this case:
> > > > > >
> > > > > >     foo-dtbs :=3D foo_base.dtb foo_overlay.dtbo
> > > > > >     dtb-y :=3D bar.dtb foo.dtb
> > > > > >
> > > > > > In this example, the new list will include foo.dtb with foo_bas=
e.dtb and
> > > > > > foo_overlay.dtbo on the same line, but not bar.dtb.
> > > > > >
> > > > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > ---
> > > > > > Hi,
> > > > > >
> > > > > > I hacked up this new thing to list out the individual component=
s of each
> > > > > > composite dtb. I think this information would be useful for FIT=
 image
> > > > > > generation or other toolchains to consume. For example, instead=
 of
> > > > > > including each dtb, a toolchain could realize that some are put=
 together
> > > > > > using others, and if the bootloader supports it, put together c=
ommands
> > > > > > to reassemble the end result from the original parts.
> > > > > >
> > > > > > This is based on and complements Masahiro-san's recent dtbs-lis=
t work.
> > > > >
> > > > >
> > > > >
> > > > > This is another format of my previous per-dtb "*.dtlst"
> > > > > (but I did not pick up 3/4, 4/4 because I did not know what we ne=
ed after all).
> > > > >
> > > > > This should be discussed together with how Simon's script will lo=
ok like.
> > > > >
> > > > > I can understand your Makefile code, but I still do not know
> > > > > how the entire overlay stuff will work in a big picture.
> > > >
> > > > How would you like to proceed? I can through together some changes =
on top
> > > > of Simon's patches as an initial proposal if that helps?
> > > >
> > > > I can use your format if you prefer.
> > >
> > >
> > > How would you select base+addonX among
> > > other base+addonY or base+addonZ configurations?
> >
> > I assume you are alluding to the existing in-tree composite DTs that
> > share the same board compatible strings?
>
>
> Yes.
> It is possible to implement it, but I do not see a point
> to implement what we do not know how to use.
>
>
>
> >
> > Under the current FIT image design with compatible strings populated fr=
om
> > the FDTs, I don't think there's any way to automatically select among t=
hem.
> > The FIT image simply does not have the information available. Nor do th=
e
> > overlays themselves. The toolchain can only either include all of them
> > and let the bootloader figure things out, or filter out all the duplica=
tes.
> > With the composite list, at least it will be able to consistently keep
> > only the base DT and drop the ones with the addons.
>
> It makes the purpose of this work even more obscure.
>
> For the purpose of avoiding duplication,
> we can take the first DTB (or the smallest size)
> when we encounter a duplicated compatible string.

Yes, that is also one way of doing it. I'm just not sure if it's
fool proof. Taking the first one requires the Makefile be correctly
ordered? Maybe that is implied because the base dtb needs to be
built first?

Also not sure about using size, as you could have an overlay that
deletes stuff, and the resulting composite DTB could be streamlined
and made smaller.

> >
> > In one of my previous replies to v9 I mentioned adding a user provided
> > mapping between "configuration" compatible string and FDT filename. The
> > mapping could be maintained in-tree for those base+addonXYZ FDTs if
> > desired.
>
>
> That is one way, but I do not think such a configuration file
> is maintainable.

I see.

> Rob suggested overwriting the compatible string,
> but I do not think we got consensus.

Yeah, that's the simplest way. But IIRC on IRC someone mentioned that
this doesn't work for stacking multiple overlays. I think prepending
or appending compatible strings was proposed (subject to compiler
support), but that doesn't really help our case, as all the composite
DTBs would have the same fallback board compatible string.

> > Also, Simon's FIT image "extensions" proposal [1] adds more metadata to
> > the FIT image to cover these addons that currently don't have distinct
> > compatible strings.
>
> I think this is yet another way, but I am not sure
> how to derive the extension compatible string.

I believe it is meant to be firmware specific, or at least defined by
the first firmware / bootloader to implement support for that board.
And also specific to a particular board family. So it may or may not
live in the overlay itself. If not, then it would be an external file.
If you do want it in the overlay to avoid maintaining an extra file,
it would need to be brought up with the DT folks. This would be metadata
associated with the overlay, not hardware descriptions, so I wonder
about the acceptance.

But I do think it is a better fit for the "board + a variety of modules"
case.

> Even if we decide to implement base/overlay split,
> we may not need to add anything to Makefile.
>
> We already have .*.cmd files, and we can know
> if it is a combined DTB or not, by parsing the .*.cmd
> from the python script.
>
> It might be a bit messy, but it is what we do
> in scripts/clang-tools/gen_compile_commands.py

If that is an acceptable practice, I think that would work. Not sure
how the dependency needs to be written though.

For now I guess we should concentrate the discussions on Simon's
FIT image series.

Thanks
ChenYu

> >
> >
> > ChenYu
> >
> > [1] https://lore.kernel.org/u-boot/CAPnjgZ06s64C2ux1rABNAnMv3q4W++sjhNG=
CO_uPMH_9sTF7Mw@mail.gmail.com/
> --
> Best Regards
> Masahiro Yamada

