Return-Path: <linux-kbuild+bounces-1077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACBD86991F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 15:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CFB1C22D0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Feb 2024 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1693D68;
	Tue, 27 Feb 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+ZIqWP2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F151420DF;
	Tue, 27 Feb 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709045590; cv=none; b=UGfh90ZgDBZ00nVin5WKvEPelBnsvvLBDTThfxU/2Iqzb6fm7B7mdB4IETQznkr6JxXVrsO+PtaX00Tji/COfxFYYuDFvLPVtuxQmSwjmgnbjpj75ZGkKmqm//MIHOl/PxAUOcuTY2uotyiLndskjVT+6nzTjDbRXD75ZnLS9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709045590; c=relaxed/simple;
	bh=YlS+XLPkpbAB4xgj3+7khXh6HKkBzhmjNhKtEN3j9xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx6LBfcZWh4YnrLK6K3TfACTHwF5bRIa3Jp5ppMn2WEmenRyV+c5rB3q6ETXUkXRok6dHggP599Nq0Pvjzy0U3puheCLi8HFlswXYSoXgqF60jx+bNJqISmi+gRuiRXfEr6B3SsZyDwRDnwDK9uJKny36yUhxkDsUGjLhefJzEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+ZIqWP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A7C433F1;
	Tue, 27 Feb 2024 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709045590;
	bh=YlS+XLPkpbAB4xgj3+7khXh6HKkBzhmjNhKtEN3j9xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o+ZIqWP2hpAAfsiYuOmt5JxabM8OEhtC/GyTaCjzvDEPL3/2n9i7cvRC/ML7XTEIw
	 ADfHYc0jqxaiCOqcYPHJYZB+Obh6uQbGN6RJRN+mPDVAswyoIeO03Bhm+D8dB587Kx
	 UkY3B3YyS0jPFOb7F81rZxHFFuipAbjVqXI3YpTmoVsvL4kSSEMu6A9dq0SRPBbSpn
	 g0MWwv44NyZdjIk81sZt8qdWWof0z6YrayjoiTd1g93UJWZ2nQCt+WMk3P+68iVXue
	 q+DzEKAjWbjcoxW1mnb1Mac80/jBEcGElBDS3pJ3dpCeFHAHGATzJ49IB13sf1xdQE
	 7zP2FerHGWR5g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d094bc2244so52005611fa.1;
        Tue, 27 Feb 2024 06:53:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGklBRXaeJd8KzsxRuZ2ClY2XgsKFiWveakYpGZt22W95sVPBpA+IaAWL368f9Em0a1CZBMvfoPz4EylPWCAQ+02bu8MbK8kg56klvuHglfciSlDcs694x+X92qb77WfOBB3IvKf1wHhHxNw==
X-Gm-Message-State: AOJu0Ywow9oWzPjv5Ba4G5GjKQbNsCpz4oyt8pcOhRg1KhqrlfTYAzgW
	3A02JPxXKxq3e5xNtKDo3PXK9Svz4ihiYazXhM8/lo1E6B32gJLQuUMG2wEuL1uxzrNEf/Z1mnf
	brtJxEYdr+P/aXBMjx4Q5ohnSBpA=
X-Google-Smtp-Source: AGHT+IFdU5+QVtAGPROXQ3gMPQ7H3jlS9Zb3pV4/rSiCMlShMF/7Qkq67XHHVbRlo7IYf5l0wDT+UNh7zTNTp0CQxA4=
X-Received: by 2002:a05:651c:2128:b0:2d2:3fac:5fdc with SMTP id
 a40-20020a05651c212800b002d23fac5fdcmr7612423ljq.10.1709045588717; Tue, 27
 Feb 2024 06:53:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org> <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
 <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
In-Reply-To: <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Feb 2024 23:52:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTCNRQBG3DAFaMi4k4LUfoeU7q-JV4q8TLFqrD4YLSww@mail.gmail.com>
Message-ID: <CAK7LNASTCNRQBG3DAFaMi4k4LUfoeU7q-JV4q8TLFqrD4YLSww@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 8:01=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 26 Feb 2024 at 08:33, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The driver might decide to put the _shipped files to the subdir.
> >
> >
> >
> > Please stop this sentence.
> >
> > This sounds like we are not learning.
> >
> > https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8=
ok+7-CQUN=3DfQ@mail.gmail.com/
> >
> >
> >
> >
> > > In such
> > > case the cmd_copy might fail because the destination directory is not
> > > present. Call mkdir -p to make sure that the destination directory is
> > > present.
> >
> >
> > There is no justification for this.
> >
> > If you need a single generated directory
> > (drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whate=
ver)
> > that should be super simple.
> >
> > Why does scripts/Makefile.lib need the modification?
>
> Could you please tell me how I should handle this?
> I was looking for a way to generate
> drivers/gpu/drm/msm/registers/foo.xml.h and then use it during
> compilation.
> In drivers/gpu/drm/msm/Makefile I added $(obj)/registers/foo.xml.h as
> a dependency to the corresponding object files and then added
> drivers/gpu/drm/msm/registers/foo.xml.h_shipped file.
> This way Kbuild/make will attempt to call cmd_copy to generate target
> file, which thanks to VPATH expansion boils down to `cat
> $(srctree)/$(src)/registers/foo.xml.h_shopped >
> $(obj)/registers/foo.xml.h`. However this breaks as there is no
> $(obj)/registers.
>



One simple solution is to use $(shell mkdir -p ...)
to create the output directory.

scripts/Makefile.build does a similar thing.



You can add the following to drivers/gpu/drm/msm/Makefile.



# Create output directory when CONFIG_DRM_MSM is defined.
# This avoids creating the output directory during 'make clean'
ifdef CONFIG_DRM_MSM
$(shell mkdir -p $(obj)/registers)
endif











--=20
Best Regards
Masahiro Yamada

