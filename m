Return-Path: <linux-kbuild+bounces-5427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DAA0978E
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45373A29DB
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 16:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED89D20B1E1;
	Fri, 10 Jan 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sput3gIz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BE1FC114;
	Fri, 10 Jan 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526825; cv=none; b=g+mV0biOa3q1uEufqHt8JnhGyV4GQnUyhO8mJuBAgBM+S5KTAznTVxlU6nzLsNJfV9oSAbDPNJNmZSxhwAp1D/Uib9lEW2hamUi5Uy6P7SOmJ8khFSgSxk81bwym3GKIFlroJDymUssAqzM2J6tIdi4U/vcCyvkgWOuOQPzUgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526825; c=relaxed/simple;
	bh=iR8auIcyn2SIDYZfhrHZrIFr6THIu7bH4vq56852TUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErdFTFPnS3nf75CBV/aMAt0dVoI0hN2/+rlEAplj5tis/xx1AzBbzmOT3IYFQUYKlu7Tq4oETpf3WjMa2DE36qJZbWzpXArLc6n7SKntS1sJQ1yDP0LWnhorEMTcnDEtGIS1EsENe+wS2Ap2IyWjU/eIUkRrX6+j2EJ4fZiaM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sput3gIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41256C4CED6;
	Fri, 10 Jan 2025 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526825;
	bh=iR8auIcyn2SIDYZfhrHZrIFr6THIu7bH4vq56852TUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sput3gIzVCV1FoGtYt9n3Y2eXV5OGgEiSi+oP/W9C+Wjaf7GgU21CXa8duaaQPV/A
	 5JtCwBLGpZWOlLDt0DuArZrfRAA7gBQBMGjfPOfyXMtThnLnYcLsInuNlM+5dWB5I3
	 FX8v6QQJCYoJf6/RrR+JeYzdB1g1bsvSUpHnKBJfXmn2EgB+X2maYkyuhqBA0DcX2g
	 BNGt+q/sqW9PT5FRFUifaow1NFy/12oDLeaRuz/PFzSEFF6kOAGkvWqLbJzQ9UhNt+
	 9/steiBrBixXvalaP+bDj1fy8Q1bvEy1UoO+ghrNSEd4pH/zOa3Uo/+ycyU/pULXAW
	 No/T+BGPpp/kQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401c68b89eso2449560e87.0;
        Fri, 10 Jan 2025 08:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0nGm3hqGBNAiXLzXbMx4bsiwkEC2yt8t+NfHSXXz/KJ3DbQzLfhOoGOyBvp1Cg6vLBmlBSVz0FM/jdtg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzed09kfNETMFi0iPcV+uqt1Yf0X4iLP4q+H/cL69GRqYRPCOUK
	39o6oF3Vgl/wTDEOhU95Zq44+NJ6IWAVMohl++UKYc+x8oLj6BHEpfLVY0Wus1thNeaYH8hLHy1
	x2Z30y7Hsy/+hGIoDGaTygeyqgRo=
X-Google-Smtp-Source: AGHT+IENbkMr7M6WPgiWXCk8mMhFPTUJ6/kSg+VU1MbAGigKna5Dp3om89alv/5iuJipo5ZbETGVEgoACXo1GZDWREo=
X-Received: by 2002:a05:6512:308d:b0:542:8386:e5bf with SMTP id
 2adb3069b0e04-5428a5fa5c0mr2577120e87.6.1736526823966; Fri, 10 Jan 2025
 08:33:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5843611.DvuYhMxLoT@devpool47.emlix.com> <4616510.LvFx2qVVIh@devpool47.emlix.com>
In-Reply-To: <4616510.LvFx2qVVIh@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 01:33:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnzS=nCNwzj577qNZOpf8D2U-OVvbCRmDisiw4P2wOkA@mail.gmail.com>
X-Gm-Features: AbW1kvazN4W3yq5eKGxdyjf4l0UGYOiedZfHK6KpJgDbWyA2I32viEKWppLW8x8
Message-ID: <CAK7LNASnzS=nCNwzj577qNZOpf8D2U-OVvbCRmDisiw4P2wOkA@mail.gmail.com>
Subject: Re: [PATCH 1/4] kconfig: qconf: use preferred form of QString API
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 4:23=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> A QString constructed from a character literal of length 0, i.e. "", is n=
ot
> "null" for historical reasons. This does not matter here so use the prefe=
rred
> method isEmpty() instead.
>
> Also directly construct empty QString objects instead of passing in an em=
pty
> character literal that has to be parsed into an empty object first.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

Applied to linux-kbuild. Thanks.

>  scripts/kconfig/qconf.cc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 6c92ef1e16ef..eaa465b0ccf9 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1464,8 +1464,8 @@ void ConfigMainWindow::loadConfig(void)
>  {
>         QString str;
>
> -       str =3D QFileDialog::getOpenFileName(this, "", configname);
> -       if (str.isNull())
> +       str =3D QFileDialog::getOpenFileName(this, QString(), configname)=
;
> +       if (str.isEmpty())
>                 return;
>
>         if (conf_read(str.toLocal8Bit().constData()))
> @@ -1491,8 +1491,8 @@ void ConfigMainWindow::saveConfigAs(void)
>  {
>         QString str;
>
> -       str =3D QFileDialog::getSaveFileName(this, "", configname);
> -       if (str.isNull())
> +       str =3D QFileDialog::getSaveFileName(this, QString(), configname)=
;
> +       if (str.isEmpty())
>                 return;
>
>         if (conf_write(str.toLocal8Bit().constData())) {
> --
> 2.47.1
>
>
> --
> Rolf Eike Beer
>
> emlix GmbH
> Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
> Phone +49 (0)551 30664-0, e-mail info@emlix.com
> District Court of G=C3=B6ttingen, Registry Number HR B 3160
> Managing Directors: Heike Jordan, Dr. Uwe Kracke
> VAT ID No. DE 205 198 055
> Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
> Office Bonn: Bachstr. 6, 53115 Bonn, Germany
> http://www.emlix.com
>
> emlix - your embedded Linux partner
>
>


--=20
Best Regards
Masahiro Yamada

