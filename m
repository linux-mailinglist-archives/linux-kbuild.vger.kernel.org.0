Return-Path: <linux-kbuild+bounces-9555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BBC4CA33
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5224C3A27F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802B22F0C66;
	Tue, 11 Nov 2025 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6McQrtI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF252EF662
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852997; cv=none; b=ALVBJKQMcPr1x4vtnSf/FEAocvlOJbkN5TbV0/wFu6jJdIypJFqYjaW4pwcNFsMEIaB3UHWAn5w68NjPKgoFKzWOwrO0hw8GJZdBUNzW+Pic+NHf7NYGxF0wtLIpbxtY1rC6tX67jVGJMpKzlmEsMW7HjZr1RUObm+Xeytu+PXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852997; c=relaxed/simple;
	bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ED+lKgcBY6HJlfEw7TipKGSgPnMpt9AHQ04boYMDPbcUgz9RqLnDzs9S5DGekWNh1iodOuC1DnmDgsuj5aIqcYmVdYcegmI1XTdqptCtzeIVIwy5n/tV+awfWmSAzSLvVOLdB6685k2yADu2YffV17DgoCAryvlr8xfzfG+MLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6McQrtI; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88054872394so58396726d6.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852995; x=1763457795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=G6McQrtIGCYwTv+qtUcpdpxsjOBOcbABhj3mgP1FPSF14qzrygXKRbZTfaBEW1QzXQ
         ptH3Eoj5bvdZcC09088K3MdhmAm625hZkmlu2ZALnmSVy4Nj5f7ioO62gatl2JkW9p+W
         1jXtM3MUjuew7NAMzeHrmR5t6sLAZhIM74qWg8gr8IbF7E187Ihj3yweySyWKcSoozT2
         Qnr99/VkuaRdBbh87x0j6Wx9VgMiDxfw9FmZloB2G/hux46/1UwpN2sZ07OD2gd5aO24
         uCD6TXHOo5Abh9hjV0RZtuvY9Juht4VuhNxS/8hC0bNGMpOc949ynwkIGYpllJ/GiXi7
         +Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852995; x=1763457795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW+BHIjHuyTX7OAC9AGqEECbSB0U1bNiaGYXhX8ud1c=;
        b=WvKOMi14N6E8cTRxOYXbPr1Lqc9BWu/oAU2qn0z89gzRTdken3SOtb/U14oXT/EuDr
         7kuSYLObT/JGkIEnlQ3Wp6/oYdwBdlibidQ/5B9F5uTg30QgQz9VkGA4bAZc8V+ygJFN
         +2roZsN6Bqut6PU4mAI1hBwDRSeF9lApQswdLDCjBAamEg8PDTdjInEQ4Vp7yiUsNVhb
         7CNm9gda5z1P2hoP11myMwjN1Vb75M/qktLmsEArYJI6YJsetY9Q6C5v9KshpG01alFy
         Sat8wcEWz/BrTxXJlYLMP2ZJuAFCrtkSXJZl9CD3opyZpRanCVcSpho7RMpnX00PQ5ee
         8WgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX16Mb9vWToKub0cZ4Qmt4OyDrlas9BocxlDFFIKU/ZkKnWKx6YJUpURq1eN4L4IupJjV2VJVEy4yxnDyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHxr3MoZa0pOBbJvVtG0Cnmep8RAbenGvqma+mJ5bFXlPvf0J
	a/9ftmtiahHl58Iy4MjyB1DVNYir+7lf6+6xzLHslHmVo0PRzKgUDwS+OjnBwx8H61QCqm1i8+u
	wBa0qkQN9WYPVFQ1HHBOhORDdGsXiRPrvvoQQlLVy
X-Gm-Gg: ASbGncuvIw/AkwQYgRT1XkrHt9MiGZ36WYdVmTBdnbq92eZ7LCOtIeL6tutsqj+yl9J
	W9h1kJa5edHUJ4UZHmtLGKdgEWM01sFAvRr1eSa4EH7v+BTxk9YIA6enozuC6P4s6Qd7s40u6q4
	5KihHYOr7RyOPNKz949Rq6k8j0MHO7i4We+/tbHo5Q+n6isF6tVDZnRcIkf4rZT6SUibnflH9jI
	WT8yVEKPi2M8CNKtdrm1UPnqCUpId4yO1rjRW4ThG4tHxz/SeH+Vv+CClkgjq83NwBbnD0X66kZ
	2x490MrsA2V4O3zp9EbQfSvjrQ==
X-Google-Smtp-Source: AGHT+IE0yzs57LETS85djEZyTYXW5DmddvlcMHLtxP59+D7EFGLVQ5m9xCUc4smiAAZV+t8Cn2za8HGBMs1SjTj1Y9o=
X-Received: by 2002:a05:6214:1310:b0:880:3e92:3d33 with SMTP id
 6a1803df08f44-8823873d584mr174202246d6.34.1762852994390; Tue, 11 Nov 2025
 01:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <8681ee6683b1c65a1d5d65f21c66e63378806ba0.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:22:37 +0100
X-Gm-Features: AWmQ_bn-gtNt_PIr26xFMqgMDiPlRCOzgcJVubPfw4RNrG4hXg8UIUOVQ0zkb_Q
Message-ID: <CAG_fn=V46UeEvrPb01VRk+60-wL0DA6Y6ZD5HAfVLzHcgRh+VQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] kasan: Fix inline mode for x86 tag-based mode
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

>
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

