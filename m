Return-Path: <linux-kbuild+bounces-5040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D33BE9E88C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 01:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9E31884119
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 00:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA0DDD3;
	Mon,  9 Dec 2024 00:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzIJGSeV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2CAD2C;
	Mon,  9 Dec 2024 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733705854; cv=none; b=IjB2/H66Ks62g5BQCDscoRJi83wJHVBNYui0RuquZR0NTVNnOJQoDw4dX3Uq2vOtksL9rtTPOgxGsRKKczE4TmH5D81I3ADbc3eDzsbS2OePeSpR1FI9ayVPfTJlh2U+6t4x69USmo1OEyb5o5VHAShJgZgWEHXTxdHPEMn3GOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733705854; c=relaxed/simple;
	bh=Lhgk8+MWcm2XR10Ngkxy57xRqCXLabyz0bYbEy22xm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lg/B8mwq0DqSp3bRtG4ksLyB0M/W4o6KAAXcYPuLzzXRAmNWhYyT4sqTZRcO9YY+o3sH5O88xAAb0WC+FvPu4k3iwzVpDGVixfDARBlvnWjJPFz5OqNH5Ycv1Ij3Pwq7ncyUeKrBBlSdemnTrhBnhrvhdCyg9J9m0vMXc9gSprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzIJGSeV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa67f31a858so103144666b.2;
        Sun, 08 Dec 2024 16:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733705851; x=1734310651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhgk8+MWcm2XR10Ngkxy57xRqCXLabyz0bYbEy22xm4=;
        b=DzIJGSeVRmCilXlDAlick0lZKuLZ/9RilupOBEuq7kzZQhxAumUvR6TlAdeYrboynu
         INgxL+GqKxHqnVXt2JJWRLMhXQ598l1PBk1aH1KlsP2OoXlvy55TjI/e9KNLs6JxE01+
         in73XbTbViRxGLAIU5UZwnATJ86sFMROaZph9jPzLYE0rs4j/3aDWX3oieIU6WrefBZM
         GCpR9IKdS5S9GEkQ/wrKFMbDYVPbPbSyRuD+sID/UeFKKCAjPaklJUr9yQYqJqABb7+N
         eMUDaK83HukVnYfspF5NNl2y96UtNG3Y7z0j4ZZNa0bhTeHr/kT+O5hlvLRtFRp3JDP5
         2wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733705851; x=1734310651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lhgk8+MWcm2XR10Ngkxy57xRqCXLabyz0bYbEy22xm4=;
        b=FNELR4Du4v6wdFKWJtHzFmUrn7T5x3alfKKrUi2rHlMGjJnrO4f1dIIZEIy4X7ntw3
         5rcHvMXpBifh8gWRAZwSHfEycdlm9ev0yZMUhUm2NmzKqzfrD6JGpPuO/jt7BiLgJzr6
         yYxbSFGTfTsahmSKj4iVuSHk0p9FChNM5aDPhWUWxm6zEKRp4SncRgVVYOl+imLx1/WR
         6hicEiiDfuRsIoAKR8V3zh6ncysSVvPAb8peluXXjVrUNhuZ6Y+xlyPJW9ChXfg2f5s0
         v9kD7bjK2/yEEiOmQGRx02AX5ex4rBvTJitPddmgilCdWRIx6JS7zfSs3EosQnwXLT2Z
         ANdg==
X-Forwarded-Encrypted: i=1; AJvYcCUw1fuLJMx64WsPE9A4QbAs5Y2YIaaNq6wfAXa8NMzfWCY2DTbGDXbhoQ7LtDN97D2i8HiCtAkMuY0kxh4=@vger.kernel.org, AJvYcCVDB6txp6NIgJWM4ILYmdAdbHPHAnVdrQDxokMob22FBSehBInWCKPodQ0/gghK4hhrOjC7ky8GJ/sVqeeo@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYniYBoPD5EaF2tfqhvrKDUbNUX1hk+UrKKNDy4U6XVlBw7Vc
	j0CU1FGz0kaopSEEz2RCJiFcqieC03DA2+SFsr2p6SLaFvSWyaZz
X-Gm-Gg: ASbGncumX/lgszozNGquhmfLdcwz/KcSJwet4f8ZOKJ+nqujzHAKddwL3g/UrQ67Yiv
	qjFlLWgexJRNB8QU0x0VNqt1mVZjlgiAYAvDphQN7YlAAjlHdY8yNhK4HT0ktRPoJ6G/Y3O7GEc
	eq2cdWgjY95+q9EZ5q2smdYkVQORO90mUGmO4QHpFEj4u8xzyTgFihbNBILxE6IaIeNhdYk8y8W
	iwh22ecFFyFD1gnqExpXk1KMPiqDUFuls02DI/i53ija1qf3CUPrqz+igDG49qdW2M=
X-Google-Smtp-Source: AGHT+IEUc8abCwFPTxC5loAjIqdJRg/b3bbbrnVWEaSSxPCr6uGYfTsO1vp2ZrVjPG3tBWYDpWr1rw==
X-Received: by 2002:a17:907:9554:b0:aa6:8160:8495 with SMTP id a640c23a62f3a-aa6816089admr275962166b.42.1733705850844;
        Sun, 08 Dec 2024 16:57:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:64ca:fb51:d773:c8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6883f65c3sm67779866b.157.2024.12.08.16.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 16:57:30 -0800 (PST)
From: Ole Schuerks <ole0811sch@gmail.com>
To: mcgrof@kernel.org
Cc: deltaone@debian.org,
	jan.sollmann@rub.de,
	jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ole0811sch@gmail.com,
	thorsten.berger@rub.de
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Date: Mon,  9 Dec 2024 01:57:13 +0100
Message-Id: <20241209005713.52352-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <Z1DgqAb2wnlDjnLR@bombadil.infradead.org>
References: <Z1DgqAb2wnlDjnLR@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for all the feedback.=0D
=0D
> This just deals with the first error and there is no unwinding, is that O=
K?=0D
=0D
This should be OK. dlsym() only retrieves the address of a symbol from an=0D
already loaded object. The calls to dlsym() thus should not need to be=0D
unwound, it's sufficient to unload the object via dlclose().=0D
=0D
> Other than that, did you run this through checkpatch.pl?=0D
=0D
I ran all patches through checkpath.pl. The only reported issues with this=
=0D
patch are the ones related to the use of the X-macro and one about the=0D
typedef for the PicoSAT type. Is the use of X-macros discouraged?=0D
Refactoring it wouldn't be a problem. (I think it makes most sense to keep=
=0D
the typedef, though, in order to keep the declarations compatible with=0D
those from the original header file.)=0D
=0D
Best regards,=0D
Ole Schuerks=0D

