Return-Path: <linux-kbuild+bounces-7931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D095AFC92C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 13:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6117A3B25C0
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 11:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FED2D8764;
	Tue,  8 Jul 2025 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mDEy0/y/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070C2D8388
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Jul 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973022; cv=none; b=MNhl/FSWVZXihR+Wzag0JP1G/zHxoB6H21qkLUkXx1TE9J+2nL3fMxROdODpslOlE+1tPCZeNoZqqLD+hnxUY/2H/H/41aTLQHeBQlb8XijJ/56a2JniggEbJwtlgjxSel9GXq+HShuHc190TXkL1N2CiAYVeYOMGlVqh9Xgftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973022; c=relaxed/simple;
	bh=2C+JqpHcaKQzyLw/XGlAE8Mf08lSrm6aP2riDGNq9tw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qHRMJlzj8RpMcpqahOZseH+eM3AxJWV648U1Y40U2ZeG4fCDYb3P+KzmRyAowuXST5SsDZ0OrybwD/pBku0ciSYUwwI6N9ADA3NsZ6h+31CH0dKUnCvvMB5x7wVgLCZQUoQr0bRD8WfyKHwWfuV2sdTycXR+/qZmfvhJgukWGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mDEy0/y/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso541628f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Jul 2025 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751973019; x=1752577819; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6MXf+cnW7g75sWewP23Pqj+kzB/2yvPPFGN9ce4Tdo=;
        b=mDEy0/y/3+ecqdBLfjZwgeP91Dhla1B6c71uAKa4mUcdVrm037orrmJA9fDu2gJyUp
         x4nAn4gp2NQ7vHhIttdE7Bb2Rgm4dOSCU5D7GVuhVTGvH0C+8Y1wozQ4n3+gEMPcH6xz
         JFYo6w3/JSfDGPX58ZKtLRjls1BvyEBEWxLkcGzSyVnoVFcIJqlQ/16uaIWgKnG6VSA4
         LTU/x6sfEahu+Ito11CuWgbDopVt3elGo62Y3XaAKyDLQM0sS/6UfjmTsxi9ZpMKIky3
         sq7dzX7jbBIFju6ww5qrsu9NPCO8zIpNB0f7CzXpP75vq5yO1upYrNC6u8Cqf9dRTq3q
         eJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973019; x=1752577819;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6MXf+cnW7g75sWewP23Pqj+kzB/2yvPPFGN9ce4Tdo=;
        b=vTLWnHha75z2Nt+DMoNDO0GTgtiK8sa29bU5oaC7+GgESxCDZ/ZZ8DoHto5upY2btW
         RGtRHjKYspSfBhkmw4ouAc+qiwlBFXHpJFitZa4R/O52WAv66dJkI0hEjvRq35O3vHYP
         jmO17qMoylJhPDxzD2NifAf1DSqHJKaXheQCELvtMRgCsdpJvtOW7Dyn9rzk/SK8il33
         UjfkZb652Inqnt8zkiSV+9Xaxi4tyKg0sQdzn+Nzawq/DRA6OorZhrLgfhWjKs/DsXHg
         ++iglBmwSliEz+GJ2eCea8SaL8IcSMjgcvtK4EG/PEDAMJrS7LNy2syJVDhz2JsG+N0E
         nO7g==
X-Forwarded-Encrypted: i=1; AJvYcCWG8eqjeIJu2YhD39YbX8uRkZtScIVFRvcp2YDaI/YtCd29Bb5uFt1UcNgq94p9a7T0zLA5PEBxxEf6a5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtpiY1x+uGg98fpfslPKflk1jvZW+qfXFqV6BLCqnmZKgyyu5
	ujU0weYSvxe1IQ0486eRAulpbP+kPHZvQMvtgOzCkVIH71qv554g4ZCczbVFF8WhBEEuREGrUfm
	zLhiiO7o=
X-Gm-Gg: ASbGnctZd6RdebayviMVGstvLqYKGYE0S4rPehfeVCKII36hKU9XTXJXcpVJIGJ/4me
	g0pRsa3kffJ3ibY8jWVy/gzhLc1oXoNRjArlRy/U3wb7/VlJx0kO0pkNaH5clZ4iEXuxRnykveH
	knuWYd6KRzOnU3Dulz/1nO2LKRS04tvTnuoO7V5s8+daqeTzcgHeMjJyYdRQ5dJSLaG4LSTvnpd
	ouHlYJoPUXD/n19KPqhJg+zA7EZ8MINfWzMQaRRC0DWHDRw1UL1QjX4xZkB1hc+rr72xAqLxphz
	9EX9TRk4oqePV/m4ilQvbDoAD50vuhlesNRGBu2hXR2qycy5uJGRfiD9swINm5d6IZRD4w==
X-Google-Smtp-Source: AGHT+IHb7haycFhehS+DKxl9ZCTVbzrVRxhiVWGlwDogb2eAqYTCyJ2HxoLQdVlyupJK2TxFwCvY8A==
X-Received: by 2002:a05:6000:1789:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3b4966019c8mr4853212f8f.11.1751973018480;
        Tue, 08 Jul 2025 04:10:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f873:aafc:f154:af28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm12854474f8f.36.2025.07.08.04.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 04:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 13:10:17 +0200
Message-Id: <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
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
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
In-Reply-To: <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>

2025-07-08T18:07:27+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> This patch cleverly differentiates whether an exception originates
> from user mode or kernel mode. However, there's still an issue with
> using CSR_SCRATCH: each time handle_exception() is called, the
> following instructions must be executed:
>
> REG_L s0, TASK_TI_CPU(tp)
> slli s0, s0, 3
> la s1, __per_cpu_offset
> add s1, s1, s0
> REG_L s1, 0(s1)
> csrw CSR_SCRATCH, s1

We can minimize the cost at exception entry by storing the precomputed
offset in thread_info, which bloats the struct, and also incurs update
cost on cpu migration, but should still be a net performance gain.

The minimal code at exception entry would be:

  REG_L s0, TASK_TI_PERCPU_OFFSET(tp)
  csrw CSR_SCRATCH, s0

> Should we consider adding a dedicated CSR (e.g., CSR_SCRATCH2) to
> store the percpu offset instead?
> See: https://lists.riscv.org/g/tech-privileged/topic/113437553#msg2506

It would be nice to gather more data on the CSR_SCRATCH approach.
Basically, the overhead of "REG_L s0, TASK_TI_PERCPU_OFFSET(tp)".
(Or the longer sequence if we think it is worth it.)

Can you benchmark the patch after reverting percpu.h, so we include the
overhead of switching CSR_SCRATCH, but without any benefits provided by
the per-cpu offset?
The baseline would be the patch with reverted percpu.h, and reverted the
sequence that sets the CSR_SCRATCH in handle_exception, so we roughly
estimate the benefit of adding CSR_SCRATCH2.

The CSR_SCRATCH2 does add overhead to hardware, and to domain context
switches, and we also have to do something else for a few years anyway,
because it's not even ratified...  It's possible we might not benefit
enough from CSR_SCRATCH2 to make a good case for it.

Thanks.

