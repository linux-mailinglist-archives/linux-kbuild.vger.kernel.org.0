Return-Path: <linux-kbuild+bounces-9529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2FC4862D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 18:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B073B7ECC
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 17:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F32DCBE3;
	Mon, 10 Nov 2025 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKQrz37d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2E2DBF7C
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796322; cv=none; b=ArA2rQffnYhJo0yyLjka05joqDLrgMrh/Y/PQUUPmWf6XpZujgelNABKBrE9TpiyRnHD5axhLWQv4Dham1mcfIKepfxYlCUSVr1IZ2tHGghg35A4sI4pRi0KEpU5M+HcRTpvgi0v9z/WIuC+R4aPdsbsGvzTapIrvWLoxPOqx+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796322; c=relaxed/simple;
	bh=M1o1kOh6VqP4CN6/zqp8bynioGZKC94OCphZddFeq6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqh9jQschguKY1JmFa1Bu8y+IgRAY0GmeuE2lIQS+m12+iRObT62UcHhKAcNoPxIcJJFaoUejXziC8EDvJiDhzYUH/4rQgA75OiC/eOmPU5qTQX/tdwPuUTGvhAhFky0kcjEG3j3d6aePVeK+KBWcaP4GAO3+K1GASN6KKy4VDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKQrz37d; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ed7a7ddc27so32250141cf.2
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 09:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796317; x=1763401117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=QKQrz37djniZBKn9uHMmxnFLXbTU+N404fTvpLi2IVx4Fp5KARKFMni4pECj0Y7Oqy
         TJTFGqPshOG30+TByOWsumL4SG/47k51TSX4bSXChr4DNUjwSqLZRBCLGecp4+DOElfE
         4kkIl82doNAwf1TSq0w4+9Kr9i0yXHIYPX62O9at/fp+qUA5cT8OlLyQJrzWuVU3g+M1
         1YPbBVYy3+kxCB/SijXCX7Os0jrxm5u4I4CSNakSuTBGSjjHbLrCRiMpoOiw4IZgHDrE
         lPWPu3jEj5Gd1GfXaGkNWzPhS6nk49Zz7Yup1MSumjddXPOWMIeWKndH50GGN8Y+kl1w
         9vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796317; x=1763401117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSOpGWJwXMs0s/g4qCwlIsfD5sl3RCmHWkcwp+GKrsA=;
        b=hlE6sOvCBCx8sQs6kyF5TRnpz/umEQZ4BzcJ5LZsQ9OFlJ2f/lNqL4dv9MDaQWzBsI
         40BU9Vx9J66JJ7w5es3jqUcseHaTwjO5pTzyx6/CVw+VtPmmVW0NTgqbDaxYsBZ4klb0
         UiboHeqATXpCCXYeSI2lT1qyC8/FfRT69d5h+54hpIseHMoO8MZS88ZMPFJ9+eEuJQVQ
         Bjew4KNQ0M4Prmf343ppWt3eX5hyaKnsz1VvhaMZe1TROYTABJxln57F/Itp1v4gGTOl
         e4lLPc4l7PdLV+oLxQWS1tiWwwrUfmAo9hqw1HBJKXRTGUw7Gx1x5oYo8KLfcXTAMiVK
         W7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxERDG9w1Qi1apj8cLa9ayUejmvDgOwPdMGxNL6O+K7UefBJlGKdvYOtMxJm4zoPAeQJgqnpilgKIwKxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhQcSsq4Q7j+extjp0SP9Qmp4+umAC7YxKP38fCfi2RmU/4/Pr
	5HzkYxL59dP5l1B4EfaY4K2eBRqoSS9/GJZDc0E9kSvixl1wHfB1mon3ND0dSI04CpWe3HwnsuS
	WVdqLIf90YhWFawBvNhDPT5pQ2nyIsFlSJGzkGQkm
X-Gm-Gg: ASbGncuWQWfOMYQSlHNZ+htJUuopQgFoWYvz8OEJ4qofiEmz6+8hB5FGXS6g39oEvMN
	dyXBJytEshVfNQEzc6Rhr3mFEKlVfteHjBZY1UeIN2WApTJgp8LXO0jo+eOOCVm3SFvhSRI7Qjz
	U6PUbDcumx27yj/5mvXCObtouqNILBOZnhzj34eEpTmbgiVEkOqezuPaKG+8H3Mskr7x9UzjkjQ
	3ycVC8kLfk0pnlVqGzpLSixbqtDUmd6ph/2ClT5od1ChNTQsFsaGHIZPz7Pue6JCcsXszAsnQH/
	2LfUlB3eK9XjdGO39PxawhrrmQ==
X-Google-Smtp-Source: AGHT+IFr1gTkxV/2KbejHCAfn9cmRrtPm5R67TTLAIre2TRAH5dAXb9YnE16dsLdFYHK6GdY4jiLnljrS99RBkOdtpA=
X-Received: by 2002:ac8:5856:0:b0:4e8:baad:9875 with SMTP id
 d75a77b69052e-4eda4e70d87mr109099991cf.4.1762796316364; Mon, 10 Nov 2025
 09:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:37:59 +0100
X-Gm-Features: AWmQ_bnlgBiH0JekOxzwX-3tPMF5D_wHyW4PzCjMfs9TphH4P9izG_-i06SXddA
Message-ID: <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/18] kasan: sw_tags: Support tag widths less than 8 bits
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +++ b/include/linux/kasan-tags.h
> @@ -2,13 +2,16 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> +#include <asm/kasan.h>

In Patch 07, this is changed to `#include <asm/kasan-tags.h>` what is
the point of doing that?
Wouldn't it be better to move the addition of kasan-tags.h for
different arches to this patch from Patch 07?

