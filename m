Return-Path: <linux-kbuild+bounces-9549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD0C4C823
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF9C44F3577
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CE4257859;
	Tue, 11 Nov 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bl1d6VmE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349F224220
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851700; cv=none; b=NgfeFaDIBNYjE2gF/CM07S/I9bHlA6riFYlhj0HtuGG+NFkv1PayiDxUA3BcmSNXtvuaKEb7OZSdYDXqU5muMTIk4beHOsgBy0q0p1OBRKsypwDZuoKfqNiaC8Qbb8oZgAg2Z/qJ3lRnhMYqu+ulRLNiAyodA3CHNbC0UuiiUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851700; c=relaxed/simple;
	bh=LQ/YVcrasx9+XZH+uzfM5+gmHZwPvR4UMJFJLgRCMmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTWLstIig1w4coD73xY41LigByRwRNRxrAB1t1/jL8/kguPdNnW1y7dncQlIUMghoIlAFBvAtLE2dL4Pkw4zOl5D6OiLziXYchNR5JMkgFMvqpdQqcJ4tUW7gYwMaR6E92DwSkHQg5u6h7rJYHlDVVAkvz+xSTgo127p2ZHMCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bl1d6VmE; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b272a4ca78so308360385a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851697; x=1763456497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=Bl1d6VmEn9R1tjzMZVvrqqf6DUSUrdoBGOZciAEvr6DaunbsmRO2Q4flGJvTlWK6zR
         nxhEbyb76+SEsLvEJsJwi5YkE/T+9p2hvpx4jxOqdt0USIIpPpfnTl4QnuIBjFMLSD8b
         pUNsPWFoRkX6fd9KP4hPGkOrOJeqQlXK3LmfAxCW4UlQgCYA+cHuBAhcg105DNmp+3yA
         PPQj4hK4GsPMJffmnYkpq37s2Q3mjv34n8P4lcEiVi6hhjGov7yrLoTC2B3FGuwmDU7o
         KudfRMc/26zAiG00BxD0MUFz1swyRPTGf7n7HlDce4f2I4Z9FDyRBMkW3zZJwOF1v4hn
         xyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851697; x=1763456497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=wtemucjWJSZzabIcxh5CDE6RbMc9Cgkwe+en3AaE7L/3Al0DrgjmsaXb6lIQHK4gQg
         7KR6c/J0rpGa1Hun+sonCwdiqz1RDGYXZDowmTb6wPzyfo+XgyNmP2Mtph7qHX7q8KeR
         3E95wjbe3y5VKyM9MnoCJ3w354ddLkKaAhShTpR+FKD9bhxbPwPVQ5ObtYbbjI+PnK4f
         3l/rEsZIATucS/In2L2lNL5+TM4yO/Q3bzUqs/GWe/cm3oCdhU6BbrLK2STymG55CWlK
         +QsYTRpJoSTCgtb1bR230TNGu23eu3cFW4eNGIWrBp5Buc0Zz9HB6YHiy7eurW2Hzyz/
         zyBA==
X-Forwarded-Encrypted: i=1; AJvYcCXRxF67hXqyhvvpHNpaG4sMDHZMuvfWTHEpu+O/rdh4/xOe+w3gqO2fdNQChMu15wUmNHJm7QpHlFZPRtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pS8IyabUEl47ukRWytaTlkakQjfrWEdXcrFYca6Vsgm6Ob98
	apxseBoCmV/oik2laxuI99hRePqNiADw5pNroQNsOC0qV8F+Y1PmTvAUQq2PEEj0jxsOKrKwsik
	kyv8hGbqhMWd97w7aw5LLPKIuGJ2mBAoUbHGzoZ/w
X-Gm-Gg: ASbGncseJtB0P5ASwdaIhc9Ic3bU5dWwIrgn0cDvWu2LAGZsyGcruMdpJQQ26xLwdYE
	idzqHraWDney5GBMFg1UOlrKERHp4YFh8N3LuYJcA4MjB2ey7bpmhVzmil6C13zvy56ne8GykWh
	NP7TRrpvGscy4n4v8fCKUtekQoRjLJZEhsIbyAkVvIIUIWctXQrR3Zy2AaTA52X/mRvBCyRJ2BR
	hWda2xHWZxvxLcvgMJg384jnuhmx2qEb5kLSbWIEYtB5TidpKxlAt242i2RHlJYG10Qgu3bwJvN
	RAju3mfLLyKqyzDRJN2EU9B33QyisW2hGi0K
X-Google-Smtp-Source: AGHT+IHmbNWz4nrBYzIA6dULAnEplmbnkhIWWkrftwGIkZuDmlgOtFs93CqEkgKXIfWxtOJB7Fa7kj8HnLkgxuZShy0=
X-Received: by 2002:ad4:5f07:0:b0:880:42a7:7730 with SMTP id
 6a1803df08f44-88238731aaamr156015206d6.53.1762851696507; Tue, 11 Nov 2025
 01:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:00:59 +0100
X-Gm-Features: AWmQ_bku8cq-CFmbh2Cbwbizm47o3PsCv7pQitKRdKmveqfrADnJlpnymR3GFhA
Message-ID: <CAG_fn=WPQZ4ti3Lb+A3jSXFWLtn6291sTKJBwKBiLD2E9YbuKA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] x86/kasan: Make software tag-based kasan available
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
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:11=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>

> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________


> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________

> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000

Please elaborate in the patch description how these values were picked.

