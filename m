Return-Path: <linux-kbuild+bounces-4276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F99AD12B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A4B1C2185C
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C299D1CACEF;
	Wed, 23 Oct 2024 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBiir+8s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918B13B792;
	Wed, 23 Oct 2024 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701561; cv=none; b=Jqa8SHeOma2/bxpF7pM4M8RH/SWO7IU97jRJy3PbDW1iDB/waxPTrB9EekLR1B6MRqzuZiXqqMYVELociIPPn4a/O6MT1OjwwxNqYrMIJ8QZIsYVDrwwGBAQ75jjCgGQ3mZ4OeasPzODFYRZdHrMUvWgwFDCKt5g56wtWQw+WNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701561; c=relaxed/simple;
	bh=1vm/vJPnqZ3Y9PyWxRqcHnRIdzQtOedtRdfemnaD3QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+7KHWODpSn8rioxtLRmXfQ86LHetwk11uDrk0MZgouIyoDsg+w06O+l+OPh0GwBoz/gKv/c7tioWBwVfSCJVi99kUqUoHLihxlgYY7I7BF1QS+/FqsPnW+KouovvsIhG9XnSqm4/8qkrZQNOkdHVmtqjx9pT0TP/gJ4K0rmQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBiir+8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B795C4CEE4;
	Wed, 23 Oct 2024 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701561;
	bh=1vm/vJPnqZ3Y9PyWxRqcHnRIdzQtOedtRdfemnaD3QE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CBiir+8sW2Wc7eHa1uMwUGpzfbwW9kAfV5RwtHy2DYXcore6939aUBELdcXcPe5Ih
	 9I8YmV93tHpm0rngfnWt0HxF7zpwLDBIIcoUakOkXzDMf1FTJ65N5h4hWRJKSGn7Mc
	 oeJktdmUprgoZWOQDzGQDQ86NuxRANuFbBMbUl6OLYsO7RHdctoeeI7eZWg2zy9zM6
	 n9umXvKcs0/6YmDsJI9FMd9QS/ih7SLtqYAGOEA+AAIxyQgExqFG1KB0/Zxj0hfPjT
	 xjBtjnoPNoXpC3/qto1Oc8iS/1STzW7BO5TKOU2HoxhPTxRhcJTI7cKlNphiMgThL+
	 3w3EQhSq9SGIg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7868755e87.3;
        Wed, 23 Oct 2024 09:39:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmNofANNRu0Pi5Ee2g9NwgzK7JwcObRWYaM2uClle1lPEf40nOIJctUSuFaf1p1A1Hqc/KKln1352RFRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIGF84s/exdjCQrx/dSkec5aI18Nwhv8F0RkWF2ACt/VH7GSv
	VBtE5ZjRw24VyohvthrYG1WB+lFfHKYMz9wIV8i0N6xsLDMqPT8B4IHcoNvy/SXxmJUT2TMxdP2
	oEFelOHy7cKJxf2pUHJ4RHeWR6Eg=
X-Google-Smtp-Source: AGHT+IHLKJvA//TAI5BgwAAr8gldy9PaVgrUn9ArNQNzmLuqUcffvcz9gjICZFaypUCE4lp5MWP07pGPJp6pWam2/ZQ=
X-Received: by 2002:a05:6512:3a95:b0:539:edf4:68b4 with SMTP id
 2adb3069b0e04-53b1a37f186mr1578413e87.57.1729701559938; Wed, 23 Oct 2024
 09:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <3317655.aeNJFYEL58@devpool47.emlix.com>
In-Reply-To: <3317655.aeNJFYEL58@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:38:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8=Jy5t6JsP0mNw2XD7=gyD=Ny9uBw=Wq+CzX7-pmjdw@mail.gmail.com>
Message-ID: <CAK7LNAS8=Jy5t6JsP0mNw2XD7=gyD=Ny9uBw=Wq+CzX7-pmjdw@mail.gmail.com>
Subject: Re: [PATCH 3/7] kconfig: qconf: use preferred form of QString API
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The code looks good to me, but please describe something
in the commit message body.

For example, you can quote:
"We recommend that you always use the isEmpty() function and avoid isNull()=
"
from the QString documentation. [1]

[1] https://doc.qt.io/qt-6/qstring.html#distinction-between-null-and-empty-=
strings




On Wed, Oct 23, 2024 at 3:32=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>  scripts/kconfig/qconf.cc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 54640f6b29e2..6a653ebe9df3 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1520,8 +1520,8 @@ void ConfigMainWindow::loadConfig(void)
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
> @@ -1547,8 +1547,8 @@ void ConfigMainWindow::saveConfigAs(void)
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
> 2.47.0
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


--
Best Regards
Masahiro Yamada

