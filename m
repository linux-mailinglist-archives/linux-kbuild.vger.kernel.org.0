Return-Path: <linux-kbuild+bounces-1069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83790866A1C
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 07:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5BAA1C216C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 06:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1528E8;
	Mon, 26 Feb 2024 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsA8g8FJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAA1BDCB;
	Mon, 26 Feb 2024 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708929214; cv=none; b=RVD6DuZ5kBCtOsTLuxD/yjW0/Gk87bpTEH6w4WOAa8rV304TbId7hE/3ruSsrbMJuT75o+Y/RhobuW9Tl82LgXvnkCRzDMFLKwIyBWins16JNiOE7MfAlobJtSb6QCOtk5yPF/vlhHXX4PY8JSehYDGE/I7l14x8F9Fuu49tYI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708929214; c=relaxed/simple;
	bh=0PRiyAQ+62sbJy+0qQ7BQF16ArN4W4vGLDTXw3kZPzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXMb4RMIh7JsYRH+VPgzFSYB/vVGcA+3dL9hlkF6VCaDKY7U8OgmcLcIUEseObfHEPy2HuUPprThsNu6MiFQtZy6qlLN568SR2S7NZH5OzJgvTmeXasR4CibMxWshGViubBabkYiq2I/qHhJMiDUA2HfxjnVhHHyqQMR+wwpJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsA8g8FJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5EBC43394;
	Mon, 26 Feb 2024 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708929213;
	bh=0PRiyAQ+62sbJy+0qQ7BQF16ArN4W4vGLDTXw3kZPzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CsA8g8FJiS9pkYyEduJdESrsWf4bU9aUVWWlsqwbVIFNdeVe0gjZJZte5cncr36ud
	 yVgn9+nGImzMKTauytlPZOL2SYDKHHGI1/wgZoqqZBgMNPoSzW1w7XBfsGf+mi5bl8
	 ulSZTIJFd6aqiWB4bKu6uWMqUo9Zb4hy2KHynemnHXm357R148hi25fwdkFEWPQy0R
	 IJk89RDAdxnMk16qYULL9qs6l3rmvrBsiHZKOfnAaR6sWdFNVs2F2nmDN8Fb1NvjYj
	 riOXOfRk4NzdjokbrSXRBOuW2Rba3VeGnV1OfMAFshQ1VKz0Oxbc6yRuJ8dsFFyiSU
	 x8Q3SCH6RLH5w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so47804151fa.0;
        Sun, 25 Feb 2024 22:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8FK9LvFf+FLLkgduSsv56aWGpHijwWY2fu33eT57Rkbkbz6LUZ5bC1GrTTmUmCVXn3OES+8C6wed5QUW6YTI44jIWbWgoKrxeEFQvywU3b/+gNftGFHZG7etp9Dl/uQfqZZhqMybxkGuoIw==
X-Gm-Message-State: AOJu0Yy3pMY9m76oX/DeoibWrz0je52xiD9mmzVkVwPokljvSsMEYysV
	rUv3lPdZ75TMlo6O/JZbHtbVem2L8DhX/VxfnGsHpRT7zcxajXxeBdap5/7UmkDTkMkfVcG0FhK
	3NTM2eagwG74ovrjDZhRy0mi9JgQ=
X-Google-Smtp-Source: AGHT+IHH497zRgqK39ucxBVT/PHQKHXsqK3Ktehcf6rDW3mGiZ8oyUIdR85+8eKH1h04dQVzsKJcPbGAwT1mRZAPo+U=
X-Received: by 2002:a2e:a692:0:b0:2d2:43f4:45b5 with SMTP id
 q18-20020a2ea692000000b002d243f445b5mr2730110lje.52.1708929212255; Sun, 25
 Feb 2024 22:33:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org> <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 Feb 2024 15:32:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
Message-ID: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The driver might decide to put the _shipped files to the subdir.



Please stop this sentence.

This sounds like we are not learning.

https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8ok+7=
-CQUN=3DfQ@mail.gmail.com/




> In such
> case the cmd_copy might fail because the destination directory is not
> present. Call mkdir -p to make sure that the destination directory is
> present.


There is no justification for this.

If you need a single generated directory
(drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whatever)
that should be super simple.

Why does scripts/Makefile.lib need the modification?









>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cd5b181060f1..94373eeac420 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -297,7 +297,7 @@ endef
>  # the copy would be read-only as well, leading to an error when executin=
g the
>  # rule next time. Use 'cat' instead in order to generate a writable file=
.
>  quiet_cmd_copy =3D COPY    $@
> -      cmd_copy =3D cat $< > $@
> +      cmd_copy =3D mkdir -p $(shell dirname $@) && cat $< > $@
>
>  $(obj)/%: $(src)/%_shipped
>         $(call cmd,copy)
>
> --
> 2.39.2
>


--
Best Regards

Masahiro Yamada

