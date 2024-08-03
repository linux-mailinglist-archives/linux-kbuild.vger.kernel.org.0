Return-Path: <linux-kbuild+bounces-2796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47D946A14
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 16:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 282371C20B3D
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 14:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15F914EC52;
	Sat,  3 Aug 2024 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BazRtXnr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BBAE54C;
	Sat,  3 Aug 2024 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722695181; cv=none; b=kBcPWCSW39Vpg3whMCXfl39DEo9Kx3Fc0/om4PkNYG5vEvizImwbrIeNpVdXCv9OqlEuXwPJL0UTOvpOXf5YaaSVgRLL0PqkPQagp5lgCwjhVIzNp3/uTT+1KnjAcnbOSu+UtMSZ1ZmGIliHq6GYEodSclrOvKbducRhyV463WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722695181; c=relaxed/simple;
	bh=xSCZ/t82QGpLq1GQ2q1A0z/bq70TE4X6PYSKOkzG7Ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTHlb3LtAF1BGDiS1XyjZb/2PCEJcJGFnzo8BPTGfGcr6/OnhVzDqygnkzn2k3TeddE37Y1D+Rpk9qFFn0Fpzm8wynm/vNL/Acx4yn10Tg7LTGJh0MFL9mbz73+c40NBtJTekJm2gcQC8u+DJ56s2jNonKPkKBLwgJfKbaGxyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BazRtXnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209EC116B1;
	Sat,  3 Aug 2024 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722695181;
	bh=xSCZ/t82QGpLq1GQ2q1A0z/bq70TE4X6PYSKOkzG7Ew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BazRtXnrEUk9E48IE6mKFJsegmEG2pVTtaguAEoemjZ1p+cRg40XhhMHEBMPQxQ1P
	 5rKfjB8cIxmgn/WLdOsX7WxzeaCfx1D/73JzPCvOOdeN+5e4SBiYkJQ8fCIoOX+UE9
	 P6yhNb0hFaj7HG9ThKpR1zqa7ZoonJr/4B9lw7As3tlloTH+1tAr0b1sYoph0+WFi+
	 /kj7vx9e/xzBLDTAER8LN8DHVtMozuged4n1Kergj4Acj8jwBAs/d1QDAs4TjZoecq
	 rHvnaXIanWXTct++ocACbtS6hia9f6yf2vfUNVhc+FC5rqvgLcrS9OGn4vHVzygkw/
	 LjFkoApAyHIlw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efef496ccso4035124e87.1;
        Sat, 03 Aug 2024 07:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD5Uksq9JhrxsrVj8DM7wizIOol6IL+iDdNI3mO0agTPYsmydunFoXk12A3BhfUte+iW1S1RogBGxd1D/otqg3KSkinvx2/dRW0+M/
X-Gm-Message-State: AOJu0YwK59qwmvAkL8xxDo127JFc4sd1jruMPKfXev+Xj3/rdQ9vccqp
	3RAJy0umfW77IWX+lDpTPT+GV6m8DoYaHTQdMZhFDEyLFmVjaBOfN7s+JoUVBP1Hz4+e6j776jp
	DwV4tSROOSueRWHBt6QQ0wGTQK1I=
X-Google-Smtp-Source: AGHT+IFw/Sc6saR/csTZhgiqc25IWnwy3Ob+Gj1jPb6sTjPiqv1NJzJfErRaw+Lw5xGI0HWTKECB0zvKZWfl4fnCkZg=
X-Received: by 2002:a05:6512:3d8a:b0:52c:f38b:41b2 with SMTP id
 2adb3069b0e04-530b8d17ademr2213151e87.17.1722695179776; Sat, 03 Aug 2024
 07:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802124236.2895857-1-anders.roxell@linaro.org>
In-Reply-To: <20240802124236.2895857-1-anders.roxell@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 23:25:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATn+2kKpbiHYHR7zEUeveMBY37t08qyn7Pb_wQS8PqcHQ@mail.gmail.com>
Message-ID: <CAK7LNATn+2kKpbiHYHR7zEUeveMBY37t08qyn7Pb_wQS8PqcHQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config: config files: add a
 trailing newline
To: Anders Roxell <anders.roxell@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 9:42=E2=80=AFPM Anders Roxell <anders.roxell@linaro.=
org> wrote:
>
> When merging files without trailing newlines a the end of the file, two
> config fragments end up at the same row if file1.config doens't have a
> trailing newline at the end of the file.
>
> file1.config "CONFIG_1=3Dy"
> file2.config "CONFIG_2=3Dy"
> ./scripts/kconfig/merge_config.sh -m .config file1.config file2.config
>
> this will generate a .config lookingn like this.
> cat .config
> ...
> CONFIG_1=3DyCONFIG_2=3Dy"
>
> Making sure so we add a newline at the end of every config file that is
> passed into the script.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_conf=
ig.sh
> index 902eb429b9db..ce1b77ee043b 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -136,7 +136,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
>                 echo "The merge file '$ORIG_MERGE_FILE' does not exist.  =
Exit." >&2
>                 exit 1
>         fi
> -       cat $ORIG_MERGE_FILE > $MERGE_FILE
> +       cat $ORIG_MERGE_FILE | sed -e '$a\' > $MERGE_FILE


Is the pipe necessary? This seems to be equivalent to:

  sed -e '$a\' $ORIG_MERGE_FILE > $MERGE_FILE






This issue also happens if $INITFILE lacks a newline at the end.


I think the right place to insert a line is there:


        # In case the previous file lacks a new line at the end
        echo >> $TMP_FILE
        cat $MERGE_FILE >> $TMP_FILE


I am fine with always inserting a line between files.




--=20
Best Regards
Masahiro Yamada

