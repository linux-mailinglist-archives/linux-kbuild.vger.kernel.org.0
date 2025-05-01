Return-Path: <linux-kbuild+bounces-6848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D056AA66CA
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFBC4A474F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 23:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420CF26B2D0;
	Thu,  1 May 2025 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arfs+wlp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17626C386;
	Thu,  1 May 2025 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140446; cv=none; b=i7CPFMURtYed2o0MHBUk0G2XSTFSYGs7Kw2wpE1BcCcftc62MclB81ED+ZFzmmw10TuOMoZr1xbqOVFCNStKyugL2FQU+cNgqLHl61uOy7WanDGm+POeb8a3JdDUHIm339i6ZhI3ZZnp4xPA35Dw8p31qybrF94Z41wPb056DDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140446; c=relaxed/simple;
	bh=682lfWiGOY5H1gQ7Q6kvG5sTLVNVS+CC8Ch3D7YMRiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3cv6T4Kq0GBnJWOYt5jwUYEFHFcyrW3SOJdj+I0ZcP5J/feWEkGTQri7X3q5qZxYojG+kNbiL8lh3WIh1q8PKBepqKjPZlY9SKNKijS4hKyGLfUM/g69oq8D9cEIoCdXLDg+HyK61MnOGt1CmeBBS4ypkYgYRUl9rxHvu+/U88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arfs+wlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3033C4CEE3;
	Thu,  1 May 2025 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746140445;
	bh=682lfWiGOY5H1gQ7Q6kvG5sTLVNVS+CC8Ch3D7YMRiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=arfs+wlpYC/W0ZHftpIoRuBshfg+xOZfycRoUWvd4zyHScAnILO79L2ZnowU6mlKm
	 bXeDJZsjj8kyZ/Or1UxI48ec/Sbpy0LuWQh2gQSOSusWv2WEzspumFKArRzCNL1olt
	 4u+ZeEa5m9Shk3BEbmMUag+02rvhCGnoCocnt6Mu4/2a0XHLFfaxqx7EJW6byLkWUd
	 uZJWJJS1X13m7UOctHHOh24Tm4p/smc+u3M9pHVx3wcJMefWd6hizkRdE+IlbhBhQv
	 504srBdxVVtdnRvrGRwbLb7MzVFa3VOidJHP9JwJad2oEtf1rdS5PCN8P/5jz95EeF
	 YWDjW3momFzBw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 01 May 2025 16:00:22 -0700
Subject: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Marcus Seyfarth <m.seyfarth@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2895; i=nathan@kernel.org;
 h=from:subject:message-id; bh=682lfWiGOY5H1gQ7Q6kvG5sTLVNVS+CC8Ch3D7YMRiM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnCf0W6u1VOX9z+XGNdXAi/xfz8SZpGb2LeKrnE2txmt
 WfbXdfZUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaSLcfIMK3kgUj7oftcM7Ms
 M2xmyDydMfnmwcougXN/nVfN3jLR6isjwzVx6blxv8Rn2Aow+S+r4pm2KOx4wt9n8z6fK7JZErn
 ClB0A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A new on by default warning in clang [1] aims to flags instances where
const variables without static or thread local storage are not
initialized because it can lead to an indeterminate value. The __dummy
variables in the typecheck() macro are the only places within the kernel
where this warning currently occurs.

  drivers/gpu/drm/i915/gt/intel_ring.h:62:2: error: default initialization of an object of type 'typeof (ring->size)' (aka 'const unsigned int') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-var-unsafe]
     62 |         typecheck(typeof(ring->size), next);
        |         ^
  include/linux/typecheck.h:10:9: note: expanded from macro 'typecheck'
     10 | ({      type __dummy; \
        |              ^

  include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-var-unsafe]
    478 |                 if (mtu && time_before(jiffies, rt->dst.expires))
        |                            ^
  include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
    138 | #define time_before(a,b)        time_after(b,a)
        |                                 ^
  include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
    128 |         (typecheck(unsigned long, a) && \
        |          ^
  include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
     11 |         typeof(x) __dummy2; \
        |                   ^

Zero initialize the variables to silence the warning while not impacting
the final code generation because the comparison only matters at compile
time, as suggested on the PR of [1] by the clang maintainer.

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef530727a0f4aefff30 [1]
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-PVuoSwzv6VWbY=w@mail.gmail.com/
Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/linux/typecheck.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/typecheck.h b/include/linux/typecheck.h
index 46b15e2aaefb4e7a4d21c8797ec4d1578998981c..5b473c9905ae7fce58b7226b57b668f9ddaccaca 100644
--- a/include/linux/typecheck.h
+++ b/include/linux/typecheck.h
@@ -7,8 +7,8 @@
  * Always evaluates to 1 so you may use it easily in comparisons.
  */
 #define typecheck(type,x) \
-({	type __dummy; \
-	typeof(x) __dummy2; \
+({	type __dummy = {}; \
+	typeof(x) __dummy2 = {}; \
 	(void)(&__dummy == &__dummy2); \
 	1; \
 })

-- 
2.49.0


