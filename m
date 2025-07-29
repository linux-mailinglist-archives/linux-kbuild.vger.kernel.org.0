Return-Path: <linux-kbuild+bounces-8242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434FB14E8F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BBC0545F88
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF9A199934;
	Tue, 29 Jul 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABu6Na5/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB615383A;
	Tue, 29 Jul 2025 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796503; cv=none; b=CGGF2Rxvn/tOPHEBAA9iPv8hgnyQOvpjqsqE9W6rnD3kuC7DrBwiufI9a/VFkp0NtkdpEyx66nyVlaIp/jHlHEzAY6qTpE+MAm57X8I4KQ3aPPBGYy7qk2NbrOzW2ks+WdxMiwFzyGFrLBJYPXG2yLwVlcSyoo/ChsESVD3nLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796503; c=relaxed/simple;
	bh=mAmes/zYyoBatBwuEfLsqP7Lrt5HONR4RHITd4MMcjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY+IbEUisWvWKbdj0KukHUCQRao6iiwRI+qF/WBIfZP77SHuA/sKkDV8ODrNDVRl8TyDssJwO7PekmJAgrWstORArwWt042Rftxcdot5CTe7pvcVLJqNLeIxglohi5gn3meffICtF/3tZzRgldZWq/AP5XensaZMhEQVWQ5eIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABu6Na5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D66AC4AF0B;
	Tue, 29 Jul 2025 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753796503;
	bh=mAmes/zYyoBatBwuEfLsqP7Lrt5HONR4RHITd4MMcjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABu6Na5/eI3ieZ8dnqTkLjgP4Un8Pmz+6NJ1LPPl0dyBksTr9OCP/vD8hBA5aCDE9
	 KXpLd+c1FNCxiA7Awx53/CAZxCOzwOBgVdT80+JD/SqOKeqKKry9xRWI1gHmZQZrLb
	 gx5c1IjvhqxM3DSk5X33hnCaacyCsct0Dprn4OI9OAR3AGZKcFI1vU1mA2Kkem039f
	 J4/inhxCoAVDs6bu+1X3jsuFRNA6Iko32717R72ANjkf3EWQmRDQ9iEj/lYy508INX
	 bNsUxr5qH5rqMy51BZG8tG/CCdm1H03RiIZbP9AMslKFfPqiISSa22VyWmaeS0Y/eo
	 iMlfr6keMmGjA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55a33eecc35so5899717e87.2;
        Tue, 29 Jul 2025 06:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXD6VnPXCZpXNZsj2RqboY96+xF3nLCHYAQ3E2BDgc2uWfvoG9zJt9Gbi6wN+7RGI8JdA88r/5F9Ebh4VP@vger.kernel.org, AJvYcCW03/834xb97I5OSROo6oCKtQNk9QIlTnShNycxHrrkEuT6AeXZjTdn+/ryDBdNlHXFl7pQC/4PKBVTeQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HFxf04p9SuWL/EsT4HJ5WBHUu5oS8lxZcWL22xz8H+sqrb80
	qQ4acRMnCk1dPeSb2Fk4pbqrB63TrgdPo7jMLEhKdJMMFv5dxk21RQMuEVA3c+T6JYcgi+0StbO
	T73jRB09fi44BA8cs8TcbZ8a0nIWtuHY=
X-Google-Smtp-Source: AGHT+IEwSunG1YMGday32yllpM1VGfMg+K9R6KuPv4lYOqip2dD0AuzRB11gez/iBHLrz79Iy/jkmeXYwT3x4TnoidI=
X-Received: by 2002:a05:6512:2393:b0:55a:3358:a7c1 with SMTP id
 2adb3069b0e04-55b5f4c8ad6mr3891519e87.53.1753796502230; Tue, 29 Jul 2025
 06:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:41:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPeS-cHtNGj_cfNypMkpgMYLa_Tc88Ce_3gUTEKqNkBQ@mail.gmail.com>
X-Gm-Features: Ac12FXyjXDzDCvc5P_pSBpHIy9btM9FBBrF_uzyQJ4XI2bBRPEXffRsTgXyT7n0
Message-ID: <CAK7LNATPeS-cHtNGj_cfNypMkpgMYLa_Tc88Ce_3gUTEKqNkBQ@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 1:44=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> strcpy() performs no bounds checking and can lead to buffer overflows if
> the input string exceeds the destination buffer size. This patch replaces
> it with strncpy(), and null terminates the input string.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdial=
og/inputbox.c
> index 3c6e24b20f5b..5e4a131724f2 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *pro=
mpt, int height, int width
>
>         if (!init)
>                 instr[0] =3D '\0';
> -       else
> -               strcpy(instr, init);
> +       else {
> +               strncpy(instr, init, sizeof(dialog_input_result) - 1);
> +               instr[sizeof(dialog_input_result) - 1] =3D '\0';
> +       }


Applied to linux-kbuild. Thanks.



--=20
Best Regards
Masahiro Yamada

