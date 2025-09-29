Return-Path: <linux-kbuild+bounces-8983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF9BAA4AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 20:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A4A420ECE
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 18:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ECC222565;
	Mon, 29 Sep 2025 18:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GLzx2wfI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4462222CA
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759170592; cv=none; b=unwQN74zpbrwAwOIesdWsIAr+pZsRGA1YP8ZTFTVgOkJCtcUlcI8pf3ANIkNMq3J93xmBCjBaBtCJ+KyvG3peNhzrwkxAT/6l4ih0ga017/jVVqo/P/HkyByGALI3D5iPI7v+rAo5MJ0fIx//ZP1TJyJWi039Fc/K/MYomQ/WuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759170592; c=relaxed/simple;
	bh=ANo55rHDcRUb+KHKLOipJtfkgsfm086+qvQ1yoa0FKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiBIryI2e4UCO8hjMcKaweed9okuVorSMzEN7608oZrd0HmS9qCXho/KG+Ey8GQ5O6IY1e2PPR6q/fXRhk4C0FIJqDoTQ4AsTm8OPA7yR/5XeS8XlcAK9ymKziQt5cLnla6IOWH+do+lqXJQesDGsMg719nS0pg0d/Pe4W5MMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GLzx2wfI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3ee18913c0so258984866b.3
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759170587; x=1759775387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MOhM2c0BgwGluaSg8LyQi9/Eujsn+rm74ZBpzBdKD9I=;
        b=GLzx2wfIa4nnzm0T0oS32d+mgm0mz6ahoCaK/Kqx7BYb7AfCJUoJA+uOXnxwGZoDh6
         S6itq/ZzLMuvnyRAoFTk1DuRnvDkDVOuHvZ8J9rLNIqeUi4IDyk6EwUUiBtLbAJl0hhG
         ccK7YP9T2q73KxdhOJC6m7knW1XWgeZvaYKrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170587; x=1759775387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOhM2c0BgwGluaSg8LyQi9/Eujsn+rm74ZBpzBdKD9I=;
        b=fDV16WrIJM959W24eCrsbHVd/0G6HeS5lXhjG4FUgjPR6YJ2lRa+oxcorG6YY2q2Zk
         yLZgikrKsn/hRoHEg6lFnaExv74eDONstSshVK/T8uuBOIjNRxnlvQIBJi4nTcS6908C
         lNb69OeyVULHpxCqqRH++pd1VRG+kky0MjjBCrtwQVulAWisBm+oe14UOoeatu2zZ1eD
         CqeHih5X36Ysll8NZ83Ux92wTlF1SpNKllplqLedZGiyoqPHUGgPnfr3rrbdgaIsbrMa
         n1H8zcH0PkZ1gWrCu1aw2zR07F9LSD/PVVubVeIOzYKAafSpWBb3NS29fAYldSFgLUgd
         mV6g==
X-Forwarded-Encrypted: i=1; AJvYcCUbMzG5Xfkxq/YVwFTB6p5G8nHvs06ShtQx+IoUkzF+019AnVAXLdzx+sFf0HaVvryd1KzBwDLAxiVHHoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfjsm/NMDhBfxF05hMGykSUCvFAcXKWsosqhFauzmm6pOwO+2W
	MMFdfjGJdm2hDjMjcxRbMh49dbla5HnjnGu4xaw9Dur0PO5V+RS1jM6lHnaOor1gl5hXTSDjD6w
	Uq6i+Z6cABQ==
X-Gm-Gg: ASbGnctJu3NsrIcGFdU+YD28mMMW8uy4CRIWVDESSurYhvDh/euBrFfVRKdnRUmYvFg
	xMi+ztyXhQKns3IKV1N3GuK9+FImHCiebWXzEBThEE/uBZZw9WGzwnzxSfhwxGjPLd7sKvtvT/r
	+QjpuI1c9PdfVmeEdFn+RL9e3n0lCXdxgf2q7Yid3qIZ3D/5ACEim+Lu2HqQrGeLlllwXiVVKYf
	xWLLBu3Lhq0tY8HR7vlN2/WuGjrjMmWKto6BlkXha4RWfEJDvS3pQp3syj8t4uKUWSft05K4k+y
	ds1GMkFVUGtcmCw1llCSlwtxRBMLOroIrLrNpux4sVgvi0VekydkxlAjk5NQZHTNR9NfdJDu+46
	KmE4hQ4VOs5uD8BYHebUNvko3LgpgFJemaGAgwvloSTHU2GguJQNKleHY/hie/hG5DAZU5bVCPh
	/d0dwXzgs=
X-Google-Smtp-Source: AGHT+IHutaVazVPmyH1A2okSp1kprlq4ALlPnv5zp/SG+DoJIr1fOmewyApdCEqTsbrWBJadz+kFRA==
X-Received: by 2002:a17:907:7f25:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b3ff66b28d0mr388058566b.19.1759170586657;
        Mon, 29 Sep 2025 11:29:46 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a366116esm8309379a12.21.2025.09.29.11.29.45
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 11:29:45 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e44f22f15so253708966b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 11:29:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS8gKnuhkNTu71Clv0LnYdwR7zATxPHZc4IPwpgaYAOO+OujAEC1oPNrXR0KhCExpHhpVfA2S0tofIe9g=@vger.kernel.org
X-Received: by 2002:a17:907:7288:b0:b40:f7dd:f8e8 with SMTP id
 a640c23a62f3a-b40f7de0a8bmr197226666b.38.1759170585524; Mon, 29 Sep 2025
 11:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>
 <20250929182512.GA1394437@ax162>
In-Reply-To: <20250929182512.GA1394437@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Sep 2025 11:29:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2WRS-OeO1m1Cw46Yk36L+JQ_mUOxV639DRNeu+YReXQ@mail.gmail.com>
X-Gm-Features: AS18NWDr0_9xjlTkx-rESL9XczetENTJLhD9e2yP79hMjBe99oy5hdPgzBCzMvE
Message-ID: <CAHk-=wh2WRS-OeO1m1Cw46Yk36L+JQ_mUOxV639DRNeu+YReXQ@mail.gmail.com>
Subject: Re: Tool directory build problem..
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Borislav Petkov <bp@alien8.de>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Sept 2025 at 11:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> It looks like prior to commit d503ac531a52 ("kbuild: rename LDFLAGS to
> KBUILD_LDFLAGS") in 4.19, LDFLAGS was used throughout Kbuild so I
> suspect that LDFLAGS= was there to avoid poluting the tools build with
> the flags from the main kernel build. Given the rename, it seems like
> you should be able to remove LDFLAGS= from the tools target without any
> problems.

Sounds good.  I'll do just that.

> I generally agree with Masahiro's prior comments around the tools/ build
> system (especially hooking into it for the main kernel build) but I do
> not see a good reason to break the tools/% target patterns if they are
> not overly broken or hard to maintain :)

Yeah, we can remove it later if it causes more problems, but it does
sound like it was just a workaround for a kernel build system issue
that no longer exists.

Not that the "make -C tools" pattern is all that complex, but it's
different from all the normal kernel build patterns so I find the
whole "make tools/all" syntax more natural...

                Linus

