Return-Path: <linux-kbuild+bounces-5471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0700A0BDA6
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 17:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFFB161D78
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4679190692;
	Mon, 13 Jan 2025 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZUKgtt7H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7C146D53
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786126; cv=none; b=OGPz4pQuYW8uNMv3SlGQj0YB1B91jUxk514fY0Sb2AXJB8DI9N79oF7edbbIOQ8fugjJhu77ZnuFtXhv6x+0/hmYicJZSTqiklMtKQ/RjNyQ7aiE2Ld8WxFoavkAP++ExggJBUgA+ZYvF8Aesnm6mrwvbhbbFt1edxA2JLrDSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786126; c=relaxed/simple;
	bh=BooridWNkwj5e5l7KJGz0aXFtBPUjNvLT1DK2xRxOfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rElhBeJri/j4pb7X8pAubI0PMYr8F7DFFdSCIF8KKFH/IJCR6AGsUmnXZq6TVmrYsNRa5f+mYppZQ+gYNupPc3/jiwOF6RZnDWADf9TVF1O4i2PldS0T8Sty68o/ztQyVt53OW4mC/yaCi/3F7ccKHnW5+/5e4d4hSVHvEpg1+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZUKgtt7H; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso381551cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 08:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736786124; x=1737390924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMmCFePuGHQ1skz70dTUlVQVmje52VzFgi7onjQ2Bto=;
        b=ZUKgtt7HTSPULOTv040kxbrw5EkNTyM22y/xJc4J1qoUDSn+BrQYwCH+4yj8vZrD+D
         oT3xhu2UH+5T9DxNfeXr8KdTepti1uG8387G+n4g1zsgP7Q/xBKQTgWwlSRZGp8g2EUE
         XE5196+xxkouhfye8Pigl7aGHe4fXgTRQnOTeKksdGcKXQlNU3YwFBhaq0vqkn/KGPg2
         mITZygzorr0zput+zPA18Nd5Zme7JRB9F1WJkenyO5ClfKHuR5WFH+TDPher3paJ/6Va
         hBcQV6vgcRWFy/HCrPbU2fYUHFrjeXjA3bIM7Wnn6j5t0qftzh4v+vreLt+xQ4ydd5yv
         oymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736786124; x=1737390924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMmCFePuGHQ1skz70dTUlVQVmje52VzFgi7onjQ2Bto=;
        b=Fcg+Z3GXXS0pmWXvjzHWAYaakTVCOn1DyKEwjkSeoWzff0iOUr9zqO2XFznwxVOlJI
         RjNT6jwdusWXFtora0N8B4U79WczYTUUCHt6qFyFeUS5izNOlOhp5YIDzFLYQ+95zNYD
         JER5IxxRBMOj0e5BhDdnza5nqxWLRX68m8T51KP2YI/oR5iwMVX7YWFdnW4D+kiKdG6B
         xA6LYrOEuJUrVU4i3csuzDYCLx9Rc+uRBuRE9acrrP/0o0r2phgf1LV/hNwYejLzMLB6
         lYj1P+F/yr7uRyDm0PcM1NEETP0wBprX0w4VoSSDPx31zWHRjLLMTw9lD6W7hw7ZBoo0
         DlfA==
X-Gm-Message-State: AOJu0YzZIw8ESe1C88czf6OmqLNjYHbSu3fmv3bHWO0kmz/DsHQI1dX2
	0d9pVbREAXwuHEu3gydnHcBKFSifKvPnQ5LhPNGctmgC7X/jB5izTQZJzI2jmpe4w8J1Br67Nz4
	O51FETDCg6dC11ZRLWAbNd47JPkXDoOxKeE5T
X-Gm-Gg: ASbGncuCIjxiTc3USMMorZp1/HLSeO0W5dt6jDQunc885CZKu86PhkJ6M0lG6+1g7Ug
	EzgKi5ZQoesShyKWO2m6jBAryR0HlXzbH4t+GFqRKP/SS3IaHV/vHIKPm3UxeLPWbNpop
X-Google-Smtp-Source: AGHT+IGNaOvCCyABwZt5vUL0P//fF4haAUUv6EOUPp31qiCFuubLN0JgBuYZ9VhbJJXjKtv1PsArYhwHaRneetKcBck=
X-Received: by 2002:a05:622a:2c1:b0:460:491e:d2a2 with SMTP id
 d75a77b69052e-46c89dad5a8mr10415471cf.17.1736786124079; Mon, 13 Jan 2025
 08:35:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920085628.51863-1-ole0811sch@gmail.com> <20240920085628.51863-12-ole0811sch@gmail.com>
In-Reply-To: <20240920085628.51863-12-ole0811sch@gmail.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 13 Jan 2025 17:35:13 +0100
X-Gm-Features: AbW1kvar2NaeJlZ6d8aLs2I9DLAdsdd3k4-g4cdTbq0WNqqUA1YfMJ1G58lL7GQ
Message-ID: <CA+i-1C02_GBbrSeNPqoyTrzfV3Lv0ovdsKzcv3d7zCkNk_Hv6g@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] kconfig: Add documentation for the conflict resolver
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	masahiroy@kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Sept 2024 at 10:59, Ole Schuerks <ole0811sch@gmail.com> wrote:
> +    To add a symbol to the list of symbols whose values should be changed (that
> +    is, the 'conflict'), you select the symbol in the main view of xconfig.

I got confused by this at first, I was thinking "but if there's a
conflict, I generally _can't_ select it in the main view, because it's
hidden, because of the conflict!".

However then I discovered xconfig has a "show all options" setting.
(Then if you ctrl-F for a config and click it, it shows up in the main
view).

After that, this worked great, I was able to switch on CONFIG_KVM_AMD
from a starting point of 'make tinyconfig', without having to faff
around trying to remember its dependencies. Nice!

So maybe it's worth highlighting this 'Options' > 'Show all Options'
setting here.

