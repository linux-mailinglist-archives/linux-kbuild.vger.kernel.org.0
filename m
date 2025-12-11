Return-Path: <linux-kbuild+bounces-10072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C79CB6DFF
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 19:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744B830142D8
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 18:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D169314B6B;
	Thu, 11 Dec 2025 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnXrH3Ay"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D9224249
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765476714; cv=none; b=dFQifXXGbBzqg1yR6Oo3N0QmYOf8TKsLMkQEvTxpio9ZpaWpMg1h97JyjL0/2Pla1kyGZNGhfBjzaNL2lPj6O6xCy7KqKpZcf/gS2T6Z9PbEI7AhVmFjBZfQIWCvDAMbd2rV8WOXPKOrp4+S3CmR9oB81AXQMNnOQVfj1M7g4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765476714; c=relaxed/simple;
	bh=ohNRR8mRdaddagF55e/ewnAj0hfyCt/6ndE4X2UBo0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAuJrPOZyQlGhJ6gStTdyMepPwf68fgtE/K+SsN4uHXgXmbOD7+/GMQfR3Ejlt97fHkRrJ4KyXKHx1eS7QBCo7H+ypM4g3HpFmaxQsCa6poPbjv/woNX49QlABYEOYoSzIbrHV8KE/tgTf8lcY8y63GU/tGHltx4SqJMgjiuzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnXrH3Ay; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78c64370309so4186757b3.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765476712; x=1766081512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=GnXrH3AyZra2IjiQu7YJNxiDwWOxER1CAFPMWhGxlkquejDzkOGn0RLrXflr01ye3w
         A54bSDZi83FI3gYzZSdv4X4Rxh4GmWpZ/LsLFJL6EUDjXa8YdWvdfAW705Z/lpg/qFAa
         esW76zNyaDESgKB5N4KAg0O/x29cVEk3E7mx/F0wPbmGRZw1i9Vx2Hw0wXDtRH116Mg+
         X9MNH+rPCFD8twgufmBx8tBdCa1pjxMtF+1ws8c0Mhp/vAIH8JysgsALKm6akbJG0ujp
         wcfs+VGR6z1o/B8MKbzZhbMuPPpW7lJEUSR4ld1Z9X6iZyiWDBqkgVquhqML449WxP3S
         E2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765476712; x=1766081512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=g0hOJRBdc6cCJZSVTj6YgdweunoH/UuG0gakg4DoAkJHfU2Y40BfIuOEHoFlUoCjGy
         HMPIzsda5pjogIzA7gRR0WgVfy2z9HWeE+hhUxCnyb35J0gQr+9zznCcOX29qr2LapjT
         VESLoy4vpiJCsD3QtgxTklD7+xNoUbDsPZjE2v/f7SEwvsBzwOndSEnrZw9RvgH1SFbj
         PyomO13jybgiB+yTjUyi+yZc9NzbMDP5vVK7c6Imc/FnjxB+TfQ+vsft+Y0wh1tUGIYm
         +KMxE7cYyIvBXXyFkqzLxz65HGxpDiWN6Ug2+8gj1g6jfn7AQxATgZ73QRd9/7nTqU46
         WnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy0rVIlVc0fHM+A/i6lyAFpqjOgR4eiM/OY/Ws0SdWOwvhLydQdX8tU2uUldEpMCeiWAbyR3D/BabJl0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4xkcuto+SImT39FgHqwCcCdajVQ3+53BFRCB14lU8mTm78Ni
	A9q/WjFfEE9qxzXy1gOuhZeE4skzKZAXR2/CK2jxFma+AHt31w7tZrzsz7kNAvvet+eOSmfyhML
	Ps5SJLGepQqyko6YmVkxJzMoI7qYBefQ=
X-Gm-Gg: AY/fxX4+GP74a7chrLeWxOsv6BIMQ6Zsqedu4AvLIPNZtkIO51ghskkyiZWoHBU9n7C
	hdNFqpceTup5NEOoRf8N8yvcFKAgjLZUqGG+foRm62O8uxQLXjhJwL1KUV5VOFXqhnv2846fRjR
	u3x24HYV3kTT3xaXOrjQ5S6G3PRwoPikRwUZ4hnYv8K08oa3ZW++cQSnYLyq1XK7wxiv6brE0Dd
	kAL+kgAkvmy4AR+WfBp1khs+8Jozzn86FANAP2QH5KMkQAhdVMTh+7dmJqgfY+zOZDlN19S
X-Google-Smtp-Source: AGHT+IFRzgGjcYxIbLMExA6spsMBuwax3EGl9r6dtOafMGycs0N9+jMTSH/Ac+W+oS1JYN3ndc0s25a9u/TA2UWi42U=
X-Received: by 2002:a53:d003:0:b0:63f:b1d4:f9e3 with SMTP id
 956f58d0204a3-6446e948acamr4367472d50.9.1765476711525; Thu, 11 Dec 2025
 10:11:51 -0800 (PST)
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
 <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com> <87345iebky.wl-tiwai@suse.de>
In-Reply-To: <87345iebky.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 11 Dec 2025 21:11:15 +0300
X-Gm-Features: AQt7F2q_yl_QsO8lNkmidwy3ZCDdGlJk7jGsZGeMqFXZskur9LDYPeAhNm2kr9w
Message-ID: <CAPnZJGANGeXuD56sfNMN4D4gVQD=4eZ4bA2bTP3yuBJhatXeow@mail.gmail.com>
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

On Wed, Dec 10, 2025 at 4:00=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Actually this tag isn't really right.  This commit casually surfaced
> the issue in your particular case, but the bug itself was introduced
> from the very beginning, and it could hit earlier.

Then, please, add this:
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code=
")
> Cc: <stable@vger.kernel.org>

82d9d54a6c0e is commit, which introduced "intel-dsp-config.c"
(the file was renamed since then, but I think stable devs will able to
figure this out)

--=20
Askar Safin

