Return-Path: <linux-kbuild+bounces-12976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANXMIQJo+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12976-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:33:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFA4BAFBA
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 288AF3014543
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6433237D10D;
	Mon,  4 May 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CkF4Ur92";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ne2XaM9e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79F37CD36;
	Mon,  4 May 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887216; cv=none; b=A3MR0mao+TMGifIYMXN+gkCF4m7sKssSYjzWnqzLkP5FXxAkaoOhOdE7MHc4XvZfPfN5jUnYxCOFoGz7OJ0sMDTOKvUHusixGwkSDe0xC6ExAY3ZaTo2U4jN2YKrtPzuY5x9kFRmSGp9+xaErEVuVso50vFhitgKb/O7vO/DXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887216; c=relaxed/simple;
	bh=jjFMDKdhbjQLZ+fcrbaCzSYxbFlqAxUmrc8TwIq24gA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vg7iZNc4xcxU55Ils4CYSKQgWqtpbKZmb0anpeQNwgfwQFsoIqlWdnP54FzDzF3As3PrY1gawNzdJGb3+8BGDX1i5iuQVB96YndLcCVTs7WQgyjnTEzc6we8ZbyVcprHhgf/LTxdMYZB46LTvcF23ygmKti0WzxwM/IF5gTadis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CkF4Ur92; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ne2XaM9e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiw5cliQjVOVd7Hg7M7qqHEcA53QLkykbCEMKUj9V/4=;
	b=CkF4Ur92AwTZrXO/sv6QGR6uZ0gVg6WWgj6BnkXL6F5RbU98XwApIIYsadlvw5FwHBbUle
	KCUF8wrjD1nFAaEC+LP7e3ieNZnEFRlj4rPux9WT4dGihNf7DTiGa4MzTqQ0qBuK90HVtb
	eTTv5ceRJC+vx74zomg8a1zLuIIoDXNawlOsUXZJsJqVZHcfzOCyfqr7cmFOx0cqf2W1m3
	9Ke/DHoO6Xun0TBR2CGg5bs3lgbv5gqf//6/upZusSDIqVi3uGPe6WMezvqZvUFMXdTag3
	SM2WVhET9UGxbAAdANHBdE1hwKfbCD4LbHC9dK3KfulAGRKlA0V/mm/+OBxQzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiw5cliQjVOVd7Hg7M7qqHEcA53QLkykbCEMKUj9V/4=;
	b=Ne2XaM9eh1DjfbRR/wisAzh5vD9LeAq/Wx1SZRdaT2Nkb1bs9RWaUWN2krijC8nFY8z9Cq
	hsCmlkBXoqVqPyDQ==
Subject: [PATCH v6 00/11] kunit: Introduce UAPI testing framework
Date: Mon, 04 May 2026 11:33:16 +0200
Message-Id: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQQWrDMBAF0KsErauiGc1Ypqveo2RhS+NGJDjBc
 kxK8N0rhYJLqi6/4D8N/66STFGSetvd1SRLTPE85tC87JQ/dOOn6BhyVmiQwADr43WMsz4mOQ2
 zpDlpbtDZ3pMhQpVrl0mGeHuQH/ucDzHN5+nr8cMC5bVgbBDsX2wBbXTXW2fbwB2DvJ/ieJ2n8
 xhvr0GK/1N2/5QJe2Ikb3vTPZXLNQtuF5CpIVgQJgASbN0QaojdkAaggtiMMIsNQK3vfVND6Be
 CTQWhcknrGsOWBhm4hvCGuOomXJA8igPwQfB50P26rt970M1eBQIAAA==
X-Change-ID: 20241015-kunit-kselftests-56273bc40442
To: Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, workflows@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=9871;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jjFMDKdhbjQLZ+fcrbaCzSYxbFlqAxUmrc8TwIq24gA=;
 b=qOGf/9JYWpejLSdzdJlFIjDSwMfYxKdIYhfx+3gP9+i2EIhD8YSa1FSioTUt/I6UX+Q5JWZRD
 LmSMw75cIUZA/0vVN9hOfjuYLJ0o3WWN/JB2wWfvSs0qp4L2PmW3rUL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 04FFA4BAFBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12976-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Currently testing of userspace and in-kernel API use two different
frameworks. kselftests for the userspace ones and Kunit for the
in-kernel ones. Besides their different scopes, both have different
strengths and limitations:

Kunit:
* Tests are normal kernel code.
* They use the regular kernel toolchain.
* They can be packaged and distributed as modules conveniently.

Kselftests:
* Tests are normal userspace code
* They need a userspace toolchain.
  A kernel cross toolchain is likely not enough.
* A fair amout of userland is required to run the tests,
  which means a full distro or handcrafted rootfs.
* There is no way to conveniently package and run kselftests with a
  given kernel image.
* The kselftests makefiles are not as powerful as regular kbuild.
  For example they are missing proper header dependency tracking or more
  complex compiler option modifications.

Therefore kunit is much easier to run against different kernel
configurations and architectures.
This series aims to combine kselftests and kunit, avoiding both their
limitations. It works by compiling the userspace kselftests as part of
the regular kernel build, embedding them into the kunit kernel or module
and executing them from there. If the kernel toolchain is not fit to
produce userspace because of a missing libc, the kernel's own nolibc can
be used instead.
The structured TAP output from the kselftest is integrated into the
kunit KTAP output transparently, the kunit parser can parse the combined
logs together.

Further room for improvements:
* Call each test in its completely dedicated namespace
* Handle additional test files besides the test executable through
  archives. CPIO, cramfs, etc.
* Expose the blobs in debugfs
* Provide some convience wrappers around compat userprogs
* Figure out a migration path/coexistence solution for
  kunit UAPI and tools/testing/selftests/

Output from the kunit example testcase, note the output of
"example_uapi_tests".

$ ./tools/testing/kunit/kunit.py run --kunitconfig lib/kunit example
...
Running tests with:
$ .kunit/linux kunit.filter_glob=example kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:53:53] ================== example (10 subtests) ===================
[11:53:53] [PASSED] example_simple_test
[11:53:53] [SKIPPED] example_skip_test
[11:53:53] [SKIPPED] example_mark_skipped_test
[11:53:53] [PASSED] example_all_expect_macros_test
[11:53:53] [PASSED] example_static_stub_test
[11:53:53] [PASSED] example_static_stub_using_fn_ptr_test
[11:53:53] [PASSED] example_priv_test
[11:53:53] =================== example_params_test  ===================
[11:53:53] [SKIPPED] example value 3
[11:53:53] [PASSED] example value 2
[11:53:53] [PASSED] example value 1
[11:53:53] [SKIPPED] example value 0
[11:53:53] =============== [PASSED] example_params_test ===============
[11:53:53] [PASSED] example_slow_test
[11:53:53] ======================= (4 subtests) =======================
[11:53:53] [PASSED] procfs
[11:53:53] [PASSED] userspace test 2
[11:53:53] [SKIPPED] userspace test 3: some reason
[11:53:53] [PASSED] userspace test 4
[11:53:53] ================ [PASSED] example_uapi_test ================
[11:53:53] ===================== [PASSED] example =====================
[11:53:53] ============================================================
[11:53:53] Testing complete. Ran 16 tests: passed: 11, skipped: 5
[11:53:53] Elapsed time: 67.543s total, 1.823s configuring, 65.655s building, 0.058s running

---
Changes in v6:
- Use usermode helper framework
- Trim now unnecessary new module exports
- Report unhandled output line
- Add SUPERH to ARCH_HAS_NOLIBC
- Remove non-integral patches submitted elsewhere
- Drop CC_CAN_LINK_STATIC support. It is based on CC_CAN_LINK which is
  currently being reworked.
- Use more cleanup helpers
- Split stdout/stderr forwarding into its own patch
- Link to v5: https://lore.kernel.org/r/20250717-kunit-kselftests-v5-0-442b711cde2e@linutronix.de

Changes in v5:
- Initialize output variable of kernel_wait()
- Fix .incbin with in-tree builds
- Keep requirement of KTAP tests to have a number which was removed accidentally
- Only synthesize KTAP subtest failure if the outer one is TestStatus.FAILURE
- Use -I instead of -isystem in NOLIBC_USERCFLAGS to populate dependency files
- +To filesystem developers to all patches
- +To Luis Chamberlain for discussions about usage of usermodehelper
  (see patches 6 and 12)
- Link to v4: https://lore.kernel.org/r/20250626-kunit-kselftests-v4-0-48760534fef5@linutronix.de

Changes in v4:
- Move Kconfig.nolibc from tools/ to init/
- Drop generic userprogs nolibc integration
- Drop generic blob framework
- Pick up review tags from David
- Extend new kunit TAP parser tests
- Add MAINTAINERS entry
- Allow CONFIG_KUNIT_UAPI=m
- Split /proc validation into dedicated UAPI test
- Trim recipient list a bit
- Use KUNIT_FAIL_AND_ABORT() over KUNIT_FAIL()
- Link to v3: https://lore.kernel.org/r/20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de

Changes in v3:
- Reintroduce CONFIG_CC_CAN_LINK_STATIC
- Enable CONFIG_ARCH_HAS_NOLIBC for m68k and SPARC
- Properly handle 'clean' target for userprogs
- Use ramfs over tmpfs to reduce dependencies
- Inherit userprogs byte order and ABI from kernel
- Drop now unnecessary "#ifndef NOLIBC"
- Pick up review tags
- Drop usage of __private in blob.h,
  sparse complains and it is not really necessary
- Fix execution on loongarch when using clang
- Drop userprogs libgcc handling, it was ugly and is not yet necessary
- Link to v2: https://lore.kernel.org/r/20250407-kunit-kselftests-v2-0-454114e287fd@linutronix.de

Changes in v2:
- Rebase onto v6.15-rc1
- Add documentation and kernel docs
- Resolve invalid kconfig breakages
- Drop already applied patch "kbuild: implement CONFIG_HEADERS_INSTALL for Usermode Linux"
- Drop userprogs CONFIG_WERROR integration, it doesn't need to be part of this series
- Replace patch prefix "kconfig" with "kbuild"
- Rename kunit_uapi_run_executable() to kunit_uapi_run_kselftest()
- Generate private, conflict-free symbols in the blob framework
- Handle kselftest exit codes
- Handle SIGABRT
- Forward output also to kunit debugfs log
- Install a fd=0 stdin filedescriptor
- Link to v1: https://lore.kernel.org/r/20250217-kunit-kselftests-v1-0-42b4524c3b0a@linutronix.de

To: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
To: Willy Tarreau <w@1wt.eu>
To: Thomas Weißschuh <linux@weissschuh.net>
To: Brendan Higgins <brendan.higgins@linux.dev>
To: David Gow <davidgow@google.com>
To: Rae Moar <rmoar@google.com>
To: Shuah Khan <shuah@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
Cc: linux-doc@vger.kernel.org
Cc: workflows@vger.kernel.org
To: Kees Cook <kees@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Cc: Nicolas Schier <n.schier@avm.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
Thomas Weißschuh (11):
      kbuild: doc: add label for userprogs section
      exec: add dirfd parameter to kernel_execve()
      umh: add dirfd parameter
      mount: add support for __free(kern_unmount)
      init: add nolibc build support
      kunit: qemu_configs: loongarch: Enable LSX/LSAX
      kunit: Introduce UAPI testing framework
      kunit: uapi: Forward test executable output to KUnit log
      kunit: uapi: Add example for UAPI tests
      kunit: uapi: Introduce preinit executable
      kunit: uapi: Validate usability of /proc

 Documentation/dev-tools/kunit/api/index.rst   |   5 +
 Documentation/dev-tools/kunit/api/uapi.rst    |  14 +
 Documentation/kbuild/makefiles.rst            |   2 +
 MAINTAINERS                                   |  11 +
 fs/coredump.c                                 |   2 +-
 fs/exec.c                                     |   4 +-
 include/kunit/uapi.h                          |  77 ++++++
 include/linux/binfmts.h                       |   2 +-
 include/linux/mount.h                         |   2 +
 include/linux/umh.h                           |   3 +-
 init/Kconfig                                  |   2 +
 init/Kconfig.nolibc                           |  16 ++
 init/Makefile.nolibc                          |  13 +
 init/main.c                                   |   2 +-
 kernel/module/kmod.c                          |   2 +-
 kernel/umh.c                                  |   9 +-
 lib/kobject_uevent.c                          |   2 +-
 lib/kunit/Kconfig                             |  16 ++
 lib/kunit/Makefile                            |  26 ++
 lib/kunit/kunit-example-test.c                |  15 ++
 lib/kunit/kunit-example-uapi.c                |  22 ++
 lib/kunit/kunit-test-uapi.c                   |  51 ++++
 lib/kunit/kunit-test.c                        |  24 +-
 lib/kunit/kunit-uapi.c                        | 351 ++++++++++++++++++++++++++
 lib/kunit/uapi-preinit.c                      |  68 +++++
 security/keys/request_key.c                   |   2 +-
 tools/testing/kunit/qemu_configs/loongarch.py |   2 +
 27 files changed, 732 insertions(+), 13 deletions(-)
---
base-commit: 813d26ba48f9e3909d39966857421500faef508a
change-id: 20241015-kunit-kselftests-56273bc40442

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


