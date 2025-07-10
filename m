Return-Path: <linux-kbuild+bounces-7965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DFAFF9E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 08:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A423B9B88
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 06:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEEC21D3E8;
	Thu, 10 Jul 2025 06:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="X+0uBzm3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D02253FD
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2025 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752129320; cv=none; b=NtMXSDs03caAIKy9XB3WDUSNRSyyADb4HrIfrKnHgWTRIs36AmEDm7/oQcerOXLtAC78t5O6r2we+uWgEovKL0BOUmPs/Y7X882HYwYSNmXsboKP7mR8Fl7W0nJf39l6lsfxxOe/dOcbu2Ecdz0p1xcXOrOy8/U/XYwnUJSn6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752129320; c=relaxed/simple;
	bh=ElqAfZh2BVgxfhGm74ckQk9GyfGSk4GuN3P5xEeR6vI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Q8stPDNsdgCyeZDSa8pVQp/bIpdmpbVvV3CaKcMU4yyGUk58JueFjs+wR0wn8eY5KLb5nqMso5GIqgz+9Ofjf8LRu79i1YtN/+kPduC6bxb3wMIk721NE2FzsAxc/l3RWtcdnOUEuBvmC0apgi5fNlubrp4l3acisjgbwPfYgQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=X+0uBzm3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so88144f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Jul 2025 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752129317; x=1752734117; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyhfcIGHykgvkrP2e/H7VmjAsjt0CsIijqEuhYmyjZA=;
        b=X+0uBzm3bi+AK1j8teGJm62HTgg3xswH/ObRCwbigjCBub6q31LIs/ErO+9bVytq0L
         V9UCRLl79uiw7COf3DiGJBbUvfGByyNGZPUGiaicMVFsFQ5eXV1EyTpfXUwH9WmKbSeM
         nh703dBsvxKH3lTYadSAcWn0ASS+7t3ObCUB71PlKHVTsaDw+49Syah/59cHUfUfcl2D
         uR40EpftrwRos70HsLyOA+iTOdWsNfoDmnLPzSbYLRSrNVr5j9RzeoW3OUbMVFK0u4t8
         oRq/mzhJtHedOdhZYlWanarZid56shttN2rcHTjcmfu62l9w1JzPl1B2aV4KgNRznX2m
         HUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129317; x=1752734117;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyhfcIGHykgvkrP2e/H7VmjAsjt0CsIijqEuhYmyjZA=;
        b=QGQR2ja/xz1Hn07fty2GFVOu+Rcgscy6axon+AeV+1LsD+AMxkQKFB7HVzrVZsAhdw
         qnbgCIkjus89aJWMukidoGwu9Cqyyr7WXamVGHW9fM5QHFsaxoS9TA+1PBhnia2RndIH
         5tCW72ex01WQr0x5ZHyGwl7cq/kk9KN6xAht/1EJW5JZbmowPmUUTd4uy6YTx8mAdCpz
         fWOPN+efNrWQUNqCo3C0SFLrOlY05cAtv7n945ywn354BKKE7rgcOMgKfz28Eq1zr2lV
         ILwkL4tnYFAOuhW/4cTvq5+MZT4vwxkSyZcw6dvVx03a2jbDqRdJ3L0ARSmiZBuKL954
         ZcZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQmmO1XCOMFS8LG+iZSRArbKl4/KeD+jpDLGahO1aCued5zyft3RZNjBMOiOW7K49efPVDb+FswQ7M3Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwWKcVCVa5IuEMGNOZlm8WpQZe//WP5b1LT8JcjvCZdtuCnew
	9U959UkfyLodAQJ7rGt0H9J0JlXl+vECxUnpzYkdJKRMv9fRdO3i+biIUhwCvvHSaAw=
X-Gm-Gg: ASbGncuX4W0r7uEt/0A/OPpnKQclVQ+4/KOfXEWYYdajm3hYNhRKNN3eVFODFSZ6Zzh
	u4/EfmmK8f0eOjM6zCG9yaNi1CbC32CFZRF3/9shj5xFfevFBDTICUnPtaYrNwlkkLPRD5U3SGA
	Gm+2agmDO+iU6t15BmYhqfNclAWoDJaaBFfXcJxbtl6lxj3kwh/LgCPWKAEAx9pE21Aj7eJXvQj
	w++18SpOwomCHgnGXQcfXYe9BseSiuHgU6hqbpYMbiYNgIywA+fWZNzwEMElCwEJHqhZVMVTAaX
	MV/3nDoDj3+HoaFTw4h+AuAYp6d8d6CSq+3FxJBasGjFM3XI7l02r/MWpm/NHnI9uWqD0Epdr22
	5G8mtNYu/hNZ2iU2E6vcWIg==
X-Google-Smtp-Source: AGHT+IEqEitaMgB8tObGyqBHxc/XW6tkIZ1LssQgO+WUWZXRaXyhTeRPn6KcRlFtzKo7i/2kYbIvaw==
X-Received: by 2002:a05:600c:3584:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-454db9090c3mr7110435e9.0.1752129316466;
        Wed, 09 Jul 2025 23:35:16 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb381a6sm57354855e9.1.2025.07.09.23.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 08:35:15 +0200
Message-Id: <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas.schier@linux.dev>,
 <dennis@kernel.org>, <tj@kernel.org>, <cl@gentwo.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <andybnac@gmail.com>, <bjorn@rivosinc.com>,
 <cyrilbur@tenstorrent.com>, <rostedt@goodmis.org>, <puranjay@kernel.org>,
 <ben.dooks@codethink.co.uk>, <zhangchunyan@iscas.ac.cn>,
 <ruanjinjie@huawei.com>, <jszhang@kernel.org>, <charlie@rivosinc.com>,
 <cleger@rivosinc.com>, <antonb@tenstorrent.com>, <ajones@ventanamicro.com>,
 <debug@rivosinc.com>, <haibo1.xu@intel.com>, <samuel.holland@sifive.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, <wangziang.ok@bytedance.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
 <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
 <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>

2025-07-10T11:45:06+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> On Wed, Jul 9, 2025 at 10:20=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>> Is the overhead above with this patch?  And when we then use the
>> CSR_SCRATCH for percpu, does it degrade even further?
>
> We can see that the percpu optimization is around 2.5% through the
> method of fixing registers, and we can consider that the percpu
> optimization can bring a 2.5% gain. Is there no need to add the percpu
> optimization logic on the basis of the scratch patch for testing?
>
> Reference: https://lists.riscv.org/g/tech-privileged/message/2485

That is when the value is in a GPR, though, and we don't know the
performance of a CSR_SCRATCH access.
We can hope that it's not much worse than a GPR, but an implementation
might choose to be very slow with CSR_SCRATCH.

I have in mind another method where we can use the current CSR_SCRATCH
without changing CSR_TVAL, but I don't really want to spend time on it
if reading the CSR doesn't give any benefit.

It would be to store the percpu offset in CSR_SCRATCH permanently, do
the early exception register shuffling with a percpu area storage, and
load the thread pointer from there as well.
That method would also eliminate writing CSR_SCRATCH on every exception
entry+exit, so maybe it makes sense to try it even if CSRs are slow...

Thanks.

