Return-Path: <linux-kbuild+bounces-4180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAD9A4497
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 19:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E1A1F23B76
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 17:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3B8204013;
	Fri, 18 Oct 2024 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py2Kt1nn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C62038DD;
	Fri, 18 Oct 2024 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272506; cv=none; b=iacMJEGIIw4JdLIjdU+FE4QKBzqeKY0HAeOMEjAdTkpoT18pdj0jQM8JkwXbpEca5H5YV1xl1xoaJX9cg7vYHV4cVJxmi2WTz4vBeesx3uzD5/EE3rsRraYQoT2MtDnpxCyb0lE21kHSqpZnaLHQNLvc+8SJzcXsRVKPbESQ/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272506; c=relaxed/simple;
	bh=lNcO2GXHtp1+w4gORkvU+iRjEvNMR4k4wsaCCBOjAv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmBRa5J33SBzlrWfJ6OGR0Nr0s2A31ekvVdtbOrLXCYncJxdF1fwDy4pREIR4k2gv7eOZ1wR+wJXi3sgNY46ZKy7+bwywiFaqamtbXCefnA72UKuHY6YUFbyprg6JcYf41F7SSglLzRfPEiC4hNnOBr4ECf1dHlZLi8ZaFTxinU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py2Kt1nn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D65C4CEC7;
	Fri, 18 Oct 2024 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729272505;
	bh=lNcO2GXHtp1+w4gORkvU+iRjEvNMR4k4wsaCCBOjAv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=py2Kt1nn1Bs3lC2vA5G06Qs6uw2YQGhzHiTFA7HjvKb1cEVSdLCL7uFshYfmBpk+N
	 66pwEeiS9Jg5r9dfF8HQ3B5GDxVXjDBuHy9JQn6J+GMqeX7ej8HQ83MzwI2Wghu/fP
	 7jPzYugbwIbJFEhWKYi6rPWLVQuSf522kBWDiAQsx1SlH1/wSCc9tq/0ABq0GKNeyq
	 9J05X58FxLjVnAvQExKUYQ1UsnokcOrDm0+q2tQMoA5ZqoLvx1TSAd9dksMg5lTNrp
	 U71jQNmibFQFbVu1XVzLYzzyRo16froK8KKWuAOwGI6QLfnr5DXm8AGzNybtd5YbrB
	 HM38Gl2TJcrbQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e690479cso2745280e87.3;
        Fri, 18 Oct 2024 10:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOsC3/ywMNS/EMzpcqiQJlqfvqRj3LTlgy5p4QxfGdSIsdtrlJRnKV4OJpkzzw2/6Adyw7kOFs+lHEt5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbzStVAf7+cmCl7u7+VtXbFbw6vkQglKHUTPe54DYrERwhUZfX
	x6liGW9i8zWqwcMW58hEwq4OE/G8yEsCRLLv0Wyo0dkkISTeMw9pSEaDWOXROA3okt6XwgBIgL0
	6z/Jmx7OXom0V8KWdfG0IqEraIYQ=
X-Google-Smtp-Source: AGHT+IHYervnaWfFm8hLuy2TZjL8Dum6IKvEfvCBluEu8dkZCdBkXF065vZffWhemPesDnraSgLr9g8Q03vk44P87C8=
X-Received: by 2002:a05:6512:3ba5:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53a154f8e24mr2192528e87.40.1729272504541; Fri, 18 Oct 2024
 10:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014091828.23446-2-thorsten.blum@linux.dev>
In-Reply-To: <20241014091828.23446-2-thorsten.blum@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 19 Oct 2024 02:27:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATfEuUeb3GJE1MF470wmBPZXM0ubrx0CjR51gmKethdgw@mail.gmail.com>
Message-ID: <CAK7LNATfEuUeb3GJE1MF470wmBPZXM0ubrx0CjR51gmKethdgw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: nconf: Use TAB to cycle thru dialog buttons
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 6:19=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Add the ability to cycle through dialog buttons with the TAB key.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/kconfig/nconf.gui.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 72b605efe549..aeac9e5b06ee 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -277,6 +277,15 @@ int btn_dialog(WINDOW *main_window, const char *msg,=
 int btn_num, ...)
>                 case KEY_RIGHT:
>                         menu_driver(menu, REQ_RIGHT_ITEM);
>                         break;
> +               case 9: /* TAB */
> +                       if (btn_num > 1) {
> +                               /* cycle through buttons */
> +                               if (item_index(current_item(menu)) =3D=3D=
 btn_num-1)
> +                                       menu_driver(menu, REQ_FIRST_ITEM)=
;
> +                               else
> +                                       menu_driver(menu, REQ_NEXT_ITEM);
> +                       }
> +                       break;
>                 case 10: /* ENTER */
>                 case 27: /* ESCAPE */
>                 case ' ':
> --
> 2.47.0
>


--=20
Best Regards
Masahiro Yamada

