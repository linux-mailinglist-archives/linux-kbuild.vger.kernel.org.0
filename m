Return-Path: <linux-kbuild+bounces-3931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE18991FFA
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 19:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFDE81F21664
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D296188721;
	Sun,  6 Oct 2024 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J480MbBj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1F13A3ED;
	Sun,  6 Oct 2024 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236088; cv=none; b=dHkpx9F+h9dQjahOE58LSpMYJo1NUZCX0FEP4Snf3AJB41Y/6rxFiukuUVfbSvMkb1PGm9ls0WrC8sv5O7HGjKFBSmBXxuk94TcsSIZmFnL7qrIu0z/n6tj3Bcoff+BHSKfurc6fJobzwCTQ5Q5kSbp6R5LlTb+O7oYQLuGg0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236088; c=relaxed/simple;
	bh=PGUd8cKsxuUWECeWxoh99/UCrQ9TF9GaW5lv7JRiw1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdQoCul1T9lJUSXpENUKAuBZceuDkycospxTtxxp71CNR9rvCMJjYc0ZHSu1vDQIW4Zm6pGL5rV0DjFFrkNbs4PafkkFBBpBwzf70JhtIh4/4pNRAZJ9fEsQhd2j7tI2v158ovpPkfRdd/PCJwjgR+q/4lZCOeuiS6BDNhUygvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J480MbBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F126CC4CECD;
	Sun,  6 Oct 2024 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728236088;
	bh=PGUd8cKsxuUWECeWxoh99/UCrQ9TF9GaW5lv7JRiw1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J480MbBjhVUTk/P4vqkDvHCTiOubp1bKGJYKOwjwX72rSRczL5nrZJhx444R49VaU
	 7zbwNndpAKjtrzffOLZV6F1MNSzjmw5Wxx6TM4XdMLRQ3vnTL96wi1wFX/+1SZv3ER
	 imCcIq0hztCmrZ131el673j8KxSbCHbDrDlgPGgKHoyQg0udKuFmjhCvJz9Xsn/lYo
	 wmcX9HqGikXE2y5u8OF13yfzLJaE8ZHca23MC7Tfv1JYCtGDZGWs0Lc8yNgqXD18cN
	 GLzCJ0oo/SY7i9RwBLGPUMaWlw50Gjd7YUOf5rxsg8g0SnwIqLA6a03E09MiuUf3Gz
	 B/z9y6bstaFBw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so4792108e87.0;
        Sun, 06 Oct 2024 10:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW2AnG2prJvAU83+LWaKupwZ4icep/k229nSw2J7XrUKyzByVGskohamceq017mnUBC/2XQf6dgeEx@vger.kernel.org, AJvYcCUjQ6gIaE7zStC5cEE0WrUcFtdgnyT1qUj2EyhXles7Ujb/OV9PtDXo/BmSJKJB36M9/J80+Jx2IPXnrGAB@vger.kernel.org, AJvYcCXKcBnjM0cREy78B3hWKmUQupakJ7HctRgXAoYMuMaDursdU+E+QhPL7mZbNqDNrCFW8OILQa0L4toOSFnn@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzKPnFSyoWxL37fnbnMwVKnD/ZH3YBa8O4J+PhHrstuztD6rL
	z1ZioxZa4kDC/vFh+5jvkqbbP2vwyZjiTM/MDa272+m8zPMkDhn8sBR7KF0tjvZIaAr+145bBqA
	ptZCat8j04YFSNhgVYEuQg7b1vkA=
X-Google-Smtp-Source: AGHT+IHM6IrouUIKVFd1yHOeng/VAl/xZqQqdpvGXpl/Q+/O75CQ8MvW/VWtj05/gkK7JydexnP1ZshLEC8/30mfFkQ=
X-Received: by 2002:a05:6512:110e:b0:539:8f02:f55e with SMTP id
 2adb3069b0e04-539ab873373mr4342825e87.33.1728236086679; Sun, 06 Oct 2024
 10:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925053230.45606-1-xu.yang_2@nxp.com>
In-Reply-To: <20240925053230.45606-1-xu.yang_2@nxp.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Oct 2024 02:34:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPe-R5xkXRWBPW7aMpsQzc4BCyKLJmJ==aKy+_JDKkUg@mail.gmail.com>
Message-ID: <CAK7LNARPe-R5xkXRWBPW7aMpsQzc4BCyKLJmJ==aKy+_JDKkUg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix a typo dt_binding_schema -> dt_binding_schemas
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, devicetree@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 2:31=E2=80=AFPM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> If we follow "make help" to "make dt_binding_schema", we will see
> below error:
>
> $ make dt_binding_schema
> make[1]: *** No rule to make target 'dt_binding_schema'.  Stop.
> make: *** [Makefile:224: __sub-make] Error 2
>
> It should be a typo. So this will fix it.
>
> Fixes: 604a57ba9781 ("dt-bindings: kbuild: Add separate target/dependency=
 for processed-schema.json")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>


Applied to linux-kbuild. Thanks.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 265dd990a9b6..7aa71c70305e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1645,7 +1645,7 @@ help:
>                 echo '* dtbs               - Build device tree blobs for =
enabled boards'; \
>                 echo '  dtbs_install       - Install dtbs to $(INSTALL_DT=
BS_PATH)'; \
>                 echo '  dt_binding_check   - Validate device tree binding=
 documents and examples'; \
> -               echo '  dt_binding_schema  - Build processed device tree =
binding schemas'; \
> +               echo '  dt_binding_schemas - Build processed device tree =
binding schemas'; \
>                 echo '  dtbs_check         - Validate device tree source =
files';\
>                 echo '')
>
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

