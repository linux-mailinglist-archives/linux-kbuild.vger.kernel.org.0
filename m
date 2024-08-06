Return-Path: <linux-kbuild+bounces-2827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59A9488FB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 07:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510D41C2269B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 05:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE8642AA0;
	Tue,  6 Aug 2024 05:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0ned6gO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A54A0F;
	Tue,  6 Aug 2024 05:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722922488; cv=none; b=bjzaXy/HZph4RvhLGS4YQl9nxnSmS8Wi4l59QLM+IYxIqGlppBxjpYJo6g9Df6hoXRPm+fZ7lhn2x/EBAqlaM7GDWcOyxUjMXpU6Ylqu8mm+GoIpxTHzBEqH+0j8ZT1GE7DkQ5kUFCJRzm17OS46Ql6ngLOm6dTE6QLfuPjN/wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722922488; c=relaxed/simple;
	bh=L3UOryyw0QXqnslteEuZF/WOzLr5cgi08y6Q4ZpRU2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sk07RHsmm3QIpEPIFTINbHRYzy7yhXHMlpfDE4qpxAn3bJnoR9qXFENF+IOYF21HliD/HHYGLG5V4CqPzbXJOJZ640goPlA3UB+EbHdzFGbQ2BOYaFE9vvoOGbhCRD+65MX48ALR1KZULLheR8Ez4e0PZj5LnCe8HtTPBmi0F6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0ned6gO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FA7C32786;
	Tue,  6 Aug 2024 05:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722922488;
	bh=L3UOryyw0QXqnslteEuZF/WOzLr5cgi08y6Q4ZpRU2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S0ned6gO1VnY8qMNJlGVA7Yt+wqTblwi7jID0qqbIBWwlwfO0NBP4P3tuKRX/3jTB
	 u20XQNou28KoAPbSMbKnXTXhlhcsrDjacf0gFgacXg411BwtJAMY1vF5hznXkUHwbG
	 c3ldz9mMdXErfsQ3p4HHa72rZC6za0Tvf/NYSoD6dZo5OGd9LysYEQVOI8gb5XXgIn
	 AIUHbq6YjppNJP0tZI53v4vqR+lK1meEU/B4xRj9oVcNy0prAYMWcc1MyRZOeq4Vp6
	 yM1ELK5+vv4KWC/88xHOopeOH3fdGXGOxJkKBqwN1FieDYEsSM56mUjS6ga0OgjXU8
	 eBUhxOkQGsZ8w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52fcc56c882so3678979e87.0;
        Mon, 05 Aug 2024 22:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXTKnmsKjDiXCMfFkbX1O1wMBbtiqQFaE5GXYM5xMGHB456+Qqh1tmKoF+SvRGiWKu+jzJY5DJUz67oL+IztR710JzLw4xZQu/hd0T
X-Gm-Message-State: AOJu0YxCpgDO9BOF5ndPrkMTjsEnVnd8Mj1mro5O7dctU2GxfT0fvW22
	e2gM/daD5JGFNEQ8N+C139vCHyc4R9EQcbAu56pfj2/HsP5y3ET36shY0qFVdMJD08cRxkyNRWt
	ITNMKX2aClx0G1OjrMfhT7q5/t+Q=
X-Google-Smtp-Source: AGHT+IHT89RhzRa+FF7j/Wqv67JSI88oNpgIwU2zLiHkV6ehm6CYCMRNzuaIVAbFmgen4WkOWmMX8Ee0aOt6WGclqoc=
X-Received: by 2002:a05:6512:32c7:b0:52f:30d:526c with SMTP id
 2adb3069b0e04-530bb2a21eamr4093903e87.5.1722922486651; Mon, 05 Aug 2024
 22:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802124236.2895857-1-anders.roxell@linaro.org> <20240805092234.1338866-1-anders.roxell@linaro.org>
In-Reply-To: <20240805092234.1338866-1-anders.roxell@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 14:34:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMGYWfoid3-MJBfuABXC+L3=o5r=Yai4avMOqfcEq+og@mail.gmail.com>
Message-ID: <CAK7LNAQMGYWfoid3-MJBfuABXC+L3=o5r=Yai4avMOqfcEq+og@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: kconfig: merge_config: config files: add a
 trailing newline
To: Anders Roxell <anders.roxell@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 6:22=E2=80=AFPM Anders Roxell <anders.roxell@linaro.=
org> wrote:
>
> When merging files without trailing newlines at the end of the file, two
> config fragments end up at the same row if file1.config doens't have a
> trailing newline at the end of the file.
>
> file1.config "CONFIG_1=3Dy"
> file2.config "CONFIG_2=3Dy"
> ./scripts/kconfig/merge_config.sh -m .config file1.config file2.config
>
> This will generate a .config looking like this.
> cat .config
> ...
> CONFIG_1=3DyCONFIG_2=3Dy"
>
> Making sure so we add a newline at the end of every config file that is
> passed into the script.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---


Applied to linux-kbuild/fixes.
Thanks.


>  scripts/kconfig/merge_config.sh | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_conf=
ig.sh
> index 902eb429b9db..0b7952471c18 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -167,6 +167,8 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
>                         sed -i "/$CFG[ =3D]/d" $MERGE_FILE
>                 fi
>         done
> +       # In case the previous file lacks a new line at the end
> +       echo >> $TMP_FILE
>         cat $MERGE_FILE >> $TMP_FILE
>  done
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

