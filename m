Return-Path: <linux-kbuild+bounces-8302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70BB1BE72
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 03:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC5F3AA92B
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 01:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A9B165F16;
	Wed,  6 Aug 2025 01:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RH8FgW9B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0351624E9
	for <linux-kbuild@vger.kernel.org>; Wed,  6 Aug 2025 01:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445180; cv=none; b=cjONswtiD0vnfTEGwEpRqZOlVxZ8Kjbtdh1ZrFtenQ1R7eGN1jJE1rsUIg2Y+muF2MvVQhotDhgJuHEr2qFtxna4lyFSnQ3BvO+SIm0bXYMDCri615/jrwqfyLUK2/ZggFFHJ/qw5sLrsbGYI3EQONpWq79UubRvCN/zEg03nbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445180; c=relaxed/simple;
	bh=S3FRCB5dyGt341bp1umt0ivxV1UsCg3YlGgv0bdp+jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZjWEM6fq3buavkaNfF8FtMfSCaoFH0f/JCUTsHGNT+PubVG3Zwag7k2HgB4nNHNCkv/JnU4CeNOCnW/WvTVEPVRvEo35kQE6dNZSF/ZjUBKcechTwEuhOkMclF/SPYomjh9Cn5Ns+77dyT1SaN1pH6OM6pgQCwHJJCQs3ufW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RH8FgW9B; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af66d49daffso890293666b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 18:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754445176; x=1755049976; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLJE1Uv/4ZR1r75izz8V1ikU/bjQDHulX75v/Y1kYYY=;
        b=RH8FgW9BFzWNjejAgwPLiLzsrQjamcJYd2ewp3puCtH1x+iBztvmo/HcNZCBwcSJvJ
         KjW6JRQongZ0cQnC9LNym882y9v50iJk0yKdZ4ZTBNsjH2aVHP7P7jCEiB1cp7/uooYE
         t5UrXbM9E2F5UjBCQV4PMuXMkDSbgto/wbrr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754445176; x=1755049976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLJE1Uv/4ZR1r75izz8V1ikU/bjQDHulX75v/Y1kYYY=;
        b=ApshuaKwOEy5/NfmRAehnhe79NA5ypkwFf7JL9E92p4SBtOzw09xY0PEQYgaX1ua+X
         JqW+JWEJGQ3ILMSSRwaVbeX8C0T0hz4jd6j9D8w3xxTTPTDlaluOyGhOu3LkVUh4CrG8
         Zn4xiFX/4WwO/GbWEIdtWYkbehE/btuYydILoGI9f+edVdKnM9ePxDogD93iYSp7n5c9
         qpQw0nb4JPSQfT3agChVMYSkuHh2asSvPU+w30HVz4ofwYZlApuAJpbdJ5ae1SE1PR+U
         tpNMHtepnakupmG1w4jXUzMKxzuiH9CmIkmFKh+c/YYg4oZFccvUhDjk4Zr3oOm5Rdbg
         OYbg==
X-Forwarded-Encrypted: i=1; AJvYcCVciEcJPPgPAMRheoE6Cw+hhuSzTMEMJ8jzqxmn1qESC1R+NRkCoI+tOczyRMiX/25J4mitpC2VXFt2t9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy89sn7IcdY6dEACsOKUSBZgQHcPAnvH0uLZM5LYg5PJGXUT+jg
	7SnfU8A3oepDyJfPbecQ6ldfZzrESJERO6npa5L4oLelGK7IRSr/J+TNqAmQthkGTJ1zGvlstIN
	q3dDHJQtuGQ==
X-Gm-Gg: ASbGncvo8qrqw+8M61tl1C2EVMWtSg7o3zsQxuB4Ga7u5JHzXLo5GOKoDvzWF9IAweL
	L6zk05uV99/V+tIdq3tf4nuRwZfPX5f/S3rCQrDiHF5fKboMUyMNGX2y5zt7N1/xwWAUoI7HWjg
	MIL5/bCNww3zEN/cKlrsM/6NZgMg0ti7CX+lMnyxB9Fv5fgPeHbHOz9X/kq8IIOVyocAk2gABmN
	mfTV2+IjvsdpDwqEeFxOpX5/Yd+KvOR2NxvqiuSNlF21DLoV0rlPMhno3Tz2oy8CuKVPoZn55XY
	u7U5j76MUNMyVGIQQmXpP9yxRY7Xtwve41GjYZQzrYbrolhYZvD4aV6O75gcLsIzFNit3QfUMXw
	SKypAmwV+k0fl4c1KJ9BozwbJn/i4MaFmvkUfjILIN1qGoqC06hWPvdp/+oGhbR8CSET3l77y
X-Google-Smtp-Source: AGHT+IHCFxV6A8pSbd4geAhJQA70J0HHENLO3nDtMGSqBnY6nel098oz3oYsU1cWcUvi7pSCJZiYeg==
X-Received: by 2002:a17:907:7f18:b0:af9:2502:7772 with SMTP id a640c23a62f3a-af992bc37femr56116966b.54.1754445176010;
        Tue, 05 Aug 2025 18:52:56 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07659dsm989312266b.21.2025.08.05.18.52.55
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 18:52:55 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61553a028dfso6448920a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 18:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWPRd5A3Md0fe5VqG+lAH5G5jPj7WAuKQ8B2yn2+mG/2M8rF3tRm+K1d7GnEKdLLmB4cdAsyu2ApR5Wmc=@vger.kernel.org
X-Received: by 2002:a05:6402:84f:b0:615:4146:72c2 with SMTP id
 4fb4d7f45d1cf-61797e0c23bmr629430a12.31.1754445175031; Tue, 05 Aug 2025
 18:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
 <20250806030434.10663c09@canb.auug.org.au> <CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
 <20250806104814.73fa19b9@canb.auug.org.au> <CAK7LNASw5G1oHb85XSFGhSBUrBq4iDxiX+9rRfgHWOmPj=_ALg@mail.gmail.com>
In-Reply-To: <CAK7LNASw5G1oHb85XSFGhSBUrBq4iDxiX+9rRfgHWOmPj=_ALg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Aug 2025 04:52:38 +0300
X-Gmail-Original-Message-ID: <CAHk-=wiW1_qRN5h0jy=B7NU+fVo=2X7j_bu6nb_=66P+yQp8-g@mail.gmail.com>
X-Gm-Features: Ac12FXzoajUDqGlyJyjgHvxStQz7RZOp3GtrkMUP7hrx-EYZhO5BCTUIpmtaQyw
Message-ID: <CAHk-=wiW1_qRN5h0jy=B7NU+fVo=2X7j_bu6nb_=66P+yQp8-g@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 04:35, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I ended up dropping Alexey's series entirely
> because I also observed the following warning.
> It is too late to fix up the code in the second week
> of the merge window.

I'm assuming I should still expect a v2 pull request from you? I've
archived this one...

             Linus

