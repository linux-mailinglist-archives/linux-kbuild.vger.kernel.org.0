Return-Path: <linux-kbuild+bounces-10405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5CCEE420
	for <lists+linux-kbuild@lfdr.de>; Fri, 02 Jan 2026 12:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E68CE30053EA
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Jan 2026 11:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4982E091D;
	Fri,  2 Jan 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipCfHJYf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F62DF717
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Jan 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351885; cv=none; b=fK+2EccBwAVRDGFxThlcaaaoJy9LsdvxuEdQXKIV7wRDnvipSLw7s25cAdl9hnoBAnwYKVD4taD7BYDpC0d9nkuVDdCETk+ay7M+vQo1DhLbXPAL/M3nCBOL2WJNNdRMTISWmGMz3zCF7GjxDPryWap5GMwNGyDF3Wknq6PVE4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351885; c=relaxed/simple;
	bh=wSApN7eIEmxe+ZlkFun1Wolx+BI8xxAaYv9APOnMXbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpyAz8k3ufIGIZ2WpN8+mvMMBFGlSjY5pHVWh/jEajpAyw2qpt4jqu2wdCa9h2EgkKVEJjnSFCDmBT0FX+tFG/+D4D0cU9V0vFJWgX+tYIIi0XCEBZNGkujYbV2ApVJdOIZON63A5gRu4cxIoT4V3ptOLNtgt5VDa6VgcrGhmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipCfHJYf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a110548f10so42685165ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2026 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767351882; x=1767956682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
        b=ipCfHJYf8oQoFqMJ+NDl0a9F86WRdEFeyHHJECOrCJTgF9zJ/8gSfv2wupCMMIxJfj
         eku/SNf83ymrhL/SQUYtzhPbgVk4ruSA1LYT9k/bKsYW9SrdCKgZevYG4Cg9TNfQwqoS
         caWuMb+pHVQgf1AW/BKGS9coLPWn9/MleoZ1hUJ6cuzG1lK59asRwBtVKq9C43ayEBWR
         qdj7iEyYMLFOU/K0uf6CjK8jVAxXEukfQluV/1sjZCjrJvwffOAohbgoIDdSsiOO13MX
         Ie2peETA/AJYICK2qlJpeNUpGfgbkOJ95hXdXg9xP1mWPAXH/MUYeYL6CVBcOSxhjMgz
         2WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767351882; x=1767956682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
        b=eJZrHlpm+S+fxVPTpgtNVRdi3GOB0isy/yU7a93zdGSS4fucYgxU6bSYrKVBRqyQI1
         zLc9gBUQconKQWBNaYDUFsa4M4P2GNXPLwmD9CBYjSc3my4z+GmIPSQNUIE/3Mbtqjkz
         h1W3x8Oj7hI+fKb+QZZRcQGaYqhnyPmiSvPRoJwt76o+fwuG5W9rnQMVeimq4s9gCur2
         iCdixl6V5msGV/6ZCl+8/eu6KQYO/bJqranIefkVt5rskVtDMSXS5gYEFOVH4FOo7lyp
         1ckD2Nc8M+oD0y4m8JaWDkHxOyPztXisPfAofhFvtGXa/GEjHo4//xk4mdhnQ1gvuL8M
         mVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNUbyEi2K8/dw4FAca9iySrj/8O7Y1EA5d+GWwrBtfWdx8Y2S1yE8f3NNA7K/CDD+n0rPKAiYLvSbIPLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+F+Yb9Kiw5CouFOTfEp+dUOZWz0m81zJrUg8jRBmSkK1TMxN
	6C688JPeZQDg+uGakwlY9w/aFZ3EQk1uVn6tl3gIU/PZz7j61v+RmU7rsNSZE/5WJyz+jOhb/8n
	smNNdUwUSkVEpOi9U7Fvd/899RgkR378=
X-Gm-Gg: AY/fxX7rAEM8221rm+9Hd3Y7sGd9KN/9vsiWN3cSngnaerW0+r4o74DTC3ThdEyZX+5
	wiC0/c7G3baNs22mX8CwWzHkmnO45VFm5UALHWYIpZZ+wsuz1rQmMFMuvjacYJEEpytxbH2sCz2
	qSzHrMC7kqCDksWLo2tscv6oNRgrHH0E0Az7sG9lorxAMV3UrRUqTOI4zMk1Fcr/N6rYMz5ngsH
	BzEVcdSs/cPjP+0KeuVOQW1+BTVRHYAzx2rz3LWHzo04G4clOrI8v8rRAtsgEyl5YGHV53AnYWn
	1OBGKiL+6WRicAQqZGgnWHHe6wf/P83bUiWNBJs568nLi/wmJhUE62jBVOqq7MT/8ScVJ+kBOR5
	FiU4cnB7utb33
X-Google-Smtp-Source: AGHT+IEZHP2Tt0L93hKtfLRSYNZV76m0YyhGtrMg6HK8YOKF7WDdzMO7LFlzqH2gnVcYBfD5MuH9A9W3GVedPNVkD/I=
X-Received: by 2002:a05:7301:1509:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b05ea19892mr15172023eec.0.1767351882060; Fri, 02 Jan 2026
 03:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org> <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
In-Reply-To: <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Jan 2026 12:04:28 +0100
X-Gm-Features: AQt7F2rb7qQrF04KAinb0u8Ra4qw05S31gwaEul2jMZEj1pMA4QwOapz60W1DHs
Message-ID: <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and is_negative()
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 9:13=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> thanks!  I think it's a bit sad to keep code only to make some checker
> tooling happy, but for now it seems to be the right thing to do.

Perhaps a patch to add a comment explaining Vincent's findings would
be a good outcome, i.e. explaining the reason it needs to remain in
place for the moment (even a link to lore.kernel.org to this thread
would help).

Cheers,
Miguel

