Return-Path: <linux-kbuild+bounces-2733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D693FFD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 22:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F0F1C218F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 20:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FAB188CD7;
	Mon, 29 Jul 2024 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ineyUz0G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D918732C
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 20:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722286388; cv=none; b=oRxjO+DKhyRWjSipVw0c4MrNOMJYhp/TLLkEaE3qi69P41nRtLvBHF8/LTDBh3cYgkR61eLscslU7J8OSupbOvj70OAAYx/jwUdDLm2pmLqeILMCx5HRWXj9ieZpLrt4kbCsbwEJWB51GMEJCppl/LLEb3W7OytZQqyATpCgZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722286388; c=relaxed/simple;
	bh=29JW7/dtjpDrW5DZNhY9crHWpW8ENrh1RbNqrfIMOPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxlhy6g+YzUp2bVPtgRRI2cqeQk3RYXsn3j3ELtE5LQ3b1AN0Fo++ZEaQ3WFtGNoYZF6+tseNZUU4ugqduRvkoIwGElKZXp8Te7i5DVAIOdhslFt4LF45cD/qcjY3vs434xyqde+uAyE+ZhGRVa5ga17x5BmukuQWWiVShKDCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ineyUz0G; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fee2bfd28so28571cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722286385; x=1722891185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29JW7/dtjpDrW5DZNhY9crHWpW8ENrh1RbNqrfIMOPs=;
        b=ineyUz0GGNj5orEMaw13Gq3Ve9i0/saPuoYdIITTcP3j77Rgt+3qS9yy2j5SBd85Co
         gNOnImi5AWdNIMuUIgfJnl7fii72bOQ46+lp0KTiuNezcHhlj/zXqio/qCmO3zk1zvKc
         NvZK1Adc7nxuKS5Rbw5niY3BBRVpAmZbexIk4IZGDcjKglVFV0aK9QcO7Fgg4qWOcgGs
         r+pZsnw7vvGvCa0yDNALESBmqNo4qQmoUloBzzWipuqYjitAq1bWHiTi0FqwdRVlYiQG
         wjbh1SvUY/EapqhSPGZTTAJ0vQ2dbUV8GSFGI5k8AASDiXbpMrejSAi8jvrlunvQ8E0v
         5dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286385; x=1722891185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29JW7/dtjpDrW5DZNhY9crHWpW8ENrh1RbNqrfIMOPs=;
        b=bhf+iivBA/ps6PNhmz65dZvsFH0hwYPs45D4n/E66HMSsMqgp/IzGcnx/Hsbz2rMLT
         55YhIydKkv1d6DvbhCYIb0/bqXTi3pHqKvUmFmvjMdhA2ye5AYqZBxDw+BFXH+Eh/tjE
         8TipwfXczJR6Oem5pEx2gCA++mVR3Hc2q5nyqj6GB+vPnQ+aVIJjZCk19P8BlDR/b4HG
         2SqcSAGM/zJEYhZEun7y6sHqUAaEW8X8308ABI41P4OdhFQQMQn/uawJwV4lrbVH0jaZ
         a71yLnAo6iuhv30AbVBoKGtUXfYwW8A7H0hj4Vt3c22JlAgewc0nzDfs12rHh9ZerTPe
         C+iw==
X-Forwarded-Encrypted: i=1; AJvYcCWeQuuLqMEG2JlYN8MZn88fU2v7PYPOjIJCe4kej1K5uHOwXbxKwtBWTlO9t/C6BNTDpkAh6mAP8G+Uzq88VQ8XVMiwine7VhTuvt1u
X-Gm-Message-State: AOJu0YznZw1f7dK154INecmQdJNklJxVxWMfXIK0BYecLJa6eq27WKTV
	dcTPJ/287/fFILrBafrQC6oA2/vch/YQaRS51OLEK1gGGqDR6cePX/BJR0TJzpt2vx7da8vwNLg
	PGWhKi6pIQQ8cxTOZu5bXTQUn1fYoZ9yJvXtz
X-Google-Smtp-Source: AGHT+IGdqHt+6En/vkut7lMYPmR6m6S3gJX5/4bnNDNPFadeFEDiu1DKJHGnDb+xcPgIp5dT/Iy1GTSikIgnXMmJuos=
X-Received: by 2002:a05:622a:4cb:b0:447:d78d:773b with SMTP id
 d75a77b69052e-4503634c227mr56671cf.6.1722286385326; Mon, 29 Jul 2024 13:53:05
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728203001.2551083-1-xur@google.com> <20240729085052.GA37996@noisy.programming.kicks-ass.net>
In-Reply-To: <20240729085052.GA37996@noisy.programming.kicks-ass.net>
From: Rong Xu <xur@google.com>
Date: Mon, 29 Jul 2024 13:52:51 -0700
Message-ID: <CAF1bQ=RfESfkYj3DPHjjNOEJxwwKBHgYp84=Tnk4=NwkjPuMxw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add AutoFDO and Propeller support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	David Li <davidxl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, John Moon <john@jmoon.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Mike Rapoport <rppt@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Rafael Aquini <aquini@redhat.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Eric DeVolder <eric.devolder@oracle.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Segall <bsegall@google.com>, Breno Leitao <leitao@debian.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Brian Gerst <brgerst@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 1:51=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Sun, Jul 28, 2024 at 01:29:53PM -0700, Rong Xu wrote:
> > Hi,
> >
> > This patch series is to integrate AutoFDO and Propeller support into
> > the Linux kernel. AutoFDO is a profile-guided optimization technique
> > that leverages hardware sampling to enhance binary performance.
> > Unlike Instrumentation-based FDO (iFDO), AutoFDO offers a user-friendly
> > and straightforward application process. While iFDO generally yields
> > superior profile quality and performance, our findings reveal that
> > AutoFDO achieves remarkable effectiveness, bringing performance close
> > to iFDO for benchmark applications. Similar to AutoFDO, Propeller too
> > utilizes hardware sampling to collect profiles and apply post-link
> > optimizations to improve the benchmark=E2=80=99s performance over and a=
bove
> > AutoFDO.
> >
> > Our empirical data demonstrates significant performance improvements
> > with AutoFDO and Propeller, up to 10% on microbenchmarks and up to 5%
> > on large warehouse-scale benchmarks. This makes a strong case for their
> > inclusion as supported features in the upstream kernel.
> >
> > Background
> >
> > A significant fraction of fleet processing cycles (excluding idle time)
> > from data center workloads are attributable to the kernel. Ware-house
> > scale workloads maximize performance by optimizing the production kerne=
l
> > using iFDO (a.k.a instrumented PGO, Profile Guided Optimization).
> >
> > iFDO can significantly enhance application performance but its use
> > within the kernel has raised concerns. AutoFDO is a variant of FDO that
> > uses the hardware=E2=80=99s Performance Monitoring Unit (PMU) to collec=
t
> > profiling data. While AutoFDO typically yields smaller performance
> > gains than iFDO, it presents unique benefits for optimizing kernels.
> >
> > AutoFDO eliminates the need for instrumented kernels, allowing a single
> > optimized kernel to serve both execution and profile collection. It als=
o
> > minimizes slowdown during profile collection, potentially yielding
> > higher-fidelity profiling, especially for time-sensitive code, compared
> > to iFDO. Additionally, AutoFDO profiles can be obtained from production
> > environments via the hardware=E2=80=99s PMU whereas iFDO profiles requi=
re
> > carefully curated load tests that are representative of real-world
> > traffic.
> >
> > AutoFDO facilitates profile collection across diverse targets.
> > Preliminary studies indicate significant variation in kernel hot spots
> > within Google=E2=80=99s infrastructure, suggesting potential performanc=
e gains
> > through target-specific kernel customization.
> >
> > Furthermore, other advanced compiler optimization techniques, including
> > ThinLTO and Propeller can be stacked on top of AutoFDO, similar to iFDO=
.
> > ThinLTO achieves better runtime performance through whole-program
> > analysis and cross module optimizations. The main difference between
> > traditional LTO and ThinLTO is that the latter is scalable in time and
> > memory.
>
> This,
>
> > Propeller is a profile-guided, post-link optimizer that improves
> > the performance of large-scale applications compiled with LLVM. It
> > operates by relinking the binary based on an additional round of runtim=
e
> > profiles, enabling precise optimizations that are not possible at
> > compile time.
>
> should be on top somewhere, not hidden away inside a giant wall of text
> somewhere at the end.

Thanks for the suggestion. I'll move it up. Maybe after the first
paragraph in Background.

Sorry if you received a duplicated message -- I'm resending this in
plain text mode.

-Rong

