Return-Path: <linux-kbuild+bounces-7964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1FAFF7AD
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 05:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BAC3A272A
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 03:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE0CBA45;
	Thu, 10 Jul 2025 03:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZpitKHQU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B91A285
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2025 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752119121; cv=none; b=ukoHTh2JhId7sIQSWCq7NsSXX/9ciQMjymOQdcM8SuQGgdBbLo7HdwDV0Zwovn62qS4daEcFmFPEH+tQKGeMUPDkkD/S1NPkdmuM1gs3B6HoyJzCo23fy4+EP8CqrJR59nbGoCoVYhnM7Zt4H1SVgmJ/hbO1c9R5g8KMSRe2evA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752119121; c=relaxed/simple;
	bh=XUU2EwDs3wTQud0Cl+WmDya5o1Vo+KLmUY1j/ihV8Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw3gqmafy7guiDiAgEomN8aBPAwXbsQeDKfy1mn3fbHfAWF9FtACQh4cT8hD50pReeydmSLdB1+VxqJ14V8dIeLagSAm1Gax2Zc5nsLhR0VD2divI1VW0Z764pkRoN2wv4/MyJSlwdN2dcf8kyW1A/xDy9MOmYuTrIPALLLfQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZpitKHQU; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73a5c3e1b7aso268056a34.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Jul 2025 20:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752119118; x=1752723918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MoQm87c8Z8k5cIMa6HiSZvjUkFd8qA4WK0ftEEUX+Q=;
        b=ZpitKHQUWsKs3YhVfCK/I9In3AihAWxsw49Ioxq8oZHiSvrTiCS+6aDAjMRpOV0jaY
         E2pQbO5tCOzY4e63Iz8sF/7Bv4iuczGoOiBpiz0CBKE+IZkC7ZeNn7xRwqSmuZeBjTLE
         hSX7G20aCU556h3reefpVOFC3ttD1XeonqmOo9FWR73SrrkuPjv2h58/0bFE8GofFtab
         lDaf3OrT7WHc8LdGYECw3Qk9MxybrZN0wpQc4F6jWC5u03qLw1ByPPFJvbNgCDeyVGYm
         J9607o2gj9NdXoR1ViEzYnffXv24CqFaCVN7NKNYONKPNE7Qiau0MzYqeLsULaDTnIqr
         ty/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752119118; x=1752723918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MoQm87c8Z8k5cIMa6HiSZvjUkFd8qA4WK0ftEEUX+Q=;
        b=WeKBpKOTMHbTpEhSUDJx9LK2CCg2Oyvn3NzUKNZL4wVJmr3a++jUokRDEeyxVr3FEY
         1+AbE2C/b2ybSsLk6maKuxpYr8qOV7+dWUbyt6LwZpSQsBM6R9K/ffZ2x861AM1oxksI
         1u96TSxkbTlnF/t4GzyNbcnRDtJWZ64sAdGvFQnGVQ/PvHJLbvW7lYnJ94H9wDnliuec
         C4ki/UlSGpz29ocRVn+VMgF4ezkOOOeHCj6KlJXokro+xD7p2CEZYXVxs3hnch8vuQ7g
         A6rDifnQC5AiQZDLfSLKf7kLeyNuD935eehoAXUUjVviaLbCIGv1H9s6DOi/rpUZQbAS
         x/dg==
X-Forwarded-Encrypted: i=1; AJvYcCUpMkpZmfVGOorO2Sz45h7ovqVr/ejIINVSS/yTyq12QqTNdK3ZIvARXJuQf1FR8hwSpADr41ULreP/5p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFRBTwgNrZDJZemvF2LIggfoO+z+oMJ2Hv0cCTci1KfxL2YEc
	XoK4O5Y4nXhgCl2utDVw56kBolhNtgpPUDeBS3hgBUE7ZIiuj7YlmEMqIQhL/nio9jarmomDO4L
	8psCMYh7F0LSVnWN/yCAeVFFBLMzOMGH0TUd5q0iwyw==
X-Gm-Gg: ASbGncucGbEnafrgZIlIzgztW0pDHjMdhmsvR5esNQOSqdv0jauAAWJMGlHXIIxp/MC
	jM16j9VPvPMffN3zpxGnt+IAjImHMXjsZ+SJwy/D8rNQIYQ0wP2+d1Zd5Yy7o42e5JRQC3qKtsM
	Z6gXxt3ozPxUBAfaiDx9NtL7OYGx2QJ4cWkQ2zUZ+lY6h8cA==
X-Google-Smtp-Source: AGHT+IHRyVkZ57nzhyTKCltTrLPpMwsHIDQ7uc0ufm1hakxjYl3N48OH2yPl7P6OWGuq8y5vu9wPIRf0jtP4zFgzCA0=
X-Received: by 2002:a05:6830:730d:b0:739:f13a:6f41 with SMTP id
 46e09a7af769-73cf06820a7mr1087123a34.25.1752119117879; Wed, 09 Jul 2025
 20:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com> <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
In-Reply-To: <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 10 Jul 2025 11:45:06 +0800
X-Gm-Features: Ac12FXyE0pTXhJgf-CmJFYzzVTnilQd8t8nNTo1YCw7wwl6W4gnmmliWfCBZFlE
Message-ID: <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
	bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org, 
	puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn, 
	ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, antonb@tenstorrent.com, ajones@ventanamicro.com, 
	debug@rivosinc.com, haibo1.xu@intel.com, samuel.holland@sifive.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, wangziang.ok@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radim,

On Wed, Jul 9, 2025 at 10:20=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-07-09T19:42:26+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> > Bench platform: Spacemit(R) X60
> > No changes:
> > 6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
> > Geometric mean: 6.786839305
> > Reusing the current scratch:
> > 7.085, 7.09, 7.021, 7.089, 7.068, 7.034, 7.06, 7.062, 7.065, 7.051
> > Geometric mean: 7.062466876
>
> Great results.
>
> > A degradation of approximately 4.06% is observed. The possible cause
> > of the degradation is that the CSR_TVEC register is set every time a
> > kernel/user exception occurs.
>
> I assume the same.
>
> > The following is the patch without percpu optimization, which only
> > tests the overhead of separating exceptions into kernel and user
> > modes.
>
> Is the overhead above with this patch?  And when we then use the
> CSR_SCRATCH for percpu, does it degrade even further?
>
> Thanks.


We can see that the percpu optimization is around 2.5% through the
method of fixing registers, and we can consider that the percpu
optimization can bring a 2.5% gain. Is there no need to add the percpu
optimization logic on the basis of the scratch patch for testing?

Reference: https://lists.riscv.org/g/tech-privileged/message/2485


Thanks,
Yunhui

