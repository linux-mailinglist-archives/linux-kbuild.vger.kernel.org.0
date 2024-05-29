Return-Path: <linux-kbuild+bounces-1950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4658D3598
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 13:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD7D31C22C9C
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0656416DECF;
	Wed, 29 May 2024 11:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwxaQUTE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80013C83E;
	Wed, 29 May 2024 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982315; cv=none; b=VkQL7ATAW2gNyx6G686IuwXyl6ZIXgxk4ktpzM2ceCBO5WwFulOSWa3PpU1EddaKuVyw7sYpX+6MdidMj2tWeEU6l9qUcknUI08O51SrdfTlZreBqlDsQ2kllwTmoas5Zdgi9VpxEjVSD9MkIdZ6rbz1TBvyt36C6O4Hauzn0pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982315; c=relaxed/simple;
	bh=uESYWc7CHoToEHQVWQ0OlC9Wi0KT2BNb1DscZcNS3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7wfPFpXx3am+KvtHLlM/BwxfHWuKemV65WYT72WrvRB0ShdvmXq5rIAajfUX8nTUBBEeLW8rHNogJUtBuBvm4SqbunraWtCK9wcW996rdU//KNeHwCqwGbEyqxo2GDm8jQZcUV9bTazFXNt4fqzrMnxVC4Z506c9zTFFnaWXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwxaQUTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCDAC32781;
	Wed, 29 May 2024 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716982315;
	bh=uESYWc7CHoToEHQVWQ0OlC9Wi0KT2BNb1DscZcNS3Qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QwxaQUTEaOozKsFkTtAjlYDSmwQOcopG8kE1gZJe7lR4+hRSWl0YXg6WM+zL8hYLj
	 GapR8zZ3fS3WzzMqSl64m5AT2vtKL4DPpnYUKtpfxmR9cKeVdns3TjrpH6ivqy0FCn
	 2CQXN9qyb3xakD7VSm/ISmwyL4FgunQCGj09hWRy6kHucZuQzvNbfEYVX2WmA3C3Y8
	 1Wq0HJtdC0rGOec2AwPBbTQADJm117sRX4sBFdZNSG3HWxOViWZG53b0LReojNxFu2
	 3kmHwemBv7aUbPCcCEgV2UqVLOsE9HKeBkJkqGmaVmmDGj33QUJ791TG4zLk2yEXDq
	 HTJE57tZHp3Pw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e974857588so20036901fa.3;
        Wed, 29 May 2024 04:31:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYTOU845ccg4XhXjzUrwQqfONvz4sSnAdc60C7MD2tPxHz4/p9A8xdeVZOB8h1u1mGamzJ/9T9rQLjVm4Z+sr2VYqydm1VDd4ncJqsw37F/Q25VFJJ8ZPSdf9AAuiqkMq5rrQW1limKxuSHOvrx6ExKb39nV/2vEFwGr5VrOFIA9oQkLRoSw==
X-Gm-Message-State: AOJu0Yz+WzIXB13Gc+4B6l8raGsVSVolzYroCnRpbR8Ta/ckCmD2UhIX
	4l2/nNpaVRtMYOzAvN9Mm9ySW5G8XyWjYWXmXuPfJY7Z2rdoD/CkyJ+/TI6mzwddze9+uAcqRC1
	0CVULMsvnhovxztcFNVzYDf344bU=
X-Google-Smtp-Source: AGHT+IHoNX5Kwsnh1mNZdzmDHtdg2S3B5FDxAO/1z7ESikMP+bKO7aJY3LtIQMemB6bw7x5zk/SHzcJ0k9gyDp1ZE/g=
X-Received: by 2002:a2e:b8d3:0:b0:2e1:ec20:9ae5 with SMTP id
 38308e7fff4ca-2e95b0c2401mr108564941fa.31.1716982314130; Wed, 29 May 2024
 04:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>
 <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com> <CAA8EJpoeGTitM1vYg712Q2fFPenJJvvA7HS7GBA9pqY87zbOjw@mail.gmail.com>
In-Reply-To: <CAA8EJpoeGTitM1vYg712Q2fFPenJJvvA7HS7GBA9pqY87zbOjw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 May 2024 20:31:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXLirGk-rdOUofC9bpKKNiNiiWt9CR8KwyDQgp1X7dAg@mail.gmail.com>
Message-ID: <CAK7LNARXLirGk-rdOUofC9bpKKNiNiiWt9CR8KwyDQgp1X7dAg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: verify dtoverlay files against schema
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 10:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 28 May 2024 at 16:15, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, May 27, 2024 at 6:34=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Currently only the single part device trees are validated against DT
> > > schema. For the multipart schema files only the first file is validat=
ed.
> >
> > What do you mean by multipart schema files? Did you mean multipart DTs
> > (i.e. base plus overlays)?
>
> Yes, multipart DT files, dts + dtso =3D> dtb + dtbo =3D> final dtb
>
> >
> > Looks good otherwise and I can fix that up.
>
> Awesome, thanks!




This looks equivalent to the former patch rejected by Rob Herring:

https://lore.kernel.org/lkml/20240225151209.343160-1-alexander.stein@mailbo=
x.org/



Did he change his mind since then?









> >
> > > Extend the fdtoverlay commands to validate the resulting DTB file
> > > against schema.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  scripts/Makefile.lib | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index 9f06f6aaf7fc..29da0dc9776d 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -407,8 +407,15 @@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x ass=
embler-with-cpp -o $(dtc-tmp) $< ;
> > >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> > >         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> > >
> > > +DT_CHECK_CMD =3D $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(D=
T_BINDING_DIR) -p $(DT_TMP_SCHEMA)
> > > +
> > > +ifneq ($(CHECK_DTBS),)
> > > +quiet_cmd_fdtoverlay =3D DTOVLCH $@
> > > +      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i =
$(real-prereqs) ; $(DT_CHECK_CMD) $@ || true
> > > +else
> > >  quiet_cmd_fdtoverlay =3D DTOVL   $@
> > >        cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i =
$(real-prereqs)
> > > +endif
> > >
> > >  $(multi-dtb-y): FORCE
> > >         $(call if_changed,fdtoverlay)
> > > @@ -421,7 +428,7 @@ DT_BINDING_DIR :=3D Documentation/devicetree/bind=
ings
> > >  DT_TMP_SCHEMA :=3D $(objtree)/$(DT_BINDING_DIR)/processed-schema.jso=
n
> > >
> > >  quiet_cmd_dtb =3D        DTC_CHK $@
> > > -      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLA=
GS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
> > > +      cmd_dtb =3D        $(cmd_dtc) ; $(DT_CHECK_CMD) $@ || true
> > >  else
> > >  quiet_cmd_dtb =3D $(quiet_cmd_dtc)
> > >        cmd_dtb =3D $(cmd_dtc)
> > >
> > > ---
> > > base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
> > > change-id: 20240527-dtbo-check-schema-4f695cb98de5
> > >
> > > Best regards,
> > > --
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
>
>
>
> --
> With best wishes
> Dmitry



--
Best Regards
Masahiro Yamada

