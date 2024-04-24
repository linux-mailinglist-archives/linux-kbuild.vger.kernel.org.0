Return-Path: <linux-kbuild+bounces-1684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D678C8B0925
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 14:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B1031F24FE7
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Apr 2024 12:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879F315A4BA;
	Wed, 24 Apr 2024 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D62bcCll"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897215AD9E;
	Wed, 24 Apr 2024 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961280; cv=none; b=E9dPpQNtFkbM3/GGtPVj7+pYu2uy3lhMxEE99Hhy04XoOv+JRXYTK59mikVr1YRdjvYoZJ0J6hDjHz3QzeGV59kfvT+tiRtc3Q6Li7VtoijUnikmG+Iwcn7BsT6UX1VXl11pI+LopGgX+Y7nYGUvWom4HESQrlzENzLRTkwt3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961280; c=relaxed/simple;
	bh=H9wIkxnLqjNz5ECWiZBiIgvbopdzcGJBXEACYg6ItOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlm/TwgXFdCB6DKWPljnSd1PqUhh/AaPhvwwNthYPHFxJYUSZhMxFLwLRjzR39N0/bYQnMr+pE69oT/s5xqo5lotmhWW5tGcPC9jotvH8mLCq9O4/+BNetzVOT7ZufHYLooVW0Qwqy1g8o+j5UVB+C/1WpEYISdJn5gNKHiRCDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D62bcCll; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2adce8f7814so2800138a91.0;
        Wed, 24 Apr 2024 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713961278; x=1714566078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bunj5XIiZEdgRNTi0guP+wyf7iojN98jqRolArsaLoM=;
        b=D62bcClljDwDT6whoeeuepUs4DT8Eea0G2qD0IZ8eqLdTju2K0NfyTX2uB7spxXFf6
         cqg7+Y3numblLQZbkvSDwqrnBrUSETWnypCO1B2oqQtEECSgoPOa7FmEHozekpI68idn
         mBdX5P1lAwrFzq0OQUJFts6/l0yRHilGKfqVc6E7XmxedM5Qnexv7sTwiiQuK2YQbOpI
         w0U2UrcN8CBD6yzqMNILHzGBv4v8uYkZjthe/hVnFfJOWwkNsviyjWhupl/Ga8onRlXU
         TgP61OfPS+uJbCScpcxLbNIHV9VydCOyxV0LX2SFZrZwM3kqKRgKqDSdxn2qHPQBQ13v
         6dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713961278; x=1714566078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bunj5XIiZEdgRNTi0guP+wyf7iojN98jqRolArsaLoM=;
        b=AIeF1fJpb19eb2ZZ4TeZCDakqkvwCGf6GLyAomTLmLnizeQpPi2BOyAkCjt9Nvf46d
         VHSQCWqc3ZLCw32GASnUSHDLQ+SJYIuC2X4/ntwdj3RiXwE7+I+/vw0S4Xb4Ow+H2o2B
         eb/cBuIUUWWZlkCzovlFw4bqr0QVhwNux7E2SeeDpIFu5sT3uyJetRc/zcQfx4DpUIs6
         OwOEr7gdvikSO0AK+I2DMCMl8O7PaNAglj4SV/tJzUchJZnL2o1f90B91v7tv7sETOt8
         8/Jyz5MQsAR+1oNuozK6TmFjgRIIlJiEYNfKKxm+BrZmcrHCo6b7K7EAsSPO3MIoGPGw
         tg9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwgEbNnWMlv5lGx+Rc2R6WfiTjNuciCTAkq0uCN06KTPUtbvEs1UsQoq4ZPWQ09BivpxloQojvXy0D3dIRn0SQV190EqC6AD/hpYgjP7IJv6nRsvY4z9uYo34UYlugFyavuAnfMgroiMB+ug==
X-Gm-Message-State: AOJu0YyRhbgrngZOd32J0owY8PNsuwuSWo5WzmomtWqvKIPDat+IqE0q
	9sO7ZxU/IcjDBRSnPJDiTratZf6plX/sQPcfsg/TVYXV2M2uBbLSdJJIMtYW9KkyDnBvd9CIIda
	WRih05f3uglDnJiYk30LwWTOIVtk=
X-Google-Smtp-Source: AGHT+IGETP+1lVi26Ns4UGyWygBlMb5M8kF1qGR/jCcvzQIASLeqnOBJjDQv+2u0GvL5nvwmYlOH4XoyTdsIPgVGb48=
X-Received: by 2002:a17:90a:9a87:b0:2ae:8f3f:9bf2 with SMTP id
 e7-20020a17090a9a8700b002ae8f3f9bf2mr2063814pjp.42.1713961278417; Wed, 24 Apr
 2024 05:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org> <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-9-4bdb277a85a1@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 24 Apr 2024 13:21:07 +0100
Message-ID: <CACu1E7FjcBHHZerZjRBd7=WiLDu40-d6-4jKPcKmbY244w4Zww@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] drm/msm: import A6xx XML display registers database
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 3:52=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Import Adreno registers database for A6xx from the Mesa, commit
> 639488f924d9 ("freedreno/registers: limit the rules schema").
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     | 4970 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  228 +
>  2 files changed, 5198 insertions(+)
>

FYI, this will conflict with a series I will send out soon based on
the register updates in [1]. Is there any chance to update this before
it lands in msm-next?

Best regards,

Connor

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28883.

