Return-Path: <linux-kbuild+bounces-3661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035D97E6EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 09:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13651C21136
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A194D8C3;
	Mon, 23 Sep 2024 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+8qrgSl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295EF3FE55
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078094; cv=none; b=jIrODh/lR5bfLyCY3pSaSVROXYw8CiGLF1hgaZ/fljIBUxSeInMwSh3f7hIrEx+yQx0o/55IEOvBABYRmZHi2M1jQe3FXlCDr87zLnGpMR0vTF5wnL8AS8Luscyxn87hdI68xUN4fflLfMI+jLwSpix4aewxyuQ3ru4WcqN5nqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078094; c=relaxed/simple;
	bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaZ0v1n9N69+rQnXCavz4M/LJ+QzM8RoKLWQF10G+4f8O0h33QY6AmAez0SOVNmlnb9NDPSQDKw4TvAzsXM3K5SdaQUMrA1JOpc7efSfBt1JBRbSfi+wkJeSHQi64vti2OJVCdCK3j4t+PivgvVFz6uXBwRm8LxKgYEf4Qn0rEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+8qrgSl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37a413085cbso1902441f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727078091; x=1727682891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
        b=J+8qrgSlCdnZ4ON6b/M+pDJ+Z2Km7lltvqYuZrlSyvlHh85zG2ysh42zwXadhBNQZP
         wJ1W8JSzDOrx2BSqJq2o4WBXM61uy7xLqUSmTztl4phkrBw/MIG2/wnifPIuibClvu8+
         /NBOx65FoWAbvyS4bbrGpvgb27s9lP7yAXnhhimv+y0Khr2q7isJlyhn58cDZv1sQFx+
         6fgQ+lSU8m5q9mOfK1PWaGY/i9sWVzMdXyHmyv3YZ4P/TheWvorUUDoDCpqAkdHbJ1Rp
         6LCPjehFaaeeWtcPZFTmWHj/nRAUzEA7KI4xi4IqDaZ94bMta/sg2QAjffjMoHD86rLf
         fRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727078091; x=1727682891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
        b=sRfnQ1JLWu1+bnIbzaC2C7zLwmPczBjQlOPzs2ru4b/JhYmT5AJoePsFb/hIHms+GL
         fNzw5WNoGh+cyoQgvByCdZILF+5o/Vjf0Y9QPW8J12v1m1q6qZMpcLJh3FpZEG0dQ58w
         HdmLtrnsH2NDqmg9kt1/bIZkagpyLYTn4UR3Uxg7/xK0Cc4RHNexWDOMit+9N80iBanZ
         1+ILnwOPzqV4G1Mj+qiOQpVWoeFTMA6K8fIiqEmPdLxqQAED7581B8K6skuqJ17hKgpV
         3felFzB3y2+sI+V1qyGswRbJ/HXaMFsfuftZt99/qVl4t1PtQj9HP0NcIBC0LgYOnAWF
         U6sw==
X-Forwarded-Encrypted: i=1; AJvYcCWqbDbmcg3y2A9GrIDe69/VFtJhXXEdEebAuxq5/63UdzF7go7h58KtWAz1XKSIt20J5I4CMPTTZxdrwx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcGeyHxjmorq1up7M0/V8ZeUL6RMnwqnqAIdB7V6CMDv69jf2
	BsvKyuxenRcM/2JOJt4FgVdvDCyYz2DpSGzvZoSnUGd3jR4k1fEz/HC0lEOVIF9uJRu1OD3Qv+b
	a2uiln1+XmeLugq3UAipIyCw4A6x4GE2q2s28
X-Google-Smtp-Source: AGHT+IGcu1iI3RhvLnQNs/RGwGpVv2dlXLHZmLTZXX5UKuX8D+yStN7YFyEeRfi9inoJZgWZ2+Vu6eGAVRkYgMRGeTE=
X-Received: by 2002:a5d:4f05:0:b0:374:d006:ffae with SMTP id
 ffacd0b85a97d-37a41497226mr6751368f8f.6.1727078091332; Mon, 23 Sep 2024
 00:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202409231044.4f064459-oliver.sang@intel.com>
In-Reply-To: <202409231044.4f064459-oliver.sang@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 09:54:38 +0200
Message-ID: <CAH5fLghbP3KZjkBbQe_MMJrnRpk4M0Hn0nu=uRtKWKqmKz6OeQ@mail.gmail.com>
Subject: Re: [linux-next:master] [cfi] ce4a262098: CFI_failure_at_do_basic_setup
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:35=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> Hello,
>
> kernel test robot noticed "CFI_failure_at_do_basic_setup" on:
>
> commit: ce4a2620985cdf06c200ec0b6dce80374237697c ("cfi: add CONFIG_CFI_IC=
ALL_NORMALIZE_INTEGERS")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 62f92d634458a1e308bb699986b9147a6d67045=
7]

This failure is due to an LLVM bug that causes
CFI_ICALL_NORMALIZE_INTEGERS to be incompatible with KASAN and GCOV.
It has already been fixed upstream:
https://github.com/llvm/llvm-project/pull/104826 (thanks Sami!)

However, we may want to look into having Kconfig detect this case.

Alice

