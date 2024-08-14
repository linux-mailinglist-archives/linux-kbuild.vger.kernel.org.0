Return-Path: <linux-kbuild+bounces-2982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C4952153
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B592829DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 17:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368701BBBE4;
	Wed, 14 Aug 2024 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H/tNz8Ht"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430451BC065
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Aug 2024 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656919; cv=none; b=fHc2npgMcvgT7h+Ug3mnSigUden5AhABXr43xOhssYC5juGSoPvJN45LMd0NzisAdumsQ+x4T1rHZ7HDgUexI/Iyw6N/yrR7vuNQjoVZLe2eglGX0CJi4+Cpv2jSJ8MqN5tsmhbn1fMZO5SoYlm6HuHDSqc3J/5+I2LeWG0+7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656919; c=relaxed/simple;
	bh=xWbitBG4Vy57q6SFKYvH/+aIN3UK4pDJiwGhdEeSOtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPBdrN46JJbLUVJvuLN3I+qjkZo81S4b30h7zMjBmMvcY9vDXX2RovxE7PWAi7RGnSXIZZgZ1hguLUfhkSql0i1UVaq9j/gSpWkE5B49rmpFSu/wlwWJFG0/aw8NGKBryJ7xeeCENkSS7PAw3DhIr1074hAvNhYcSsJzwZD+Q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H/tNz8Ht; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so125034e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Aug 2024 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723656915; x=1724261715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWbitBG4Vy57q6SFKYvH/+aIN3UK4pDJiwGhdEeSOtA=;
        b=H/tNz8HtkGiGMKcPN+qSt5RnpqVA9WH2BkwImL0krz6Fua4FH9X/Ppt1QilJ9B4Ql7
         M4b5j91OMzPo9u/ZJdJgBY9XQBnQr5PhsHYl1z29hVnt/hvSGsfiXUxW8uWwIpmeJUb8
         rImxKi1pjrV7IxFX4WW6zW+Sn6XyNFTUitj6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723656915; x=1724261715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWbitBG4Vy57q6SFKYvH/+aIN3UK4pDJiwGhdEeSOtA=;
        b=jQqFikpt8J0w5V0sTC7UDMNUTYBwEsikTsCdBhhGgT/ZGZBQ8bYrzY4P9VvPUmhctR
         Om2oKpkvwnEz6HWpYMpJyJUPHOqBbv40+AVK/imaXd+g9d5/fPf34TrgoDuawxK2tEsk
         VqCeA1VlYeqORv8q7oIc8PS8S5gQ7iT0kLQaAv6wcBo5MyEa3vTAwaxP1ZIh6x8O6tNC
         ZQE/cM6Kh5vTLkh/3rqXA4pwnl9nkGgf5eZq58mMc67jYqnrqTX0ND2E/QUMHJGyiq93
         t/GLWjDKDMT/Y19anVEKDqnqjsOM8vQ/VmBsdiMojrpGkvvYv/8+UCZkmz4Q5cwWk/1S
         ueiw==
X-Forwarded-Encrypted: i=1; AJvYcCXM8MQoo2y0b5m4jRAlHtd75sMA3hp93lNf98dknKtvnGgJre8Dq03U3US1Eop4CKJqUk6lRqqz49vnwj3sc+VqrgNY/tTu9G+t/wgy
X-Gm-Message-State: AOJu0Yx2fp/cnmRM2geT1JbSCK4ZBUSM7Jon60XqEJTxm9i7zTaOePNL
	jucgD/obseOAiD+9w/mIRbTVEDvunu00+FjwB8aA8C5YF+3VN697VM6BGzt5wIIfKy4R46izfmA
	=
X-Google-Smtp-Source: AGHT+IHjjE1203SLpOEy3c0H0zJt/3vNisB+xMPRw/ipP6niIvSDZ70SqDtd4ny5WY9l9nMLtVvi+A==
X-Received: by 2002:a05:6512:104d:b0:52c:8df9:2e6f with SMTP id 2adb3069b0e04-532edba899cmr2675891e87.42.1723656914837;
        Wed, 14 Aug 2024 10:35:14 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3cf0sm1332760e87.40.2024.08.14.10.35.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 10:35:14 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f00ad303aso114774e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Aug 2024 10:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUpzCOVUcsMu3a/RN+QZm6+gHer1+z1NLPH2lWD7hy12A8B+wVLK1NAWCzWay0SARWOx+wAgt2qgSDcX2Ohcb5MH5SJtIe8Onlx2lI
X-Received: by 2002:a05:6512:10c6:b0:52c:dc6f:75a3 with SMTP id
 2adb3069b0e04-532edba89e2mr2666679e87.40.1723656913739; Wed, 14 Aug 2024
 10:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814173021.3726785-1-agordeev@linux.ibm.com>
In-Reply-To: <20240814173021.3726785-1-agordeev@linux.ibm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 14 Aug 2024 10:35:00 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMafY_w5Cm5EWS+dUn59kL3d_h4ZBW9w_Hn=7OZ=5n8kQ@mail.gmail.com>
Message-ID: <CA+ASDXMafY_w5Cm5EWS+dUn59kL3d_h4ZBW9w_Hn=7OZ=5n8kQ@mail.gmail.com>
Subject: Re: [PATCH] tools build: Provide consistent build options for fixdep
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	bpf@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 14, 2024 at 10:30=E2=80=AFAM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> The fixdep binary is being compiled and linked in one step since commit
> ea974028a049 ("tools build: Avoid circular .fixdep-in.o.cmd issues").
> While the host linker flags are passed to the compiler the host compiler
> flags are missed.
>
> That might lead to failures as result of the compiler vs linker flags
> inconsistency. For example, during RPM package build redhat-hardened-ld
> script is provided to gcc, while redhat-hardened-cc1 script is missed.
> That leads to an error on s390:
>
> /usr/bin/ld: /tmp/ccUT8Rdm.o: `stderr@@GLIBC_2.2' non-PLT reloc for
> symbol defined in shared library and accessed from executable (rebuild
> file with -fPIC ?)
>
> Provide both KBUILD_HOSTCFLAGS and KBUILD_HOSTLDFLAGS to avoid that.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

FWIW, I already fielded some reports about this, and proposed a very
similar (but not identical) fix:

https://lore.kernel.org/lkml/20240814030436.2022155-1-briannorris@chromium.=
org/

Frankly, I wasn't sure about HOSTxxFLAGS vs KBUILD_HOSTxxFLAGS -- and
that's the difference between yours and mine. If yours works, that
looks like the cleaner solution. So:

Reviewed-by: Brian Norris <briannorris@chromium.org>

Either way, it might be good to also include some of these tags if
this is committed:

Closes: https://lore.kernel.org/lkml/99ae0d34-ed76-4ca0-a9fd-c337da33c9f9@l=
eemhuis.info/
Fixes: ea974028a049 ("tools build: Avoid circular .fixdep-in.o.cmd issues")

Brian

