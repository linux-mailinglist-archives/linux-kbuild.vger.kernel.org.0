Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03B32FD7EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 19:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731593AbhATRvd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 12:51:33 -0500
Received: from sendmail.purelymail.com ([34.202.193.197]:51432 "EHLO
        sendmail.purelymail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbhATRuk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 12:50:40 -0500
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Jan 2021 12:50:38 EST
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=0vKvmSFzWcheTLjBCdQh7yELER6goDXutqd83TwBMMVY82Z6u6C7lc/KAXvZOr9Y5DroqMbZO5g8JoAnXDnVK2c9usVnIZ4DySlh89kT7Qgjn1lY4Q9vudKemXtuoB20o/tvG5tp9kGk0OnPELvC0bWP9gKpQoKQOCQKT/PFwr0+5GfbN7n6KQIU5aURUtNf3MOesHkx3ksHxfZkm60usmr/Gpj3XDvgNx1A4pnNXgBZQ4DZ4FlFzg+oJRSVmuj+wzktTZXsQZLIX8aeKTnvMGmhRxra5TIi7+Ks8SCLyLmpY8si4cERL6/sClozFMjUQZKLAWgj6+U/qKS9XrsN5Q==; s=purelymail2; d=thezest.dev; v=1; bh=V9VC00tjxDxMC3NfaBpUD4u6Y+zJ6Kv9pzEYq6NvENg=; h=Received:From:To;
DKIM-Signature: a=rsa-sha256; b=iQuChVOf8ja5PrB7bMBY70Zwp7e+tPjlq7PaQvjgEW/GKtnNuzUXi5Pnqr5tbA2qXCA3JGeGK2X/LPkGe0ehyZ62Mg3uefdPWt5BMw/zGVFCXE1T4dDKgFjgn976hRByQaFE7M/9jco82PSlsa5kxir2XTZFiB+7JIfIo7dn0Zi/QRAXMbJ71Ij6soeCGagzBlSBMYe819XEBhwZVIxeKay05Pf8MmX5PCjQz0/Mv4qJzLSem8euedx2VepiYM3sIPtB4XhWxjZjt2MTGAop1xvk2yggqCYX3iDuEFr5ZkvCuB3wadUYh2qftJc+QAplDAK/5gmNdDXl4kef32N93g==; s=purelymail2; d=purelymail.com; v=1; bh=V9VC00tjxDxMC3NfaBpUD4u6Y+zJ6Kv9pzEYq6NvENg=; h=Feedback-ID:Received:From:To;
Feedback-ID: 1188:367:null:purelymail
X-Pm-Original-To: linux-kbuild@vger.kernel.org
Received: by ip-172-30-0-124.ec2.internal (JAMES SMTP Server ) with ESMTPA ID -1145992316;
          Wed, 20 Jan 2021 17:42:20 +0000 (UTC)
From:   Diab Neiroukh <lazerl0rd@thezest.dev>
To:     clang-built-linux@googlegroups.com
Cc:     Diab Neiroukh <lazerl0rd@thezest.dev>,
        Danny Lin <danny@kdrag0n.dev>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>,
        Quentin Perret <qperret@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Add support for Clang's polyhedral loop optimizer.
Date:   Wed, 20 Jan 2021 17:41:45 +0000
Message-Id: <20210120174146.12287-1-lazerl0rd@thezest.dev>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=ANSI_X3.4-1968
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Polly is able to optimize various loops throughout the kernel for cache
locality. A mathematical representation of the program, based on
polyhedra, is analysed to find opportunistic optimisations in memory
access patterns which then leads to loop transformations.

Polly is not built with LLVM by default, and requires LLVM to be compiled
with the Polly "project". This can be done by adding Polly to
-DLLVM_ENABLE_PROJECTS, for example:

-DLLVM_ENABLE_PROJECTS=3D"clang;libcxx;libcxxabi;polly"

Preliminary benchmarking seems to show an improvement of around two
percent across perf benchmarks:

Benchmark                         | Control    | Polly
--------------------------------------------------------
bonnie++ -x 2 -s 4096 -r 0        | 12.610s    | 12.547s
perf bench futex requeue          | 33.553s    | 33.094s
perf bench futex wake             |  1.032s    |  1.021s
perf bench futex wake-parallel    |  1.049s    |  1.025s
perf bench futex requeue          |  1.037s    |  1.020s

Furthermore, Polly does not produce a much larger image size netting it
to be a "free" optimisation. A comparison of a bzImage for a kernel with
and without Polly is shown below:

bzImage        | stat --printf=3D"%s\n"
-------------------------------------
Control        | 9333728
Polly          | 9345792

Compile times were one percent different at best, which is well within
the range of noise. Therefore, I can say with certainty that Polly has
a minimal effect on compile times, if none.

Suggested-by: Danny Lin <danny@kdrag0n.dev>
Signed-off-by: Diab Neiroukh <lazerl0rd@thezest.dev>
---
 Makefile     | 16 ++++++++++++++++
 init/Kconfig | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Makefile b/Makefile
index b9d3a47c57cf..00f15bde5f8b 100644
--- a/Makefile
+++ b/Makefile
@@ -740,6 +740,22 @@ else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS +=3D -Os
 endif
=20
+ifdef CONFIG_POLLY_CLANG
+KBUILD_CFLAGS=09+=3D -mllvm -polly \
+=09=09   -mllvm -polly-ast-use-context \
+=09=09   -mllvm -polly-invariant-load-hoisting \
+=09=09   -mllvm -polly-opt-fusion=3Dmax \
+=09=09   -mllvm -polly-run-inliner \
+=09=09   -mllvm -polly-vectorizer=3Dstripmine
+# Polly may optimise loops with dead paths beyound what the linker
+# can understand. This may negate the effect of the linker's DCE
+# so we tell Polly to perfom proven DCE on the loops it optimises
+# in order to preserve the overall effect of the linker's DCE.
+ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+KBUILD_CFLAGS=09+=3D -mllvm -polly-run-dce
+endif
+endif
+
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS=09+=3D $(call cc-option,--param=3Dallow-store-data-races=3D0=
)
 KBUILD_CFLAGS=09+=3D $(call cc-option,-fno-allow-store-data-races)
diff --git a/init/Kconfig b/init/Kconfig
index 05131b3ad0f2..266d7d03ccd1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -177,6 +177,19 @@ config BUILD_SALT
 =09  This is mostly useful for distributions which want to ensure the
 =09  build is unique between builds. It's safe to leave the default.
=20
+config POLLY_CLANG
+=09bool "Use Clang Polly optimizations"
+=09depends on CC_IS_CLANG && $(cc-option,-mllvm -polly)
+=09depends on !COMPILE_TEST
+=09help
+=09  This option enables Clang's polyhedral loop optimizer known as
+=09  Polly. Polly is able to optimize various loops throughout the
+=09  kernel for cache locality. This requires a Clang toolchain
+=09  compiled with support for Polly. More information can be found
+=09  from Polly's website:
+
+=09    https://polly.llvm.org
+
 config HAVE_KERNEL_GZIP
 =09bool
=20
--=20
2.30.0

