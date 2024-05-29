Return-Path: <linux-kbuild+bounces-1951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA88D377A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 15:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BE42882B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 13:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B4E1095B;
	Wed, 29 May 2024 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4pgNeyF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954511185;
	Wed, 29 May 2024 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988916; cv=none; b=Iv0wwbrgWpMqCy3QFszHnptB1LozhjnlqV1N5O7pd1CCTiBhgmjOecnuFKNh9DUL+CoqD/9n7eQS+dc2AKlOVNsNnpnm5NJfjKEKvK69rpRIGzaVSKSjjdBRhazbkWo5ElriQLivlB8WEfmzHX0QfS1F699aPC9qJiEjjTF0KXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988916; c=relaxed/simple;
	bh=FpxFPRp8yPNn8Ngd8ZdEt2mCiE8f6earyUQln/Rb0CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqRw8bhkppB2c/ch5PbsfozzTN8FIU3EMaAKiAJnWfDlaeRU56QXDgpRH7qtrFsK1qu9G/amWr4b9RlSDH/sh/ySeyz8mQ0lVhAcIfrns12NMWWflxDrHkQZDHw96FTR4QfP2h1NiLIF+DttVhcYDFJhbJiNg2c0kHAPmMyt69s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4pgNeyF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC540C4AF07;
	Wed, 29 May 2024 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716988916;
	bh=FpxFPRp8yPNn8Ngd8ZdEt2mCiE8f6earyUQln/Rb0CQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d4pgNeyFsGB4iz2l3njE2pOO7qGlrpWslG/r5XGYgR0PRJ+j4KcCUQrwp42svs31L
	 1x3GLi/3TRsOvbQ7x9mUsymo4fCGSPIGwXlc4/jMuJVKMn/kRLDKbMlepWQSeHMyfE
	 6LO89YRhipVTja1OWylOM8Afr8DKBGU0tpftjwsQPyAJmmCzgkE+J+OfXJPiA5DNH2
	 5cd/umDDJGZ+5OR+x/4/R+EeCmGSdkYo9nfqRyl35nrEbMg5rnEDzGDCvc2L9fKPlG
	 LbQxdxb3AJG0RyvWSMUUHzMlE/EMQ4BUurn1beU+gq1PBOGIq2z0bTSkt1sNG5sn3R
	 8goRC61yOmNow==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b27afe214so441438e87.1;
        Wed, 29 May 2024 06:21:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSjwvdCc0ojFUNcQc/xeAXLTWPhcWZt7VIjpSSt3WDDUq6OfsFG9HrqWN1BZZYM+rA+/icgMkK8CLzG+wWQSaM9uwMDiGC396AjuFqJwZYTO2OkrEcZNWmn6OG6HcxatZxqokoYYSZ9vHQMitBwizXVpoGdO4XQgJvhI0qxd8CH05Gns4zLQ==
X-Gm-Message-State: AOJu0YyXZFs7gQ5WR/cPaX7HbD3ZqALXoBKRqAmCsdDFC02XLqK5fS+T
	FyVE1P7fO+7p4yrMqj8HYS+CLAxQmr7VhEYegDXLX08qThIJLaSk5pUHRsEeP/AHJs5ObMqPNgp
	2Ew1sKlrgi2c2KyQ+aVnpXK4yPg==
X-Google-Smtp-Source: AGHT+IFXplSoT1DLFl4NUQ8zWQRRW0XvDiFw3ANw9v8lRwpP9IFYRS4Np3FBbmgVr02QNkKdArXMy50Lw+QujeV+Gr0=
X-Received: by 2002:ac2:5181:0:b0:51f:9a88:be2a with SMTP id
 2adb3069b0e04-52a829140ccmr708255e87.23.1716988914331; Wed, 29 May 2024
 06:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-dtbo-check-schema-v1-1-ee1094f88f74@linaro.org>
 <CAL_Jsq+cmNmm4we6B6OdeS_Qty44FxKmtZHDjLBi9f=DaBw4GA@mail.gmail.com>
 <CAA8EJpoeGTitM1vYg712Q2fFPenJJvvA7HS7GBA9pqY87zbOjw@mail.gmail.com> <CAK7LNARXLirGk-rdOUofC9bpKKNiNiiWt9CR8KwyDQgp1X7dAg@mail.gmail.com>
In-Reply-To: <CAK7LNARXLirGk-rdOUofC9bpKKNiNiiWt9CR8KwyDQgp1X7dAg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 May 2024 08:21:40 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+CS1wHV9L+QUDGOiSck=nS_kObhrQN07=JjWX80KQrHQ@mail.gmail.com>
Message-ID: <CAL_Jsq+CS1wHV9L+QUDGOiSck=nS_kObhrQN07=JjWX80KQrHQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: verify dtoverlay files against schema
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 6:31=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, May 28, 2024 at 10:16=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, 28 May 2024 at 16:15, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, May 27, 2024 at 6:34=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Currently only the single part device trees are validated against D=
T
> > > > schema. For the multipart schema files only the first file is valid=
ated.
> > >
> > > What do you mean by multipart schema files? Did you mean multipart DT=
s
> > > (i.e. base plus overlays)?
> >
> > Yes, multipart DT files, dts + dtso =3D> dtb + dtbo =3D> final dtb
> >
> > >
> > > Looks good otherwise and I can fix that up.
> >
> > Awesome, thanks!
>
>
>
>
> This looks equivalent to the former patch rejected by Rob Herring:
>
> https://lore.kernel.org/lkml/20240225151209.343160-1-alexander.stein@mail=
box.org/
>
>
>
> Did he change his mind since then?

I think I misinterpreted the prior one to be checking just overlays
rather than base+overlay seeing the 'dtbo' in it.

Of the 2, this patch seems a bit cleaner.

Rob

