Return-Path: <linux-kbuild+bounces-9553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D86C4C97A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9E03A5CD1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D9B262FF6;
	Tue, 11 Nov 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SKVSTcn1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44629CEB
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852314; cv=none; b=Czgjc9XQa3rOwLt7JK0URiDiNI7vCxc7dDu/dPGJf5uiHG7j7s9ddhCElGSFrzbsejSXn6n8bYINeL/SrJ8ALyc7FetLmP+Nx8CwQ+5OFOgd7vo/HmGWPtDcmvjPfgSBj05a2dgBejysA9fGlUdI23b/VHBVspssGw8Zc0L8ckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852314; c=relaxed/simple;
	bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6945gMCNeBPMvjf5S6QwhIBMjiFcElOyU9vn5mkhgzkcPmLQUi2SWXGivLZvcHinUZzLcdCGZWIdA+1EeLzRgCG3N2tCKfyxoHVPgbnWvg+4ble7pYGA3t9iQ/UOHrKpOru5MIQpNmM2TjqKnN9RKdXUzW3ypGEEbqMELqbPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SKVSTcn1; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8804650ca32so39403936d6.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852311; x=1763457111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=SKVSTcn1nqhQszrNr1vdsVjq8dSl9VoDABDmD7if+9Te7wJ6J6rDS7S50aJ5F69y5E
         k4E9UZLYEurZWvTFPpJtJmpQVO3sKLOFk33oROWR9PjaRKPOsNd9aIYs2Y4bP40twuFV
         y1wrJMuvjyGBhkWCw3NnHtMMBsAFT6HV5rwS0nU4gPbq3bG2iZG/R2yPw1hk3j+U4wY4
         bsViKBtjl6JHn12zl48f6GCXe8krAM52fMG1bqA0czRerGWV5m+KbPcl9pnvA5BYIhhw
         DYQCwvEA9PdZfsUncWAr0Lmvzq5AS371Eb5x39GczPqGUwPamAPNdAGl6KWLGNK/6P4W
         kvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852311; x=1763457111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=QZWvpX9iAcT3fXAgpTEfuEOwRCVz5184iRmev5de5ixteJWTTLG7qwbnXyB2WyJVwb
         4XjojsI9bgQuLcoaQJ2b9KD50s/9GIT3oOmXFxxLZci6erJX49TVR77PIA9dPzrirqsX
         pyzyYgYZfKZz0qoU88nHdxkG9fmQEVQMQ6SuZTYngVWWRIeBc35PyrpYcJ1iWLXqbNT1
         wLxwy93MT6qFk8DwWuIh47m2xOeyEOEd7udLeky+Zptjr74y6Hyyn5PNVtNleUCnlgoT
         G+p5G3Pqwyu38zcCD75+pIUe5MrSSWNzw6U8KWfS6gkw6m4Vli6ZGBQH6J7RvQsKBU4n
         P+yA==
X-Forwarded-Encrypted: i=1; AJvYcCVSvQnxaqD0II79TNYQcvH61hCZ4MqIWk6ORkxuehbZtYD4s+d7zaF/NZ/r/cGZ8uYFYHrzS7avHwsqYEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB+xodctZSMY0GsFBZJA4YHhLBuRCD7ON94OjmqB1InUGkmeYe
	WTyY64bH8CUoCHFwkc4H0GQGqAYIbianQkYZ+UxIyWE2d1onyYRHMRQAvV4wEV4qrcNindJK69m
	suazZq39h1RBRrTcLvcEhzGseJ82L6x5Tbj+V0Aat
X-Gm-Gg: ASbGncu15rb5RRwNgTG3NAhvez180890lIzdaErbIZVM/S2ND/sWQtTobkbIAp/87ep
	OnjSvr+ecvIEBs0vyGaZfsFkBTnf4dATcpBfimt0YMmey1MnZddxapSHWGFXRq6PkIQu2IuHq7k
	TCUqaCoR+ZB80Or9z8sVQs/zV/CXBn5g3JlAKu0kxetP9I1QMhGV6vHV483XHHm+GMSW7fp6J2e
	kDd0oBFAYeUSIelx+i2su0KUN9q0dP2Q0Bh85/VNl0A0WfoTovXils9RTl2Aa6U/rFssYjcM/iZ
	jRYih6RjMdNAfO8uoRnaCU1NcgloBmAB0tmE
X-Google-Smtp-Source: AGHT+IH+IyV5M3UDNVO30prt5PPyyx1n6sQAkg8H+r/cXESUVZ9Sxny0Upk5iwgOz2Gyh93ucwAfPrYSF2wYVT/cQJo=
X-Received: by 2002:ac8:7f84:0:b0:4d3:1b4f:dda1 with SMTP id
 d75a77b69052e-4eda4ff2f1fmr126391511cf.61.1762852310737; Tue, 11 Nov 2025
 01:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:11:14 +0100
X-Gm-Features: AWmQ_bnrR-pK5Rc9D-XEScjrYr9MOeawukkWZRpWJ1yHRGagV2Ym8rHVDa4nqXc
Message-ID: <CAG_fn=X-FB6vVtDC8WhQzF7cNePS5AtmC4W1-YfTce+5jOc+wA@mail.gmail.com>
Subject: Re: [PATCH v6 11/18] x86/kasan: KASAN raw shadow memory PTE init
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

On Wed, Oct 29, 2025 at 9:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> In KASAN's generic mode the default value in shadow memory is zero.
> During initialization of shadow memory pages they are allocated and
> zeroed.
>
> In KASAN's tag-based mode the default tag for the arm64 architecture is
> 0xFE which corresponds to any memory that should not be accessed. On x86
> (where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
> during the initializations all the bytes in shadow memory pages should
> be filled with it.
>
> Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
> avoid zeroing out the memory so it can be set with the KASAN invalid
> tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

