Return-Path: <linux-kbuild+bounces-1686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F638B0A11
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 14:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BFF0B26C6C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1615A4B0;
	Wed, 24 Apr 2024 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6GKHJtq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C1315959E
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2024 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713963111; cv=none; b=XSyXMWZgzt3UrDs2EiaYjjHdoAVRWLxBXKKXG+F2d8M6vsJ5GcSGq+vPPIJVOZAa/a1malSdva3KYr1+n9Rvg1RyRAJkLupSknDVQk3WUDi8LswLxP8d9LqUVR1b/6jyeKsgLArFxB7xIf0mF0if9J+TtVDPE0G9is6/EfEbuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713963111; c=relaxed/simple;
	bh=uf8KdRTFjaykwcHvBAXxOh8kxKdvQ5fIlhceg0rMfEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTxs99EgUJBNWr72QPDoog9bo3hvR0w2knqKWZdj3SUAzpUvfUA4NypZGPq5c2iHrwoGZ3fMPZrAIUYcOfIEiYyqZAbQW//S6FsoJvCf6M66o3fg8Ua92qvfGx0jvKFt6ifRQtnEdOSieA3v75n1l5/H9rA0iNt2km+HC3nXf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6GKHJtq; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61587aa9f4cso74946967b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Apr 2024 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713963109; x=1714567909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
        b=v6GKHJtqAV6p0+P1TmXzhwYfUOgx6LxWIkaeJ7e9PzAKSXW1vekpuhgLzjqHofyrWh
         rBKiUyly4J2J0GggPUamMpAM0Q2g3DnhUAFCaMuI3930Pmx6WYgWrL4ji1pcltkCnm2J
         IyCWZEBnD4TXdTPakRdBlN6ub2iZd69o9dWH5qkZiceNWuvvs+g8a38XY5iniN2ovnY+
         FJXWjj49TdNHouyOBlzqup6Ic/vOCK5t1GMcDLWktG3+lM1nq0HJ5yG4FlwONQyRcYzh
         BgXFSn/AxVPXkEO/jzHxq2pLFw+503tzc8JWkg384NgsZgxbz611jH/iPrUVEewdinSb
         Ypag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963109; x=1714567909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHUte1eLVQkq8WvW65i5PTx6wzp6ysbfkPKQwSAJqfU=;
        b=EwNbkWOKM+ctaBEPUffrw2pV45wr2DEBEx8M2A0utAkGJJodEnjz8KTmK/JaQxe8nv
         vraZUOeCYapkL0xGh6ekMMJfp4JYEmvIBAX9ObcI4dJ8wPamrVw2zZ7tS6+GlEzJ83/y
         uS3dgztf0g+lYPDKWvGnO0n5AtEl85dD5l1Hc7zz2Pfd6EW+jndtpL08rIFQtyhcrWsI
         tfgGbp7sF6hN4unsybbA+vawcvOvOLCaZ3mZX39i1nmtbeSMp6bsbBq2zy5tWSw24FzH
         fI+RWI5B6HrKprC8niais4VV02Pmnxohe/YVSdp4ZH7T41ecm4Jln2tpkuX+vJeX+Arv
         jrQA==
X-Forwarded-Encrypted: i=1; AJvYcCWSLZZ9wsLKY090sHDzfrkkSWbqridZZZxOA6YbvnKZfKPkT7paErdbOSDe0j4/ZFEH7vLG4/ZbcseRpcmYIE5Psfc4O3R2lE3rV+Kr
X-Gm-Message-State: AOJu0Yw+6laPTuF+DkYg37p2LEkAGYhvhk0h7zINQD3y9/xhnefF3kPY
	SJhXqzLyZfcDDZztzQMle4SYevKs4e6vMUWfNVeu4tk5kWIFpOErm103tvL0DooEKJP8tC2OqWS
	frZbv8Th4JJRF0kzfvchvQkPwHloMOmCrh0gYef7ZTdyI4c3D
X-Google-Smtp-Source: AGHT+IEtNwcLByaURm4S0W2WX61nHBOa/bBuBHOAAc6U0o1qOXu8yZcg3XBDxOP5Yl1UNJOhL+Nqv3uIUQoTgcemjRI=
X-Received: by 2002:a5b:a87:0:b0:dcc:f0a:e495 with SMTP id h7-20020a5b0a87000000b00dcc0f0ae495mr2062785ybq.3.1713963108899;
 Wed, 24 Apr 2024 05:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org> <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
In-Reply-To: <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 15:51:37 +0300
Message-ID: <CAA8EJpo=BP5wrFoXHZhAgc8MKf=pV5B8Psp=NrSCr=5mVh1bAA@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] drm/msm: import A6xx XML display registers database
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 at 15:21, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On Mon, Apr 1, 2024 at 3:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Import Adreno registers database for A6xx from the Mesa, commit
> > 639488f924d9 ("freedreno/registers: limit the rules schema").
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
> >  2 files changed, 5198 insertions(+)
> >
>
> FYI, this will conflict with a series I will send out soon based on
> the register updates in [1]. Is there any chance to update this before
> it lands in msm-next?

I'd suggest updating the XML file as a part of your series. I've
already opened a MR for the display changes to be picked up by Rob.

> Best regards,
>
> Connor
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28883.



--=20
With best wishes
Dmitry

