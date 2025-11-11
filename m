Return-Path: <linux-kbuild+bounces-9552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA5C4C916
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED0F3B2DC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78E42586E8;
	Tue, 11 Nov 2025 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="re7owBYY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5E21D5AA
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852109; cv=none; b=afg83fs6/9qGicp936lLoyF1BFEVYPUtagmRxbbcLB24wAUy54hZNSOAJz8GCPRFvtkiK3F2kB0hSWjDON8y2FDyHOOCoNAhHKx2Y52DC6qJJifNNH15Vo/zWwZljskKkdrulj28MOzePKD2SqKa7PctjGjCzkDQ0PUC6un15DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852109; c=relaxed/simple;
	bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sxvq6Dst1wmWqrntaCq5T8zcb6mzXSe6DaEtQS57m+UBqfnFegPYUKmQSxrX0kwyvnyc97o/XHe1OutgPRxVcfE7UGmN3ZAXPaKY3oLozN99DV2qooeLbKn2YeZXIZ/a6MMXWT8gCHwWATV0M9918bNbHcrfWGehQCwZZ1S6eL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=re7owBYY; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ed861eb98cso45651701cf.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852107; x=1763456907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=re7owBYYJrPTlSNKQcwaizDxrcmieeRuYuQ41APdnT5aR3nqNB71/0eTrKHKW25OEP
         jTynEBUFpZV66AhtMhI4jLnGlfZIyJUVU4EXJ28JpI+PZkDvTnFJWHV+dI+G7fSkkBl0
         Dkq+syf8qK7jZJwla9m/9JurteW6JeSWRIUkJQ6wehbDMLDroCObvJY7rj8Ia3x9jzEr
         UShxa6heHm1cRyWSTdS3baRg9U6ikWYyBl8Gm8psmNKIBh6X4j3lkN2OAhpPlNZP9AWe
         Ub7W+NwTMX75zZuf3tosBVf37Te4F/toDtjYuVISvXTwJj3CuZVop913uiuMZaWwE2LT
         HmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852107; x=1763456907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=MS37M/Ol8chZ0JuSygOlwezRs+SHsMmuxf6+cMAlOaLs01AZOwBw6/RN7ajRvQ9M12
         1sPNgr1CfxKH0X5ADxCwCJF6c7tH77GJJ+JL7qFeabnTiip89mq+ze5ycFDWxBwDgKmW
         XJsIQxZcIlpIDt4pp8DOnzIH0+VtbvCsrtsTImDrVf4yx8C8KYDfmgcWd4t5Bt9Y5Lbp
         HrQkjr9EzXXETpL2PwYCygIQb6hPOHO7BLQwyxIJk2tLYFkVzBG2r/XSsIAs+op94+PB
         WM4biEgKaaBQ+/P94zcATwsz6f7rkyp3t/nKynjzbLfZhKInqczsj0yQqNIpvupmk+8z
         HeYg==
X-Forwarded-Encrypted: i=1; AJvYcCUsI2JvAUS1DS90R8qQ07EApBvICwqLwEIp+mi1C8MoWXr6Biq9jyGuNFE2V29n4/Qn6mB3slT2T0YY18M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxfvQV00sQsqrN/SfnoIVgbvqd1nDjR+Vj9mMc4HmfH3QXxMf
	N5ik+rA0tXaF5UQbtzt7H4vJDzafQgw+ZWjLCparYnoIjsO313F/sq9weWGG0ZWW1fp0P5NW/RB
	WBY+hH9i6Xapjfv1dce9E7+6LoSom+jkxME2YVCDe
X-Gm-Gg: ASbGncuNFoQ+YEiH8FcJCA6TfVthHMht8ZZI880IGjWx3Y+72vqVLA7Fm65u84jwJic
	WUNnZ09xz+gRmjaGb2fLBodw8iej/xl0qPr/I3J9ul50RQBSZAIMMmIWBIx0i2Uu2BjujGX2jBi
	YHQ4WDBnAGsBGut1S74hsmYUv9rSeYi/y4kX+MvuOihKMAbaD1Yu3O4qatdtBClNZS6zuaDrHD+
	U+BU5Ij3dAysupTWP9W0WP1ossZjzL9E/mKCpXy3EbsM0KRem4HL7fl+B87MqM7LksVRaB1vXq+
	4gJ5q1NaPU+rqwOY/Z4M5SFP5UHfDG1VHTpv
X-Google-Smtp-Source: AGHT+IGGiGzNQ2eAyJqdaO9JyMrXkP7w+emfDXwZMPoyyY2gy1i/zUBgnLRf870LMq5UXpv/uG8YRTM2WfKUuwW/Bjc=
X-Received: by 2002:ac8:5751:0:b0:4ec:f4be:6b12 with SMTP id
 d75a77b69052e-4eda4fd3621mr141844221cf.72.1762852106635; Tue, 11 Nov 2025
 01:08:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:07:50 +0100
X-Gm-Features: AWmQ_bksKNIR8oRrvQW5ElnBBjqadCFUKWpQKwYmKonXZ13JEF-XHOSa5ehktsY
Message-ID: <CAG_fn=U3SLOoy_K-2ShOMYf80i4AE1tB1AL4w7wcJAXBxi+PtA@mail.gmail.com>
Subject: Re: [PATCH v6 12/18] x86/mm: LAM compatible non-canonical definition
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
> For an address to be canonical it has to have its top bits equal to each
> other. The number of bits depends on the paging level and whether
> they're supposed to be ones or zeroes depends on whether the address
> points to kernel or user space.
>
> With Linear Address Masking (LAM) enabled, the definition of linear
> address canonicality is modified. Not all of the previously required
> bits need to be equal, only the first and last from the previously equal
> bitmask. So for example a 5-level paging kernel address needs to have
> bits [63] and [56] set.
>
> Change the canonical checking function to use bit masks instead of bit
> shifts.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

