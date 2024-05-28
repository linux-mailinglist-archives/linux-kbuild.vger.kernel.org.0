Return-Path: <linux-kbuild+bounces-1943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABD8D1CB8
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 15:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C4528719B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 13:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF75116F0DB;
	Tue, 28 May 2024 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KX+o0AOb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7816E897
	for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902201; cv=none; b=PWuOff9nxYwkSHxxIrVXwdAmLWSAJcw/pxsO4Jro4gxjVZnv5n0S12bw1/8+TsstEV2lwwvF7s+YXDIq9v71A9/LvJw7dSDIPe1BWq8f/v+OPzGEfkUCUnBQENwxAAgmg5gSIoO/Pf3s1Hl0bVb+ySTpzDKMEG+13vSsdB1ht0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902201; c=relaxed/simple;
	bh=LUoz2Z7YH8Bk418zn5vn5z/l6JE7CEfbQyLS2RHxegM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6ZxXZ2nW8c2HGYkK4yUOti4xbuhx9zo0MToiCEQKHTMFnDbtzv47Pm0G2ZOa0Pe2uklNYlNceKAbiR7R2KNxSLSWJU7C+GqFiQTR8XEMY+NJGN5Rp95LjScw74Ac7hbWwJCb0ofn8bNH5yRGdmBMWihkJEgAXe4gjreXZOyhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KX+o0AOb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bf59b781d6so672827a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2024 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716902200; x=1717507000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMy7d3yNdOpqMd77ZF/zy2rrJf07kj/yM6vzAE/9RAU=;
        b=KX+o0AOba21ckrnL4JvMY5v7oBeXlpAVpkCIifqTiIgJpsznGX3PjybnZxhNnlhdJc
         2Zu1JTAFQFvKamH7Z6BJ0cy+A5UuwxDgCQ+IJB97h6BNXqMAn4I7IsiMJkT/hKk/g+Px
         EU8dRM+yqB6ND2K/8q0WMEh8TmreWFngtQPJE1YF+9KGhrUoGzu//xz3yVxAwmz7qCS9
         KXpgb3BC2k2r8Vnn2nQqq2Y9R3vgk74bvSVnzKb8VnoWDFhYBxaSQYEL+wk75ocwRm00
         TNlbDdKSIkIuy1L3DnQMVkezM0saTAuCpiviQJbW6bFatxEj8f0boCev0A3Nskd+RuQn
         6lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716902200; x=1717507000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMy7d3yNdOpqMd77ZF/zy2rrJf07kj/yM6vzAE/9RAU=;
        b=AYty7yH/v5VUoWwy4mJ+Rvlh1s7x3OIciMiVtSpcw8e9gLd5d4ryuOl71Fnup4h+Ki
         nyZN3AeYkwuKy8f3yaJ5QKs1er4TbUXGMj9xrrmWh0cOfTl7wcgYDEeaUuxvio7WPaP1
         aFrvDDrpcVktMN0sX6RE4+QVieLa6Gt7H5fFv8kIcmdxMoB7SAiTN34C9EmqY8JB1FgY
         RO9ChsBrxPBIoHL2OWcKPGjQyb5Y5YHlK8VUSghTT4SlEZ/DCdWa5KSFatk90GF/K8Mu
         aP9Zu4nN/hXAUI3JHwUd4FyZ8hoeXYdkgCUgVlJm0XW0F32dx4gEFSvw0TrGX9B/UoCY
         2y2A==
X-Forwarded-Encrypted: i=1; AJvYcCVqcfKNNhXls3SI3V0hhTnx05/NibkiALun1bvyVrJxzBlwxAG1HVw7CrTiF7N1AP3H2mT8I6suOSMggTbMC5Ac4DcUTcG8wWN7eXrU
X-Gm-Message-State: AOJu0Yw9ZJfg2fdigiXNwC/Q8S8OyxZ0CAJawFmXRAEEkLuR6nOVoJkc
	Mg+Iak6+uxzWraA2/37F3NGwmpC0iEG6aytrqv1l7EOeRFu5ldqDhbhkuLL80He7A+oBtTaeQEB
	q71uJIvrHLNP9X/SpF+QqVe7x9RGqof8U5nVW4sjMFPOCSz4S
X-Google-Smtp-Source: AGHT+IHspkrG6W4zRKwlxVNAppmAeEBlw6gj1LvinbY9kZFql6H3eexc9cOPVdVxPozgIm9yjGMMMa39TQ/eyvDIfFM=
X-Received: by 2002:a17:90a:a103:b0:2bf:e9cd:c858 with SMTP id
 98e67ed59e1d1-2bfe9cdd3d3mr3711458a91.17.1716902199614; Tue, 28 May 2024
 06:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org> <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 16:16:27 +0300
Message-ID: <CAA8EJpoeGTitM1vYg712Q2fFPenJJvvA7HS7GBA9pqY87zbOjw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: verify dtoverlay files against schema
To: Rob Herring <robh@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 28 May 2024 at 16:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 27, 2024 at 6:34=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Currently only the single part device trees are validated against DT
> > schema. For the multipart schema files only the first file is validated=
.
>
> What do you mean by multipart schema files? Did you mean multipart DTs
> (i.e. base plus overlays)?

Yes, multipart DT files, dts + dtso =3D> dtb + dtbo =3D> final dtb

>
> Looks good otherwise and I can fix that up.

Awesome, thanks!

>
> > Extend the fdtoverlay commands to validate the resulting DTB file
> > against schema.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  scripts/Makefile.lib | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 9f06f6aaf7fc..29da0dc9776d 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -407,8 +407,15 @@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assem=
bler-with-cpp -o $(dtc-tmp) $< ;
> >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> >         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> >
> > +DT_CHECK_CMD =3D $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_=
BINDING_DIR) -p $(DT_TMP_SCHEMA)
> > +
> > +ifneq ($(CHECK_DTBS),)
> > +quiet_cmd_fdtoverlay =3D DTOVLCH $@
> > +      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(=
real-prereqs) ; $(DT_CHECK_CMD) $@ || true
> > +else
> >  quiet_cmd_fdtoverlay =3D DTOVL   $@
> >        cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(=
real-prereqs)
> > +endif
> >
> >  $(multi-dtb-y): FORCE
> >         $(call if_changed,fdtoverlay)
> > @@ -421,7 +428,7 @@ DT_BINDING_DIR :=3D Documentation/devicetree/bindin=
gs
> >  DT_TMP_SCHEMA :=3D $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
> >
> >  quiet_cmd_dtb =3D        DTC_CHK $@
> > -      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS=
) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
> > +      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECK_CMD) $@ || true
> >  else
> >  quiet_cmd_dtb =3D $(quiet_cmd_dtc)
> >        cmd_dtb =3D $(cmd_dtc)
> >
> > ---
> > base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
> > change-id: 20240527-dtbo-check-schema-4f695cb98de5
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >



--=20
With best wishes
Dmitry

