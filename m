Return-Path: <linux-kbuild+bounces-6616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9993A8A5D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 19:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7BCB3BE727
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 17:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9AD21E08A;
	Tue, 15 Apr 2025 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGQw7H/v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9D20ADD8;
	Tue, 15 Apr 2025 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738785; cv=none; b=GOqcbK3Xw31OLek8qtJ11pHKHY6+85KxJvfEcMr404FjGOxoA+M2n9QzH+/VV+2GmlU339XVuc+o21Q2F0LVHlJV8g/q3dGJPBoJCCZ66sYJq1EGwRketQf0BdKO8T7zJVG0mZ6aFIrmiCA4mlHCLO+eARm4un0UWBIa8PAMQoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738785; c=relaxed/simple;
	bh=1OgdAc+XMf9ceuv3aO00YGNV+dWHLwywXLVNSuFAj58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cE0bpfOwNErJ7MwnI5Xo8/8SCHuXos5Ao4S/aQhVz2rxLRXmRfvP2UzPYpn0np4DwDw4S0ilLpEU4eIf8Zcu6Cb/jUI5ndOUfE5NmyCw1RJoHblPjM71wOHSO4rYm/L4Vc6gPNWDNofAqp4pjSNkKvPz4IV7GFBWjRtscCOq0ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGQw7H/v; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5040235f8f.1;
        Tue, 15 Apr 2025 10:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744738782; x=1745343582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7WHnmwev1Rd+gE3kqETUhHFn9A0Fc9wyWPE7zQNdrY=;
        b=jGQw7H/v1nhSzGt5Tg4EpGq4SQwp1UVtUVpPF9ajS/0ZhjOACdOk2QqaVTezfC9x3F
         7efJgQ92tLxkGEUE6G6zKkDfW/VpScBFaRzachP/0Iev8xi0wLj4u3sK8Bp/jvJnsSOh
         5llOFnGlM5EhyXCfOesdVgqdJ0KHDXV/Fn75/Bf0eqQgzOk7z0T+PDUtUPHD0sT1kaLc
         P/1BosvNT2UQkaWJr5DmORkvUDvYWSEd0UCHsUjlMhHwPcrukY4hXxTGcflTDOBngPAt
         7Up4e/ElJH0YKcGc0ply2WT43ZoJqv2KhH59DBq3Ntk1fC80agjT3PEde/WQWj3p3AwX
         udcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738782; x=1745343582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7WHnmwev1Rd+gE3kqETUhHFn9A0Fc9wyWPE7zQNdrY=;
        b=nhtBBfCbu2pHc+EVk0RiQihp0rKfmmzJ1K6YEqPnDukykyVj2kyWLaw6WUNWfF+5vt
         BnLWYBCsMAaI6dQRjtKq9Vf9yjJWkfqzmhPuhHl/sPQEfRsDI5CzQY/z8/KI6TKZNebE
         v2am34eYWLoGgJn14OV55lg6CsyI5sIauolmGVuW11JpPtoH3B4BNfS27a9kvj8SYPrT
         GwMp5QY5pgJYG2HYIaAZlJn9d1EwWGm3CyrPS5bcRBRWCTjiQKGPp3Y3yRAN85i7QVoL
         ui+wcfjkzR3Rlf1xAAxPmZPvj75PigRIwVvYxtFae079wsfK4QMKiBVytti6fWrbH6cE
         sXgA==
X-Forwarded-Encrypted: i=1; AJvYcCUin6B2/KcpHDgsXbmdR+EuriMA8IUayzQ8IovL1YCddC4R6J6Cc36iIcIRwwbw94X+s68mf46pomc1iAk=@vger.kernel.org, AJvYcCVTX0SpLeSSUKMXRPgLDjyPlo3h0bD2ujYJQjbV3U+PTAZK+tWX0bjyIC+9FaVA3wtmQqeu04hPQZCqtEha@vger.kernel.org
X-Gm-Message-State: AOJu0Yygt7ld1bsJKSHV4Eo5HRmPYi2LAINO+NRB9yquHwzi5ceqVJxW
	DQjoaHaDtub4JXF7O4azr2YaOpBDydGMEL9SwOdmASe4JtKT8lty
X-Gm-Gg: ASbGnctV68DP4XVwbXbIu/fgrljOV7LzbDqdEyGKXE4s9EyPBRcLz5Wy3FpvU28vZcy
	GWYp5PHsjv99CDl0GELmWAj/pt4rSkhny7Brzu7iBCIM6/PLVBu9i3cJiPxhjS44JR6KMhhbU0E
	E5rGpnMgD2ittFuPnftof4riKWOwEEQIEM/TNzk0i4psfmgACI5oAR9F2AqKYIDD6UOjujsNmn7
	NdDG0qm2NXD/y8TlCKiWitPAt9efm4SNOuKTAimnl7BO//7IVC9K4o7cB9V89kxmZmjZ35RHhPb
	eBhpi9cZ7IDnUHbLOdXIVlEtPq2P1hQ6mvC+u3dR/wL7fBvmOlenQHew9s0zhmGhLo2rprtV2lV
	SlJQ=
X-Google-Smtp-Source: AGHT+IHt+/APiwEUu2bWsXv0tc2W1Z5iXsXMlW8SN5vGt1RjeUjffpRFfxAaTi7RMpaV5OcRH5vvuA==
X-Received: by 2002:a05:6000:18a8:b0:39e:cbe1:8d68 with SMTP id ffacd0b85a97d-39ee2729e8fmr291658f8f.6.1744738781637;
        Tue, 15 Apr 2025 10:39:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979637sm15148655f8f.53.2025.04.15.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:39:41 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:39:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Rae Moar <rmoar@google.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Sergio =?UTF-8?B?R29uesOhbGV6?= Collado
 <sergio.collado@gmail.com>, David Gow <davidgow@google.com>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Mostafa Saleh <smostafa@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <20250415183934.46f4ed6f@pumpkin>
In-Reply-To: <20250412102218.560196c0@batman.local.home>
References: <20250328112156.2614513-1-arnd@kernel.org>
	<ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
	<20250411065054.GM9833@noisy.programming.kicks-ass.net>
	<0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>
	<20250411105849.GA5600@noisy.programming.kicks-ass.net>
	<20250412102218.560196c0@batman.local.home>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Apr 2025 10:22:18 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

...
> I just hit this on my allyesconfig build:
> 
>   NM      .tmp_vmlinux1.syms
>   KSYMS   .tmp_vmlinux1.kallsyms.S
> Symbol __cfi_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n too long for kallsyms (517 >= 512).
> Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
...
> 
> I grepped for that symbol and it lives in: lib/tests/longest_symbol_kunit.o

Looks like it is carefully counted to be 511 characters.
And then the compiler adds __cfi_ making 517.
I guess the test could be changed?

Is it possible to remove the __cfi_ symbols (to save kernel memory) and then
use a single bit to indicate that the previous few bytes (the same number for
all such symbols) belong to the following symbol?
Then stack backtraces would say "foo-n" instead "__cfi_foo+n".

	David

