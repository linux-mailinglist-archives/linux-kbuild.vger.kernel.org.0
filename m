Return-Path: <linux-kbuild+bounces-3438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AF96F77C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AEF11F2349C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE341D1F7B;
	Fri,  6 Sep 2024 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fyTRKZDd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB81D1F51
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634470; cv=none; b=UIfl/5XHIm2P3skl8H7jGxZdIAHABXITZ8PB+TnprngSfXbzqcMsJ662WLBocxt8IfeqSpdVQWq1K+dR/264JU/PVCU0IiJU5Ok57S/Qz75Gug9rX2ZAoAFUVRxQ7I8FR62rvaows5oM3ILKyuW+8gWPG/GwdOrTl1XWGe2Fv64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634470; c=relaxed/simple;
	bh=ClKhqxGbstKanb0/jRi/QInpRewdF+k/fJjdYaHj2XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDCcnGQCcxIWvIN22LRNMOAssvqq4OeXUntRgH5wAEkuapvevUsUnT0NstAFm1QqDE3qqvUTiXIJNfDuGqBvG8n95GC5232HuYZrNMxPu2Aus6Ucdj4vhGiOCJW9gjcDSkOcwI071X1xOESYmVM1FmhuhP4SkbN/K8apQD6O7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fyTRKZDd; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-502b408a381so156054e0c.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725634468; x=1726239268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
        b=fyTRKZDdogcCghBgrr3L2QcVm2pjXXgMB/bFbo5J+e75W8IXYV4QQYssaNn78zCVe2
         wk5YDbQMQBfTgCHGDr9bVtJMobBYAyVrw0yOOzD7TzeVcylOspfYGxnYZPudGxraDKkG
         MWvorXgrGeY+OFGVsfHeyvNGQQyCwoKvL07m5SgJDlSG1z12bU/77Qq4Idyj1n0H/kj4
         hacGZ4R2R6PvnqGRDiJCq2/ozRFXeZoSD/SR3In+6deyYpln/B6YPqwF9fBG/84AOsDI
         aHwC5Voca+x6s/0pI5Q1y9DiJuvRH3X/cI78g7gGdnWOIkuyRy3rbXuUNlrtrL4qq6ga
         VV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634468; x=1726239268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
        b=f7/yMRI95gfY/jFmBO5M4I9TM56mWImPDSw2GFs6lrVdDrxuLOUszoE4zdkFKFrguW
         BZy6J1seuC1i77u3jn2d1z5kzs2IxOlJJODkAJm09m/xJiwSFHx9lgNRkiTeK8NE1o79
         H54LOCamzfqaTyMNk3hLQgHWkMSjw22xOLtH9KLnHaMWp5HzOh7o/fjQkfJ3JKUDir2o
         /ntVrb59lI3d00khI33QumemhUfW7PVVsioRMSiKjHo9AdvXCRso94AuPEdTUzzK12L9
         NkMi5vY9i2HwFzNiWVQLNU2is+YIycH1PnzhdrRKOAMeuNkdRcTad409uEzVF6sHjH4h
         CfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlm034cD7CVHLfd2AQ37S3/w4hdmz/IPrA/fNtUy8cNS6jpC/s64tBFrXLCnm0gBsIOGWZFjwsmDXMOgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWS4vdLiLmVCh5FhLMyVEAmrUbG0WNMy5jwuWHpdrE8PqudHwI
	6Bgr/9zknKFWLaxDG0YhvN4yZCUvq1YbibUdPu6lu415KE+Tg4mhRRas4FnHkqrXspRpa8j49qZ
	qnOWiFTevIQcoCyzjvbR7bRSljX2pXB5biUaX
X-Google-Smtp-Source: AGHT+IE2ETqS8j5INGhOJuEC0LfB5JoY7mno+WUbnlfQDVox+nEHO2zDE8qlvEGgTlm1b5qEJlJi4b2dA1AvozrG+1Y=
X-Received: by 2002:a05:6122:318d:b0:4f6:c44b:2504 with SMTP id
 71dfb90a1353d-502143c9c06mr2840417e0c.10.1725634467954; Fri, 06 Sep 2024
 07:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com> <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 10:54:16 -0400
Message-ID: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	speakup@linux-speakup.org, selinux@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
>
> This tool is only used in security/selinux/Makefile.
>
> There is no reason to keep it under scripts/.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/remove-stale-files                                    | 3 +++
>  scripts/selinux/Makefile                                      | 2 +-
>  scripts/selinux/genheaders/.gitignore                         | 2 --
>  scripts/selinux/genheaders/Makefile                           | 3 ---
>  security/selinux/.gitignore                                   | 1 +
>  security/selinux/Makefile                                     | 7 +++++-=
-
>  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
>  7 files changed, 10 insertions(+), 8 deletions(-)

Did you read my comments on your previous posting of this patch?  Here
is a lore link in case you missed it or it was swallowed by your
inbox:

https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moore=
.com

Unless there is an serious need for this relocation, and I don't see
one explicitly documented either in this patchset or the previous, I
don't want to see this patch go upstream.

--=20
paul-moore.com

