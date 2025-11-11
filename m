Return-Path: <linux-kbuild+bounces-9557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41FC4CB6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082CE3A6148
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E12C2EFD9F;
	Tue, 11 Nov 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kz7YMOlC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B12ED168
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853721; cv=none; b=qSXvYHPnOyB4zGR3cbraA6XjLuXJjNilf+hz/7SXQs0i8ikxmC+7kZxACqGGqkfiilApTWmfUZay7FsjkLVhJ0684ZpEIkiTriZYqnQxudtMP2r5NtVMwu5adIivFmEW9PS8ngZoq6QexPrTlDj5679l0rOPtB6ScM1O+NsAzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853721; c=relaxed/simple;
	bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbRAwT3seDBMYM5XO/N5bk40KZwsUgOTriMednuwpsaotvDpT3tW6ymATVWWKAHwGBy1nGwmka9wkXYFNzydM9PSX/CfD4or3zhH1s7AoPLSwM06PPCmdlzV8oLFUNKb+iqrcynA5gocaNrBScUY4OJSrnYOqE9AKvmIQa3YlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kz7YMOlC; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2489626a91.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853719; x=1763458519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=Kz7YMOlCp0w+UrHY5twsYY8JF+Kv6/Dt+AXnLPCZ7Tlf6hTZaP85WkxpKixnmSKJ73
         yat5/nkJcYMecBUvXpPhOR2qauA/5M1fuRClERrZvacDw2anm4tkig3nq07KS3yLBCKO
         FAGgSaBjNDaFloCiyqHxCSSBMAZs9gXY52h0aMk+t0Qs5nudNVBUEu+0Vco4i37jdJuq
         pB4fqOJkVWqp9TsIgyEwyVUJiUk91mcjBkQlXKstFvl4YIGBvUO46Jr5zO+NUuDS5d4P
         fo+IilEs++lxM8dWoUrXcS+dya6iOfmPtlKK9rPF8LlN05X4GCd0jsxpegsA5Vsaxolb
         cBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853719; x=1763458519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EetqUyAEJqiuKxD3fEI2nbY8lCOitzdVH7lF4O8jjNY=;
        b=DT2qdLIF1zFCkxmrNh0q8B9jT7OvYs4AucDKTdTpnLY6zg9kFVKAEV1Fcy+3b5idqV
         xwp289iSVCoYj3IrD/sE1t/SYnzht2ziT7VPOHdKUir2Pg4smciBC8zFcWyOko/ZMsw7
         3QKp+/jDXFvZzwraVDhfz9so/DBEdk5UPpaF4/0zBvFcmUeqWM0fFlRVTRWOSu6fcUKE
         jsrmw1MR1qT7dHEnwNu+KFJ9ZrQRzGdT+yAq6FGpSZJuMa5AghUkD9CGBFzaP87RDgln
         19lXIZaRdrFwdqCougJti5fwJuPvmil4UHPOYJy3naSk2mS2Fb76RpBIb1l/Dh3RyUd2
         R+rA==
X-Forwarded-Encrypted: i=1; AJvYcCW+oIRQFb6FjBBie8o66fbu0eBiqRlNx52DxthVRbA51CYyu0BgwwYM4EtUfgyksavBL+Mx+L4EwANdHiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoeXMlv1IUfy+XyvizvUV8l3RUQPr9PnHu3hx1dNG9HG7fIcqW
	c/3AvRdrfjNj+XV1PS6/W2OTrpI+o4qHa6A0LuSkfj+r4zxnXd/qWeVdEUgwuXzKzLPivIxVNdD
	kpTRTF4JJwZvOrLLOTVX020RWTQuRymGLpADuQq33
X-Gm-Gg: ASbGncu/mmphQcY6qSKNfOaRQ1lZZCv2h7AQXoHgEcAgC8N2hiqqqT4nbfg8EtqBb86
	SMsxzGvAumARjjfeMJrAzqo4gYQPlOgkiah2niUUScruO0muSGul9jgbUmuWMt5z5gIEZf/sYLk
	T2HJhg3fBjxvVs9c16Ob8qtpSZJKF8gPQZ2VtMWN8WsNIYCFAf/sJuTsN31qrrdMMYggaGuQZ7g
	c9NeGgNg8sroOyHbm1TwgIiBPOdyNjTwjabPRFhok3SRaoJyzcqEo0R0m2BPGw40t+RDg1PB8d3
	7IQSqEbhsocpjnG3xbXiVeAnsg==
X-Google-Smtp-Source: AGHT+IE1gIu9BAiXsX0H1O+GFnCkjCXA7LjUzdEGNtie4OCQJL0hEG9RvsKQFDwhfkMp+tiOpjzqm/vRLg5+ZmsNZZg=
X-Received: by 2002:a17:90b:390f:b0:340:c151:2d66 with SMTP id
 98e67ed59e1d1-3436cd0bb4cmr14245240a91.30.1762853718758; Tue, 11 Nov 2025
 01:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <fd549c974b53b5410dbf85c0cf6a1f9a74c1f63a.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:34:41 +0100
X-Gm-Features: AWmQ_bkZUqiS435kDnMhK6mmvyG8PwqBjo8fr1ltJrKRlyqzMnD3vTHwKYRZs0Y
Message-ID: <CAG_fn=UoQeoHh6Bpy0YOCywpfaimuYZM_d043JfxLVReW8PdJQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] kasan: arm64: x86: Make special tags arch specific
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

> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>

Perhaps moving this part to patch 04, along with the newly added
kasan-tags.h, would be cleaner.

