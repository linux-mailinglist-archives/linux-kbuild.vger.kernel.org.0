Return-Path: <linux-kbuild+bounces-10028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA7CAAE51
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Dec 2025 22:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 413C030430B7
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Dec 2025 21:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE6A2D97B9;
	Sat,  6 Dec 2025 21:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPkGwS4R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60022DF146
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Dec 2025 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765057232; cv=none; b=UQc/D5ZrLIvEdTxaREIK7sqzO2Vh80DqgLgFiSVbyq7dsYQWil1o1g5JoXUoxFC4z1nQaCBfVVXqjIn97tWfyCBwWutQLr7A94oFDxoUDQ69eole4fGolk7udjSlLuvnLCDUbynVSUVRdLj/H8VmynuPdK3w3ZOSIhXn/MCQgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765057232; c=relaxed/simple;
	bh=NtKxi7YsFujc1I7HbuzJSsN573ytnARDXoaQUKiX+cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnH90O8Mp11zjqZdaUxeujg0NYS1oNED1pnT96M6vzCsES3YtM1KiD/Ggm5uiHJPtHpr49ji7fF86aN1TnDJ7mEqQhBM/twU7hL5QUfrocmgpt2h1F2V5j7YjGCmxozErRQXF/TdJBDy1+I8vmjuVmVBLKlxwQczVykBYGtRpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPkGwS4R; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-786943affbaso24537547b3.0
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Dec 2025 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765057229; x=1765662029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=iPkGwS4RshWupwzaC910sbQd7CjF+RTc8i2SM0iagzvwJS17j1SpEl2l460eRPbx9/
         R6+AXZAETocb8O+d87p5KWylLgKpDH+r8RwieTppqi1ZSfqo/q3M3vJYHaNOFWOCzIyr
         OcvBHDe1jV/dGUv75QTKpcMPXsYcLMBHZPUr7QW/ASSktS7ftCNAsEZ9U8KTgloGWrgm
         k/KNLRprq+LMj/u2OHWFlyviYb3pwCAjOBTw2FaNbv7odKZrXZ7rA6WEu+eePSKM1xfa
         hQef9gn+LGqYAkZTPGCDgO6QOoiymBTvUPTUIsC+AseDTKujkB1YvRjiMh4E3ERBrVEj
         /3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765057229; x=1765662029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=M+2AhbPyfA0UHmOxIoxsXox4zkfJF3IHas5ieX3f5VE9BIkn8TqonXqhqfibvwSs8n
         Pj7M1LtviSYEiEk01ULrV9bav6OomIm5jq3Z1eaCmbnsuEhpGXRQjGIhtPKudcxT43W8
         +IGnA2c1oLfBUALGmLtGGPcRbbOWNdhYWji5jZ9n2GUOCOrHfFerjpMs16fFsVUwNbl0
         N4jwrRis7un874T+PDbJUde72MFS843wvhcvk1zzgrszHrzfwLeDYS/ZN+Ibq3kbXsbO
         GxJu+3VM/SOfolp6eOav/KmN2aMyvoE2uBUpzg1tbvNA1IWom+HpzHaaURsbNUtHFSQs
         Shpg==
X-Forwarded-Encrypted: i=1; AJvYcCUmSeN8IcdhBJloQucuvqf1OCDiKfmJEV0fxO4w7cn0BT2nO9ZyYswUsTk6rzNdKYKqpQ8MKgI4tOnw+8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99crkruAT/ha76qvGXmyWqeaRzbiDVrDM6BfoLUQfZEcghig0
	9UZCFknKJ40rMS8CWX0b2yrzThjXs+K9EioVCiQ4FOWIymXuBmb3Wz/DjRBln9RRw4KSo3yRd9N
	kIvbub8i9uiWvHexd5a+V9UJ5VVHSnvY=
X-Gm-Gg: ASbGnctui2ecD6Nb6/grQXxhKNvsCIOyBewfqNvQp4YXw5nN1U55fDk2+gTOO4RU0MN
	8LI14i/tE3YQXG2GzSB4S3TW+OYqJ1s+gFRpPN3cFS4DppujPGWwMsfnIIHDNR0KsAFqbpKx+QA
	CC4F7mFMtf/BKPoYpDFkRQfToaxX5rEDOO2hS1JbwcQqqtTNWOqSbbyFVwXwhVzWWf8eCsbuCeu
	dQOz42NpQGCRp/CYzpjMijrXRsvBMNMG5LrDSGKpquc3bcEjwuB2KNRlUmtElIaaE60fjbE
X-Google-Smtp-Source: AGHT+IHqbqmEJ2vaB5W4uwBXmi2AqqrA+VzbtYcWwJiGGaH0O5ufb0McVeuzgrEaiVyROG/3JlGg1/jbdyFP2FsqpvQ=
X-Received: by 2002:a05:690c:f06:b0:78c:28b7:88e4 with SMTP id
 00721157ae682-78c33cd4cfbmr30764857b3.69.1765057228766; Sat, 06 Dec 2025
 13:40:28 -0800 (PST)
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
 <871plbucj3.wl-tiwai@suse.de>
In-Reply-To: <871plbucj3.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 00:39:52 +0300
X-Gm-Features: AQt7F2oxKkU3ePgE3Z0z9BFc8gUWWy2Y-S8sruhwpHi2W7JaGHpQyHor_1Jl-cs
Message-ID: <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
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

On Wed, Dec 3, 2025 at 12:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> A rather hackish fix would be something like below.  Instead of

I tested. This patch works. Thank you!
Tested-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin

