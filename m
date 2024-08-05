Return-Path: <linux-kbuild+bounces-2812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38C94761B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 09:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E265AB2111E
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A72148847;
	Mon,  5 Aug 2024 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtzUhMSt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C0149DFB;
	Mon,  5 Aug 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722843245; cv=none; b=us3EGFHWf/W5oX5sMt7MqzR5ULytTZyXqZtNh7oQsdyayN6YT+hSz3KrO/LVMVpqn7lYeNiC3DC/Lta8R9QdEuEhQrAbh++9HE46A0VqYurkN3RG3+h9IBzUj/w9yDZZsQYzaE3fcnE3BGCDBSF3BLSoxpIfId+c7Wd6MIa6v2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722843245; c=relaxed/simple;
	bh=ll0dtPkR+Tr6nazM/ECCyasAqYfAaIsbDWXwVaUZC50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jj+QweTcYy7dCjqG+n1eAyfMoJYuCsev86sYEeJTwHbi+q02krf0ZwBniD47aLgwEKzSd9mYZz90t2r3tWlXb3jvPwWgdckFW5vXalaZHM2VfDETfFWfqPFTlvVbBOkj3Dx1rSq0+Jl4FuLYUsSmxhpaZqBin8AifWiLksfiVmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtzUhMSt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f149845fbaso67922401fa.3;
        Mon, 05 Aug 2024 00:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722843242; x=1723448042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MECwRAkA6x+URFBDTTAsaLSEltXVQfVD7kXa96X+AA8=;
        b=KtzUhMStzNsYPB2Z7yPmC6aXiwaGiusSXiko55BzeYemLJAym2uZaDBU0EXu25iPX5
         P5CMpHNj4BfSO8+itOeXzSelcmjZi7rNwkmqXRDABibaqvAqINVuBlSd2c1LBlFR7SoO
         ugW/MZB/2dj5d4CEudaNXLq4LHyTj68IYt7xwjHC4kF02eBlSN8wRVVu8q+6zL60ENbX
         kTaAniSEse3YYxVYKebvrOpS92IBgp/ade6GCCEQDwhd/gvdJ4JO/uLjyDRF3AzxbSSJ
         7WWTi487I1uuw6oUT0mYV+26/ONkPWtP9caPVljs2wmQMbdwngHGmTFXpG/P7+DB9SbR
         lMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722843242; x=1723448042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MECwRAkA6x+URFBDTTAsaLSEltXVQfVD7kXa96X+AA8=;
        b=OWoioZv/AWfMzkXB5goXaCAEZnGpV4Ue17W9nxhr9+LiOAMkH4FWE6ZJDJx40QTs8G
         q6Hb9YEvjktES5zbd7kANRfugQ0Ayi8mOohg+wUAKcV1g6jyEQopPn7dAFJCRJ9AtCeR
         heNFiRBYDqlrz9iwOSRJWauX8BoIJYtxCwmnf//obpPMZCf1HgOfywhBVlicNloacHO1
         CJUEL7CdXrIztTKEb1WAuiI8FHQCBepKWdUEBYdXb+z4/8Beb1JBlXbTv8Cu5CWMXAgX
         d9VaaOKyrTaTgE6RGHV46QHNYYhdGUQcVvNmh0KzFtv6fgRpb1G3+Wh0w5deWfcUKwY9
         mnOA==
X-Forwarded-Encrypted: i=1; AJvYcCV3u9jQSZw7Swz8imb5C8ido36uVpGWc6fb5kDgvuAArHfbxGD8a3bqigt6qscns6wSGATduInaLjv+GrzKZ0DE7WQWxQroOHnarWVE1wsxTyyNB2yYDkKCridOeJyqC+DTTk+ICA8/KVGV
X-Gm-Message-State: AOJu0YyBv7mpJAXbdEySHbJrm9VwI0bN0HpNaxXfnU/vqMeW7LcpFLFy
	EkL7yoa+p8JcL1ZJQJYvXgNJghYjViyvSXyDwL+G9GwBZ/8oIZrn5/jobv43gPgv8FkuDwtC6XA
	95iEwSEcRnAfIcH5dkYLe37o69ZKPiw==
X-Google-Smtp-Source: AGHT+IHYDFh3pkp+WWlPOWpjthzQFOZ+Fjpj7+lIjaVGlfKwzvNm2tCbirtD4Anv34NHYKEK5m9oJ4mQU3VwwC8sups=
X-Received: by 2002:a2e:6819:0:b0:2ef:7fef:3b27 with SMTP id
 38308e7fff4ca-2f15aaf61d4mr73146301fa.35.1722843241894; Mon, 05 Aug 2024
 00:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804055057.262682-1-gnurou@gmail.com> <CAK7LNARHRjP0E-5GLJCWqyQHRURrJBgZO174thdokb5taW+qiQ@mail.gmail.com>
In-Reply-To: <CAK7LNARHRjP0E-5GLJCWqyQHRURrJBgZO174thdokb5taW+qiQ@mail.gmail.com>
From: Alexandre Courbot <gnurou@gmail.com>
Date: Mon, 5 Aug 2024 16:33:49 +0900
Message-ID: <CAAVeFuJ8ruqSGbqLTG3d31tTy6p22af7yt6C59mYhS2p0goa-Q@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add $(srctree) to dependency of
 compile_commands.json target
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:20=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Sun, Aug 4, 2024 at 2:51=E2=80=AFPM Alexandre Courbot <gnurou@gmail.co=
m> wrote:
> >
> > When trying to build the compile_commands.json target from an external
> > module's directory, the following error is displayed:
>
>
> As I mentioned in v1, this issue only happens when using the kernel
> directory built in a separate output directory (O=3D).
>
> Unless you have a opposition, I will reword this sentence as follows:
>
> When trying to build compile_commands.json for an external module
> against the kernel built in a separate output directory, the following
> error is displayed:

Sounds perfect! Thank you.
Alex.

>
>
>
>
>
>
> >
> >         make[1]: *** No rule to make target 'scripts/clang-tools/gen_co=
mpile_commands.py',
> >         needed by 'compile_commands.json'. Stop.
> >
> > This is because gen_compile_commands.py was previously looked up using =
a
> > relative path to $(srctree), but commit b1992c3772e6 ("kbuild: use
> > $(src) instead of $(srctree)/$(src) for source directory") stopped
> > defining VPATH for external module builds.
> >
> > Prefixing gen_compile_commands.py with $(srctree) fixes the problem.
> >
> > Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) f=
or source directory")
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 8ad55d6e7b60..52d7dfe4212a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1980,7 +1980,7 @@ nsdeps: modules
> >  quiet_cmd_gen_compile_commands =3D GEN     $@
> >        cmd_gen_compile_commands =3D $(PYTHON3) $< -a $(AR) -o $@ $(filt=
er-out $<, $(real-prereqs))
> >
> > -$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile=
_commands.py \
> > +$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/=
gen_compile_commands.py \
> >         $(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
> >         $(if $(CONFIG_MODULES), $(MODORDER)) FORCE
> >         $(call if_changed,gen_compile_commands)
> > --
> > 2.46.0
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

