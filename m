Return-Path: <linux-kbuild+bounces-7949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAFAFEBE1
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 16:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D732E5C6875
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 14:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A661B412A;
	Wed,  9 Jul 2025 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cVpz1ZUT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A068226D1D
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Jul 2025 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070843; cv=none; b=tLdDf8TRAHFz1kGQ9C++DJ1VFupJBFmxHGc1tWARkug17ztSWbJ5hyC621YK0Y3wdsY9IkVlM0QJtnZ/PzkNgBwOIC2L7YCrT/gNRY7zy/N7l7bS6hQPRo4kH9b6bea++pA8qnpIPpWf6/5gOlnzVAiKqPXCAR/D4WSrFX8wq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070843; c=relaxed/simple;
	bh=nw6rWprVDOzqKFIcpKfFcQc0nmdA7H/jjCcoahqyI+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UGItdNigXgJfJ4rMcn28oe8wUrYVZKTdToygSJ7z7QDUWYqUbCyzJcvzT+1EWmGdFVZTZM95EtPZ3EC+BhV9Ih+zZxy63SXhJmEmoIg6nM0m3j1Eip86Qy08qbnuGgsGuqLzTXN7+m6paBYnvMKGqtJGPntW8eLAwO8wShuaVO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cVpz1ZUT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so185f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Jul 2025 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752070840; x=1752675640; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK5F0Psa0jV0e0OKoSTpS2uqnRAXM+Q8I3wnhMvoqUM=;
        b=cVpz1ZUTCRfYzWQIEn+0XNOpMBTFmmGz+oklBJjSkhWlJeERQ6EdG7Rjcy8M9khIUi
         6ZZOBY5UxnEFHkNPcyioIyKIKE4mrLHYI33Luqx+fWZnyhDJNnDn+FjYpQqPoq0Y/LbB
         YVjjWl3TDFMRqZS7MfihzR6VasFugq931pjr8oU6CA+Du08YZyXW1pnlTfOWT+vcf2rA
         uSe4Km9coU99xkxQD2yKbFYtdwuPb6qAl5BWPdxAJSl4aViyRcEsbqb8cve5sZ/PYkyX
         /M8qnFsB8wuD23j5Z2fg910epVGCQxtVn9Gr8wHBukFwPxpuLffx7sWWIgLfqWIC3Pb6
         0VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070840; x=1752675640;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oK5F0Psa0jV0e0OKoSTpS2uqnRAXM+Q8I3wnhMvoqUM=;
        b=BbsXw6YW3YOOmPwK43ky+fXQvU1LvT67FSoEFgcFB5g93+hZK91IiP5uMtDhtEhVZm
         wFPR0WNrxfuATTvNSxBg7BD5/WSNRyxkKS0DQIEc6tkXIT+32Eo6QjnC7Iad2GITZ3nD
         pAyTTtfey6o+OgGxX2S9ooqn6qDh54+zrcFY3Ul2aFwz06FWmOZ+Kvy69AAE5MWDGBqm
         z3pVRWPyuiCIVjAhEaLWCS38G2Y0yFFUZghTcDICoB+jnySdsN/MBrMgHU4x1bgCcYPG
         yZ4iNqZFh5nPQsD0V1WJpbtwmFyBkHguiL4EruoLT1UIKiuBDFqlvTvEQeqKeBwzTa6V
         sRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUX39Y6Zd3ELUHuPALzLLLQgLN0mw9reKCxH9rbS0bh+JOj8gzMlkTJ+uRk2QAZVquCXgbXI8LS9bD7F3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9YTKESP5nZy7zGy4so8OzUpGjZRb6i3iAGVqpE1L6VikZ5/x
	pGYAwqVbyyw4TrGTiISm3snPvUQfmiZe8KyAQBllXmPalZWgy/z/ImVItKAYcNY3X/o=
X-Gm-Gg: ASbGncscQMRjqw4kWyd1KcaP8FXYEDucSdWo3kgNM0V1wKkMSCH1IKUbZtUu1fAbdXw
	w+pHbOn+biALFn9DKUihHOb1nDEYc6eUAfmL255JgIS0AZrOIFbVsqlcQth3gnink3m4kQYSjv9
	5S94fnmmXxf+wubcpfIoAkl+HMPwQiBlNQPCaQYTbTp7ivsAnfjosVEjWRJRXa2UFnSsLhN7OXN
	k/U56Ak9SZFmymAGyi48mEB7WoGuUBxpPontH3h/hCCbnfSyLOS+I10GUojXDfhHbLgGjnISb6U
	BVyYkk2cjWOfY7LKNGHLri1FKvv/GytA/3ENU4tyykJ6wn8D53MmJDz3C3zDZ2wdYEvJb1TxnVR
	VDO5tiKquJyjyORJexSTp1Wm0Nxl3fRYz
X-Google-Smtp-Source: AGHT+IGxkkezw4h7f5aRtHdd0JhI8ZNN7qdtxJAKXsiUxUxHmPLMlNUPt+KptfBVUix4/wS6yDYi8g==
X-Received: by 2002:a05:6000:230b:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3b5e44e1087mr940883f8f.5.1752070839628;
        Wed, 09 Jul 2025 07:20:39 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b472259842sm16047493f8f.72.2025.07.09.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 16:20:38 +0200
Message-Id: <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
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
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
 <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
In-Reply-To: <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>

2025-07-09T19:42:26+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> Bench platform: Spacemit(R) X60
> No changes:
> 6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
> Geometric mean: 6.786839305
> Reusing the current scratch:
> 7.085, 7.09, 7.021, 7.089, 7.068, 7.034, 7.06, 7.062, 7.065, 7.051
> Geometric mean: 7.062466876

Great results.

> A degradation of approximately 4.06% is observed. The possible cause
> of the degradation is that the CSR_TVEC register is set every time a
> kernel/user exception occurs.

I assume the same.

> The following is the patch without percpu optimization, which only
> tests the overhead of separating exceptions into kernel and user
> modes.

Is the overhead above with this patch?  And when we then use the
CSR_SCRATCH for percpu, does it degrade even further?

Thanks.

