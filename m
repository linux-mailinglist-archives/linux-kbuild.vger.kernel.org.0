Return-Path: <linux-kbuild+bounces-8774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7FB49AF4
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 22:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3E84E06F0
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 20:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E312E0B71;
	Mon,  8 Sep 2025 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me17E9qJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35C2E1726;
	Mon,  8 Sep 2025 20:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362769; cv=none; b=ooM0sTIwCgVQSAW6EHJLuBWnO1VNvrr7Zqnt2RxKvvhgdkwI1Kl7oBwb+n9NqnCFfaP0dim69AVB3LLNGfCOdI3wJ9+NjhEfo/pomAlyvkg/2BwsluraQo1XNwFIsBuuOfnYyD5crtuebUdfVd7CySlsADAsw1737mnvjnZbFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362769; c=relaxed/simple;
	bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8+MO5PFTJSCvwgZmQZpoFTlUl1fXoaoHJOfiwAMUlzIls8aNxK6pqnc9hUyp9GVb8hm3EoZv2Lpn5OEDxRODSK5KA75sn89ol71lspihBug0LrtD+cxhYK8TDdpFcyoqgC1Z8kPn3EDT4/mTlI/qTjpszhOg93xRssyxQiM0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me17E9qJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso1583125e9.0;
        Mon, 08 Sep 2025 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362766; x=1757967566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
        b=Me17E9qJwuQhED6UIZbHs1IKI06FKOrht9doak1IOzAiutUHfnFVmYoDNAkIqvFadg
         WxbjU3uNwU2Xt+h75WnoVHqtbNk5qZZzdHkdymBSTqDMxr+1xnGf71wVDVueBJY5efKX
         OSQfR/3d3sPXZory8KIbvZTtxDapVgTf9BJaQmXp7wB3BUv6FbNiZkLOuwoylewhToBA
         vu/54cNTdLNvKH+m4uPTNTw43bwqiz3IP4TpD21jU4LPQ52KN1hH7SNOtsxfKKG+R6hl
         5YmZ7YY3edcYCfZVcco/o/m8pBxMG/exdGLRqGR2TLXSO60uloQPprHE5VqWY2EBDKKD
         gSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362766; x=1757967566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEKhAzri7BBrxNHU6CjKqcmbERBZnrPEV1ur7Br4EzE=;
        b=wbfy49lCY/ZgZHt8VfpUIfaE2zCNcXAP4jTXyYSGg7ym8FalH2bu29otC1Qv05OA72
         JYAp8Kfvrr75TGXSgJcTOHJdZ7wlPV5Ek9bpEo5vQG+7K4jaVSut+JlclBVCYvG7WCBV
         QjTDsie0110PdwlxvthSHjlkCzXReFkohGLC4wMk7eTrXtc05tTdi59q58JQFwf6+pN5
         P5QZtsAPxJ1Y/tgPLF5PBTF5AjKWxhnkd27ROv0KnxSiXHjy23hc8OcQm5dus/BQbSZ0
         9eLy/3MHhgWpnrVM9xucmR9nmy8kc4r9TgK7kdzll0fRJNNIji44onjM1lJDsiUDD2r3
         XrMg==
X-Forwarded-Encrypted: i=1; AJvYcCW7lyywpxYdDd8zigbjQ4hbESoIuYaEGrvUeL4AHZQWxCxqsiOtBKMTOgUhiXzgF4ndDG23yH5w4A8mn/wX@vger.kernel.org, AJvYcCWFv+bhuNchDxGS/+1ItU9ssH3m9MOAe7bJbanIjglD7DmNZgmVU6nuIae+urcFQF0Zi7/47VIGzfI=@vger.kernel.org, AJvYcCWKT6K7xdLc3u0gUwAITMXUuwo32xO2BgpGCGyjQvTFCHNBbEq+1RQO04sUADYWsVxHwSssjXjghrH/lBmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzUO8dszxKLIpW+3xOQrih8x6UTLpzd4FOGwAmZ58w1abL9BJWQ
	JDV0pau+JQZLs1iqWfkCe3ClcyOEhEFW+DmTmkh+kDJ/gHrqpQzos/1BFTPtbkhNvidHy3kQROE
	hJNna13yMkY843dlq/agqCvmdCjYPcyA=
X-Gm-Gg: ASbGnct1Dcqe5clme/m3qVRkadVTBbXeJNoDQgW0CSF4zBevIhxbQSjmgIqCfKKYcqh
	irQ05E2XyazgGK5+GuL9rEfxs6kHlFCXftHY/MGM6U5AfcZxGxcR5LPN5oBKEnnYrUiGnJ9PdL5
	2ePncPJjSKszSwOkk7u6Knn5pyWU0bHY03A01hkltPBKX6mOX5Pi/SVixe0XA6OKnafOo5QmuE3
	tL62SxZ2JnD3rV568g=
X-Google-Smtp-Source: AGHT+IETXcCyuhskt8NfiuIvMZk4HNrRqt02JjM5fpQLtTPCEi8+CDkXKLs0cMppBKfL27M9u+6qWLgrHDP5cvo0P64=
X-Received: by 2002:a05:600c:35d3:b0:45d:98be:ee8e with SMTP id
 5b1f17b1804b1-45ded05bcd0mr4878465e9.1.1757362766098; Mon, 08 Sep 2025
 13:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com> <2xfriqqibrl7pwvcn6f2zwfjromyuvlxas744vpqrn2jthbzu6@nrhlxafjpfnr>
In-Reply-To: <2xfriqqibrl7pwvcn6f2zwfjromyuvlxas744vpqrn2jthbzu6@nrhlxafjpfnr>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:15 +0200
X-Gm-Features: AS18NWDjLBMTDDx-3GcgskVrIFrWTkldm4ARgshAhph95s8X05Rv1arvNW2pjfU
Message-ID: <CA+fCnZeem3pBPfhQyPiSAUfp5K0YdHFuRs0FZykF03YXVS-f1g@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common tag
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:12=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >Do we need this fix for the HW_TAGS mode too?
>
> Oh, I suppose it could also affect the hardware mode since this is relate=
d to
> tagged pointers and NUMA nodes. I'll try to also make it work for HW_TAGS=
.

Ack. I suspect you won't need to provide two separate implementations
for this then.

Also, could you split out this fix into a separate patch with the
Fixes and CC stable tags (or put the fix first in the series)?

