Return-Path: <linux-kbuild+bounces-2817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF3F94783C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 11:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510621C213CE
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 09:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A08614F9D4;
	Mon,  5 Aug 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPMqSBpy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224E14F9EB
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Aug 2024 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849674; cv=none; b=Y5VcBkbfHT0L03YmpOdvLzNcYUD7UWCbgG4yK/N3eH88bqFs690a8JJaDxBBCPEizs6Wn+mCtJfZITU0YQZkgK7VxSSXob1O/nRUyd6ZMkYZwF0b9Xna4jEdHo0SEV/z4Y3Fzv7OHCJUvw49n3BnVPi7JeFmdRdTz+trON4mVTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849674; c=relaxed/simple;
	bh=6m5Xpe1UzEAA88/zXvZanFqw4wWIAjlUJ7hYewOSJpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmvzHBrIkV7Jn+ItD2Moj/othhKsnrASL1Dgl9ToYZOSSbHvy62hsELdHo5xMYvcCHGJuo53XQeGqQwbqeG8XLfLTmDsNfdMnart8Wwun+3MnIpgiECP+yh/tmpsmLbc4q0ImcZ0ELoeEN0/ZPLfClPHZEQMxHozolXfJoxP1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gPMqSBpy; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b7a3b75133so77508326d6.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2024 02:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722849671; x=1723454471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmHB41Myjziu9h1evB/nIwJ7s3wFVhmNjQYmlD8jvuo=;
        b=gPMqSBpyUu912zGuG9dAQNqBE7SNE+eaLLgwwYWjEBIcCH2zgZOU0cpzhDi1xHAqfq
         mEM08HkHdomo/IA2AYIQ79Np3n9No9dekxymY4dxE7SWE9KGprUhbvzag59XcqDdBFvl
         WFC+tAikbWfkoo2sUGCNc2VluW+ZfjmJG2r78/VfTyalR9dmlWsbjXAfW5IK17AxNN+x
         rB1OdoEYDrhOMqjU03SIYW0UE4hf2aLQc6M67H5CwIGF0sUwS9C5XTSZCnagQeM5ijVm
         JYYx8IuECU0M1op0xFHEwN7Du7xajGH8KPUCMyc9mGaj1o6Dp5pO7L6k4M0Xl5pEooXp
         CjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849671; x=1723454471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmHB41Myjziu9h1evB/nIwJ7s3wFVhmNjQYmlD8jvuo=;
        b=hNTyzHKzEnYS3iDoy3+VeyaMo/CHw29++i/XUmaFwekUvpiT08RWhY02Mflt5fLNz4
         K48PyovBKRxzdqtlXMz6xIDSNpBx42yf8k4AVD2NcRrfcF7q+qo9fKuevUDF1RrQJRce
         mhoBcQFQQ7v2zAuCFlt8kMg55mgQ8Q96d3PWGUI1zZwExDie94zZFHxR10Pq3Q6reVzB
         7SOReJ+VB0WALMQtRAK12DL0bM52dNinteb8zzk5mN3iZwkeWR5fIaBcVX2yAu7y8VVI
         CUZMzoV6ZuQesNpxwS0vP3LCUYzcNF3RZ/G3GkBFtuoLUFiXH+VQnCqAwUVBrJTuR7kN
         hBqw==
X-Gm-Message-State: AOJu0YwhLJtMZoRORGoOn7fatSpRg+L5WIC9792D+HYQrIAg+hkEkSQC
	2tTbFIXvxpFX9+OPUluTmYWMfzHAi/bJ//fDFWGlCpuzsKc9fN4BW/8pjfSnvRHDHu3pcM0P4mP
	4wmJeGldD3ygllXsxx12udZoWm57kumw9qX2hKOp4ep1hQyCf
X-Google-Smtp-Source: AGHT+IHIUHsYB3YnW1yLfqteFTaI13RhBKyqUe54ibc/nDeZHQmsHmInNkfvc56k9/4rc5J5l3gn1/e+g0XgWcgYVDU=
X-Received: by 2002:a05:6214:5c49:b0:6b5:ec9e:a815 with SMTP id
 6a1803df08f44-6bb983d5ea8mr151068586d6.42.1722849671493; Mon, 05 Aug 2024
 02:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802124236.2895857-1-anders.roxell@linaro.org> <CAK7LNATn+2kKpbiHYHR7zEUeveMBY37t08qyn7Pb_wQS8PqcHQ@mail.gmail.com>
In-Reply-To: <CAK7LNATn+2kKpbiHYHR7zEUeveMBY37t08qyn7Pb_wQS8PqcHQ@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 5 Aug 2024 11:21:00 +0200
Message-ID: <CADYN=9KXUYjfKrO0u_zmFoxrLAKap8Jtc5o8CN7TL4N76YngJw@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config: config files: add a
 trailing newline
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 3 Aug 2024 at 16:26, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Aug 2, 2024 at 9:42=E2=80=AFPM Anders Roxell <anders.roxell@linar=
o.org> wrote:
> >
> > When merging files without trailing newlines a the end of the file, two
> > config fragments end up at the same row if file1.config doens't have a
> > trailing newline at the end of the file.
> >
> > file1.config "CONFIG_1=3Dy"
> > file2.config "CONFIG_2=3Dy"
> > ./scripts/kconfig/merge_config.sh -m .config file1.config file2.config
> >
> > this will generate a .config lookingn like this.
> > cat .config
> > ...
> > CONFIG_1=3DyCONFIG_2=3Dy"
> >
> > Making sure so we add a newline at the end of every config file that is
> > passed into the script.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  scripts/kconfig/merge_config.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_co=
nfig.sh
> > index 902eb429b9db..ce1b77ee043b 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -136,7 +136,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
> >                 echo "The merge file '$ORIG_MERGE_FILE' does not exist.=
  Exit." >&2
> >                 exit 1
> >         fi
> > -       cat $ORIG_MERGE_FILE > $MERGE_FILE
> > +       cat $ORIG_MERGE_FILE | sed -e '$a\' > $MERGE_FILE
>
>
> Is the pipe necessary? This seems to be equivalent to:
>
>   sed -e '$a\' $ORIG_MERGE_FILE > $MERGE_FILE
>
>
>
>
>
>
> This issue also happens if $INITFILE lacks a newline at the end.
>
>
> I think the right place to insert a line is there:
>
>
>         # In case the previous file lacks a new line at the end
>         echo >> $TMP_FILE
>         cat $MERGE_FILE >> $TMP_FILE
>
>
> I am fine with always inserting a line between files.

Thank you Masahiro for your review.
Sending a v2 shortly.

Cheers,
Anders

