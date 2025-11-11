Return-Path: <linux-kbuild+bounces-9551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A1C4C8E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1ED18839A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF50732B982;
	Tue, 11 Nov 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxwuj8N+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926032ABC6
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851914; cv=none; b=TKTy1Q05bSWbir0TOk23Txh8ENPEAuOpTNmYVG8Yw0SpkCVkQjLtKLZG3liReUz0KX2DjvdGTTi5eyal27uepZMqm2t3OQ3HPvvbkHxj6/z1+sygE4QqFf3UIsGZSqQ9ATMIS/0Bl7GGOTMWvCb1lbkshDuc7yEzZk2FoZySD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851914; c=relaxed/simple;
	bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVszaPzDzKaHmaEvEqUaUJkM8X5JVnrQcPExbiSi5aOB7ElBZGcMzLao4wfTY2zX/wjr4FZZTcdw12Dm6cbZMdiAoFmG2T3iQEusoy5dsPUYwgypDZu5TS2q+vd4FVqyFQd6ct4Q27kmNG0R2usLBo6XUpOVq7dJkChcWM9JiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxwuj8N+; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-880499b2bc7so37185296d6.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851912; x=1763456712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
        b=pxwuj8N+6FMlJEpLxnknfBqbkKMIJjMQ5kcIRjfDYwC1MTl6v+eubvvxRKaUKaT/Lj
         6uIKiqu54GqazWaIxxRmbQTldf3cgIxIdN4H4NQxo/xYhL9rzHhjUfWWBBvaM6xhWrSG
         Vp4Zb7VrvVp8ML6alYf54k7KStXtaEGQVoYnXcQ3wJmMbGTqqtOZdslOVol/X8JtP5Eg
         8GnK0A3ee1M1AWZg84Dfh6bjPiESV+sw1Jcd1ec/qTO8Mt18Hgh0wA904TwJhuFMEU17
         /P2QGG5zAXT0RVhn7Cv7BVSzrhmEVE85BTJxMhzbAbGF79P3wkklqDSVuh8ui8SKLT+f
         ZaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851912; x=1763456712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
        b=PP8qtNFPdph0hmAH6gtdFbGCV9ShWjaEyFuSs5ro7tdV+XpIQTBOjtct2lMnquhWA1
         96zDB7R9TV/a3cYHPhLHsE94pMBocXrKiuSOig3qNnOVTLGWsl7GE3CHCAuL0Oqi0SSr
         0SIqIHKI0c8p9lnZMvIOBt1VmOytD0qr73lpRJO8Jqtn2yiqx0u3uVvs2nOdM37oT3Uj
         vEin0cemrUo2+dyoqTEQCY0/9AtlhVE/AVm7Pq4zN2gJl0xeLYEc8dleqnPFlRRpIxpa
         t1wmVRDK1KsFxOcPF8OqWAucU9HUH81c+dEtyUhAPpxgSLt7YzZvY7rju5ejmFGSod26
         8SBw==
X-Forwarded-Encrypted: i=1; AJvYcCUHcO+i9S0eGIGwdgLV+o7iRu5CKLl9sG7yNlVnqDPdCnXygp8N54qanEiw8wPQ7MwxaEoXbcMhZVjoQAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM50L0e/CM+d2LglN9ZTTBlSyHqRhmh7LbhJfQ63U5iaO7QHLK
	Glls43/aWbTkDxicD/vdZuIu3CNeN3lxPuu5yUy2Qzv1yw399dH1fdT3Nl4BX04tGfIWEQ+GXrO
	zEKR1dn6iSLmJSF7Vr/wjrLF6nS1uixHUY7tB7fqA
X-Gm-Gg: ASbGnctmnvxmQQbafAjxUMxu2bDMPjQs/jMvdOFcuHl71GWYS20F8tm6VBcjkfsSR1V
	VKfAKG2/qmVtX+KFz9LOwkREmteXxmTwXlP7QeZN2pnJBWYGinKZz1D1etNs0f0vegFQJF93jQU
	d1mqmE9G1vl92cFZGvo/TWFk8vteLOb/rvpTjuShhYa/RB8U4zgBeh7yjqUB6XDP6qh+6Yt5oW2
	jZf1hOyENc9QNIDSu/YS57JTR1RroAOYEQqJmzjeizeSislnQrQuipma7yUD5HpBuKAcrUI/mXD
	hHx0iukH7VeiIilhEXBu5eEPeQ==
X-Google-Smtp-Source: AGHT+IG5h9zoN8ZgQbNHnylwE6ej/e45pEoTj6YsGsJFK5D5YZvplepfzX5RbzM9p15i6Nqb6Snmeh5EikEQA067P+g=
X-Received: by 2002:a05:6214:d4c:b0:880:56f6:92ae with SMTP id
 6a1803df08f44-882386d7384mr151892296d6.57.1762851911409; Tue, 11 Nov 2025
 01:05:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <96559d5a8e897f97879259bad3117db617e21377.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <96559d5a8e897f97879259bad3117db617e21377.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:04:34 +0100
X-Gm-Features: AWmQ_bnTIARw6amUs-gvSQivLCgG0XY32k4ioUAxykbqmf67HMroMwsIF2IdVwY
Message-ID: <CAG_fn=X5Dr_Dc1pcnAW19zgo7tW8mUSkpDj-v5eaG-awy4S53Q@mail.gmail.com>
Subject: Re: [PATCH v6 13/18] x86/mm: LAM initialization
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

On Wed, Oct 29, 2025 at 9:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> To make use of KASAN's tag based mode on x86, Linear Address Masking
> (LAM) needs to be enabled. To do that the 28th bit in CR4 has to be set.
>
> Set the bit in early memory initialization.
>
> When launching secondary CPUs the LAM bit gets lost. To avoid this add
> it in a mask in head_64.S. The bitmask permits some bits of CR4 to pass
> from the primary CPU to the secondary CPUs without being cleared.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

