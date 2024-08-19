Return-Path: <linux-kbuild+bounces-3086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E258956FBE
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B19C41F22956
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD77183CC6;
	Mon, 19 Aug 2024 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZTmbnYgq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853B71849D9;
	Mon, 19 Aug 2024 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083462; cv=none; b=BaAXYd6Sjt7cq0rrSNYeurqISVUPoleAT6dsooC53xs3K03wYcB/+90tEEVNb0qPwucBDfLUJ8knEY22XNMV64skkjADk1qdYDTRiT+243qHGxHlnBHk3q8shb37owq4J6qKpX3zwMY2X0e1gryJSxX8q2L0bWbV0MJB2+4bqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083462; c=relaxed/simple;
	bh=9Ucss5HG0diUcir177YuLpgNyIb+GHMMdBeY9FOrtEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GHES1ds5u/O2rq3ecT5HtSQoARfQL0H2fIm6zkfYDaFZsPt+NLuppJQEKCVRt3nwaJwHhtou25iHPgCL8mhtqqk0ob8Zsau4THTzxGdOA/g9l+cxncNxXwtWkHVYPlfAdHXCuYiFB/vMQkcJcNMHvOBKsQS1aHfhL3/PAwTcyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZTmbnYgq; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6rjS022339;
	Mon, 19 Aug 2024 16:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=corp-2023-11-20; bh=C+cnh6N6K7BtUK
	654GVY7sZsFR5tpWmaFb1qxQ/3tX0=; b=ZTmbnYgqLkHqqvMUyd1NctjN1tEdd6
	tprzu7EdS92ef7GB+wqCJVsdjFi61HAuW7HGX/dBYyN6OWu8yBkUyvxssmV/818F
	S7dJ6IL/pQmevJ1WeaUWvYCXM+mSB6TsYpvBnj6aJDOUFxUUz1WqcAr7bTsGLXFn
	4VxnZG6dxlfQBWRWne8Au4Zd/W8kiQxfFXKwMYPkbB3F89C5AbCq51SzkAYjMUU9
	aB4ZswpBhUiHXJXVBtiTIHWFVEaFIA/xw3Evh8CIcsav/eQGydpfI0wisG9Ve6Cr
	dkBss7zz1avzoY7p8cA/IecMIcB3QZXz8dNFwDVapi9eKPtbyRdVo6sQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dk11h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHmf007848;
	Mon, 19 Aug 2024 16:03:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pba2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:47 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Feb014254;
	Mon, 19 Aug 2024 16:03:47 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-1;
	Mon, 19 Aug 2024 16:03:47 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH 00/11] output a valid shell script when running 'make -n'
Date: Mon, 19 Aug 2024 18:02:57 +0200
Message-Id: <20240819160309.2218114-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190107
X-Proofpoint-ORIG-GUID: BvS8yD8qZbYKApA0bQ1cPyqsN5kIqMMY
X-Proofpoint-GUID: BvS8yD8qZbYKApA0bQ1cPyqsN5kIqMMY

This patch series lets 'make -n' output a shell script that can be
used to build the kernel without any further use of make. For example:

    make defconfig

    # ensure some build prerequisites are built
    make prepare

    # generate build script
    make -n | tee build.sh

    # excecute build script
    bash -eux build.sh

The purpose of this is to take a step towards defeating the insertion of
backdoors at build time (see [1]). Some of the benefits of separating the
build script from the build system are:

 - we can invoke make in a restricted environment (e.g. mostly read-only
   kernel tree),

 - we have an audit log of the exact commands that run during the build
   process; although it's true that the build script wouldn't be useful
   for either production or development builds (as it doesn't support
   incremental rebuilds or parallel builds), it would allow you to
   rebuild an existing kernel and compare the resulting binary for
   discrepancies to the original build,

 - the audit log can be stored (e.g. in git) and changes to it over time
   can themselves be audited (e.g. by looking at diffs),

 - there's a lot fewer places to hide malicious code in a straight-line
   shell script that makes minimal use of variables and helper functions.
   You also cannot inject fragments of Makefile code through environment
   variables (again, see [1]).

Alternative ways to achieve some of the same things would be:

 - the existing compile_commands.json infrastructure; unfortunately this
   does not include most of the steps performed during a build (such as
   linking vmlinux) and does not really allow you to reproduce/verify the
   full build,

 - simply running something like strace -f -e trace=execve make; however,
   this also does not result in something that can be easily played back;
   at the very least it would need to be heavily filtered and processed
   to account for data passed in environment variables and things like
   temporary files used by the compiler.

This implementation works as follows:

 - 'make -n' (AKA --dry-run) by default prints out the commands that make
   runs; this output is modified to be usable as a shell script,

 - we output 'make() { :; }' at the start of the script in order to make
   all 'make' invocations in the resulting build script no-ops (GNU Make
   will actually execute -- and print -- all recipe lines that include
   $(MAKE), even when invoked with -n).

 - we simplify the makefile rules in some cases to make the shell script
   more readable; for example, we don't need the logic that extracts
   dependencies from .c files (since that is only used by 'make' itself
   when determining what to rebuild) or the logic that generates .cmd
   files,

This patch is WIP and may not produce a working shell script in all
circumstances. For example, while plain 'make -n' works for me, other
make targets (e.g. 'make -n htmldocs') are not at all guaranteed to
produce meaningful output; certain kernel configs may also not work,
especially those that rely on external tools like e.g. Rust.

[1]: https://www.openwall.com/lists/oss-security/2024/04/17/3
[2]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags


Vegard

---

Vegard Nossum (11):
  kbuild: ignore .config rule for make --always-make
  kbuild: document some prerequisites
  kbuild: pass KERNELVERSION and LOCALVERSION explicitly to
    setlocalversion
  kbuild: don't execute .ko recipe in --dry-run mode
  kbuild: execute modules.order recipe in --dry-run mode
  kbuild: set $dry_run when running in --dry-run mode
  kbuild: define 'make' as a no-op in --dry-run mode
  kbuild: make link-vmlinux.sh respect $dry_run
  kbuild: simplify commands in --dry-run mode
  kbuild: don't test for file presence in --dry-run mode
  kbuild: suppress echoing of commands in --dry-run mode

 Makefile                          | 28 +++++++++++++++++---
 arch/x86/boot/compressed/Makefile |  6 +++++
 scripts/Kbuild.include            | 27 +++++++++++++++++++
 scripts/Makefile.build            |  2 +-
 scripts/Makefile.modfinal         |  9 +++++--
 scripts/Makefile.modpost          |  8 ++++--
 scripts/Makefile.vmlinux          | 22 ++++++++++++++--
 scripts/Makefile.vmlinux_o        |  3 +++
 scripts/link-vmlinux.sh           | 44 ++++++++++++++++++++-----------
 9 files changed, 123 insertions(+), 26 deletions(-)

-- 
2.34.1


