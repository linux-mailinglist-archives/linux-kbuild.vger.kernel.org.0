Return-Path: <linux-kbuild+bounces-2022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DE8FF560
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 21:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65CDD1C2539E
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 19:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C359A3F9C5;
	Thu,  6 Jun 2024 19:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he6berez"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180934CB4E;
	Thu,  6 Jun 2024 19:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717702858; cv=none; b=pT1t4kebPSi5wHO7Dh5c6yJScDbwA+sANvg0ditn4z+WeVZBz0uZ5iCdPIzdmGe2bk+puDOAe2bLGdddEAshhzwlv0hC7at4shd+xcm+eZQFZaxW852RBfj0iNWl4kPdi1ZjJM2CZuH+lujpHtcdX2+OKXjxgcaM+KmsfeQ+dDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717702858; c=relaxed/simple;
	bh=nqmuZAXsgJT3L7yyO+ZftJF3F/VTtxhZgZWGgav0uu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwnFQLHWDZjMHmHDNMcgRRKfzC3CaA4qiFG21abQwq0TJCJR/O/X5b6TTFNcnvXMlbF5qmXkMxRumAfJY4ny6wQu3q72IHzrjKsSegAXHkmQ6XQxHEqQfZ3Sx/mxcD7OcnmiQ4N8Sa9VXV7gxwdTevixgK3IBHelmfev+eFHovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he6berez; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b840cfecdso1605875e87.3;
        Thu, 06 Jun 2024 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717702855; x=1718307655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMRXXzQeW24r8GaqJHGXoIgaMljSxkuiM6e9jAW3pTw=;
        b=he6berez0DEV7GfkZLNyvgX/2KIDou2WtqF2zd0WtoudQh7twXCMr9cQizS1GfHW/k
         YhcJZ+FklNHiOiOjpNbV4asYOlndm+eaVsPVc25NisQOFYE+3wJGkZ10bUVQbe6XRrBh
         zuNdLbRJ+LiFc2maeYxQLaOO8t7ipmKgPbe8Xh+kdPjKystN6VEdeT73/92DNhjNpvoC
         a6UTBAlQ2nJp+CnW7utSzl5SMwpZ/wEbgUe3AEVOepT2XtstA/UON4ul2CUmXRIuFnpH
         48TZt11qwjzmZLU/PPztNiSxmCFVv13WsfFXoRVqDqIi+M8TG6lcsIICP4VajoYLQ/IM
         kvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717702855; x=1718307655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMRXXzQeW24r8GaqJHGXoIgaMljSxkuiM6e9jAW3pTw=;
        b=Rl54dmV0gBw+wigkOIZCCGmGljDWoTlpvNHw67nKi6ZJR5jQ3J5mUxl2buUm4pIqxD
         BftnlrteQTCeTmGmtqsoYsXdr81rlpeKVB9ERusuuK0mrOQMNW+Mn/qfoJGyilL1QSMF
         Aw7jexUx0xYVpDFwmu4INMljiafc1eEM48bVmQMztd3k7PmaSubYGaD0UU2ieVEnzyEX
         boiWYdQ0ja9/3ojY8rje1dhjPjlSy2ralKO7FlcMokrDtlGDuAq0AQMYYy1B7fxwZEZg
         YB6GfL/2uuNFUUd+qEJidIk7nYFiVgGIQzIjRmWc0xWwyMHOfecAknrk/VQ4Cf+q9RGh
         UfkA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Iy2NW2rlTi1t8ff2Pis9CaHZpCbOrk8bxza5Xds/aRb/YvM7m8KyclD3ql0x7EmaUKZsFoUsL8gQ6vkKRM7+YvfGOPX3PLHsYut+
X-Gm-Message-State: AOJu0YzhU5VH13MbAfOsOcSLh5e++5tqxPEvVEpeeWLavqWBJbvYjFr+
	PCePjers2QRjzv1V/NR+O4m2uNZQ77bmXSK+JM4xGXlYfck6V5xRiAMYmqUKiCXsd8G/7zHdeqJ
	yRcgTTGF+fdO0BW636yWbNn6bzZBM0WNfyDE=
X-Google-Smtp-Source: AGHT+IEYCxL4GarMdI2OkQmF2JRvblmJC//Gllac9FduCd87A7ycmNqnpgR7waQyN9efknDTvW04bPvXf47SbugZfxo=
X-Received: by 2002:a2e:9a96:0:b0:2ea:8037:29f5 with SMTP id
 38308e7fff4ca-2eadce28272mr4399651fa.14.1717702854962; Thu, 06 Jun 2024
 12:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606183921.1128911-1-masahiroy@kernel.org>
In-Reply-To: <20240606183921.1128911-1-masahiroy@kernel.org>
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Date: Thu, 6 Jun 2024 21:40:43 +0200
Message-ID: <CAKy8djTXYt=g_YZbyHJNNYLBKuBGDp4Ur-vGLU9LTnYgvp-L+A@mail.gmail.com>
Subject: Re: [PATCH] modpost: do not warn about missing MODULE_DESCRIPTION()
 for vmlinux.o
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGMT, thanks

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>


On Thu, Jun 6, 2024 at 8:39=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Building with W=3D1 incorrectly emits the following warning:
>
>   WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>
> This check should apply only to modules.
>
> Fixes: 1fffe7a34c89 ("script: modpost: emit a warning when the descriptio=
n is missing")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 937294ff164f..f48d72d22dc2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1647,10 +1647,11 @@ static void read_symbols(const char *modname)
>                         namespace =3D get_next_modinfo(&info, "import_ns"=
,
>                                                      namespace);
>                 }
> +
> +               if (extra_warn && !get_modinfo(&info, "description"))
> +                       warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
>         }
>
> -       if (extra_warn && !get_modinfo(&info, "description"))
> -               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) {
>                 symname =3D remove_dot(info.strtab + sym->st_name);
>
> --
> 2.43.0
>

