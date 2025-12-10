Return-Path: <linux-kbuild+bounces-10040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D113ACB1A5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 02:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EAB23017D90
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 01:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABB4248F68;
	Wed, 10 Dec 2025 01:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1+j0f3m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53219E7F7
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2025 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331193; cv=none; b=Pz8V3u7DdajSMnl64hNw4/oFzCyzYYc7CAKplzGqFzUa1COoUD/1c05rBGm2Hf6Ne/SAsdzIVj1C4wYa/3r4T7Yei5IEHbc1APx5Ecxn0cYcwusdD7BtPekXRE5A37omQPpmz/SizPHhOayu3iGXCIgpkB0eqmJMvEDHYQzDc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331193; c=relaxed/simple;
	bh=+/APqOnN84rXLQeXUydTcFlZtrcqSjMaTX9Y+xK4YE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFGzMpgHGuhhZRXGJ5gzVwZ9M+r51p4Rs+u6CqNAbOGFbs2TrR5btBFEwoQ8Vc2LPHSrfGhbEUXKWV6ThSkT5NEiV/az5P2do25CvzUrRJGjr/CHO/7HEbjbZ0PVncrx2txyvVmUFdcqBtNtaVQjm+1zddH+TYs9mms1wKTbsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1+j0f3m; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78a76afeff6so71023207b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Dec 2025 17:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765331191; x=1765935991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=Q1+j0f3maF1qb+xbAVAgf08HIzVqoNZ+gYsJisxuwZjzCjCQrWNm2bsyTlUGDVTrlU
         H3DlAMc1nz0lz6ZNOdbVaZtbWKgl9QAC+qHFb6RgTp3lLh3FeLGySXuqlhTYm8ViwXiv
         oG95yPYo3iFLN9uPaqszxFGzM7TwyIWIM7dbpNnw7lvTa+7c6H2fv8FpMZ+AAt+fBFur
         lZjOXs0A4Vyx00OW0GyZW0jtm+3py4qNc6FCDYgXkuOBC6e2i4Wz/5mmGQHYtvkhSH+c
         ITywSjmYknJBJxgnLFddHCy7wql+XEb7ikQMcUMchCJ6MAd4bxAhDGoN7NgK57a5ilIE
         4oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331191; x=1765935991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFP+SwCgoD6NbY96JnNDOX6vBcbdvYJju9zn+wNt47g=;
        b=T0pbaV+tHAOWTbpI1OUuKC5NNz+PZEaqV4OkV/G+cNnumQpQpa8B7vwb2QLZpVa+d0
         3BeU2Sl0/UT02TWCBY/qkRQIw3yDRUHKAupOpa/ZsLN/im0cLwxP7E6Vgc1qWvKcbUXD
         3JIrlmRFlzqJr4kVZH1ulrpmy5G7yxdoWQQI+0pi+4CJrTgFKMplfGKvpuCXhz1yfTrm
         EDcfzHRjRBlfG1GwWuZXCG6EMxgc7Kx8EydmuCrPRzmHRtjE6dWHTG5G//fq3HGMf36a
         LuPZ7Zl5ZgQ8iBvH/S9J0RzPF63J6w0Q6bvf3JvrCGG4ikBxlhPnYPmOsAZtBdXkgfvQ
         fH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8SdgCL6KY0wZHIQ+qltVe9n5pKADow77me6VVt0EliQ/mwip2Vk2lMmB+DZaNjSJjZK8YP15J8sNWwJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAVykXHAat4SAb7huPYpFjbLcrfcEdAdBWmuVfznYwJWoXIT9
	bqGRMdNjQt6Ov+MP/3dLvIOmJ1jr9ORCi6ry4s6rm9jzCZU+kGuX3/eqjqBBY10JIkfFpUbk3+2
	T3Pu5q9GP1IgMKxYPgRSXv1S0SVSJw+g=
X-Gm-Gg: AY/fxX41ybW1SqJtGlA7q32Y9n97cVqNVDzeXAAECbzxCG9v1dUC1Yd16o4fPNHwrmI
	T4w6WRwILMDBE2Kgc7RxNJ1yANum2ymBh2+kiqFbyL2SbBPQtYFwiSQ9xfBhdHNHTzdSFKp4TJb
	U51L5L2Uy/g6l0vjXdKtoOdbbDdEPtggUqJFG7Mz1WFCipl4M9UwnoGd2xStjBNhspcAR9d38t7
	OagLzcMfmteczcgNF7+muScZDyU0i+2okldA7VBD3iL3OwPm1D+/1KV4tUEOWLAAKB0JmTz
X-Google-Smtp-Source: AGHT+IE85Xv0u/sx6VfPNzN3g4Tl7u3d0ImAA0DZGLPPhQUIIiFLjZzVvS+WAuRYWIBQ7d8QfLpIaV6TgcnURt8BOek=
X-Received: by 2002:a05:690c:4a0c:b0:787:e3c1:8c with SMTP id
 00721157ae682-78c9d7cdacfmr5671147b3.64.1765331191298; Tue, 09 Dec 2025
 17:46:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
 <871plbucj3.wl-tiwai@suse.de> <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
 <875xagt7d1.wl-tiwai@suse.de> <87y0ncrons.wl-tiwai@suse.de>
In-Reply-To: <87y0ncrons.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 10 Dec 2025 04:45:55 +0300
X-Gm-Features: AQt7F2rd32LSsdqWLpP58mgpRDLCWij5Xhm4_fvW6LhI8L_uc3Zw-8pHnicMoVI
Message-ID: <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 12:27=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> The below one is a revised fix, just to be safer in case the legacy
> driver is disabled, too.  Give it a try.

I just tested both patches (this and previous). Both work.

Also, please, add this for regzbot:
> Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/c=
ontrollers directory")
> Reported-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin

