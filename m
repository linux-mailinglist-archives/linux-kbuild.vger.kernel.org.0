Return-Path: <linux-kbuild+bounces-3692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9B2983B78
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 05:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF452825D8
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 03:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3062B17991;
	Tue, 24 Sep 2024 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWXYprCp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F217FEAD7;
	Tue, 24 Sep 2024 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727147241; cv=none; b=rDWb9NGmsKkSFur96fZ1aWtDcL32gMdIzvwOeHrAsS+w2qpI92yyuNw4YZjZnZsmS6ibXO93trh6t3bJ/QeP9Wu/yWapzwL+T4WRyFCngKQrEjr4x1UZJyZ73IXa+NXiKwWvunUPBYUfD8EE7iQP4cs2UnynWq0j0quzXY9Eei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727147241; c=relaxed/simple;
	bh=3jbFHJtUchsekUF258b7LOI5H/BZr86Q5XVLOhHkqOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieK7fxGeZZagtPRJUFaCIDiag8zCeA89qrs03op5WSB98z6OrAKROOYOeULnA+9e504AI4lbSfCM6ZLjvngCoCESK+0c+M6Y2YdxT5PXrVUrDINDDqND+OBKFvS9nVqeSzcUb6l1BehDcRAWRgTi11VWGQmrXVsQJkzlNhfo3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWXYprCp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91951C4CECD;
	Tue, 24 Sep 2024 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727147240;
	bh=3jbFHJtUchsekUF258b7LOI5H/BZr86Q5XVLOhHkqOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fWXYprCp7zMWSAZtmWB7C3yCPiv7Asj3mw80eWCy0/KJjMxT5E04erGjyNT60jFcR
	 AljZyAtS18WYwRxkVv8UnVcYqhk7mn4qsX7kx9xTK+rN1sSVoj/UqBZY58X78Wo6jA
	 OVg2QOYdcEmrAOCInTtBRTyFbFlZUItsKiB4qkNNGTXa/bC2AMb87HIUNdVcZ8AVIH
	 xaMK2+KZWk5FVgBgPwkeyznOPIP+NAXM8WeHh/n0oCysJUadCz8NTN2ZhX/eT8xh+P
	 co291W3OnQWyBiX3HoQm+V8k+RpUjMQ/M7pxtp/jqTxv97qdu5HL5w3LtbuEwhfmeE
	 Z8hDU7j7eI/JQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f759688444so40754851fa.1;
        Mon, 23 Sep 2024 20:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDX2UsrxgxILwa08spwAYeeGNOtUru2Y0LfTWBlTqITNSnXZyrEQqt6ZwtQmmeLt4OemF5L9kh6L4T4EY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqsq5Viqv8/CN8O75WCLG96lgXHK8O7DRR9htccOCh+F0UFUYw
	fcm5/7JvjejHanm5Onr1CKm11oQNJ+EIF38A+IjrpTNRSwhcANovKf1/6W2R7jatL4Bv8yHkO/f
	9moflsTgNQc3FhnepXLelqmtbCYQ=
X-Google-Smtp-Source: AGHT+IFRo/Nq6gwUotS/Zh9Az0O9RrYR1+0X7fPeUZGKWGTkOjfQCbkRwwzfBmo0FS+5bsxB4LwhhRh9kxdV54OPp+4=
X-Received: by 2002:a2e:e11:0:b0:2f7:7f76:994b with SMTP id
 38308e7fff4ca-2f7cb2f9b70mr48744891fa.24.1727147239287; Mon, 23 Sep 2024
 20:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-4-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-4-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 12:06:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0YBNhH693f9sTJCZMfC4mV3kPYFye0r3X13Th_wuhDg@mail.gmail.com>
Message-ID: <CAK7LNAR0YBNhH693f9sTJCZMfC4mV3kPYFye0r3X13Th_wuhDg@mail.gmail.com>
Subject: Re: [PATCH 3/7] linux-kbuild: fix: ensure all defaults are tracked
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Same for the commit subject.



On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Track default options on the second line. On the second line of some
> config entries, default and depndency options sometimes appear. In those
> instances, the state will be "NEW" and not "DEP".
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index ddc630f2264a..bb1f19a1ab5e 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -220,7 +220,7 @@ sub read_kconfig {
>             $depends{$config} =3D $1;
>         } elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
>             $depends{$config} .=3D " " . $1;
> -       } elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S=
.*)$/) {
> +       } elsif (($state eq "DEP" || $state eq "NEW") && /^\s*def(_(bool|=
tristate)|ault)\s+(\S.*)$/) {



I agree this is correct, but you can also fix it to
  $state ne "NONE"
This is more consistent with the existing code.


A few lines below, we already have this:

} elsif ($state ne "NONE" && /^\s*((bool|tristate)\s+\S|prompt\b)/) {



This will work unless you introduce a new
state, "CHOICE".

I am not sure if it is necessary.







>             my $dep =3D $3;
>             if ($dep !~ /^\s*(y|m|n)\s*$/) {
>                 $dep =3D~ s/.*\sif\s+//;
> --
> 2.43.0
>


--
Best Regards
Masahiro Yamada

